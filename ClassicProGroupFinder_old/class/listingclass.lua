-- class/listingclass.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder

-- Define the ClassicProGroupFinder.WoWRoles type with the possible roles
ClassicProGroupFinder.WoWRoles = {
    Melee = "Melee",
    Range = "Range",
    Caster = "Caster",
    Healer = "Healer",
    Tank = "Tank",
    Offtank = "Offtank",
}

ClassicProGroupFinder.WoWClasses = {
	Druid = {
		name = "Druid",
		icon = "Interface\\ICONS\\ClassIcon_Druid",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Melee, ClassicProGroupFinder.WoWRoles.Caster, ClassicProGroupFinder.WoWRoles.Healer, ClassicProGroupFinder.WoWRoles.Tank, ClassicProGroupFinder.WoWRoles.Offtank }
	},
	Hunter = {
		name = "Hunter",
		icon = "Interface\\ICONS\\ClassIcon_Hunter",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Range }
	},
	Mage = {
		name = "Mage",
		icon = "Interface\\ICONS\\ClassIcon_Mage",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Caster }
	},
	Paladin = {
		name = "Paladin",
		icon = "Interface\\ICONS\\ClassIcon_Paladin",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Melee, ClassicProGroupFinder.WoWRoles.Healer, ClassicProGroupFinder.WoWRoles.Tank, ClassicProGroupFinder.WoWRoles.Offtank }
	},
	Priest = {
		name = "Priest",
		icon = "Interface\\ICONS\\ClassIcon_Priest",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Caster, ClassicProGroupFinder.WoWRoles.Healer }
	},
	Rogue = {
		name = "Rogue",
		icon = "Interface\\ICONS\\ClassIcon_Rogue",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Melee, ClassicProGroupFinder.WoWRoles.Tank, ClassicProGroupFinder.WoWRoles.Offtank }
	},
	Shaman = {
		name = "Shaman",
		icon = "Interface\\ICONS\\ClassIcon_Shaman",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Caster }
	},
	Warlock = {
		name = "Warlock",
		icon = "Interface\\ICONS\\ClassIcon_Warlock",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Caster, ClassicProGroupFinder.WoWRoles.Tank, ClassicProGroupFinder.WoWRoles.Offtank }
	},
	Warrior = {
		name = "Warrior",
		icon = "Interface\\ICONS\\ClassIcon_Warrior",
		availableRoles = { ClassicProGroupFinder.WoWRoles.Melee, ClassicProGroupFinder.WoWRoles.Tank, ClassicProGroupFinder.WoWRoles.Offtank }
	},
}

-- Define the LFG class
ClassicProGroupFinder.LFG = {
    Level = nil,
    Class = nil,
    Roles = {},  -- Expected to be a list of ClassicProGroupFinder.WoWRoles
}

function ClassicProGroupFinder.LFG:new(level, class, roles)
    local instance = setmetatable({}, { __index = ClassicProGroupFinder.LFG })
    instance.Level = level
    instance.Class = class
    instance.Roles = roles
    return instance
end

-- Define the Listing class
ClassicProGroupFinder.Listing = {
    ID = nil,
    TYPE = nil,
    LFG = nil,  -- Default null, will be an instance of LFG if applicable
    LFM = nil,  -- Default null, will be an instance of LFG if applicable
    Sender = nil,
    Timestamp = nil,
    Message = nil,
}

--[[
function ClassicProGroupFinder.Listing:new(id, type, lfg, sender, timestamp, message)
    local instance = setmetatable({}, { __index = ClassicProGroupFinder.Listing })
    instance.ID = id
    instance.TYPE = type
    instance.LFG = lfg
    instance.Sender = sender
    instance.Timestamp = timestamp
    instance.Message = message
    return instance
end
--]]

function ClassicProGroupFinder.Listing:new(listingData)
    local instance = setmetatable({}, { __index = ClassicProGroupFinder.Listing })
    instance.Message = listingData.originalMessage
    instance.Sender = listingData.author
    -- Other fields as necessary
    return instance
end