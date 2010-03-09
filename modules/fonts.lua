-- $Id: fonts.lua 557 2010-03-03 21:00:07Z john.d.mann@gmail.com $
local _, t = ...

--[[
	Buttons:
	button:SetNormalFontObject(recMedia.fontObject("NORMAL", 10, "OUTLINE"))

	FontStrings:
	fontstring:SetFont(recMedia.font("bold10outline"))
--]]

recMedia.fontFace = {
	--PIXEL      = t.DIRECTORY..[[fonts\pf_tempesta_five_condensed.ttf]],
	--TINY_PIXEL = t.DIRECTORY..[[fonts\pf_tempesta_five_condensed.ttf]],
	PIXEL =      t.DIRECTORY..[[fonts\25321Russel Square LT.ttf]],
	TINY_PIXEL = t.DIRECTORY..[[fonts\25321Russel Square LT.ttf]],
	--SMALL      = t.DIRECTORY..[[fonts\Oceania-Medium.ttf]],
	--SMALL_BOLD = t.DIRECTORY..[[fonts\Oceania-Medium.ttf]],
	--NORMAL     = t.DIRECTORY..[[fonts\Oceania-Medium.ttf]],
	--BOLD       = t.DIRECTORY..[[fonts\Oceania-Medium.ttf]],
	--LARGE      = t.DIRECTORY..[[fonts\Oceania-Medium.ttf]]
	SMALL =      t.DIRECTORY..[[fonts\25321Russel Square LT.ttf]],
	SMALL_BOLD = t.DIRECTORY..[[fonts\25321Russel Square LT.ttf]],
	NORMAL =     t.DIRECTORY..[[fonts\25321Russel Square LT.ttf]],
	BOLD =       t.DIRECTORY..[[fonts\25321Russel Square LT.ttf]],
	LARGE =      t.DIRECTORY..[[fonts\25321Russel Square LT.ttf]]
}

recMedia.fontFlag = {
	OUTLINE = "OUTLINE",
	THICK =   "THICKOUTLINE",
	THIN =    "THINOUTLINE"
}

recMedia.fontSize = {
	NORMAL = 9
}
	
recMedia.fontObject = function(font, size, flags)
	
	-- Use default in case of error.
	if (not font) or (not recMedia.fontFace[font]) then
		font = "NORMAL"
	end
	
	-- If we have already created this font, return the reference to it.
	local fontName = string.format("recMediaFontObject%s%s%s", font, size, flags)
	if _G[fontName] then return _G[fontName] end
	
	-- We need to create the font and return it.
	local fontObject = CreateFont( fontName )
	fontObject:SetFont( recMedia.fontFace[font], (size or 10), (flags or "") )
	return fontObject
end











