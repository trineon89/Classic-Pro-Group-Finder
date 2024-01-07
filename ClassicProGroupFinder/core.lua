-- core.lua
local addonName, addonTable = ...

-- Addon setup and initialization
local ClassicProGroupFinder = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceEvent-3.0", "AceComm-3.0")



function ClassicProGroupFinder:OnInitialize()
	self:Debug("core loaded")
    -- Perform setup tasks here
	
	-- Initialize Listings

	self.listings = self.Listings:new()
    -- self.listings:addListing("Test message","Test Sender")  -- Static test entry
    -- self:UpdateResultsLayout()  -- Call this somewhere appropriate to update the UI
end

function ClassicProGroupFinder:OnEnable()
    -- Called when the addon is enabled
end

function ClassicProGroupFinder:OnDisable()
    -- Called when the addon is disabled
end

addonTable.ClassicProGroupFinder = ClassicProGroupFinder

-- Slash command handler
SLASH_CLASSICPROGROUPFINDER1 = "/cpgf"
SLASH_CLASSICPROGROUPFINDER2 = "/cpgfclose"

SlashCmdList["CLASSICPROGROUPFINDER"] = function(input)
    input = input:trim()
    if input == "" then
        ClassicProGroupFinder:ShowInterface()
    elseif input == "close" then
        ClassicProGroupFinder:HideInterface()
    elseif input == "results" or input == "r" then
        ClassicProGroupFinder:CreateResultsWindow()
    else
        -- Handle any other arguments or show usage message
        print("Usage: /cpgf [close/results/r]")
    end
end