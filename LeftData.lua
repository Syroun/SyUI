local font = "Interface/Addons/SyUI/media/fonts/francois.ttf"
local fontSize = 12

------------------------------------------------------------
-- Memory
------------------------------------------------------------
local function updateMemory(self, event)
	local MemoryTable = GetNumAddOns()
	local AddonMem = 0
	local TotalMem = 0

	for i=1, MemoryTable do
   		AddonMem = GetAddOnMemoryUsage(i)
   		MemoryTable = AddonMem
   		TotalMem = TotalMem + AddonMem
	end
	TotalMem = TotalMem / 1000
	m = string.format("%.2f KB", TotalMem)
	memory:SetText(m)
end

------------------------------------------------------------
-- FPS
------------------------------------------------------------
local function updateFPS(self, event)
	local frames = GetFramerate()
	local frame
    if frames>30 then
        frame = string.format("|cff11D100%.0f|r fps", frames)
    end
    if frames < 30 then
        frame = string.format("|cffffee00%.0f|r fps", frames)
    end
    if frames < 10 then
        frame = string.format("|cffFF2F00%.0f|r fps", frames)                
    end
    fps:SetText(frame)
end

------------------------------------------------------------
-- Guild
------------------------------------------------------------
local function updateGuild(self, event)
	local numTotalMembers, numOnlineMaxLevelMembers, numOnlineMembers = GetNumGuildMembers()
	num = string.format("|cff40F540Gilde:|r %.0f", numOnlineMembers)
	guild:SetText(num)
end

------------------------------------------------------------
-- Friends
------------------------------------------------------------
local function updateFriends(self, event)
	local numFriends, onlineFriends = GetNumFriends()
	local numBNFriends, BNnumOnline = BNGetNumFriends()
	local TotalOnline = 0
	TotalOnline = onlineFriends + BNnumOnline
	num = string.format("|cff07F5ECFreunde:|r %.0f", TotalOnline)
	friend:SetText(num)
end

------------------------------------------------------------
-- Ping
------------------------------------------------------------
local function updatePing(self, event)
	local down, up, lagHome, lagWorld = GetNetStats()
    if lagHome < 80 then
        p = string.format("|cff11D100%.0f|r ms", lagWorld)
    end
    if lagHome < 200 then
        p = string.format("|cffffee00%.0f|r ms", lagWorld)
    end
    if lagHome > 200 then
        p = string.format("|cffFF2F00%.0f|r ms", lagWorld)         
    end
    ping:SetText(p)
end

------------------------------------------------------------
-- Create Frame
------------------------------------------------------------
f = CreateFrame("Frame",nil,UIParent)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(560)
f:SetHeight(25)
f:SetPoint("BOTTOMLEFT", 0, 15)
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
UpdateFrameFPS = CreateFrame("Frame",nil,UIParent)
UpdateFrameMEM = CreateFrame("Frame",nil,UIParent)
UpdateFramePing = CreateFrame("Frame",nil,UIParent)
UpdateFrameGuild = CreateFrame("Frame",nil,UIParent)
UpdateFrameFriends = CreateFrame("Frame",nil,UIParent)

UpdateFrameFPS:RegisterAllEvents()
UpdateFrameMEM:RegisterAllEvents()
UpdateFramePing:RegisterAllEvents()
UpdateFrameGuild:RegisterAllEvents()
UpdateFrameFriends:RegisterAllEvents()

UpdateFrameFPS:SetScript("OnUpdate", updateFPS)
UpdateFrameMEM:SetScript("OnUpdate", updateMemory)
UpdateFramePing:SetScript("OnUpdate", updatePing)
UpdateFrameGuild:SetScript("OnEvent", updateGuild)
UpdateFrameFriends:SetScript("OnEvent", updateFriends)

------------------------------------------------------------
-- Create Memory Text
------------------------------------------------------------
memory = f:CreateFontString("mem","OVERLAY","GameFontNormalSmall")
memory:SetJustifyH("LEFT")
memory:SetTextHeight(11)
memory:SetTextColor(1,1,1,1)
memory:SetPoint("LEFT", f, 60, 0)
memory:Show()
memory:SetFont(font, fontSize)

------------------------------------------------------------
-- Create FPS Text
------------------------------------------------------------
fps = f:CreateFontString("fps","OVERLAY","GameFontNormalSmall")
fps:SetJustifyH("LEFT")
fps:SetTextHeight(11)
fps:SetTextColor(1,1,1,1)
fps:SetPoint("LEFT", f, 140, 0)
fps:Show()
fps:SetFont(font, fontSize)

------------------------------------------------------------
-- Create Guild Member Text
------------------------------------------------------------
guild = f:CreateFontString("g","OVERLAY","GameFontNormalSmall")
guild:SetJustifyH("LEFT")
guild:SetTextHeight(11)
guild:SetTextColor(1,1,1,1)
guild:SetPoint("LEFT", f, 280, 0)
guild:Show()
guild:SetFont(font, fontSize)

------------------------------------------------------------
-- Create Friends Points Text
------------------------------------------------------------
friend = f:CreateFontString("g","OVERLAY","GameFontNormalSmall")
friend:SetJustifyH("LEFT")
friend:SetTextHeight(11)
friend:SetTextColor(1,1,1,1)
friend:SetPoint("LEFT", f, 360, 0)
friend:Show()
friend:SetFont(font, fontSize)

------------------------------------------------------------
-- Create Ping Text
------------------------------------------------------------
ping = f:CreateFontString("p","OVERLAY","GameFontNormalSmall")
ping:SetJustifyH("LEFT")
ping:SetTextHeight(11)
ping:SetTextColor(1,1,1,1)
ping:SetPoint("LEFT", f, 210, 0)
ping:Show()
ping:SetFont(font, fontSize)