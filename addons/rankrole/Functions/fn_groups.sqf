if (isServer) then
{
   private _headhunter = [nil, "Head Hunter", false]; // [<Insignia>, <Group Name>, <Private>]

   ["RegisterGroup", [nil, nil, _headhunter]] call BIS_fnc_dynamicGroups;
};
