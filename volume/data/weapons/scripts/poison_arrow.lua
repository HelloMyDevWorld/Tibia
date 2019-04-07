local combat = Combat()
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISONARROW)
combat:setFormula(COMBAT_FORMULA_SKILL, 1, 0, 1, 0)

local condition = Condition(CONDITION_POISON)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(10, 2000, -1)
combat:setCondition(condition)

function onUseWeapon(cid, var)
	return combat:execute(cid, var)
end
