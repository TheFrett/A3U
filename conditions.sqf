_p = player;

while {alive _p} do
{
	waitUntil {(currentWeapon _p != "") || (vest _p != "") || (primaryWeapon _p != "") || (secondaryWeapon _p != "") || ([_p] call AGM_Explosives_fnc_hasPlacedExplosives);};
	sleep 1;
	_p setCaptive false;
	waitUntil {(currentWeapon _p == "") && (vest _p == "") && (primaryWeapon _p == "") && (secondaryWeapon _p == "") && !([_p] call AGM_Explosives_fnc_hasPlacedExplosives);};
	if (currentWeapon _p == "") then
	{
		_pursuer = _p findNearestEnemy (getPos _p);
		if (!isNull _pursuer) then
		{
			waitUntil {((_p distance _pursuer) > 300);};
			sleep (60 + (ceil random 300));
			_p setCaptive true;
		}
		else
		{
			sleep 2;
			_p setCaptive true;
		};
	};	
};
