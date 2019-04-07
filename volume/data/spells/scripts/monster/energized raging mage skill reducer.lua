local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)

local area = createCombatArea(AREA_CROSS6X6)
combat:setArea(area)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 50)
combat:setCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
