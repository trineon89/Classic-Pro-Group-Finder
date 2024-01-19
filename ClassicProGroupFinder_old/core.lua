-- core.lua
local addonName, addonTable = ...

-- Addon setup and initialization
local ClassicProGroupFinder = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceEvent-3.0", "AceComm-3.0")

addonTable.ClassicProGroupFinder = ClassicProGroupFinder


function ClassicProGroupFinder:OnInitialize()
	self:Debug("core loaded")
	
	if _G["CPGFMainFrame"] then
		self:Debug("MainFrame found")
	else
		self:Debug("Error: MainFrame not found")
	end
	
	C_Timer.After(1, function()
		if self.InitializeMainFrame then
			self:InitializeMainFrame()
		end
	end)
    
	
	--[[
	
	self:Debug("Addon initializing")
    C_Timer.After(1, function()
        self:Debug("Checking MainFrame after delay")
        if _G["CPGFMainFrame"] then
            self:Debug("MainFrame found after delay")
        else
            self:Debug("Error: MainFrame not found after delay")
        end
    end)
	--]]
	
	-- Initialize Listings
	--self.listings = self.Listings:new()
	
    -- self.listings:addListing("Test message","Test Sender")  -- Static test entry
    -- self:UpdateResultsLayout()  -- Call this somewhere appropriate to update the UI
end

function ClassicProGroupFinder:OnEnable()
    -- Called when the addon is enabled
end

function ClassicProGroupFinder:OnDisable()
    -- Called when the addon is disabled
end

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