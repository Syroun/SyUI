local _, Class, classIndex = UnitClass("player")
if Class ~= "ROGUE" or Class ~= "DRUID" then return end

local font = "Interface/Addons/SyUI/media/fonts/francois.ttf"
local fontSize = 12

local width = 47
local height = 20
local posX = 0
local posY = -155
local posY2 = -130

local comboPoints = 0
local anticipation = 0

local Colors1 = {0.69, 0.31, 0.31} -- 1
local Colors2 = {0.65, 0.42, 0.31} -- 2
local Colors3 = {0.65, 0.63, 0.35} -- 3
local Colors4 = {0.46, 0.63, 0.35} -- 4
local Colors5 = {0.33, 0.63, 0.33} -- 5

function combat(self, event, ...)
  if event == "PLAYER_REGEN_DISABLED" then
    self:Show()
  elseif event == "PLAYER_REGEN_ENABLED" then
    self:Hide()
  elseif event == "PLAYER_ENTERING_WORLD" then
    self:Hide()
  elseif event == "SPELLS_CHANGED" then
  	comboPoints = GetComboPoints("player")
  	self:Hide()
  end
end

function get_combo(self, event, ...)
	comboPoints = GetComboPoints("player")
	if comboPoints == 1 then
		c1:Show()
	elseif comboPoints == 2 then
		c1:Show()
		c2:Show()
	elseif comboPoints == 3 then
		c1:Show()
		c2:Show()
		c3:Show()
	elseif comboPoints == 4 then
		c1:Show()
		c2:Show()
		c3:Show()
		c4:Show()
	elseif comboPoints == 5 then
		c1:Show()
		c2:Show()
		c3:Show()
		c4:Show()
		c5:Show()
	else
		c1:Hide()
		c2:Hide()
		c3:Hide()
		c4:Hide()
		c5:Hide()
	end
end

function get_anticipation(self, event, ...)
	local talentID, name, _, selected, _ = GetTalentInfo(6, 3, 1, false)
	local buffname, _, icon, count, _, duration, expirationTime, unitCaster, isStealable, _, spellId, canApplyAura, isBossDebuff, _, _, _ = UnitBuff("player", "Erwartung")
	if name == "Erwartung" and selected == true then
		anticipation = count
		if anticipation == 1 then
			c6:Show()
		elseif anticipation == 2 then
			c6:Show()
			c7:Show()
		elseif anticipation == 3 then
			c6:Show()
			c7:Show()
			c8:Show()
		elseif anticipation == 4 then
			c6:Show()
			c7:Show()
			c8:Show()
			c9:Show()
		elseif anticipation == 5 then
			c6:Show()
			c7:Show()
			c8:Show()
			c9:Show()
			c10:Show()
		elseif event == "PLAYER_REGEN_ENABLED" then
			c6:Hide()
			c7:Hide()
			c8:Hide()
			c9:Hide()
			c10:Hide()
		else
			c6:Hide()
			c7:Hide()
			c8:Hide()
			c9:Hide()
			c10:Hide()
		end
	end
end

------------------------------------------------------------
-- Create Frame
------------------------------------------------------------
c1 = CreateFrame("Frame",nil,UIParent)
c1:SetFrameStrata("BACKGROUND")
c1:SetWidth(width)
c1:SetHeight(height)
c1:SetPoint("CENTER",posX - 100,posY)
c1:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c1:SetBackdropColor(Colors1[1],Colors1[2],Colors1[3])
c1:SetBackdropBorderColor(0,0,0)

c1:RegisterAllEvents()

c1:SetScript("OnEvent", combat)
c1:SetScript("OnEvent", get_combo)

------------------------------------------------------------

c2 = CreateFrame("Frame",nil,UIParent)
c2:SetFrameStrata("BACKGROUND")
c2:SetWidth(width)
c2:SetHeight(height)
c2:SetPoint("CENTER",posX - 50,posY)
c2:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c2:SetBackdropColor(Colors2[1],Colors2[2],Colors2[3])
c2:SetBackdropBorderColor(0,0,0)

c2:RegisterAllEvents()

c2:SetScript("OnEvent", combat)
c2:SetScript("OnEvent", get_combo)

------------------------------------------------------------

