-- base_layout.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local AceGUI = LibStub("AceGUI-3.0")

local mainFrame = _G["CPGFMainFrame"]
local frameLeft
local frameRight

function ClassicProGroupFinder:InitializeMainFrame()

	--local mainFrame = _G["CPGFMainFrame"]
    if mainFrame then
        self:Debug("MainFrame found in InitializeMainFrame")
        -- Your code to initialize mainFrame...
    else
        self:Debug("Error: MainFrame not found in InitializeMainFrame")
    end
	
    -- Apply styles and properties
	mainFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = {left = 11, right = 12, top = 12, bottom = 11}
    })
	
	mainFrame:SetMovable(true)
	mainFrame:EnableMouse(true)
	mainFrame:RegisterForDrag("LeftButton")
	mainFrame:SetScript("OnDragStart", mainFrame.StartMoving)
	mainFrame:SetScript("OnDragStop", mainFrame.StopMovingOrSizing)

	-- Access inner frames
    frameLeft = mainFrame.FrameLeft
    frameRight = mainFrame.FrameRight

    -- Store references for later use
  --  self.frameLeft = frameLeft
 --   self.frameRight = frameRight
  --  self.mainFrame = mainFrame
	
	self.AddContentToLeftFrame()
	--self.AddContentToRightFrame()
end


function ClassicProGroupFinder:ShowInterface()
    print("ShowInterface called on:", self)  -- Debugging
    if mainFrame then
        print("Showing main frame:", mainFrame)  -- Debugging
        mainFrame:Show()
	end
end

function ClassicProGroupFinder:ShowFrameLeftContent()
    if self.frameLeft then
        -- Add/show content for FrameLeft
        self.frameLeft:Show()
    end
end

function ClassicProGroupFinder:HideFrameLeftContent()
    if self.frameLeft then
        -- Hide/remove content for FrameLeft
        self.frameLeft:Hide()
    end
end

function ClassicProGroupFinder:ShowFrameRightContent()
    if self.frameRight then
        -- Add/show content for FrameRight
        self.frameRight:Show()
    end
end

function ClassicProGroupFinder:HideFrameRightContent()
    if self.frameRight then
        -- Hide/remove content for FrameRight
        self.frameRight:Hide()
    end
end

function ClassicProGroupFinder:AddContentToLeftFrame()
    local label = frameLeft:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("CENTER", self.frameLeft, "CENTER", 0, 0)
    label:SetText("Content in Left Frame")
    self.leftFrameLabel = label -- Store reference for later removal
end

function ClassicProGroupFinder:AddContentToRightFrame()
    local button = CreateFrame("Button", nil, self.frameRight, "UIPanelButtonTemplate")
    button:SetPoint("CENTER", self.frameRight, "CENTER", 0, 0)
    button:SetSize(120, 40)
    button:SetText("Right Frame Button")
    button:SetScript("OnClick", function() print("Button clicked!") end)
    self.rightFrameButton = button -- Store reference for later removal
end

function ClassicProGroupFinder:RemoveContentFromLeftFrame()
    if self.leftFrameLabel then
        self.leftFrameLabel:Hide()
        self.leftFrameLabel = nil -- Clear reference after removal
    end
end

function ClassicProGroupFinder:RemoveContentFromRightFrame()
    if self.rightFrameButton then
        self.rightFrameButton:Hide()
        self.rightFrameButton = nil -- Clear reference after removal
    end
end