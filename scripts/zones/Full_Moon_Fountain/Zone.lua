-----------------------------------
--
-- Zone: Full_Moon_Fountain (170)
--
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Full_Moon_Fountain/MobIDs");
require("scripts/zones/Full_Moon_Fountain/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/titles");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-260.136,2.09,-325.702,188);
    end
    if (player:getCurrentMission(WINDURST) == FULL_MOON_FOUNTAIN and player:getVar("MissionStatus") == 3) then
        cs = 50;
    elseif (player:getCurrentMission(WINDURST) == DOLL_OF_THE_DEAD and player:getVar("MissionStatus") == 7) then
            cs = 61;
    end
    return cs;
end;

function afterZoneIn(player)
    player:entityVisualPacket("kilk");
    player:entityVisualPacket("izum");
    player:entityVisualPacket("hast");
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 50) then
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 61) then
        player:addTitle(dsp.title.GUIDING_STAR);
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 32004) then
        local battlefield = player:getBattlefield();
        if battlefield then
            local bfid = battlefield:getBattlefieldNumber();
            local pos =
            {
                [1] = { ajidoPos = {342.5, 47.5, -364, 180}, playerPos = {338, 47.25, -369.5, 180} },
                [2] = { ajidoPos = {-62.097, 9.25, 30.467, 180}, playerPos = {-62.097, 9.25, 30.467, 180} },
                [3] = { ajidoPos = {-381.943, -52.75, 390.474, 180}, playerPos = {-381.943, -52.75, 390.474, 180} }
            }
            for _, mobid in pairs(MOON_READING_LAST_BOSS[bfid]) do
                SpawnMob(mobid)
            end

            local ajido = battlefield:insertAlly(MOON_READING_AJIDO);
            ajido:setSpawn(pos[bfid].ajidoPos);
            ajido:spawn();
            player:setPos(pos[bfid].playerPos);
        end
    end
end;
