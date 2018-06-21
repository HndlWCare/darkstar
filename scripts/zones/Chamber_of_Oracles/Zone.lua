-----------------------------------
--
-- Zone: Chamber_of_Oracles (168)
--
-----------------------------------
package.loaded["scripts/zones/Chamber_of_Oracles/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Chamber_of_Oracles/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-177.804,-2.765,-37.893,179);
    end
    if (player:getCurrentMission(WINDURST) == MOON_READING and player:getVar("MissionStatus") == 1 and player:hasKeyItem(dsp.ki.ANCIENT_VERSE_OF_ALTEPA) == false) then
        cs = 3;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 3 and player:getCurrentMission(WINDURST) == MOON_READING) then
        player:addKeyItem(dsp.ki.ANCIENT_VERSE_OF_ALTEPA);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ANCIENT_VERSE_OF_ALTEPA);
    end
end;
