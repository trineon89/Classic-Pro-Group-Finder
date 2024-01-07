-- listings.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder

-- Import the Listing class from the class/listingclass.lua file
local Listing = ClassicProGroupFinder.Listing

-- Define the Listings class
ClassicProGroupFinder.Listings = {}
local Listings = ClassicProGroupFinder.Listings

function Listings:new()
    local instance = setmetatable({}, { __index = Listings })
    instance.entries = {}  -- Table to store listing elements
    return instance
end

--[[
function Listings:addListing(message, sender)
    local id = 123  -- You will need a way to generate a unique ID for each listing
    local type = "LFG"  -- You will need logic to determine if this is LFG or LFM based on the message
    local timestamp = GetServerTime()  -- This will get the UNIX timestamp for the current time
    local lfg = nil  -- Placeholder for the LFG class instance

    -- Logic to create an LFG instance if the type is LFG
    -- You'll need to extract level, class, and roles from the message
    if type == "LFG" then
        -- Example logic to create an LFG instance
        local level = 25  -- Placeholder level
        local class = "Warrior"  -- Placeholder class
        local roles = {ClassicProGroupFinder.WoWRoles.Melee}  -- Placeholder roles
        lfg = ClassicProGroupFinder.LFG:new(level, class, roles)
    end

    -- Create a new Listing instance with the parsed data
    local listing = ClassicProGroupFinder.Listing:new(id, type, lfg, sender, timestamp, message)

    -- Add the new Listing instance to the entries table
    table.insert(self.entries, listing)
    
    -- If you have a method to update the UI, you should call it here
    ClassicProGroupFinder:UpdateResultsLayout()  -- Assuming this function updates the UI with new listings
end
--]]
--[[
-- listings.lua
function Listings:addListing(listingData)
    -- Create a new Listing instance with the parsed data
    local listingElement = ClassicProGroupFinder.Listing:new(listingData)
    table.insert(self.entries, listingElement)

    -- Update the UI with the new listing
    ClassicProGroupFinder:UpdateResultsLayout()
end
--]]

function Listings:addListing(listingData)
    local listing = ClassicProGroupFinder.Listing:new(listingData)  -- Create a Listing instance
    local listingElement = ClassicProGroupFinder.ListingElement:new(listing)  -- Create a ListingElement instance
    table.insert(self.entries, listingElement)
	-- Update the UI with the new listing
    ClassicProGroupFinder:UpdateResultsLayout()
end
