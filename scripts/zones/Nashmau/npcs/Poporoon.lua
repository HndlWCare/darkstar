-----------------------------------
-- Area: Nashmau
--  NPC: Poporoon
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Nashmau/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,POPOROON_SHOP_DIALOG);

    local stock =
    {
        0x3298,336,        -- Leather Highboots
     0x3299,3438,        -- Lizard Ledelsens
     0x329A,11172,        -- Studded Boots
     0x329B,20532}        -- Cuir Highboots

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

