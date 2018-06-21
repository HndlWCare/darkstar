-----------------------------------
-- Area: Full Moon Fountain
--  MOB: Ajido-Marujido
-- Ally during Windurst Mission 9-2
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Full_Moon_Fountain/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobRoam
-----------------------------------

function onMobRoam(mob)
    local wait = mob:getLocalVar("wait");
    local ready = mob:getLocalVar("ready");
    if (ready == 0 and wait > 40) then
        local baseID = MOON_READING_BCNM_OFFSET + (mob:getBattlefield():getBattlefieldNumber() - 1) * 2;
        mob:setLocalVar("ready", bit.band(baseID, 0xFFF));
        mob:setLocalVar("wait", 0);
    elseif (ready > 0) then
        mob:addEnmity(GetMobByID(ready + bit.lshift(mob:getZoneID(), 12) + 0x1000000),0,1);
    else
        mob:setLocalVar("wait", wait+3);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    mob:getBattlefield():lose();
end;