c3 = CreateFrame("Frame",nil,UIParent)
c3:SetFrameStrata("BACKGROUND")
c3:SetWidth(width)
c3:SetHeight(height)
c3:SetPoint("CENTER",posX,posY)
c3:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c3:SetBackdropColor(Colors3[1],Colors3[2],Colors3[3])
c3:SetBackdropBorderColor(0,0,0)

c3:RegisterAllEvents()

c3:SetScript("OnEvent", combat)
c3:SetScript("OnEvent", get_combo)

------------------------------------------------------------

c4 = CreateFrame("Frame",nil,UIParent)
c4:SetFrameStrata("BACKGROUND")
c4:SetWidth(width)
c4:SetHeight(height)
c4:SetPoint("CENTER",posX + 50,posY)
c4:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c4:SetBackdropColor(Colors4[1],Colors4[2],Colors4[3])
c4:SetBackdropBorderColor(0,0,0)

c4:RegisterAllEvents()

c4:SetScript("OnEvent", combat)
c4:SetScript("OnEvent", get_combo)

------------------------------------------------------------

c5 = CreateFrame("Frame",nil,UIParent)
c5:SetFrameStrata("BACKGROUND")
c5:SetWidth(width)
c5:SetHeight(height)
c5:SetPoint("CENTER",posX + 100,posY)
c5:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c5:SetBackdropColor(Colors5[1],Colors5[2],Colors5[3])
c5:SetBackdropBorderColor(0,0,0)

c5:RegisterAllEvents()

c5:SetScript("OnEvent", combat)
c5:SetScript("OnEvent", get_combo)

------------------------------------------------------------

c6 = CreateFrame("Frame",nil,UIParent)
c6:SetFrameStrata("BACKGROUND")
c6:SetWidth(width)
c6:SetHeight(height)
c6:SetPoint("CENTER",posX - 100,posY2)
c6:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c6:SetBackdropColor(Colors1[1],Colors1[2],Colors1[3])
c6:SetBackdropBorderColor(0,0,0)

c6:RegisterAllEvents()

c6:SetScript("OnEvent", combat)
c6:SetScript("OnEvent", get_anticipation)

------------------------------------------------------------

c7 = CreateFrame("Frame",nil,UIParent)
c7:SetFrameStrata("BACKGROUND")
c7:SetWidth(width)
c7:SetHeight(height)
c7:SetPoint("CENTER",posX - 50,posY2)
c7:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c7:SetBackdropColor(Colors2[1],Colors2[2],Colors2[3])
c7:SetBackdropBorderColor(0,0,0)

c7:RegisterAllEvents()

c7:SetScript("OnEvent", combat)
c7:SetScript("OnEvent", get_anticipation)

------------------------------------------------------------

c8 = CreateFrame("Frame",nil,UIParent)
c8:SetFrameStrata("BACKGROUND")
c8:SetWidth(width)
c8:SetHeight(height)
c8:SetPoint("CENTER",posX,posY2)
c8:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c8:SetBackdropColor(Colors3[1],Colors3[2],Colors3[3])
c8:SetBackdropBorderColor(0,0,0)

c8:RegisterAllEvents()

c8:SetScript("OnEvent", combat)
c8:SetScript("OnEvent", get_anticipation)

------------------------------------------------------------

c9 = CreateFrame("Frame",nil,UIParent)
c9:SetFrameStrata("BACKGROUND")
c9:SetWidth(width)
c9:SetHeight(height)
c9:SetPoint("CENTER",posX + 50,posY2)
c9:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c9:SetBackdropColor(Colors4[1],Colors4[2],Colors4[3])
c9:SetBackdropBorderColor(0,0,0)

c9:RegisterAllEvents()

c9:SetScript("OnEvent", combat)
c9:SetScript("OnEvent", get_anticipation)

------------------------------------------------------------

c10 = CreateFrame("Frame",nil,UIParent)
c10:SetFrameStrata("BACKGROUND")
c10:SetWidth(width)
c10:SetHeight(height)
c10:SetPoint("CENTER",posX + 100,posY2)
c10:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
c10:SetBackdropColor(Colors5[1],Colors5[2],Colors5[3])
c10:SetBackdropBorderColor(0,0,0)

c10:RegisterAllEvents()

c10:SetScript("OnEvent", combat)
c10:SetScript("OnEvent", get_anticipation)