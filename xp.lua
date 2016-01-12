local width = 10
local height = 150
local xPos = 25
local yPos = 40
local red
local green
local blue

local function hide(self, event)
	if (UnitLevel("player") == MAX_PLAYER_LEVEL) then
		self:Hide()
	end
end

local function update(self, event)
	local Current, Max = UnitXP("player"), UnitXPMax("player")
	self:SetMinMaxValues(0, Max)
	self:SetValue(Current)
end

local  function classcolor(self, event, red, green, blue)
	local class, classFileName = UnitClass("player")
   	local color = RAID_CLASS_COLORS[classFileName]
   	red = color.r
   	green = color.g
   	blue = color.b
   	return red, green, blue
end
------------------------------------------------------------
-- XP-Bar Frame
------------------------------------------------------------
local XP_Bar = CreateFrame("StatusBar", nil, XP_Bar_BG)
		
XP_Bar:SetStatusBarTexture("Interface/AddOns/Tukui/Medias/Textures/normTex")
XP_Bar:SetStatusBarColor(classcolor(red, green, blue))
XP_Bar:EnableMouse()
XP_Bar:SetFrameStrata("LOW")
XP_Bar:SetFrameLevel(4)

XP_Bar:SetOrientation("Vertical")
XP_Bar:SetWidth(width - 5)
XP_Bar:SetHeight(height - 5)
XP_Bar:SetPoint("BOTTOMLEFT", 27, 42)

XP_Bar:RegisterAllEvents()

XP_Bar:SetScript("OnUpdate", update)
XP_Bar:SetScript("OnUpdate", hide)

------------------------------------------------------------
-- XP-Bar Frame Background
------------------------------------------------------------

XP_Bar_BG = CreateFrame("Frame", "XP_Bar_BG")
XP_Bar_BG:SetPoint("BOTTOMLEFT", 25, 40)
XP_Bar_BG:SetWidth(width - 1)
XP_Bar_BG:SetHeight(height)
XP_Bar_BG:SetFrameStrata("BACKGROUND")
XP_Bar_BG:SetBackdrop({
    bgFile = "Interface/AddOns/Tukui/Medias/Textures/normTex",
    edgeFile = "Interface/AddOns/iFilger/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
XP_Bar_BG:SetBackdropColor(.25,.25,.25)
XP_Bar_BG:SetBackdropBorderColor(0,0,0)

XP_Bar_BG:RegisterAllEvents()

XP_Bar_BG:SetScript("OnUpdate", hide)