-----------------------------------
-- Area: Full_Moon_Fountain
--  MOB: Ace of Batons
-----------------------------------
require("scripts/zones/Full_Moon_Fountain/MobIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    -- if all mobs in list are dead, victory
    local inst = player:getBattlefield():getBattlefieldNumber();
    for i,v in ipairs(MOON_READING_CARDIANS[inst]) do
        if (not GetMobByID(v):isDead()) then
            return;
        end
    end

    player:startEvent(32004,1,1,1);
end;
