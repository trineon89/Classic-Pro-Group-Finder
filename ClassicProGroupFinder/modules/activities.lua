-- activities.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder

-- Define the structure for group types
local GroupTypes = {
    Raid10 = {
        Healers = 2,
        Tanks = 2,
        DPS = 6
    },
	Group = {
        Healers = 1,
        Tanks = 1,
        DPS = 3
    }
}

-- Define the activities with types Dungeon and Raid
ClassicProGroupFinder.activities = {
    Dungeon = {
		RC = {
			name = "Ragefire Chasm",
            groupType = GroupTypes.Group,
			minlevel = 13,
			maxlevel = 18,
        },
		WC = {
			name = "Wailing Caverns",
            groupType = GroupTypes.Group,
            minlevel = 17,
			maxlevel = 24,
        },
        DM = {
			name = "Deadmines",
            groupType = GroupTypes.Group,
            minlevel = 17,
			maxlevel = 26,
        },
		SFK = {
			name = "Shadowfang Keep",
            groupType = GroupTypes.Group,
            minlevel = 22,
			maxlevel = 30,
        },
		STOCKADE = {
			name = "The Stockade",
            groupType = GroupTypes.Group,
            minlevel = 24,
			maxlevel = 32,
        }
    },
    Raid = {
        BFD = {
			name = "Blackfathom Deeps",
            groupType = GroupTypes.Raid10,
			minlevel = 25,
			maxlevel = 25,
        }
    }
}

-- Make GroupTypes accessible if needed elsewhere in the addon
ClassicProGroupFinder.GroupTypes = GroupTypes
