-----------------------------------
-- Area: Port San d'Oria
--  NPC: Bonmaurieut
-- Only sells when San d'Oria controlls Elshimo Uplands
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    local RegionOwner = GetRegionOwner(dsp.region.ELSHIMOUPLANDS);

    if (RegionOwner ~= dsp.nation.SANDORIA) then
        player:showText(npc,BONMAURIEUT_CLOSED_DIALOG);
    else
        player:showText(npc,BONMAURIEUT_OPEN_DIALOG);

        local stock =
        {
            1413, 1656, -- Cattleya
            628,   239, -- Cinnamon
            4468,   73, -- Pamamas
            721,   147  -- Rattan Lumber
        }
        dsp.shop.general(player, stock, SANDORIA);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
