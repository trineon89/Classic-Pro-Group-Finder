-- ac_selector_layout.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local AceGUI = LibStub("AceGUI-3.0")

function ClassicProGroupFinder:CreateACSelectorLayout(container)
    -- Dungeon button
    local dungeonButton = AceGUI:Create("Button")
    dungeonButton:SetText("Dungeon")
    dungeonButton:SetFullWidth(true)
    dungeonButton:SetCallback("OnClick", function()
        self:UpdateActivitiesLayout("Dungeon")
    end)
    container:AddChild(dungeonButton)

    -- Raid button
    local raidButton = AceGUI:Create("Button")
    raidButton:SetText("Raid")
    raidButton:SetFullWidth(true)
    raidButton:SetCallback("OnClick", function()
        self:UpdateActivitiesLayout("Raid")
    end)
    container:AddChild(raidButton)
	
	local function updateActivitiesLayout(activityType)
        if activityType then
            self:CreateActivitiesLayout(self.activitiesLayout, activityType)
            self.activitiesLayout.frame:Show()  -- Show activities layout

            if self.isSearchActive then
                self:LockActivitiesLayout()  -- Keep layout locked if search is active
            else
                self:ResetActivitiesLayout()  -- Reset layout if no search is active
            end
        else
            self.activitiesLayout.frame:Hide()  -- Hide activities layout
        end
    end

    -- Update the callback for Dungeon and Raid buttons
    dungeonButton:SetCallback("OnClick", function()
        updateActivitiesLayout("Dungeon")
    end)
    raidButton:SetCallback("OnClick", function()
        updateActivitiesLayout("Raid")
    end)
end
