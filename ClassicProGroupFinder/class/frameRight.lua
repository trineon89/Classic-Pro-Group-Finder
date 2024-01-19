FrameRight = {}
FrameRight.__index = FrameRight

function FrameRight:New(parentFrame)
    local self = setmetatable({}, FrameRight)
    
	local padding = 0
    local width = (parentFrame:GetWidth() * 0.6) - padding -- Adjusting for padding
	local dropdownWidth = width  -- Adjusting dropdown width
	
	-- Create the right frame
    self.frame = CreateFrame("Frame", nil, parentFrame)
    self.frame:SetSize(width, parentFrame:GetHeight() - (padding * 2))
    self.frame:SetPoint("TOPRIGHT", parentFrame, "TOPRIGHT", -padding, -padding)

	-- Initial content: a big text
    self.initialText = self.frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    self.initialText:SetPoint("CENTER")
    self.initialText:SetText("Select Left your Activity!")

    return self
end

function FrameRight:ChangeToComboBox()
    -- Remove the initial text
	local padding = 0
    local width = (self.frame:GetWidth() * 0.6) - padding -- Adjusting for padding
	local dropdownWidth = width  -- Adjusting dropdown width
	
    self.initialText:Hide()

    -- Create a dropdown menu (combobox)
    if not self.comboBox then
        self.comboBox = CreateFrame("Frame", nil, self.frame, "UIDropDownMenuTemplate")
		self.comboBox:SetSize(dropdownWidth, 32)  -- Set the dropdown width
		self.comboBox:SetPoint("TOPLEFT", self.frame, "TOPLEFT")
        
        -- Dropdown menu initialization code goes here
    end

    self.comboBox:Show()
end