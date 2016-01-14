local _, Class, classIndex = UnitClass("player")
if Class ~= "ROGUE" and Class ~= "DRUID" then return end

local font = "Interface/Addons/SyUI/media/fonts/francois.ttf"
local fontSize = 12

local width = 40
local height = 16
local posX = 0
local posY = -155
local posY2 = -130

local comboPoints = 0
local anticipation = 0

local Options = {
	comboWidth = 40,
	comboHeight = 11,
	spacing = 5, 
	colors = {
		[1] = {0.69, 0.31, 0.31},
		[2] = {0.65, 0.42, 0.31},
		[3] = {0.65, 0.63, 0.35},
		[4] = {0.46, 0.63, 0.35},
		[5] = {0.33, 0.63, 0.33},
	},
}
local anchorWidth = ((Options.comboWidth + Options.spacing)*5)-Options.spacing

function combat(self, event, ...)
  if event == "PLAYER_REGEN_DISABLED" then
    self:Show()
  elseif event == "PLAYER_REGEN_ENABLED" then
    for i=1,10 do
      c[i]:Hide()
    end
    self:Hide()
  elseif event == "PLAYER_ENTERING_WORLD" then
    self:Hide()
  elseif event == "SPELLS_CHANGED" then
    comboPoints = GetComboPoints("player")
    self:Hide()
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
-- Create Combo Anchor Frame
------------------------------------------------------------
local cAnchor = CreateFrame("Frame", "ComboAnchor", UIParent)
cAnchor:SetWidth(anchorWidth)
cAnchor:SetPoint("CENTER",posX,posY)
cAnchor:SetBackdropBorderColor(1,0,0)
cAnchor:SetMovable(true)
cAnchor:Hide()

------------------------------------------------------------
-- Create Combo Frames
------------------------------------------------------------
local c = CreateFrame("Frame","c",UIParent)
for i=1,5 do
    c[i] = CreateFrame("Frame","c"..i,UIParent)
    c[i]:SetFrameStrata("BACKGROUND")
    c[i]:SetWidth(Options.comboWidth)
    c[i]:SetHeight(Options.comboHeight)
	
    c[i]:SetPoint("CENTER")
	if i == 1 then
		c[i]:SetPoint("TOPLEFT", cAnchor, "BOTTOMLEFT", 0, -3)
	else
		c[i]:SetPoint("LEFT", c[i-1], "RIGHT", Options.spacing, 0)
	end
	
    c[i]:SetBackdrop({
        bgFile = "Interface/Addons/SyUI/media/textures/normTex",
        edgeFile = "Interface/Addons/SyUI/media/textures/blank",
        tile = false, tileSize = 16, edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
        })
    c[i]:SetBackdropColor(unpack(Options.colors[i]))
    c[i]:SetBackdropBorderColor(0,0,0)
	
    c[i]:RegisterAllEvents()
    c[i]:SetScript("OnEvent", function(self, event)
	local points, pt = 0, GetComboPoints("player")
		if pt == points then
			c[i]:Hide()
		elseif pt > points then
			for i = points + 1, pt do
				c[i]:Show()
			end
		else
			for i = pt + 1, points do
				c[i]:Hide()
			end
		end
		points = pt	
	end)
end

------------------------------------------------------------
-- Create Anticipation Anchor Frame
------------------------------------------------------------
local aAnchor = CreateFrame("Frame", "AnticipationAnchor", UIParent)
aAnchor:SetBackdropBorderColor(1,0,0)
aAnchor:SetMovable(true)
aAnchor:Hide()

------------------------------------------------------------
-- Create Anticipation Frames
------------------------------------------------------------
local a = CreateFrame("Frame","a",UIParent)
for i=1,5 do
	a[i] = CreateFrame("Frame","a"..i,UIParent)
	a[i]:SetFrameStrata("BACKGROUND")
	a[i]:SetWidth(Options.comboWidth)
	a[i]:SetHeight(Options.comboHeight)
	a[i]:SetPoint("CENTER")
	if i == 1 then
		a[i]:SetPoint("TOPLEFT", aAnchor, "BOTTOMLEFT", 0, -3)
		else	
		a[i]:SetPoint("LEFT", a[i-1], "RIGHT", Options.spacing, 0)
	end

	a[i]:SetBackdrop({
	bgFile = "Interface/Addons/SyUI/media/textures/normTex",
		edgeFile = "Interface/Addons/SyUI/media/textures/blank",
		tile = false, tileSize = 16, edgeSize = 1,
		insets = { left = 1, right = 1, top = 1, bottom = 1 }
		})
	a[i]:SetBackdropColor(Options.colors[i])
	a[i]:SetBackdropBorderColor(0,0,0)
	
	a[i]:RegisterEvent("PLAYER_ENTERING_WORLD")
	a[i]:RegisterEvent("PLAYER_COMBO_POINTS")
	a[i]:RegisterEvent("PLAYER_TARGET_CHANGED")
	a[i]:RegisterEvent("PLAYER_REGEN_DISABLED")
	a[i]:RegisterEvent("PLAYER_REGEN_ENABLED")
	a[i]:SetScript("OnEvent", function(self)	
	local ap, anticipation = 0, GetComboPoints("player")
		if anticipation == ap then
			a[i]:Hide()
		elseif anticipation > ap then
			for i = ap + 1, anticipation do
				a[i]:Show()
			end
		else
			for i = anticipation + 1, ap do
				a[i]:Hide()
			end
		end
		ap = anticipation	
	end)
end