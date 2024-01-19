local AceGUI = LibStub("AceGUI-3.0")

MainFrame = {}
MainFrame.__index = MainFrame

function MainFrame:New()
    local self = setmetatable({}, MainFrame)
    
    -- Create the main frame using AceGUI
    self.frame = AceGUI:Create("Frame")
    self.frame:SetTitle("Classic Pro Group Finder")
    self.frame:SetStatusText("Addon loaded")
    self.frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
    self.frame:SetLayout("Fill")
    self.frame:SetWidth(400)
    self.frame:SetHeight(300)

	local aceFrame = self.frame.frame
    aceFrame:SetResizable(false)
	 aceFrame.StartSizing = function() end
	
	local resizeButton = aceFrame.obj.sizer_se
    if resizeButton then
        resizeButton:Hide()
    end
	
	local function removeFrameButtons(frame)
		if frame.GetChildren then
			for _, child in ipairs({frame:GetChildren()}) do
				if child:IsObjectType("Button") then
					child:Hide()  -- This hides the button
				end
			end
		end
	end

	-- Call this function with the mainFrame to remove/hide its buttons
	removeFrameButtons(aceFrame)
	
	local closeButton = CreateFrame("Button", "MyCloseButton", aceFrame, "UIPanelCloseButton")
	closeButton:SetPoint("TOPRIGHT", aceFrame, "TOPRIGHT", -5, -6)
	closeButton:SetSize(30, 32)
	
	local mainFrameLevel = aceFrame:GetFrameLevel()
	-- Set the closeButton frame level to be higher than mainFrame
	closeButton:SetFrameLevel(mainFrameLevel + 6)
	
	-- Use the default UI texture for the close button
	closeButton:SetNormalTexture("Interface/Buttons/UI-Panel-MinimizeButton-Up")
	closeButton:SetPushedTexture("Interface/Buttons/UI-Panel-MinimizeButton-Down")
	closeButton:SetHighlightTexture("Interface/Buttons/UI-Panel-MinimizeButton-Highlight", "ADD")

	-- Assign the close function to the button's click
	closeButton:SetScript("OnClick", function(self)
		aceFrame:Hide()
	end)

	-- Remove the button's background if needed
	if not closeButton.SetBackdrop then
		Mixin(closeButton, BackdropTemplateMixin)
	end
	closeButton:SetBackdrop(nil)

	-- Add the new close button directly to the mainFrame
	aceFrame.closeButton = closeButton
    -- Initialize inner frames
    self.frameLeft = FrameLeft:New(self.frame.content)
    self.frameRight = FrameRight:New(self.frame.content)
	
	self.frame.content.LeftFrame = self.frameLeft
    self.frame.content.RightFrame = self.frameRight

    return self
end

function MainFrame:Show()
    self.frame:Show()
end

function MainFrame:Hide()
    self.frame:Hide()
end
