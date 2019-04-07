local blessings = {
	{id = 5, name = 'Wisdom of Solitude'},
	{id = 4, name = 'Spark of the Phoenix'},
	{id = 3, name = 'Fire of the Suns'},
	{id = 1, name = 'Spiritual Shielding'},
	{id = 2, name = 'Embrace of Tibia'},
	{id = 6, name = 'Twist of Fate'}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local result, bless = 'Received blessings:'
	for i = 1, #blessings do
		bless = blessings[i]
		result = player:hasBlessing(bless.id) and result .. '\n' .. bless.name or result
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 20 > result:len() and 'No blessings received.' or result)
	return true
end
