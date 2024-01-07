-- listing_element_layout.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local AceGUI = LibStub("AceGUI-3.0")

ClassicProGroupFinder.ListingElement = {}
local ListingElement = ClassicProGroupFinder.ListingElement

function ListingElement:new(listing)
    local instance = setmetatable({}, { __index = ListingElement })
    instance.listing = listing  -- Store the Listing object
    return instance
end

function ListingElement:createLayout()
    local layout = AceGUI:Create("SimpleGroup")
    layout:SetFullWidth(true)
    layout:SetLayout("Flow")

    -- Sender label
    local senderLabel = AceGUI:Create("Label")
	local senderText = self.listing.Sender or "Unknown"  -- Fallback for nil sender
    senderLabel:SetText("From: " .. senderText)
    senderLabel:SetColor(1, 0.82, 0)  -- Orange color for the sender's name
    senderLabel:SetFullWidth(false)
    senderLabel:SetRelativeWidth(0.5)
    layout:AddChild(senderLabel)

    -- Level/Role label (placeholder, replace with dynamic data later)
    local levelRoleLabel = AceGUI:Create("Label")
    levelRoleLabel:SetText("Lv25 DPS")  -- Placeholder text
    levelRoleLabel:SetFullWidth(false)
    levelRoleLabel:SetRelativeWidth(0.25)
    layout:AddChild(levelRoleLabel)

    -- Class label (placeholder, replace with dynamic data later)
    local classLabel = AceGUI:Create("Label")
    classLabel:SetText("WARRIOR (Class)")  -- Placeholder text
    classLabel:SetFullWidth(false)
    classLabel:SetRelativeWidth(0.25)
    layout:AddChild(classLabel)

    -- Message label
    local messageLabel = AceGUI:Create("Label")
	local messageText = self.listing.Message or "Unknown"  -- Fallback for message sender
    messageLabel:SetText("MSG: " .. messageText)
    messageLabel:SetFullWidth(true)
    layout:AddChild(messageLabel)

    -- The layout elements are added to a SimpleGroup and arranged according to the relative width
    -- The actual backdrop cannot be set due to AceGUI limitations

    return layout
end
