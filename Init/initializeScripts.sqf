#include "detect.sqf"

missionNamespace setVariable ["ACE_maxWeightDrag", 2000];
missionNamespace setVariable ["ACE_maxWeightCarry", 2000];

if (!isServer) exitWith {};

TS_Infantry_Players = [];
TS_Pilots = [];
TS_Zeuses = [];

TS_aviationChannel_AdditionalUnits = [SFL_unit, NFL_unit];
TS_ArtilleryPositions = [ "arti_01", "arti_02", "arti_03", "arti_04", "arti_05", "arti_06", "arti_07", "arti_08"];
TS_AA_Positions = [ "aa_01", "aa_02", "aa_03", "aa_04", "aa_05", "aa_06", "aa_07", "aa_08"]; 

_debug = ["Debug", -1] call BIS_fnc_getParamValue;
_intro = ["Intro", -1] call BIS_fnc_getParamValue;
_despawnDelayType = ["DelayGarabage", -1] call BIS_fnc_getParamValue;
_deleteWave = ["DeleteRestWave", -1] call BIS_fnc_getParamValue;
_spawnDelay = ["DelaySpawn", -1] call BIS_fnc_getParamValue;
_SpawnType = ["SpawnSettings", -1] call BIS_fnc_getParamValue;
MissionDebug = (_debug == 1);
MissionIntro = (_intro == 1);
IntroPlayed = false;
DelayDespawnType = (_despawnDelayType == 1);
DeleteRestWave = (_deleteWave == 1);
SetAttackActive = false;
SetNvgAvailable = false;
SpawnDelay = (_spawnDelay == 1);
SpawnType = (_SpawnType == 1);
publicVariable "MissionDebug";
publicVariable "MissionIntro";
publicVariable "DeleteRestWave";
publicVariable "SetAttackActive";
publicVariable "SetNvgAvailable";
publicVariable "SpawnDelay";
publicVariable "IntroPlayed";
publicVariable "SpawnType";
TS_AviationChannel = radioChannelCreate [[1,0,0,1], "Aviation Channel", "%UNIT_GRP_NAME", [], false];
execVm "scripts\GarbageCleaner\OnlyInfantry\garbageCleaner.sqf";
execVm "scripts\Init\infantryDetector.sqf";
execVm "scripts\Supplies\inBoxesWithCustomContent\Supplies.sqf";
execVm "scripts\Init\updateCustomChat.sqf";
execVm "scripts\AntiAir\general\configuration.sqf";
execVm "scripts\SpawnEnemyRandom\onPremarkedPositions\taskMgr.sqf";
execVm "scripts\SpecialScripts\addDragAndCarry.sqf";



#include "enemyUnits.sqf"
#include "places.sqf"
#include "zones.sqf"

_vehicles = [heli_01, heli_02, heli_03, heli_04, plane_01, plane_02, plane_03, plane_04, plane_05, plane_06];
{
    _x execVM "scripts\Respawns\vehicleRespawn.sqf";
} forEach _vehicles;