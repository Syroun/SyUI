local font = "Interface/Addons/SyUI/media/fonts/francois.ttf"
local fontSize = 12

local width = 250
local height = 20
local posX = 0
local posY = -180

local Current
local MAX
local powerToken
local powerType
local red = 0
local green = 0
local blue = 0
local alpha = 0

function hide(self, event)
  if event == "PLAYER_REGEN_ENABLED" then
    self:Hide()
  end
end

function show(self, event)
  if event == "PLAYER_REGEN_DISABLED" then
    self:Show()
  end
end

function update(self, event)
  Current, Max = UnitPower("player"), UnitPowerMax("player")
  self:SetMinMaxValues(0, Max)
  self:SetValue(Current)
end

function powercolor(self, event, red, green, blue, alpha)
  _, powerToken = UnitPowerType("player")
  if powerToken == "MANA" then
    red = 0.31
    green = 0.45
    blue = 0.63
    alpha = 1
  end
  if powerToken == "RAGE" then
    red = 0.69
    green = 0.31
    blue = 0.31
    alpha = 1
  end
  if powerToken == "ENERGY" then
    red = 0.65
    green = 0.63
    blue = 0.35
    alpha = 1
  end
  if powerToken == "FOCUS" then
    red = 0.71 
    green = 0.43
    blue = 0.27
    alpha = 1
  end
  if powerToken == "RUNIC_POWER" then
    red = 0
    green = 0.82
    blue = 1
    alpha = 1
  end
  return red, green, blue, alpha
end

function combat(self, event, red, green, blue, alpha, ...)
  if event == "PLAYER_REGEN_DISABLED" then
    self:Show()
  elseif event == "PLAYER_REGEN_ENABLED" then
    self:Hide()
  elseif event == "PLAYER_ENTERING_WORLD" then
    self:Hide()
  elseif event == "SPELLS_CHANGED" then
    Current, Max = UnitPower("player"), UnitPowerMax("player")
    p:SetStatusBarColor(powercolor(red,green,blue,alpha))
  end
end

------------------------------------------------------------
-- Create Frame
------------------------------------------------------------
f = CreateFrame("Frame",nil,UIParent)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(width)
f:SetHeight(height)
f:SetPoint("CENTER",posX,posY)
f:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
f:SetBackdropColor(.25,.25,.25)
f:SetBackdropBorderColor(0,0,0)

f:RegisterAllEvents()

f:SetScript("OnEvent", combat)

p = CreateFrame("StatusBar",nil,f)
p:SetStatusBarTexture("Interface/AddOns/Tukui/Medias/Textures/normTex")
p:SetFrameStrata("BACKGROUND")
p:SetStatusBarColor(powercolor(red,green,blue,alpha))
p:SetWidth(width - 4)
p:SetHeight(height - 4)
p:SetPoint("CENTER")

p:RegisterAllEvents()

p:SetScript("OnUpdate", update)
p:SetScript("OnEvent", combat)