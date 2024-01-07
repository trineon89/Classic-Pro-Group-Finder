-- results_layout.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local AceGUI = LibStub("AceGUI-3.0")

function ClassicProGroupFinder:CreateResultsWindow()
    if self.resultsWindow then
        self.resultsWindow:Show()
        return
    end

    -- Create the results window frame
    local resultsWindow = AceGUI:Create("Frame")
    resultsWindow:SetTitle("Search Results")
    resultsWindow:SetCallback("OnClose", function(widget) widget:Hide() end)
    resultsWindow:SetLayout("Fill")
    self.resultsWindow = resultsWindow

    -- Create a scroll container
    local scrollContainer = AceGUI:Create("ScrollFrame")
    scrollContainer:SetLayout("Flow")  -- Adjust layout as needed
    resultsWindow:AddChild(scrollContainer)

    -- Store the scroll container for adding results later
    self.resultsWindow.scrollContainer = scrollContainer
end

function ClassicProGroupFinder:UpdateResultsLayout()
    self:Debug("Debug - Updating results layout")  -- Debug print
    if not self.resultsWindow or not self.listings then
		print("No data to update")  -- Debug print
        return  -- Ensure the results window and listings are initialized
    end

    local scrollContainer = self.resultsWindow.scrollContainer
    scrollContainer:ReleaseChildren()  -- Clear existing entries

    for _, listingElement in ipairs(self.listings.entries) do
        local layout = listingElement:createLayout()
        scrollContainer:AddChild(layout)
    end
end
