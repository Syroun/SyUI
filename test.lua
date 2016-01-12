--[=====[local name, currentAmount, texture, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity = GetCurrencyInfo(823)


local test = CreateFrame("Frame",nil,UIParent)
test:SetFrameStrata("BACKGROUND")
test:SetWidth(50)
test:SetHeight(50)
--test:SetTexture(texture, false)
test:SetPoint("CENTER", 0, 0)
test:SetBackdrop({
    bgFile = "Interface/Addons/SyUI/media/textures/normTex",
    edgeFile = "Interface/Addons/SyUI/media/textures/blank",
    tile = false, tileSize = 16, edgeSize = 1,
    insets = { left = 1, right = 1, top = 1, bottom = 1 }
  })
test:SetBackdropColor(.25,.25,.25)
test:SetBackdropBorderColor(0,0,0)
test:Show()

local tex = test:CreateTexture(nil, "BACKGROUND")
tex:SetAllPoints()
tex:SetTexture(texture)
]=====]--