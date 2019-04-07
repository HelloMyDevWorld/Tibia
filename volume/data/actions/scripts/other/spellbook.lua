function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local count = getPlayerInstantSpellCount(player)
	local text = ""
	local t = {}
	for i = 0, count - 1 do
		local spell = getPlayerInstantSpellInfo(player, i)
		if spell.level ~= 0 then
			if spell.manapercent > 0 then
				spell.mana = spell.manapercent .. "%"
			end
			t[#t + 1] = spell
		end
	end
	table.sort(t, function(a, b) return a.level < b.level end)
	local prevLevel = -1
	local spell
	for i = 1, #t do
		spell = t[i]
		local line = ""
		if prevLevel ~= spell.level then
			if i ~= 1 then
				line = "\n"
			end
			line = line .. "Spells for Level " .. spell.level .. "\n"
			prevLevel = spell.level
		end
		text = text .. line .. "  " .. spell.words .. " - " .. spell.name .. " : " .. spell.mana .. "\n"
	end
	player:showTextDialog(item.itemid, text)
	return true
end
