-- activities_layout.lua
local addonName, addonTable = ...
local ClassicProGroupFinder = addonTable.ClassicProGroupFinder
local AceGUI = LibStub("AceGUI-3.0")

function ClassicProGroupFinder:CreateActivitiesLayout(container, activityType)
    -- Clear the current activities layout
    container:ReleaseChildren()

    -- Check if activityType is valid
    if not activityType or not self.activities[activityType] then
        print("Error: Invalid activity type provided.")
        return
    end

	local ElementsGroup = AceGUI:Create("SimpleGroup")

	-- Dropdown for specific activities
    local activitiesDropdown = AceGUI:Create("Dropdown")
	
	local activityList = {}
    for key, activity in pairs(self.activities[activityType]) do
        activityList[key] = activity.name
    end

	activitiesDropdown:SetLabel("Select " .. activityType)
    --activitiesDropdown:SetWidth(200)
    activitiesDropdown:SetList(activityList)
	self.activitiesDropdown = activitiesDropdown
    	
	local listSelfButton = AceGUI:Create("Button")
    local findMembersButton = AceGUI:Create("Button")
    local stopListeningButton = AceGUI:Create("Button")

    -- Button for "List Self/Find Group"
    listSelfButton:SetText("List Self/Find Group")
    --listSelfButton:SetWidth(200)

    -- Button for "Find Members"
    findMembersButton:SetText("Find Members")
    --findMembersButton:SetWidth(200)
	
	-- Button to stop listening
    stopListeningButton:SetText("Stop Listening")
    --stopListeningButton:SetWidth(200)
		
	-- Function to update button visibility
    local function updateButtonVisibility()
        local activitySelected = self.selectedActivity ~= nil
        listSelfButton:SetDisabled(not activitySelected)
        findMembersButton:SetDisabled(not activitySelected)
        stopListeningButton.frame:Hide()
    end
	
	activitiesDropdown:SetCallback("OnValueChanged", function(widget, event, value)
        self.selectedActivity = self.activities[activityType][value].name
        updateButtonVisibility()
    end)
	
	 -- Function to reset layout
    function self:ResetActivitiesLayout()
        self.selectedActivity = nil
        activitiesDropdown:SetValue(nil)
        activitiesDropdown:SetDisabled(false)
        updateButtonVisibility()
		self.isSearchActive = false
    end

    -- Function to lock layout during search
    function self:LockActivitiesLayout()
        activitiesDropdown:SetDisabled(true)
        listSelfButton:SetDisabled(true)
        findMembersButton:SetDisabled(true)
		stopListeningButton.frame:Show()
		self.isSearchActive = true
    end
	
	listSelfButton:SetCallback("OnClick", function()
        self:StartListening("LFG")
        self:LockActivitiesLayout()
        stopListeningButton.frame:Show()
    end)

    findMembersButton:SetCallback("OnClick", function()
        self:StartListening("LFM")
        self:LockActivitiesLayout()
        stopListeningButton.frame:Show()
    end)

    stopListeningButton:SetCallback("OnClick", function()
        self:StopListening()
		self:ResetActivitiesLayout()
    end)
	-- Add widgets to the container
	ElementsGroup:AddChild(activitiesDropdown)
    ElementsGroup:AddChild(listSelfButton)
    ElementsGroup:AddChild(findMembersButton)
    ElementsGroup:AddChild(stopListeningButton)
    container:AddChild(ElementsGroup)
    
	
    updateButtonVisibility()
	
	local resultsButton = AceGUI:Create("Button")
	resultsButton:SetText("Show Results")
	--resultsButton:SetWidth(150)
	resultsButton:SetCallback("OnClick", function()
		ClassicProGroupFinder:CreateResultsWindow()
	end)
	
	container:AddChild(resultsButton)
end

function ClassicProGroupFinder:UpdateActivitiesDropdown(activityType)
    local activitiesDropdown = self.activitiesDropdown
    if not activitiesDropdown then
        print("Error: Activities dropdown does not exist.")
        return
    end

    local activities = self.activities[activityType]
    if not activities then
        print("Error: No activities found for type", activityType)
        return
    end

    -- Update the activities dropdown based on the selected type
    local values = {}
    for key, activity in pairs(activities) do
        values[key] = activity.name
    end
    activitiesDropdown:SetList(values)

    -- Automatically select the first activity in the list
    local firstKey = next(values)
    if firstKey then
        activitiesDropdown:SetValue(firstKey)
    end
end


