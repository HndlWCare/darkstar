-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Windurst Mission 9-2)
-- @pos  X:-239 Y:-2 Z:-18 (126)
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (CurrentMission == MOON_READING and MissionStatus == 1 and player:hasKeyItem(dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH) == false) then
        player:startEvent(68);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 68 and player:getCurrentMission(WINDURST) == MOON_READING) then
        player:addKeyItem(dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH);
    end
end;
