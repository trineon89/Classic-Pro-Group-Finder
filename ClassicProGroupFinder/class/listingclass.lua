-- class/listingclass.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder

-- Define the WoWRoles type with the possible roles
ClassicProGroupFinder.WoWRoles = {
    Melee = "Melee",
    Range = "Range",
    Caster = "Caster",
    Healer = "Healer",
    Tank = "Tank",
    Offtank = "Offtank",
}

-- Define the LFG class
ClassicProGroupFinder.LFG = {
    Level = nil,
    Class = nil,
    Roles = {},  -- Expected to be a list of WoWRoles
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