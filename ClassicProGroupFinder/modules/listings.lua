-- listings.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder

-- Define the Listings class
ClassicProGroupFinder.Listings = {}
local Listings = ClassicProGroupFinder.Listings

function Listings:new()
    local instance = setmetatable({}, { __index = Listings })
    instance.entries = {}  -- Table to store listing elements
    return instance
end

function Listings:addListing(message, sender)
    print("Debug - Adding listing:", message, "from", sender)  -- Debug print
    local listingElement = ClassicProGroupFinder.ListingElement:new(message, sender)
    table.insert(self.entries, listingElement)
end
