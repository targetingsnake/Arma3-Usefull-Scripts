// by ALIAS
// nul = [JIP] execVM "AL_intro\intro.sqf";

waitUntil {time > 0};

_jip_enable	= _this select 0;

[[_jip_enable],"AL_intro\time_srv.sqf"] remoteExec ["execVM"];
waitUntil {!isNil "curr_time"};

if (!hasInterface) exitWith {};

if ((!curr_time) or (_jip_enable<0)) then {
0 fadeSound 0;
0 fadeMusic 1;
0 fadeEnvironment 0;
playmusic "Defcon";

/* ----- how to use camera script -----------------------------------------------------------------------

_camera_shot = [position_1_name, position_2_name, target_name, duration, zoom_level1, zoom_level_2, attached, x_rel_coord, y_rel_coord, z_rel_coord,last_shot] execVM "camera_work.sqf";

Where
_camera_shot	- string, is the name/number of the camera shot, you can have as many as you want see examples from down bellow
position_1_name - string, where camera is created, replace it with the name of the object you want camera to start from
position_2_name - string, the object where you want camera to move, if you don't want to move from initial position put the same name as for position_1_name
target_name   	- string, name of the object you want the camera to look at
duration 		- seconds, how long you want the camera to function on current shot
zoom_level_1 	- takes values from 0.01 to 2, FOV (field of view) value for initial position
zoom_level_2	- takes values from 0.01 to 2, FOV value for second position, if you don't to change you can give the same value as you did for zoom_level_1
attached		- boolean, if you want to attach camera to an moving object its value has to be true, otherwise must be false
					in this case position_1_name must have the same value as position_2_name
x_rel_coord		- meters, relative position to the attached object on x coordinate
y_rel_coord		- meters, relative position to the attached object on y coordinate
z_rel_coord		- meters, relative position to the attached object on z coordinate
last_shot		- boolean, true if is the last shot in your movie, false otherwise

-----------------------------------------------------------------------------------------------------------*/

// - do not edit or delete the lines downbelow, this line must be before first camera shot
loopdone = false;
while {!loopdone} do {
//^^^^^^^^^^^^^^^^^^^^^^ DO NOT EDIT OR DELETE ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


// EXAMPLES------ insert your lines for camera shots starting from here -----------------------------------------
_Shot1 = [I_C_1_1, I_T_1_1, 0, 0.3]; 
_Shot2 = [I_C_1_1, I_T_1_1, 15, 0.5]; 
_Shot3 = [I_C_1_2, I_T_1_2, 10, 0.6]; 
_Shot4 = [I_C_1_3, I_T_1_3, 10, 0.5]; 
_Shot5 = [I_C_1_4, I_T_1_4, 10, 0.5]; 
_Scene1 = [_Shot1, _Shot2, _Shot3, _Shot4, _Shot5]; 
_camshot1 = [_Scene1, false] execVM "AL_intro\camera_work.sqf";
waitUntil {scriptdone _camshot1};

_Shot6 = [I_C_2_1, I_T_2_1, 0, 1];  
_Shot7 = [I_C_2_2, I_T_2_2, 10, 1];  
_Shot8 = [I_C_2_3, I_T_2_3, 10, 0.2]; 
_Scene2 = [_Shot6, _Shot7, _Shot8];  
_camshot2 = [_Scene2, false] execVM "AL_intro\camera_work.sqf"; 
waitUntil {scriptdone _camshot2};

_Shot9 = [I_C_3_1, I_T_3_1, 0, 0.25];  
_Shot10 = [I_C_3_2, I_T_3_2, 15, 0.25];  
_Shot11 = [I_C_3_3, I_T_3_3, 15, 0.25]; 
_Scene3 = [_Shot9, _Shot10, _Shot11]; 
_camshot3 = [_Scene3, true] execVM "AL_intro\camera_work.sqf";
waitUntil {scriptdone _camshot3};

/*
if you want to add a forth or a fifth camera shot use a code like:
_forthshot = [cam5, cam6, target4, 7, 1, 1, false] execVM "camera_work.sqf";
waitUntil {scriptDone _forthshot};

** Note that last boolean parameter will tell the script if the camera shot is the last one or not,
make sure that last camera has that parameter true and the intermediar cameras has it false as in my examples above

>>!! don't forget to name the objects cam5, cam6, target4 in editor 

You can add as many camera shots as you want 
but you have to name the script differently 
and don't forget to add the wait line after each shot
waitUntil {scriptDone _xxxshot};
*/

// --------------->> end of camera shots <<---------------------------------------------------------
};

_camera = "camera" camCreate (getpos player);
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;
"dynamicBlur" ppEffectEnable true;   //Fade in effects
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 5;
titleCut ["", "BLACK IN", 5];
1 fadesound 0.5; //put sound back in, over a period of 0.5seconds
1 faderadio 1;
};