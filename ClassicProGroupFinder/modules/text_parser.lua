-- text_parser.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder

local TextParser = {}
ClassicProGroupFinder.textParser = TextParser

function TextParser:parseMessage(msg, author)
    -- Perform parsing logic here to extract structured data
    local listingData = {
        originalMessage = msg,
        author = author,
    }
	-- print("Debug - Textparser:", listingData.originalMessage, "from", listingData.author)  -- Debug print
    -- Pass the structured data to Listings to create a new Listing
    ClassicProGroupFinder.listings:addListing(listingData)
end