--[[]]
-- System font overrides
local SetFont = function(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
	obj:SetFont(font, size, style)
	if sr and sg and sb then obj:SetShadowColor(sr, sg, sb) end
	if sox and soy then obj:SetShadowOffset(sox, soy) end
	if r and g and b then obj:SetTextColor(r, g, b)
	elseif r then obj:SetAlpha(r) end
end

local FixTitleFont = function()
	for _, button in pairs(PlayerTitlePickerScrollFrame.buttons) do
		button.text:SetFontObject(GameFontHighlightSmallLeft)
	end
end

UNIT_NAME_FONT     = recMedia.fontFace.NORMAL
NAMEPLATE_FONT     = recMedia.fontFace.NORMAL
DAMAGE_TEXT_FONT   = recMedia.fontFace.NORMAL
STANDARD_TEXT_FONT = recMedia.fontFace.NORMAL

recMedia.font_events = CreateFrame("Frame")
recMedia.font_events:RegisterEvent("ADDON_LOADED")

recMedia.font_events:SetScript("OnEvent", function(self, event, addon)
	
	--if IsAddOnLoaded("Blizzard_CombatLog") or addon == "Blizzard_CombatLog" then
	
	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 9
	CHAT_FONT_HEIGHTS = {7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24}

	-- Base fonts
	SetFont(AchievementFont_Small,                recMedia.fontFace.NORMAL, 9)
	SetFont(GameFontNormalHuge,					recMedia.fontFace.NORMAL, 20, "OUTLINE") -- Used for RaidWarningFrame
	SetFont(GameTooltipHeader,                    recMedia.fontFace.NORMAL, 10, "OUTLINE")
	SetFont(InvoiceFont_Med,                    recMedia.fontFace.NORMAL, 9, nil, 0.15, 0.09, 0.04)
	SetFont(InvoiceFont_Small,                  recMedia.fontFace.NORMAL, 8,  nil, 0.15, 0.09, 0.04)
	SetFont(MailFont_Large,                     recMedia.fontFace.NORMAL, 9, nil, 0.15, 0.09, 0.04, 0.54, 0.4, 0.1, 1, -1)
	SetFont(NumberFont_OutlineThick_Mono_Small, recMedia.fontFace.NORMAL, 11, "THICKOUTLINE")
	SetFont(NumberFont_Outline_Huge,            recMedia.fontFace.NORMAL, 13, "OUTLINE", 28)
	SetFont(NumberFont_Outline_Large,           recMedia.fontFace.NORMAL, 13, "OUTLINE")
	SetFont(NumberFont_Outline_Med,             recMedia.fontFace.NORMAL, 13, "OUTLINE")
	SetFont(NumberFont_Shadow_Med,              recMedia.fontFace.NORMAL, 12)
	SetFont(NumberFont_Shadow_Small,            recMedia.fontFace.NORMAL, 10)
	SetFont(QuestFont_Large,                    recMedia.fontFace.NORMAL, 13)
	SetFont(QuestFont_Shadow_Huge,                recMedia.fontFace.NORMAL, 13, nil, nil, nil, nil, 0.54, 0.4, 0.1)
	SetFont(ReputationDetailFont,                 recMedia.fontFace.NORMAL, 10, nil, nil, nil, nil, 0, 0, 0, 1, -1)
	SetFont(SpellFont_Small,                      recMedia.fontFace.NORMAL, 9)
	SetFont(SystemFont_InverseShadow_Small,       recMedia.fontFace.NORMAL, 9)
	SetFont(SystemFont_Large,                   recMedia.fontFace.NORMAL, 13)
	SetFont(SystemFont_Med1,                    recMedia.fontFace.NORMAL, 11)
	SetFont(SystemFont_Med2,                    recMedia.fontFace.NORMAL, 12, nil, 0.15, 0.09, 0.04)
	SetFont(SystemFont_Med3,                    recMedia.fontFace.NORMAL, 13)
	SetFont(SystemFont_OutlineThick_Huge2,      recMedia.fontFace.NORMAL, 13, "OUTLINE")
	SetFont(SystemFont_OutlineThick_Huge4,        recMedia.fontFace.NORMAL, 13, "OUTLINE")
	SetFont(SystemFont_OutlineThick_WTF,          recMedia.fontFace.NORMAL, 13, "OUTLINE", nil, nil, nil, 0, 0, 0, 1, -1)
	SetFont(SystemFont_Outline_Small,           recMedia.fontFace.NORMAL, 11, "OUTLINE")
	SetFont(SystemFont_Shadow_Huge1,              recMedia.fontFace.NORMAL, 13)
	SetFont(SystemFont_Shadow_Huge3,              recMedia.fontFace.NORMAL, 13)
	SetFont(SystemFont_Shadow_Large,            recMedia.fontFace.NORMAL, 13)
	SetFont(SystemFont_Shadow_Med1,             recMedia.fontFace.NORMAL, 11)
	SetFont(SystemFont_Shadow_Med3,             recMedia.fontFace.NORMAL, 13)
	SetFont(SystemFont_Shadow_Outline_Huge2,    recMedia.fontFace.NORMAL, 13, "OUTLINE")
	SetFont(SystemFont_Shadow_Small,              recMedia.fontFace.NORMAL, 9)
	SetFont(SystemFont_Small,                   recMedia.fontFace.NORMAL, 8)
	SetFont(SystemFont_Tiny,                    recMedia.fontFace.NORMAL, 7)
	SetFont(Tooltip_Med,                        recMedia.fontFace.NORMAL, 11)
	SetFont(Tooltip_Small,                        recMedia.fontFace.NORMAL, 10)

	-- Derived fonts
	SetFont(BossEmoteNormalHuge,                  recMedia.fontFace.NORMAL, 13, "OUTLINE")
	SetFont(CombatTextFont,                     recMedia.fontFace.NORMAL, 13)
	SetFont(ErrorFont,                          recMedia.fontFace.NORMAL, 13, "OUTLINE")
	SetFont(QuestFontNormalSmall,                 recMedia.fontFace.NORMAL, 11, nil, nil, nil, nil, 0.54, 0.4, 0.1)
	SetFont(WorldMapTextFont,                   recMedia.fontFace.NORMAL, 13, "THICKOUTLINE",  38, nil, nil, 0, 0, 0, 1, -1)
	
	hooksecurefunc("PlayerTitleFrame_UpdateTitles", FixTitleFont)
	FixTitleFont()
	
	SetFont = nil
	self:SetScript("OnEvent", nil)
	self:UnregisterAllEvents()
	self = nil
	
	--end
end)--]]