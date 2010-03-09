-- $Id: backdrop.lua 594 2010-03-07 20:07:35Z john.d.mann@gmail.com $

recMedia.backdrop_table = {
	bgFile   = [[Interface\ChatFrame\ChatFrameBackground]],
	edgeFile = [[Interface\Addons\recMedia\caellian\glowtex]],
	edgeSize = 4,
	insets   = {
		left   = 3,
		right  = 3,
		top    = 3,
		bottom = 3
	}
}

recMedia.border_table = {
	bgFile   = nil,
	edgeFile = [[Interface\Addons\recMedia\caellian\glowtex]],
	edgeSize = 4,
	insets   = {
		left   = 3,
		right  = 3,
		top    = 3,
		bottom = 3
	}
}

recMedia.backdrop = function(object, remove_backdrop)
	if not object then return end
	if type(object) == "frame" then
		object:SetBackdrop((not remove_backdrop) and recMedia.backdrop_table or recMedia.border_table)
		object:SetBackdropBorderColor(0, 0, 0)
		object:SetBackdropColor(.25,.25,.25, .5)
	else
		object.bg = CreateFrame("Frame", nil, object)
		object.bg:SetPoint("TOPLEFT")
		object.bg:SetPoint("BOTTOMRIGHT")
		object.bg:SetBackdrop((not remove_backdrop) and recMedia.backdrop_table or recMedia.border_table)
		object.bg:SetFrameStrata("BACKGROUND")
		object.bg:SetBackdropBorderColor(0, 0, 0)
		object.bg:SetBackdropColor(.25,.25,.25, .5)
	end
	return object
end