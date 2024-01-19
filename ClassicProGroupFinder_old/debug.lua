-- debug.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local LibSerialize = LibStub("LibSerialize")
local LibDeflate = LibStub("LibDeflate")

-- Simple debug flag
ClassicProGroupFinder.isDebugMode = true

-- Debug function to output text to the chat console if debug mode is active
function ClassicProGroupFinder:Debug(...)
    if self.isDebugMode then
        local message = strjoin(" ", tostringall(...))
        DEFAULT_CHAT_FRAME:AddMessage("|cFF33FF99" .. addonName .. "|r: " .. message)
    end
end

-- Function to manually test SendMessage with serialization and compression
function ClassicProGroupFinder:DebugTestSendMessage(testData)
    --local serialized = LibSerialize:Serialize(testData)
    --local compressed = LibDeflate:CompressDeflate(serialized)
    --local encoded = LibDeflate:EncodeForWoWAddonChannel(compressed)
    self:SendMessage(testData, "WHISPER", UnitName("player"))

    self:Debug("DebugTestSendMessage called with data:", testData)
end

-- Slash command for manual debug test
SLASH_CLASSICPROGROUPFINDERDEBUG1 = "/cpgfdebug"
SlashCmdList["CLASSICPROGROUPFINDERDEBUG"] = function(msg)
    -- Assuming simple string data for manual test
    ClassicProGroupFinder:DebugTestSendMessage(msg)
end
