_p = player;

while {alive _p} do
{
	_nearestEnemies = [];
	_nearestUnits = nearestObjects [_p, ["Man"], 400];
	sleep 2;
	if (EAST countSide _nearestUnits >= 2) then 
	{
		{
		_unit = _x;
		if (side _unit == EAST) then {_nearestEnemies = _nearestEnemies + [_unit]};
		} foreach _nearestUnits;
	};
	if (count _nearestEnemies >= 2) then
	{
		_close = _nearestEnemies select 0;
		groupclose = group _close;
	};
	sleep 10;
	if (count _nearestEnemies < 2) then
	{
		groupclose = grpNull;
	};
};
