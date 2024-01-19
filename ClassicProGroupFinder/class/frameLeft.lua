FrameLeft = {}
FrameLeft.__index = FrameLeft

function FrameLeft:New(parentFrame)
    local self = setmetatable({}, FrameLeft)
    
	--local padding = 10
	local padding = 0
    local width = (parentFrame:GetWidth() * 0.4) - padding -- Adjusting for padding
	
    -- Create the left frame
    self.frame = CreateFrame("Frame", nil, parentFrame)
	self.frame:SetSize(width, parentFrame:GetHeight() - (padding * 2))
	self.frame:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", padding, -padding)

    -- Create buttons
    self.button1 = CreateFrame("Button", nil, self.frame, "UIPanelButtonTemplate")
    self.button1:SetSize(width, 24)  -- Width, Height
    self.button1:SetPoint("TOP", self.frame, "TOP")
    self.button1:SetText("Dungeon")
	self.button1:SetScript("OnClick", function() parentFrame.RightFrame:ChangeToComboBox() end)

    self.button2 = CreateFrame("Button", nil, self.frame, "UIPanelButtonTemplate")
    self.button2:SetSize(width, 24)  -- Width, Height
    self.button2:SetPoint("TOP", self.button1, "BOTTOM")
    self.button2:SetText("Raid")
	self.button2:SetScript("OnClick", function() parentFrame.RightFrame:ChangeToComboBox() end)

    return self
end
