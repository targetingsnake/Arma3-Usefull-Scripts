if (!isServer) exitWith {};

_systems = [
	[AA_s400_01, 1.5, NFL_unit],
	[AA_s400_02, 2, SFL_unit]
];

TS_AA_hasTarget = [];

_systems execVm 'scripts\AntiAir\Guided\limitRange.sqf';