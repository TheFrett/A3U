_p = player;

while {alive _p} do
{
	waitUntil {!isNull groupclose};
	_p addEventHandler ["Fired", {groupclose Move (getPos (_this select 0));}];
	waitUntil {isNull groupclose};
	_p removeEventHandler ["Fired", 0];
};
