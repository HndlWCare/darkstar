-----------------------------------
--
-- dsp.effect.DEX_BOOST
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX,effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    -- the effect loses dexterity of 1 every 3 ticks depending on the source of the boost
    local boostDEX_effect_size = effect:getPower();
    if (boostDEX_effect_size > 0) then
        effect:setPower(boostDEX_effect_size - 1)
        target:delMod(dsp.mod.DEX,1);
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    boostDEX_effect_size = effect:getPower();
    if (boostDEX_effect_size > 0) then
        target:delMod(dsp.mod.DEX,boostDEX_effect_size);
    end
end;
