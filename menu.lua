function BeginTextCommandDisplayText(text)
    return Citizen.InvokeNative(0x25FBB336DF1804CB, text)
end

function AddTextComponentSubstringPlayerName(text)
    return Citizen.InvokeNative(0x6C188BE134E074AA, text)
end

--[[
WarMenu by Warxander
https://github.com/warxander

vRP Tunnel and Proxy libraries by ImagicTheCat
https://github.com/ImagicTheCat/vRP/tree/master/vrp

Anyone is free to use this menu and modify it as they please. All I ask in return is that
you do not try to monetize this release - I made this because I was tired of seeing
people trying to sell the same old reused code and charging ridiculous amounts for it.

  /\   _____  ______          _____         _____  _      ______           _____ ______   /\
 |/\| |  __ \|  ____|   /\   |  __ \       |  __ \| |    |  ____|   /\    / ____|  ____| |/\|
      | |__) | |__     /  \  | |  | |      | |__) | |    | |__     /  \  | (___ | |__
      |  _  /|  __|   / /\ \ | |  | |      |  ___/| |    |  __|   / /\ \  \___ \|  __|
      | | \ \| |____ / ____ \| |__| |      | |    | |____| |____ / ____ \ ____) | |____
      |_|  \_\______/_/    \_\_____/       |_|    |______|______/_/    \_\_____/|______|
]]
-- CONFIG
--[[
If you make an edit and would like to add your name, feel free to do so.
Please leave the original developers somewhere in the credits.
]]
developers = {
    "tommyakshot - Joeyarrabi#7440", -- Main Developer
    "Kirtle - Kirtle#0498", -- Secondary Developer
    "Erwin Rommel - Erwin Rommel#4860" -- Tertiary Developer and GitHub Maintenance
}

-- Keybindings
-- Supported keys are shown below (line 1316)
-- Find new ones at https://docs.fivem.net/game-references/controls/

