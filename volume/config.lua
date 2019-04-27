-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp"
hotkeyAimbotEnabled = true
protectionLevel = 100
killsToRedSkull = 5
killsToBlackSkull = 10
pzLocked = 60000
removeChargesFromRunes = false
timeToDecreaseFrags = 4 * 60 * 60 * 1000
whiteSkullTime = 7 * 60 * 1000
stairJumpExhaustion = 500
experienceByKillingPlayers = false
expFromPlayersLevelRange = 75

freeDepotLimit = 2000
premiumDepotLimit = 10000
depotBoxes = 17

storeImagesUrl = "http://127.0.0.1"
storeCoinsPacketSize = 5200

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
ip = "40.127.107.33"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = "2100"
motd = "Bem vindo ao melhor global_fogotten!"
onePlayerOnlinePerAccount = true
allowClones = false
serverName = "forgotten"
statusTimeout = 5000
replaceKickOnLogin = true
maxPacketsPerSecond = 1000

enableLiveCasting = true
liveCastPort = 7173
-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
housePriceEachSQM = 1000
houseRentPeriod = "never"

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "map1"
mapAuthor = "Elera"

-- Market
marketOfferDuration = 30 * 24 * 60 * 60
premiumToCreateMarketOffer = true
checkExpiredMarketOffersEachMinutes = 60
maxMarketOffersAtATimePerPlayer = 100

-- MySQL
mysqlHost = "database"
mysqlUser = "root"
mysqlPass = "1234"
mysqlDatabase = "otserv"
mysqlPort = "3306"
passwordType = "sha1"
mysqlSock = ""

-- Misc.
allowChangeOutfit = true
freePremium = true
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
emoteSpells = true
classicEquipmentSlots = false

-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
rateExp = stages
rateSkill = 50
rateLoot = 4
rateMagic = 10
rateSpawn = 1

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = true

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = true

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = false

-- Status server information
ownerName = "forgotten"
ownerEmail = ""
url = "http://www.otland.net"
location = "Brazil"