if (!isServer) exitWith {};

_known = [];
while {true} do {
	_da30sAT = entities "rhsgref_cdf_b_reg_d30_at";
	_newDA30 = [];
	{
		_test = _x;
		_isKnow = ({ _x == _test } count _known) > 0;
		if (!_isKnow) then {
			_newDA30 pushBack _x;
		}
	} forEach _da30sAT;
	if (count _newDA30 > 0) then {
		{
			[_x, true, [0,3,0]] call ace_dragging_fnc_setDraggable; //disable dragging
			[_x, true, [0,3,0]] call ace_dragging_fnc_setCarryable; //disable carrying
			_known pushBack _x;
		} forEach _da30sAT;
		"All AT canons can now be carried and dragged." remoteExec ["hint", 0];
	};
	sleep 30;
}