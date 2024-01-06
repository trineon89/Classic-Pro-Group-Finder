-- base_layout.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local AceGUI = LibStub("AceGUI-3.0")

-- Function to create and show the base layout
function ClassicProGroupFinder:ShowInterface()
    if self.mainFrame then
        self.mainFrame:Show()
        return
    end

    local mainFrame = AceGUI:Create("Frame")
    mainFrame:SetTitle("Classic Pro Group Finder")
    mainFrame:SetStatusText("Ready")
    mainFrame:SetCallback("OnClose", function(widget)
        AceGUI:Release(widget)
        self.mainFrame = nil
    end)
    mainFrame:SetLayout("Flow")
    self.mainFrame = mainFrame
	
	local mainFrameWidth = mainFrame.frame:GetWidth()

    -- Create the AC Selector Layout on the left side
    local acSelectorLayout = AceGUI:Create("InlineGroup")
    acSelectorLayout:SetTitle("AC Selector Layout")
    acSelectorLayout:SetRelativeWidth(0.4) -- 40% width of mainFrame
    acSelectorLayout:SetLayout("List") -- A list layout for the buttons
    mainFrame:AddChild(acSelectorLayout)
    self.acSelectorLayout = acSelectorLayout
    self:CreateACSelectorLayout(acSelectorLayout)

    -- Create the Activities Layout on the right side
    local activitiesLayout = AceGUI:Create("InlineGroup")
    activitiesLayout:SetTitle("Activities Layout")
    activitiesLayout:SetRelativeWidth(0.6) -- 60% width of mainFrame
    activitiesLayout:SetLayout("List") -- Change to "Fill" if you want contained elements to fill the space
    mainFrame:AddChild(activitiesLayout)
	self.activitiesLayout = activitiesLayout
    self:UpdateActivitiesLayout("Dungeon")
	
	-- Initially hide the activities layout
    self.activitiesLayout.frame:Hide()

end

function ClassicProGroupFinder:UpdateActivitiesLayout(activityType)
    if not self.activitiesLayout then
        print("Error: Activities layout container does not exist.")
        return
    end

    -- Clear the current activities layout
    self.activitiesLayout:ReleaseChildren()

    -- Repopulate the activities layout based on the selected activity type
    self:CreateActivitiesLayout(self.activitiesLayout, activityType)
end

-- Function to hide the base layout
function ClassicProGroupFinder:HideInterface()
    if self.mainFrame then
        self.mainFrame:Hide()
    end
end
