-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Sealed Entrance (Sealed_Entrance_3)
-- !pos -340.000 1.825 -364.825 95
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta_[S]/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/West_Sarutabaruta_[S]/TextIDs");
-----------------------------------

function onTrigger(player,npc)
    local QuestStatus = player:getQuestStatus(CRYSTAL_WAR, SNAKE_ON_THE_PLAINS);
    local HasPutty = player:hasKeyItem(dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
    local MaskBit1 = player:getMaskBit(player:getVar("SEALED_DOORS"),0)
    local MaskBit2 = player:getMaskBit(player:getVar("SEALED_DOORS"),1)
    local MaskBit3 = player:getMaskBit(player:getVar("SEALED_DOORS"),2)

    if (QuestStatus == QUEST_ACCEPTED and HasPutty) then
        if (MaskBit3 == false) then
            if (MaskBit2 == false or MaskBit1 == false) then
                player:setMaskBit(player:getVar("SEALED_DOORS"),"SEALED_DOORS",2,true);
                player:messageSpecial(DOOR_OFFSET+1,dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
            else
                player:setMaskBit(player:getVar("SEALED_DOORS"),"SEALED_DOORS",2,true);
                player:messageSpecial(DOOR_OFFSET+4,dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
                player:delKeyItem(dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
            end
        else
            player:messageSpecial(DOOR_OFFSET+2,dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS) == QUEST_COMPLETED) then
        player:messageSpecial(DOOR_OFFSET+2, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY);
    else
        player:messageSpecial(DOOR_OFFSET+3);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;