menuKeybind = "F1" -- Key to open the menu
noclipKeybind = "F10" -- Key to toggle Noclip
healplayerKeybind = "F2" -- Key to heal player
freecamKeybind = "F5" -- Key to toggle Freecam
shootKeybind = 24 -- Left mouse button to shoot
exitFreecamKeybind = 243 -- ` key to exit Freecam

-- End Keybindings

menuName = "BAKAsMenu" -- The name of the menu
version = "1.0" -- Keep it simple
theme = "darkblue" -- Feel free to make your own
themes = {"infamous", "basic", "dark", "normal", "darkblue"} -- Add themes here if you want them to be in the theme selector
mpMessage = false -- Whether or not to use the big mp message
startMessage = "∑ ~b~Welcome, " .. GetPlayerName(PlayerId()) .. "." -- The message that is shown when the menu is opened
subMessage = "~w~Press ~b~" .. menuKeybind .. "~w~ to open the menu." -- subtitle of opening message
motd = "∑ Press ~b~" .. noclipKeybind .. "~w~ to toggle noclip!" -- motd

-- Add any new menus to this list (for theme changer/textures)
menulist = {

    -- MAIN SUBMENUS
    'skid',
    'player',
    'self',
    'weapon',
    'vehicle',
    'world',
    'misc',
    'teleport',
    'lua',

    -- PLAYER SUBMENUS
    'allplayer',
    'playeroptions',

    -- SELF SUBMENUS
    'appearance',
    'modifyskintextures',
    'modifyhead',
    'modifiers',

    -- WEAPON SUBMENUS
    'weaponspawner',

    -- WEAPON SPAWNER SUBMENUS
    'melee',
    'pistol',
    'shotgun',
    'smg',
    'assault',
    'sniper',
    'thrown',
    'heavy',

    -- VEHICLE SUBMENUS
    'vehiclespawner',
    'vehiclemods',
    'vehiclemenu',

    'vehiclecolors',
    'vehiclecolors_primary',
    'vehiclecolors_secondary',
    'primary_classic',
    'primary_matte',
    'primary_metal',
    'secondary_classic',
    'secondary_matte',
    'secondary_metal',

    'vehicletuning',

    -- VEHICLE SPAWNER SUBMENUS
    'compacts',
    'sedans',
    'suvs',
    'coupes',
    'muscle',
    'sportsclassics',
    'sports',
    'super',
    'motorcycles',
    'offroad',
    'industrial',
    'utility',
    'vans',
    'cycles',
    'boats',
    'helicopters',
    'planes',
    'service',
    'commercial',

    -- WORLD SUBMENUS
    'objectspawner',
    'objectlist',
    'weather',
    'time',

    -- MISC SUBMENUS
    'esp',
    'keybindings',
    'webradio',
    'credits',

    -- TELEPORT SUBMENUS
    'saveload',
    'pois',

    -- LUA SUBMENUS
    'esx',
    'vrp',
    'other',
    
    -- ANTICHEAT BYPASS
    'anticheatbypass'
}
-- END CONFIG

-- Modify Skin Textures
faceItemsList = {}
faceTexturesList = {}
hairItemsList = {}
hairTextureList = {}
maskItemsList = {}
hatItemsList = {}
hatTexturesList = {}

-- Noclip Speed Options
NoclipSpeedOps = {1, 5, 10, 20, 30}
-- Default Noclip Speed
NoclipSpeed = 1
oldSpeed = nil

-- Forcefield Radius Options
ForcefieldRadiusOps = {5.0, 10.0, 15.0, 20.0, 50.0}
-- Default Forcefield Radius
ForcefieldRadius = 5.0

-- Fast Run/Swim Options
FastCB = {1.0, 1.09, 1.19, 1.29, 1.39, 1.49}
FastCBWords = {"+0%", "+20%", "+40%", "+60%", "+80%", "+100%"}
-- Default
FastRunMultiplier = 1.0
FastSwimMultiplier = 1.0

-- Object Rotation Options
RotationOps = {0, 45, 90, 135, 180}
-- Default Rotation
ObjRotation = 90

-- Gravity options
GravityOps = {0.0, 5.0, 9.8, 50.0, 100.0, 200.0, 500.0, 1000.0, 9999.9}
GravityOpsWords = {"0", "5", "Default", "50", "100", "200", "500", "1000", "9999"}
-- Default
GravAmount = 9.8

-- Speed mod options
SpeedModOps = {1.0, 1.5, 2.0, 3.0, 5.0, 10.0, 20.0, 50.0, 100.0, 500.0, 1000.0}
SpeedModAmt = 1.0

-- ESP Distance Options
ESPDistanceOps = {50.0, 100.0, 500.0, 1000.0, 2000.0, 5000.0}
EspDistance = 500.0

-- ESP Refresh Options
ESPRefreshOps = {"0ms", "100ms", "250ms", "500ms", "1s", "2s", "5s"}
ESPRefreshTime = 0

-- Aimbot Bone Options
AimbotBoneOps = {"Head", "Chest", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "Dick"}
AimbotBone = "SKEL_HEAD"

-- Clothing Slots
ClothingSlots = {1, 2, 3, 4, 5}

-- Ped Attack Types
PedAttackOps = {"All Weapons", "Melee Weapons", "Pistols", "Heavy Weapons"}
-- Default
PedAttackType = 1

-- Radios
RadiosList = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}
RadiosListWords = {
    "Los Santos Rock Radio",
    "Non-Stop-Pop FM",
    "Radio Los Santos",
    "Channel X",
    "West Coast Talk Radio",
    "Rebel Radio",
    "Soulwax FM",
    "East Los FM",
    "West Coast Classics",
    "Blue Ark",
    "Worldwide FM",
    "FlyLo FM",
    "The Lowdown 91.1",
    "The Lab",
    "Radio Mirror Park",
    "Space 103.2",
    "Vinewood Boulevard Radio",
    "Blonded Los Santos 97.8 FM",
    "Blaine County Radio",
}

-- Weathers
WeathersList = {
    "CLEAR",
    "EXTRASUNNY",
    "CLOUDS",
    "OVERCAST",
    "RAIN",
    "CLEARING",
    "THUNDER",
    "SMOG",
    "FOGGY",
    "XMAS",
    "SNOWLIGHT",
    "BLIZZARD"
}

-- Objects to spawn
objs_tospawn = {
    "stt_prop_stunt_track_start",
    "prop_container_01a",
    "prop_contnr_pile_01a",
    "ce_xr_ctr2",
    "stt_prop_ramp_jump_xxl",
    "hei_prop_carrier_jet",
    "prop_parking_hut_2",
    "csx_seabed_rock3_",
    "db_apart_03_",
    "db_apart_09_",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
    "xs_prop_hamburgher_wl",
    "sr_prop_spec_tube_xxs_01a"
}

-- WEAPONS LISTS
local allweapons = {
    "WEAPON_UNARMED",
    -- Melee
    "WEAPON_KNIFE",
    "WEAPON_KNUCKLE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_BOTTLE",
    "WEAPON_DAGGER",
    "WEAPON_HATCHET",
    "WEAPON_MACHETE",
    "WEAPON_FLASHLIGHT",
    "WEAPON_SWITCHBLADE",
    "WEAPON_POOLCUE",
    "WEAPON_PIPEWRENCH",

    -- Thrown
    "WEAPON_GRENADE",
    "WEAPON_STICKYBOMB",
    "WEAPON_PROXMINE",
    "WEAPON_BZGAS",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_MOLOTOV",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_PETROLCAN",
    "WEAPON_SNOWBALL",
    "WEAPON_FLARE",
    "WEAPON_BALL",

    -- Pistols
    "WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_STUNGUN",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_RAYPISTOL",

    -- SMGs / MGs
    "WEAPON_MICROSMG",
    "WEAPON_MINISMG",
    "WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_COMBATPDW",
    "WEAPON_GUSENBERG",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_RAYCARBINE",

    -- Assault Rifles
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_COMPACTRIFLE",

    -- Shotguns
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_SWEEPERSHOTGUN",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",

    -- Sniper Rifles
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_MARKSMANRIFLE_MK2",

    -- Heavy Weapons
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_MINIGUN",
    "WEAPON_FIREWORK",
    "WEAPON_RAILGUN",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_RAYMINIGUN",
}

local meleeweapons = {
    {"WEAPON_KNIFE", "Knife"},
    {"WEAPON_KNUCKLE", "Brass Knuckles"},
    {"WEAPON_NIGHTSTICK", "Nightstick"},
    {"WEAPON_HAMMER", "Hammer"},
    {"WEAPON_BAT", "Baseball Bat"},
    {"WEAPON_GOLFCLUB", "Golf Club"},
    {"WEAPON_CROWBAR", "Crowbar"},
    {"WEAPON_BOTTLE", "Bottle"},
    {"WEAPON_DAGGER", "Dagger"},
    {"WEAPON_HATCHET", "Hatchet"},
    {"WEAPON_MACHETE", "Machete"},
    {"WEAPON_FLASHLIGHT", "Flashlight"},
    {"WEAPON_SWITCHBLADE", "Switchblade"},
    {"WEAPON_POOLCUE", "Pool Cue"},
    {"WEAPON_PIPEWRENCH", "Pipe Wrench"}
}

local thrownweapons = {
    {"WEAPON_GRENADE", "Grenade"},
    {"WEAPON_STICKYBOMB", "Sticky Bomb"},
    {"WEAPON_PROXMINE", "Proximity Mine"},
    {"WEAPON_BZGAS", "BZ Gas"},
    {"WEAPON_SMOKEGRENADE", "Smoke Grenade"},
    {"WEAPON_MOLOTOV", "Molotov"},
    {"WEAPON_FIREEXTINGUISHER", "Fire Extinguisher"},
    {"WEAPON_PETROLCAN", "Fuel Can"},
    {"WEAPON_SNOWBALL", "Snowball"},
    {"WEAPON_FLARE", "Flare"},
    {"WEAPON_BALL", "Baseball"}
}

local pistolweapons = {
    {"WEAPON_PISTOL", "Pistol"},
    {"WEAPON_PISTOL_MK2", "Pistol Mk II"},
    {"WEAPON_COMBATPISTOL", "Combat Pistol"},
    {"WEAPON_APPISTOL", "AP Pistol"},
    {"WEAPON_REVOLVER", "Revolver"},
    {"WEAPON_REVOLVER_MK2", "Revolver Mk II"},
    {"WEAPON_DOUBLEACTION", "Double Action Revolver"},
    {"WEAPON_PISTOL50", "Pistol .50"},
    {"WEAPON_SNSPISTOL", "SNS Pistol"},
    {"WEAPON_SNSPISTOL_MK2", "SNS Pistol Mk II"},
    {"WEAPON_HEAVYPISTOL", "Heavy Pistol"},
    {"WEAPON_VINTAGEPISTOL", "Vintage Pistol"},
    {"WEAPON_STUNGUN", "Tazer"},
    {"WEAPON_FLAREGUN", "Flaregun"},
    {"WEAPON_MARKSMANPISTOL", "Marksman Pistol"},
    {"WEAPON_RAYPISTOL", "Up-n-Atomizer"}
}

local smgweapons = {
    {"WEAPON_MICROSMG", "Micro SMG"},
    {"WEAPON_MINIS
