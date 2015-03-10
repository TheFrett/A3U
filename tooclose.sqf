_p = player;

while {alive _p} do
{
	_nearestEnemies = [];
	sleep 0.2;
	_nearestUnits = nearestObjects [_p, ["Man"], 7];
	if ((EAST countSide _nearestUnits >= 1) && (speed _p > 0)) then 
	{
		{
		_unit = _x;
		if (side _unit == EAST) then {_nearestEnemies = _nearestEnemies + [_unit]};
		} foreach _nearestUnits;
		_close = _nearestEnemies select 0;
		_groupclose = group _close;
		_groupclosearray = units _groupclose;
		_groupclosearray doWatch _p;
		hint format ["BACK OFF! We WILL shoot!"];
		while {((_p distance _close) <= 8)} do
		{
			if ((_p distance _close) <= 4) exitWith
			{
				if (speed _p > 8) then
				{
					hint format ["FIRING!!!"];
					_p setCaptive false;
					_close doFire _p;
				};
				waitUntil {((_p distance _close) > 9);};
				hint format [""];
				_groupclosearray doWatch ObjNull;
			};
			if ((_p distance _close) > 7) exitWith 
			{
				hint format [""];
				_groupclosearray doWatch ObjNull;
			};
		};
	};		
};
