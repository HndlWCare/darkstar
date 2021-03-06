-----------------------------------
-- Area: Batallia Downs
--  NPC: Cavernous Maw
-- !pos -48 0.1 435 105
-- Teleports Players to Batallia Downs [S]
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/globals/campaign");
require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (ENABLE_WOTG == 1 and player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER) == false) then
        player:startEvent(500,0);
    elseif (ENABLE_WOTG == 1 and hasMawActivated(player,0)) then
        if (player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and
        (player:getQuestStatus(CRYSTAL_WAR, CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED or
         player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_COMPLETED or
         player:getQuestStatus(CRYSTAL_WAR, FIRES_OF_DISCONTENT) == QUEST_COMPLETED)) then
        player:startEvent(501);
        else
        player:startEvent(910);
        end
    else
        player:messageSpecial(NOTHING_HAPPENS);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 500) then
        local r = math.random(1,3);
        player:addKeyItem(dsp.ki.PURE_WHITE_FEATHER);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.PURE_WHITE_FEATHER);
        player:completeMission(WOTG,CAVERNOUS_MAWS);
        player:addMission(WOTG,BACK_TO_THE_BEGINNING);
        if (r == 1) then
            player:addNationTeleport(MAW,1);
            dsp.teleport.toMaw(player,1); -- go to Batallia_Downs[S]
        elseif (r == 2) then
            player:addNationTeleport(MAW,2);
            dsp.teleport.toMaw(player,3); -- go to Rolanberry_Fields_[S]
        elseif (r == 3) then
            player:addNationTeleport(MAW,4);
            dsp.teleport.toMaw(player,5); -- go to Sauromugue_Champaign_[S]
        end;
    elseif (csid == 910 and option == 1) then
        dsp.teleport.toMaw(player,1); -- go to Batallia_Downs[S]
    elseif (csid == 501) then
        player:completeMission(WOTG, BACK_TO_THE_BEGINNING);
        player:addMission(WOTG, CAIT_SITH);
        player:addTitle(dsp.title.CAIT_SITHS_ASSISTANT);
        dsp.teleport.toMaw(player,1);
    end;
end;