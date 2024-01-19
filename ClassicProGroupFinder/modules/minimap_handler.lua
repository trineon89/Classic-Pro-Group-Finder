local icon = LibStub("LibDBIcon-1.0")
local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("ClassicProGroupFinder", {
    type = "data source",
    text = "Classic Pro Group Finder",
    icon = "Interface\\Icons\\INV_Misc_GroupLooking",
    OnClick = function(self, button)
        if button == "LeftButton" then
            if ClassicProGroupFinder and ClassicProGroupFinder.mainFrame then
                if ClassicProGroupFinder.mainFrame.frame:IsShown() then
                    ClassicProGroupFinder.mainFrame:Hide()
                else
                    ClassicProGroupFinder.mainFrame:Show()
                end
            end
        end
    end,
    OnTooltipShow = function(tooltip)
        if not tooltip or not tooltip.AddLine then return end
        tooltip:AddLine("Classic Pro Group Finder")
        tooltip:AddLine("|cffffff00Click|r to open/close the group finder window.")
    end,
})

local minimapIconDB = {
    hide = false,
    minimapPos = 220, -- Default position
}

-- Initialize the minimap button
function InitializeMinimapButton()
    if not icon:IsRegistered("ClassicProGroupFinder") then
        icon:Register("ClassicProGroupFinder", LDB, minimapIconDB)
    end
end

-- Call this function in your main addon file to initialize the minimap button
InitializeMinimapButton()
