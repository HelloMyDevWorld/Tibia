local deathListEnabled = true
local maxDeathRecords = 5

local function sendWarStatus(guildId, enemyGuildId, warId, playerName, killerName)
	local guild, enemyGuild = Guild(guildId), Guild(enemyGuildId)
	if not guild or not enemyGuild then
		return
	end

	local resultId = db.storeQuery("SELECT `guild_wars`.`id`, (SELECT `limit` FROM `znote_guild_wars` WHERE `znote_guild_wars`.`id` = `guild_wars`.`id`) AS `limit`, (SELECT COUNT(1) FROM `guildwar_kills` WHERE `guildwar_kills`.`warid` = `guild_wars`.`id` AND `guildwar_kills`.`killerguild` = `guild_wars`.`guild1`) guild1_kills, (SELECT COUNT(1) FROM `guildwar_kills` WHERE `guildwar_kills`.`warid` = `guild_wars`.`id` AND `guildwar_kills`.`killerguild` = `guild_wars`.`guild2`) guild2_kills FROM `guild_wars` WHERE (`guild1` = " .. guildId .. " OR `guild2` = " .. guildId .. ") AND `status` = 1 AND `id` = " .. warId)
	if resultId then

		local guild1_kills = result.getNumber(resultId, "guild1_kills")
		local guild2_kills = result.getNumber(resultId, "guild2_kills")
		local limit = result.getNumber(resultId, "limit")
		result.free(resultId)

		local members = guild:getMembersOnline()
		for i = 1, #members do
			members[i]:sendChannelMessage("", string.format("%s was killed by %s. The new score is %d:%d frags (limit: %d)", playerName, killerName, guild1_kills, guild2_kills, limit), TALKTYPE_CHANNEL_R1, CHANNEL_GUILD)
		end

		local enemyMembers = enemyGuild:getMembersOnline()
		for i = 1, #enemyMembers do
			enemyMembers[i]:sendChannelMessage("", string.format("%s was killed by %s. The new score is %d:%d frags (limit: %d)", playerName, killerName, guild1_kills, guild2_kills, limit), TALKTYPE_CHANNEL_R1, CHANNEL_GUILD)
		end

		if guild1_kills >= limit or guild2_kills >= limit then
			db.query("UPDATE `guild_wars` SET `status` = 4, `ended` = " .. os.time() .. " WHERE `status` = 1 AND `id` = " .. warId)
			Game.broadcastMessage(string.format("%s has just won the war against %s.", guild:getName(), enemyGuild:getName()), MESSAGE_EVENT_ADVANCE)
		end
	end
end

function onDeath(cid, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	local player = Player(cid)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are dead.")
	if not deathListEnabled then
		return
	end

	local byPlayer = 0
	local killerCreature = Creature(killer)
	if not killerCreature then
		killerName = "field item"
	else
		if killerCreature:isPlayer() then
			byPlayer = 1
		else
			local master = killerCreature:getMaster()
			if master and master ~= killerCreature and master:isPlayer() then
				killerCreature = master
				byPlayer = 1
			end
		end
		killerName = killerCreature:isMonster() and killerCreature:getType():getNameDescription() or killerCreature:getName()
	end

	local byPlayerMostDamage = 0
	if mostDamage == 0 then
		mostDamageName = "field item"
	else
		local mostDamageKiller = Creature(mostDamage)
		if mostDamageKiller:isPlayer() then
			byPlayerMostDamage = 1
		else
			local master = mostDamageKiller:getMaster()
			if master and master ~= mostDamageKiller and master:isPlayer() then
				mostDamageKiller = master
				byPlayerMostDamage = 1
			end
		end
		mostDamageName = mostDamageKiller:isMonster() and mostDamageKiller:getType():getNameDescription() or mostDamageKiller:getName()
	end

	local playerGuid = player:getGuid()
	db.query("INSERT INTO `player_deaths` (`player_id`, `time`, `level`, `killed_by`, `is_player`, `mostdamage_by`, `mostdamage_is_player`, `unjustified`, `mostdamage_unjustified`) VALUES (" .. playerGuid .. ", " .. os.time() .. ", " .. player:getLevel() .. ", " .. db.escapeString(killerName) .. ", " .. byPlayer .. ", " .. db.escapeString(mostDamageName) .. ", " .. byPlayerMostDamage .. ", " .. (unjustified and 1 or 0) .. ", " .. (mostDamage_unjustified and 1 or 0) .. ")")
	local resultId = db.storeQuery("SELECT `player_id` FROM `player_deaths` WHERE `player_id` = " .. playerGuid)

	local deathRecords = 0
	local tmpResultId = resultId
	while tmpResultId ~= false do
		tmpResultId = result.next(resultId)
		deathRecords = deathRecords + 1
	end

	if resultId ~= false then
		result.free(resultId)
	end

	while deathRecords > maxDeathRecords do
		db.query("DELETE FROM `player_deaths` WHERE `player_id` = " .. playerGuid .. " ORDER BY `time` LIMIT 1")
		deathRecords = deathRecords - 1
	end

	if byPlayer == 1 then
		local targetGuild = player:getGuild()
		targetGuild = targetGuild and targetGuild:getId() or 0
		if targetGuild ~= 0 then
			local killerGuild = killerCreature:getGuild()
			killerGuild = killerGuild and killerGuild:getId() or 0
			if killerGuild ~= 0 and targetGuild ~= killerGuild and isInWar(cid, killerCreature) then
				local warId = false
				resultId = db.storeQuery("SELECT `id` FROM `guild_wars` WHERE `status` = 1 AND ((`guild1` = " .. killerGuild .. " AND `guild2` = " .. targetGuild .. ") OR (`guild1` = " .. targetGuild .. " AND `guild2` = " .. killerGuild .. "))")
				if resultId ~= false then
					warId = result.getNumber(resultId, "id")
					result.free(resultId)
				end

				if warId ~= false then
					local playerName = player:getName()
					db.query("INSERT INTO `guildwar_kills` (`killer`, `target`, `killerguild`, `targetguild`, `time`, `warid`) VALUES (" .. db.escapeString(killerName) .. ", " .. db.escapeString(playerName) .. ", " .. killerGuild .. ", " .. targetGuild .. ", " .. os.time() .. ", " .. warId .. ")")
					addEvent(sendWarStatus, 1000, killerGuild, targetGuild, warId, playerName, killerName)
				end
			end
		end
	end
end
