-- modules/addon_messaging.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local LibSerialize = LibStub("LibSerialize")
local LibDeflate = LibStub("LibDeflate")

-- Constants for the addon communication
local ADDON_MESSAGE_PREFIX = "CPGF" -- Change to an appropriate prefix for your addon

-- Register the prefix for addon communication
C_ChatInfo.RegisterAddonMessagePrefix(ADDON_MESSAGE_PREFIX)

-- Function to send a message to other addon users with compression
function ClassicProGroupFinder:SendMessage(data, channelType, target)
    -- ChannelType can be "GUILD", "PARTY", "RAID", "WHISPER", etc.
    -- Target is only needed for "WHISPER"
    
    local serialized = LibSerialize:Serialize(data)
    local compressed = LibDeflate:CompressDeflate(serialized)
    local encoded = LibDeflate:EncodeForWoWAddonChannel(compressed)
    self:SendCommMessage(ADDON_MESSAGE_PREFIX, encoded, channelType, target)
    self:Debug("Message sent on channel:", channelType, "to target:", target, "with prefix:", ADDON_MESSAGE_PREFIX)
end

-- Function to handle received messages with decompression
function ClassicProGroupFinder:OnCommReceived(prefix, payload, distribution, sender)
    -- Only process messages with the correct prefix
    if prefix ~= ADDON_MESSAGE_PREFIX then return end
    
    local decoded = LibDeflate:DecodeForWoWAddonChannel(payload)
    if not decoded then
        self:Debug("Failed to decode payload from sender:", sender)
        return
    end

    local decompressed, errorMsg = LibDeflate:DecompressDeflate(decoded)
    if not decompressed then
        self:Debug("Failed to decompress payload from sender:", sender, "Error:", errorMsg)
        return
    end

    local success, data = LibSerialize:Deserialize(decompressed)
    if not success then
        self:Debug("Failed to deserialize payload from sender:", sender)
        return
    end

    -- Display the deserialized data
    self:Debug("Received data from:", sender, ". Data:", data)
    -- Handle `data` here, if necessary
end

-- Initialize the addon's comm system
function ClassicProGroupFinder:SetupComm()
    -- Register the prefix for addon communication
    self:RegisterComm(ADDON_MESSAGE_PREFIX, "OnCommReceived")
end

ClassicProGroupFinder:SetupComm()
