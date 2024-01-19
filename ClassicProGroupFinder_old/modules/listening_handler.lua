-- listening_handler.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder

function ClassicProGroupFinder:StartListening(filterType)
	self:Debug("Started listening to chat channels.")
    self.currentFilterType = filterType
    -- Listen to standard channels
    for _, channel in ipairs(self.listeningChannelsConfig.standardChannels) do
        self:RegisterEvent("CHAT_MSG_" .. channel, "HandleChatMessage")
    end

    -- Listen to global channels
    local channels = {GetChannelList()}
    for i = 1, #channels, 3 do  -- Channels are returned in sets of 3 items (id, name, disabled)
        local name = channels[i + 1]
        if tContains(self.listeningChannelsConfig.globalChannels, name) then
            self:RegisterEvent("CHAT_MSG_CHANNEL", "HandleChatMessage")
        end
    end
end

function ClassicProGroupFinder:StopListening()
    -- Unregister all chat message events
    for _, channel in ipairs(self.listeningChannelsConfig.standardChannels) do
        self:UnregisterEvent("CHAT_MSG_" .. channel)
    end
    self:UnregisterEvent("CHAT_MSG_CHANNEL")
    self:Debug("Stopped listening to chat messages.")
end

function ClassicProGroupFinder:HandleChatMessage(event, msg, author, ...)
    if self:passesGlobalFilter(msg) then
		print("Debug - Filtered message received:", msg, "from", author)  -- Debug print
        self.textParser:parseMessage(msg, author)
    end
end

function ClassicProGroupFinder:passesGlobalFilter(msg)
    local globalFilterPass = false
    local filters = self.currentFilterType == "LFG" and self.listeningChannelsConfig.filtersLFG or self.listeningChannelsConfig.filtersLFM
    
    for _, filter in ipairs(filters) do
        if msg:lower():find(filter:lower()) then
            globalFilterPass = true
            break
        end
    end

    if not globalFilterPass then
        return false  -- Message does not pass the specific global filter (LFG or LFM)
    end

    local activityFilterPass = false
    if self.selectedActivity and self.definitions[self.selectedActivity] then
        for _, abbreviation in ipairs(self.definitions[self.selectedActivity]) do
            if msg:find(abbreviation) then
                activityFilterPass = true
                break
            end
        end
    end

    return activityFilterPass
end