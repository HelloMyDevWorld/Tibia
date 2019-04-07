function onCastSpell(creature, var, isHotkey)
	local position = Variant.getPosition(var)
	local tile = position:getTile()
	local field = tile and tile:getItemByType(ITEM_TYPE_MAGICFIELD)
	if field and isInArray(FIELDS, field.itemid) then
		field:remove()
		position:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	creature:getPosition():sendMagicEffect(CONST_ME_POFF)
	return false
end
