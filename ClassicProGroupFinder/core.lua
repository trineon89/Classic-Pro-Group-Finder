-- Import Ace3 libraries
local AceAddon = LibStub("AceAddon-3.0")
local AceComm = LibStub("AceComm-3.0")

-- Define the addon
ClassicProGroupFinder = AceAddon:NewAddon("ClassicProGroupFinder", "AceComm-3.0")

-- Instance of MainFrame
ClassicProGroupFinder.mainFrame = nil

-- Function to initialize the addon
function ClassicProGroupFinder:OnInitialize()
    -- Create and initialize the MainFrame
    self.mainFrame = MainFrame:New()

    -- Register slash command
    SLASH_CLASSICPROGROUPFINDER1 = "/cpgf"
    SlashCmdList["CLASSICPROGROUPFINDER"] = function(msg)
        self:ToggleMainFrame(msg)
    end
	
	
	self.mainFrame:Show()
end

-- Function to toggle the main frame
function ClassicProGroupFinder:ToggleMainFrame(msg)
    if self.mainFrame.frame:IsShown() then
        self.mainFrame:Hide()
    else
        self.mainFrame:Show()
    end
end

-- Event handler for communication (example)
function ClassicProGroupFinder:OnCommReceived(prefix, message, distribution, sender)
    -- Handle received communication
end
