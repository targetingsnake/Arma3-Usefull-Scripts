if(!isServer) exitWith {};

while {true} do {
	_channelInfo = radioChannelInfo TS_AviationChannel;
	_unitsPart = _channelInfo select 3;
	_shouldBePart = TS_Pilots + TS_Zeuses + TS_aviationChannel_AdditionalUnits;
	{
		_test = _x;
		if ({_x == _test} count _unitsPart == 0) then {
			TS_AviationChannel radioChannelAdd [_test];
		}
	} forEach _shouldBePart;
	sleep 30;
}