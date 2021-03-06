-----------------------------------
-- Area: Bastok Markets
--  NPC: Oggodett
-- Aragoneu Regional Goods
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local RegionOwner = GetRegionOwner(dsp.region.ARAGONEU)

    if RegionOwner ~= dsp.nation.BASTOK then
        player:showText(npc, OGGODETT_CLOSED_DIALOG)
    else
        local stock =
        {
            631,    36,    -- Horo Flour
            629,    43,    -- Millioncorn
            4415,  111,    -- Roasted Corn
            4505,   90,    -- Sunflower Seeds
            841,    36     -- Yagudo Feather
        }

        player:showText(npc, OGGODETT_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
