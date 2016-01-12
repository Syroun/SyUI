local font = "Interface/Addons/SyUI/media/fonts/francois.ttf"
local fontSize = 12

local ApexisName, ApexisAmount, ApexisTexture = GetCurrencyInfo(823)
local GarrisonName, GarrisonAmount, GarrisonTexture = GetCurrencyInfo(824)
local ValorName, ValorAmount, ValorTexture = GetCurrencyInfo(1191)
local RollName, RollAmount, RollTexture = GetCurrencyInfo(1129)


local function updateMoney(self, event)
	local money = GetMoney()
    local g = floor(abs(money / 10000))
    local silver = floor(abs(mod(money / 100, 100)))
    local copper = floor(abs(mod(money, 100)))
    asdf = string.format("|cffffee00%dg|r |cffBFBFBF%ds|r |cffF28B16%dc|r", g, silver, copper)
	gold:SetText(asdf)
end

local function updateApexis(self, event)
	ApexisName, ApexisAmount, ApexisTexture = GetCurrencyInfo(823)
	apex:SetText(ApexisAmount)
end

local function updateGarry(self, event)
	GarrisonName, GarrisonAmount, GarrisonTexture = GetCurrencyInfo(824)
	garry:SetText(GarrisonAmount)
end

local function updateValor(self, event)
	ValorName, ValorAmount, ValorTexture = GetCurrencyInfo(1191)
	valor:SetText(ValorAmount)
end

local function updateRolls(self, event)
	RollName, RollAmount, RollTexture = GetCurrencyInfo(1129)
	rolls:SetText(RollAmount)
end

------------------------------------------------------------
-- Create Frame
------------------------------------------------------------
f = CreateFrame("Frame",nil,UIParent)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(560)
f:SetHeight(25)
f:SetPoint("BOTTOMRIGHT", 0, 15)
f:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
f:SetBackdropColor(.25,.25,.25)
f:SetBackdropBorderColor(0,0,0)
f:Show()

------------------------------------------------------------
-- Create Update Frames
------------------------------------------------------------
UpdateFrameGold = CreateFrame("Frame",nil,UIParent)
UpdateFrameApexis = CreateFrame("Frame",nil,UIParent)
UpdateFrameGarrison = CreateFrame("Frame",nil,UIParent)
UpdateFrameValor = CreateFrame("Frame",nil,UIParent)
UpdateFrameRolls = CreateFrame("Frame",nil,UIParent)

UpdateFrameGold:RegisterAllEvents()
UpdateFrameApexis:RegisterAllEvents()
UpdateFrameGarrison:RegisterAllEvents()
UpdateFrameValor:RegisterAllEvents()
UpdateFrameRolls:RegisterAllEvents()

UpdateFrameGold:SetScript("OnEvent", updateMoney)
UpdateFrameApexis:SetScript("OnEvent", updateApexis)
UpdateFrameGarrison:SetScript("OnEvent", updateGarry)
UpdateFrameValor:SetScript("OnEvent", updateValor)
UpdateFrameRolls:SetScript("OnEvent", updateRolls)

------------------------------------------------------------
-- Create Money Text
------------------------------------------------------------
gold = f:CreateFontString("gsc","OVERLAY","GameFontNormalSmall")
gold:SetText(MoneyAndIcons)
gold:SetJustifyH("RIGHT")
gold:SetTextHeight(11)
gold:SetTextColor(1,1,1,1)
gold:SetPoint("LEFT", f, 60, 0)
gold:Show()
gold:SetFont(font, fontSize)

------------------------------------------------------------
-- Create Apexis Text and Texture
------------------------------------------------------------
apex = f:CreateFontString("a","OVERLAY","GameFontNormalSmall")
apex:SetPoint("LEFT", f, 200, 0)
apex:SetJustifyH("RIGHT")
apex:SetTextHeight(11)
apex:SetTextColor(1,1,1,1)
apex:SetText(ApexisAmount)
apex:Show()
apex:SetFont(font, fontSize)

local tex = f:CreateTexture(nil, "LOW")
tex:SetPoint("LEFT", f, 235, 0)
tex:SetWidth(12)
tex:SetHeight(12)
tex:SetTexture(ApexisTexture)

------------------------------------------------------------
-- Create Garrison resources Text
------------------------------------------------------------
garry = f:CreateFontString("gr","OVERLAY","GameFontNormalSmall")
garry:SetText(GarrisonAmount)
garry:SetJustifyH("RIGHT")
garry:SetTextHeight(11)
garry:SetTextColor(1,1,1,1)
garry:SetPoint("LEFT", f, 280, 0)
garry:Show()
garry:SetFont(font, fontSize)

local tex = f:CreateTexture(nil, "LOW")
tex:SetPoint("LEFT", f, 310, 0)
tex:SetWidth(12)
tex:SetHeight(12)
tex:SetTexture(GarrisonTexture)

------------------------------------------------------------
-- Create Valor Points Text
------------------------------------------------------------
valor = f:CreateFontString("v","OVERLAY","GameFontNormalSmall")
valor:SetText(ValorAmount)
valor:SetJustifyH("RIGHT")
valor:SetTextHeight(11)
valor:SetTextColor(1,1,1,1)
valor:SetPoint("LEFT", f, 350, 0)
valor:Show()
valor:SetFont(font, fontSize)

local tex = f:CreateTexture(nil, "LOW")
tex:SetPoint("LEFT", f, 375, 0)
tex:SetWidth(12)
tex:SetHeight(12)
tex:SetTexture(ValorTexture)

------------------------------------------------------------
-- Create Bonus Rolls Text
------------------------------------------------------------
rolls = f:CreateFontString("r","OVERLAY","GameFontNormalSmall")
rolls:SetText(RollAmount)
rolls:SetJustifyH("RIGHT")
rolls:SetTextHeight(11)
rolls:SetTextColor(1,1,1,1)
rolls:SetPoint("LEFT", f, 420, 0)
rolls:Show()
rolls:SetFont(font, fontSize)

local tex = f:CreateTexture(nil, "LOW")
tex:SetPoint("LEFT", f, 430, 0)
tex:SetWidth(12)
tex:SetHeight(12)
tex:SetTexture(RollTexture)