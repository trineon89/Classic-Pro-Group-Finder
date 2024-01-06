-- listing_element_layout.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local AceGUI = LibStub("AceGUI-3.0")

ClassicProGroupFinder.ListingElement = {}
local ListingElement = ClassicProGroupFinder.ListingElement

function ListingElement:new(message, sender)
    local instance = setmetatable({}, { __index = ListingElement })
    instance.message = message
    instance.sender = sender
    return instance
end

function ListingElement:createLayout()
    -- print("Debug - Creating layout for message:", self.message)  -- Debug print
    local layout = AceGUI:Create("SimpleGroup")
    layout:SetFullWidth(true)
    layout:SetLayout("Flow")

	local senderText = self.sender or "Unknown"  -- Fallback for nil sender
    local senderLabel = AceGUI:Create("Label")
    senderLabel:SetText("From: " .. senderText)
    senderLabel:SetFullWidth(true)
    layout:AddChild(senderLabel)

    local messageLabel = AceGUI:Create("Label")
    messageLabel:SetText(self.message)
    messageLabel:SetFullWidth(true)
    layout:AddChild(messageLabel)

    return layout
end
