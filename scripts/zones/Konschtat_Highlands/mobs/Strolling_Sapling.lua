-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Strolling Sapling
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,81,1);
end;
