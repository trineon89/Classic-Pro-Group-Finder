-- listening_channels_config.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder

ClassicProGroupFinder.listeningChannelsConfig = {
    standardChannels = {
        "GUILD",
        "SAY",
        "YELL",
        "PARTY",
        "RAID",
		"WHISPER",
        -- Add other channels as needed
    },
	globalChannels = {
        -- Global channels, identified by name
        "General",
        "Trade",
        "LocalDefense",
        "LookingForGroup",
		"LFG",
        -- Add other global channels as needed
    },
    filtersLFG = {
        "lfm",
        "LFM"
    },
	filtersLFM = {
		"lfg",
        "LFG"
    }
}
