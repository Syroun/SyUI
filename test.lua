--[=====[local _, Class, classIndex = UnitClass("player")
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

local Options = {
	comboWidth = 40,
	comboHeight = 11,
	spacing = 5, 
	colors = {
		[1] = {0.60, 0, 0, 1},
		[2] = {0.60, 0.30, 0, 1},
		[3] = {0.60, 0.60, 0, 1},
		[4] = {0.30, 0.60, 0, 1},
		[5] = {0, 0.60, 0, 1},
	},
}

------------------------------------------------------------
-- Create Combo Anchor Frame
------------------------------------------------------------
local cAnchor = CreateFrame("Frame", "ComboAnchor", UIParent)
cAnchor:CreatePanel("", ((Options.comboWidth + Options.spacing)*5)-Options.spacing, 12, "CENTER", UIParent, "CENTER", posX, -posY)
cAnchor:SetBackdropBorderColor(1,0,0)
cAnchor:CreateShadow("")
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
		c[i]:Point("TOPLEFT", cAnchor, "BOTTOMLEFT", 0, -3)
	else
		c[i]:Point("LEFT", c[i-1], "RIGHT", Options.spacing, 0)
	end
	
    c[i]:SetBackdrop({
        bgFile = "Interface/Addons/SyUI/media/textures/normTex",
        edgeFile = "Interface/Addons/SyUI/media/textures/blank",
        tile = false, tileSize = 16, edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
        })
    c[i]:SetBackdropColor(Options.colors[i])
    c[i]:SetBackdropBorderColor(0,0,0)
	
    c[i]:RegisterEvent("PLAYER_ENTERING_WORLD")
	c[i]:RegisterEvent("PLAYER_COMBO_POINTS")
	c[i]:RegisterEvent("PLAYER_TARGET_CHANGED")
	c[i]:RegisterEvent("PLAYER_REGEN_DISABLED")
	c[i]:RegisterEvent("PLAYER_REGEN_ENABLED")
    c[i]:SetScript("OnEvent", function(self, event, ..)	
	local pt, comboPoints = 0, GetComboPoints("player")
		if comboPoints == pt then
			c[i]:Hide()
		elseif comboPoints > pt then
			for i = pt + 1, comboPoints do
				c[i]:Show()
			end
		else
			for i = comboPoints + 1, pt do
				c[i]:Hide()
			end
		end
		pt = comboPoints	
	end)
end


local talentID, name, _, selected, _ = GetTalentInfo(6, 3, 1, false)
local buffname, _, icon, count, _, duration, expirationTime, unitCaster, isStealable, _, spellId, canApplyAura, isBossDebuff, _, _, _ = UnitBuff("player", "Erwartung")
if name == "Erwartung" and selected == true then
------------------------------------------------------------
-- Create Anticipation Anchor Frame
------------------------------------------------------------
	local aAnchor = CreateFrame("Frame", "AnticipationAnchor", UIParent)
	aAnchor:CreatePanel("", ((Options.comboWidth + Options.spacing)*5)-Options.spacing, 12, "CENTER", UIParent, "CENTER", posX, -posY)
	aAnchor:SetBackdropBorderColor(1,0,0)
	aAnchor:CreateShadow("")
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
			a[i]:Point("TOPLEFT", aAnchor, "BOTTOMLEFT", 0, -3)
		else	
			a[i]:Point("LEFT", a[i-1], "RIGHT", Options.spacing, 0)
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
		a[i]:SetScript("OnEvent", function(self, event, ..)	
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
end
]=====]--