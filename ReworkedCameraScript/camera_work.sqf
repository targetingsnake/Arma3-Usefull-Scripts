// by ALIAS
// _targetArea= [_campos, _target, _duration, _zoomLevel]
// _camera_shot= [position_1_name, position_2_name, target_name, duration, zoom_level1, zoom_level_2, attached, x_rel_coord, y_rel_coord, z_rel_coord,last_shot] execVM "camera_work.sqf";
_camInformation = _this select 0;
_last_shot = _this select 1;

// ----------------------

if (!loopdone) then 
{
		_camera = objNull;
		_run = 0;
		{
			_cameraPos = _x select 0;
			_target = _x select 1;
			_duration = _x select 2;
			_zoom = _x select 3;	
			_cI = count _x;
			_durationSleep = 0;	
			if (_cI > 4) then {
				_durationSleep = _x select 4;	
			};
			if (_run == 0) then {
				_camera = "camera" camCreate (getpos _cameraPos);
				showCinemaBorder true;
				_camera cameraEffect ["internal", "BACK"];
				_camera camCommand "inertia on";
				_camera camPrepareTarget _target;
				_camera camPrepareFOV _zoom;
				_camera camCommitPrepared 0;
				sleep _duration;
			} else {
				_posC = getPos _cameraPos;
				_posT = getPos _target;
				_dst = _cameraPos distance _posT;
				_camera camPreparePos (getpos _cameraPos);
				_camera camPrepareTarget _target;
				_camera camPrepareFOV _zoom;
				_camera camCommitPrepared _duration;
				_camPositions = count _camInformation;
				if (!_last_shot || (_run < ( _camPositions - 1 ))) then {
					waitUntil {camCommitted _camera};
				} else {
					sleep _duration - 5;
					"dynamicBlur" ppEffectEnable true;   //Fade in effects
					"dynamicBlur" ppEffectAdjust [0.0];
					"dynamicBlur" ppEffectCommit 0;
					"dynamicBlur" ppEffectAdjust [6];
					"dynamicBlur" ppEffectCommit 5;
					titleCut ["", "BLACK OUT", 5]; //make screen black
					sleep 5;
				};
				if (_durationSleep > 0) then {
					sleep _durationSleep;
				};
			};
			_run = _run + 1;
		} forEach _camInformation;
	if (_last_shot) then {
		loopdone = true
	};
};