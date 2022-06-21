if (!isServer) exitWith {};

_RepBox = _this select 0;
_caller = _this select 1;


private _time = if (isMultiplayer) then {serverTime} else {time};

_range = 30; //repair & heal range in meters
_duration = 30; //Total duration the vehicle service should take

if(MissionDebug) then {
    _duration = 6;   
};

if (_duration == 0) then {_duration = 0.1;};

_RepBox setVariable ["lastUsed", _time, true];

//unit medical
{
    if ((side group _x == west) and (_x distance _RepBox < _range)) then
    {
        if (!isNil "ace_advanced_fatigue_fnc_handlePlayerChanged") then {
            // abuse the init/respawn function to reset ACE stamina
            [_x, objNull] remoteExec ["ace_advanced_fatigue_fnc_handlePlayerChanged", _x];
        }
        else {
            [_x, 0] remoteExec ["setFatigue", _x];
        };
		diag_log format ["Healing player: %1",name _x];
        [_x, _x] call ace_medical_treatment_fnc_fullHeal;
        "You are now fully healed!" remoteExec ["hint",_x];
    };
} forEach allUnits;

sleep (_duration / 4);
"Medical done." remoteExec ["hint",_caller];

//vehicle RRR
_vicsInRange = [];
{
    if ((_x distance _RepBox < _range) and (alive _x) and (isNull(attachedTo _x))) then
    {
        private _vehSide = side group _x;
        if (_vehSide == sideUnknown || _vehSide == west) then {
            _vicsInRange pushBack _x;
        }
    };
} forEach vehicles;

"Repairing..." remoteExec ["hint",_caller];
sleep (_duration / 4);
{
    _x setDamage 0;
    [_x,0] remoteExec ["setDamage",_x];
} forEach _vicsInRange;

"Rearming..." remoteExec ["hint",_caller];
sleep (_duration / 4);
{
    _x setVehicleAmmo 1;
    [_x,1] remoteExec ["setVehicleAmmo",_x];
} forEach _vicsInRange;

"Refueling..." remoteExec ["hint",_caller];
sleep (_duration / 4);
{
    _x setFuel 1;
    [_x,1] remoteExec ["setFuel",_x];
    if (_x getVariable ["incapacitated",false]) then {_x setVariable ["incapacitated",false,true]};
} forEach _vicsInRange;

//credits (pls dont remove these)
"Nearby units and vehicles have been repaired, rearmed and refueled." remoteExec ["hint",_caller];
sleep 3;
"Original script by Barbolani, Spoffy and John Jordan" remoteExec ["hint",_caller];