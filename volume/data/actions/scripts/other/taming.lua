local TYPE_ITEM, TYPE_MONSTER, TYPE_NPC = 0, 2, 3

local config = {
	[5907] = {
		name = 'bear',
		id = 3,
		type = TYPE_MONSTER,
		chance = 20,
		fail = {
			{run = true, text = 'The bear ran away.'},
			{broke = true, text = 'Oh no! The slingshot broke.'},
			{sound = 'GRRRRRRRRRRRR', text = 'The bear is trying to hit you with its claws.'}
		},
		success = {sound = 'Grrrrrrr', text = 'You tamed the wild bear.'}
	},
	[13247]	= {
		name = 'boar',
		id = 10,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, text = 'The boar ran away'},
			{broke = true, text = 'Oh no! The hunting horn broke!'},
			{sound = 'Grunt! Grunt!', text = 'The boar is refusing to obey the hunting horn.'}
		},
		success = {sound = 'Oink', text = 'You tamed the wild boar.'}
	},
	[13291]	= {
		name = 'undead cavebear',
		id = 12,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, text = 'The undead cavebear ran away.'},
			{sound = 'GRRRRRRRRRR', text = 'The undead cavebear is growling at you.'}
		},
		success = {sound = 'Grrrrrrr', text = 'You tamed the undead cavebear.'}
	},
	[13292]	= {
		name = 'inoperative tin lizzard',
		mountName = 'tin lizzard',
		id = 8,
		type = TYPE_ITEM,
		chance = 40,
		fail = {
			{destroyObject = true, sound = 'Krr... kch.', text = 'The tin lizzard broke apart.'}
		},
		success = {sound = 'Krkrkrkrk', text = 'You wind up the tin lizzard.'}
	},
	[13293]	= {
		name = 'midnight panther',
		id = 5,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, text = 'The midnight panther ran away.'},
			{sound = 'Groarrrrrrrr', text = 'The midnight panther is growling at you.'}
		},
		success = {sound = 'Purrrrrrr', text = 'You tamed the wild panther.'}
	},
	[13294]	= {
		name = 'draptor',
		id = 6,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, text = 'The wild draptor ran away.'},
			{sound = 'Screeeeeeeeech', text = 'The wild draptor is struggling.'}
		},
		success = {sound = 'Screeeeeeeeech', text = 'You tamed the wild draptor.'}
	},
	[13295]	= {
		name = 'black sheep',
		id = 4,
		type = TYPE_MONSTER,
		chance = 25,
		fail = {
			{run = true, sound = 'Baaaah', text = 'The black sheep ran away.'},
			{broke = true, text = 'Oh no! The reins were torn.'},
			{sound = 'Baaaah', text = 'The black sheep is trying to run away.'}
		},
		success = {sound = 'Baaaaaah', text = 'You tamed the black sheep.'}
	},
	[13298]	= {
		name = 'terror bird',
		id = 2,
		type = TYPE_MONSTER,
		chance = 15,
		fail = {
			{run = true, text = 'The terror bird ran away.'},
			{broke = true, text = 'Oh no, the bird ate the carrot.'},
			{sound = 'CARRRRAAAH!', text = 'The terror bird is pecking you.'}
		},
		success = {sound = 'Guruuuuh', text = 'You tamed the bird.'}
	},
	[13305]	= {
		name = 'crustacea gigantica',
		id = 7,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, text = 'The gigantic creature ran away.'},
			{sound = 'CHRRRR', text = 'The gigantic creature is trying to pinch you.'}
		},
		success = {sound = 'Chrrrrr', text = 'You tamed the gigantic creature.'}
	},
	[13307]	= {
		name = 'wailing widow',
		id = 1,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, sound = 'SSSSSSSSSSSSS', text = 'The wailing widow ran away.'},
			{broke = true, text = 'Oh no! The wailing widow ate the bait.'},
			{sound = 'SSSSSSSSSSSSS', text = 'The wailing widow is hissing at you.'}
		},
		success = {sound = 'Sssssssss', text = 'You tamed the wailing widow.'}
	},
	[13498]	= {
		name = 'sandstone scorpion',
		id = 21,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, sound = '*rattle-rattle*', text = 'The sandstone scorpion flees.'},
			{broke = true, text = 'Using the sceptre on the stone surface of the scorpion, it breaks in two halves.'},
			{sound = '*tak tak tak*', text = 'The sandstone scorpion eludes the influence of the scepter.'}
		},
		success = {sound = '*rattle*', text = 'You tamed the sandstone scorpion'}
	},
	[13508]	= {
		name = 'slug',
		id = 14,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, sound = 'Slurp!', text = 'The slug flees.'},
			{broke = true, text = 'This slug drug didn\'t seem to have any effect.'},
			{sound = '*shlorp*', text = 'The slug slips through your grasp.'}
		},
		success = {sound = 'Sluuuuurp!', text = 'You drugged the slug.'}
	},
	[13535]	= {
		name = 'dromedary',
		id = 20,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, sound = 'Gruuuuunt!', text = 'The dromedary flees.'},
			{sound = 'Grunt!', text = 'The dromedary remains stubborn.'}
		},
		success = {sound = '*blaaammm*', text = 'You tamed the dromedary.'}
	},
	[13536]	= {
		name = 'crystal wolf',
		id = 16,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, sound = '*zwiiiish*', text = 'The crystal wolf vanished into thin air.'},
			{sound = '*klaaaaaang* Rrrrooooaaaarrrgh!', text = 'The crystal wolf is startled by the wrong sound of the diapason.'}
		},
		success = {sound = '*kliiiiiiiiiiing* Aooooouuuuu!!', text = 'The smooth sound of the diapason tamed the crystal wolf.'}
	},
	[13537]	= {
		mountName = 'donkey',
		lookType = 399,
		id = 13,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{removeTransformation = true, text = 'The donkey transformation suddenly wears off.'},
			{broke = true, sound = 'Heeee-haaa-haaa-haaw!', text = 'You did not manage to feed the donkey enough apple slices.'}
		},
		success = {sound = 'Heeee-haaaaw!', text = 'Munching a large pile of apple slices tamed the donkey.'}
	},
	[13538]	= {
		name = 'panda',
		id = 19,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, sound = 'Grrrrr!', text = 'The panda flees.'},
			{broke = true, text = 'While you were trying to soothe the panda, it ate all the remaining bamboo behind your back.'},
			{sound = 'Grrrroaaar!!', text = 'The panda refuses to follow any of your orders.'}
		},
		success = {sound = 'Rrrrr...', text = 'You tamed the panda.'}
	},
	[13539]	= {
		name = 'enraged white deer',
		mountName = 'white deer',
		id = 18,
		type = TYPE_MONSTER,
		chance = 40,
		fail = {
			{run = true, sound = '*sniff*', text = 'The white deer flees.'},
			{broke = true, sound = 'ROOOAAARR!!', text = 'Oh no... the enraged deer angrily ripped the fir cone from your hands!'},
			{sound = '*wheeze*', text = 'The white deer sniffs and wheezes trying to withstand the taming.'}
		},
		success = {sound = '*bell*', text = 'You tamed the white deer.'}
	},
	[13938]	= {
		name = 'inoperative uniwheel',
		mountName = 'uniwheel',
		id = 15,
		type = TYPE_ITEM,
		chance = 40,
		fail = {
			{broke = true, sound = 'Splosh!', text = 'It looks like most of the special oil this can was holding was spilt without any effect.'}
		},
		success = {sound = 'Vroooomratatatatatatat.', text = 'The strange wheel seems to vibrate and slowly starts turning continuously.'}
	},
	[13939]	= {
		name = 'wild horse',
		id = 17,
		type = TYPE_MONSTER,
		chance = 5,
		fail = {
			{run = true, text = 'With its last strength the horse the horse runs to safety.'},
			{broke = true, sound = 'Weeeheeeehee', text = 'The wild horse happily munches the sugar oat and runs on.'},
			{sound = 'Weeheheheehaaa!!', text = 'Weeeheeeehee.'}
		},
		success = {sound = '*snort*', text = 'The horse eats the sugar oat and accepts you as its new master.'}
	},
	[15545]	= {
		name = 'manta ray',
		id = 28,
		type = TYPE_MONSTER,
		chance = 30,
		fail = {
			{run = true, sound = 'Swooooosh', text = 'The manta ray fled.'},
			{sound = 'Shhhhhh', text = 'The manta ray is trying to escape.'}
		},
		success = {sound = '~~~', text = 'You tamed the manta ray.'}
	},
	[15546]	= {
		name = 'ladybug',
		id = 27,
		type = TYPE_MONSTER,
		chance = 30,
		fail = {
			{run = true, text = 'The bug got scared and ran away.'},
			{sound = 'Chrk chrk!', text = 'The ladybug is trying to nibble you.'}
		},
		success = {sound = 'Chhrk...', text = 'You tamed the lady bug.'}
	},
	[18447]	= {
		name = 'ironblight',
		id = 29,
		type = TYPE_MONSTER,
		chance = 30,
		fail = {
			{run = true, sound = 'Pling', text = 'The ironblight managed to run away.'},
			{broke = true, text = 'Oh no! The magnet lost its power!'},
			{sound = 'Plinngggg', text = 'The ironblight is fighting against the magnetic force.'}
		},
		success = {sound = 'Plinnnggggggg', text = 'You tamed the ironblight.'}
	},
	[18448]	= {
		name = 'magma crawler',
		id = 30,
		type = TYPE_MONSTER,
		chance = 30,
		fail = {
			{run = true, sound = 'Charrrrrr', text = 'The magma crawler refused to drink wine and vanishes into thin air.'},
			{broke = true, text = 'Argh! The magma crawler pushed you and you spilled the glow wine!'},
			{sound = '<sniff> <sniff>', text = 'The magma crawler is smelling the glow wine suspiciously.'}
		},
		success = {sound = 'ZzzZzzZzzzZz', text = 'The magma crawler will accompany you as a friend from now on.'}
	},
	[18449] = {
		name = 'dragonling',
		id = 31,
		type = TYPE_MONSTER,
		chance = 30,
		fail = {
			{sound = 'FCHHHHHHHHHHHHHHHH', text = 'The dragonling doesn\'t seem to impressed with your ribbon.'}
		},
		success = {sound = 'FI?', text = 'The wild dragonling has accepted you as its master.'}
	},
	[18516]	= {
		name = 'modified gnarlhound',
		id = 32,
		type = TYPE_MONSTER,
		chance = 100,
		success = {sound = 'Gnarl!', text = 'You now own a modified gnarlhound.'}
	},
	[20138]	= {
		name = 'water buffalo',
		id = 35,
		type = TYPE_MONSTER,
		chance = 30,
		fail = {
			{run = true, sound = 'Baaaah', text = 'The water buffalo flees.'},
			{broke = true, text = 'The leech slipped through your fingers and is now following the call of nature.'},
			{sound = 'Bellow!', text = 'The water buffalo ignores you.'}
		},
		success = {sound = 'Looooow!', text = 'The leech appeased the water buffalo and your taming was successful.'}
	},
	[22608]	= {
		name = 'shock head',
		id = 42,
		type = TYPE_MONSTER,
		chance = 30,
		fail = {
			{run = true, text = 'The shock head ran away.'},
			{sound = 'GRRRRRRRRRRR', text = 'The shock head is growling at you.'}
		},
		success = {sound = 'Grrrrrrr', text = 'You tamed the shock head.'}
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local mount = config[item.itemid]
	if not mount then
		return false
	end

	local targetName = target:getName():lower()
	if mount.type ~= target.type
			or (mount.lookType and mount.lookType ~= target:getOutfit().lookType)
			or (mount.name and mount.name ~= targetName) then
		return false
	end

	if player:hasMount(mount.id) then
		player:say('You already tamed a ' .. (mount.mountName or targetName) .. '.', TALKTYPE_MONSTER_SAY)
		return true
	end

	if target.type == TYPE_MONSTER then
		if target:getMaster() then
			return false
		end
	end

	if math.random(100) > mount.chance then
		local action = mount.fail[math.random(#mount.fail)]
		if action.run then
			target:remove()
		elseif action.broke then
			item:remove(1)
		elseif action.destroyObject then
			addEvent(Game.createItem, 60 * 60 * 1000, target.itemid, 1, toPosition)
			target:remove()
		elseif action.removeTransformation then
			target:removeCondition(CONDITION_OUTFIT)
		end

		doCreatureSayWithRadius(player, action.text, TALKTYPE_MONSTER_SAY, 2, 2)
		if action.sound then
			player:say(action.sound, TALKTYPE_MONSTER_SAY, false, 0, toPosition)
		end
		return true
	end

	player:addAchievement('Natural Born Cowboy')
	player:addMount(mount.id)
	doCreatureSayWithRadius(player, mount.success.text, TALKTYPE_MONSTER_SAY, 2, 2)
	player:say(mount.success.sound, TALKTYPE_MONSTER_SAY, false, 0, toPosition)

	target:remove()
	item:remove(1)
	return true
end
