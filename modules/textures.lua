-- $Id: textures.lua 557 2010-03-03 21:00:07Z john.d.mann@gmail.com $
local _, t = ...

--[[
	Buttons:
	button:SetNormalFontObject(recMedia.fontObject("NORMAL", 10, "OUTLINE"))

	FontStrings:
	fontstring:SetFont(recMedia.font("bold10outline"))
--]]

recMedia.texture = {
	BORDER =    t.DIRECTORY..[[textures\glowtex.tga]],
	STATUSBAR = t.DIRECTORY..[[textures\normtexa.tga]],
	BACKDROP =  [[Interface\ChatFrame\ChatFrameBackground]]
}