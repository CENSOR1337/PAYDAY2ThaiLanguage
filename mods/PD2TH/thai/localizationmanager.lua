Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_THLoc", function(self)
	local texts = {}
	local file_names = {
		"PD2TL/contact/Framing_Frame.lua",
		"PD2TL/Custom_Music/Bank_Heist.lua",
		"PD2TL/contact/Hoxton_Breakout.lua",
		"PD2TL/SafeHouse/Trophies.lua",
		"PD2TL/SafeHouse/Menu.lua",
		"PD2TL/achievement.lua",
		"PD2TL/Action_Key.lua",
		"PD2TL/Bot_Custom.lua",
		"PD2TL/Crew_AI.lua",
		"PD2TL/Chat.lua",
		"PD2TL/Casino.lua",
		"PD2TL/CrimeSpree.lua",
		"PD2TL/Dialog.lua",
		"PD2TL/End_Heist.lua",
		"PD2TL/HUD.lua",
		"PD2TL/Loadout.lua",
		"PD2TL/Menu_Contact_Crimenet.lua",
		"PD2TL/menu_Crimenet.lua",
		"PD2TL/Menu_inside_lobby.lua",
		"PD2TL/Menu_Inventory.lua",
		"PD2TL/menu_lobby.lua",
		"PD2TL/menu_lobby_filters.lua",
		"PD2TL/Menu_Main.lua",
		"PD2TL/Menu_Option.lua",
		"PD2TL/Menu_Option_Control.lua",
		"PD2TL/Menu_Option_Control_EditKey.lua",
		"PD2TL/Menu_Option_Network.lua",
		"PD2TL/Menu_Option_Sound.lua",
		"PD2TL/Menu_Option_Video.lua",
		"PD2TL/Menu_Option_Video_Advanced.lua",
		"PD2TL/No_location.lua",
		"PD2TL/PAYDAY_CardPick.lua",
		"PD2TL/Screen.lua",
		"PD2TL/Steam_inventory.lua",
		"PD2TL/System_text.lua",
		"PD2TL/INVENTORY/Armor.lua",
		"PD2TL/INVENTORY/Character.lua",
		"PD2TL/INVENTORY/Equip.lua",
		"PD2TL/INVENTORY/Gun_inventory.lua",
		"PD2TL/INVENTORY/INVENTORY_info.lua",
		"PD2TL/INVENTORY/Mask_inventory.lua",
		"PD2TL/INVENTORY/Melee_Weapon.lua",
		"PD2TL/INVENTORY/Stat.lua",
		"PD2TL/INVENTORY/Throw.lua",
		"PD2TL/PERK/Armorer.lua",
		"PD2TL/PERK/Burglar.lua",
		"PD2TL/PERK/Crew-Chief.lua",
		"PD2TL/PERK/Crook.lua",
		"PD2TL/PERK/Ex_president.lua",
		"PD2TL/PERK/Gambler.lua",
		"PD2TL/PERK/Grinder.lua",
		"PD2TL/PERK/Hitman.lua",
		"PD2TL/PERK/Infiltrator.lua",
		"PD2TL/PERK/Muscle.lua",
		"PD2TL/PERK/Perk_all.lua",
		"PD2TL/PERK/Perk_info.lua",
		"PD2TL/PERK/Rogue.lua",
		"PD2TL/PERK/Sociopath.lua",
		"PD2TL/PERK/Yakuza.lua",
		"PD2TL/Skills_New/Mastermind_skill.lua",
		"PD2TL/Skills_New/Enforcer_skill.lua",
		"PD2TL/Skills_New/Technician_skill.lua",
		"PD2TL/Skills_New/Ghost_skill.lua",
		"PD2TL/Skills_New/Fugitive_skill.lua",
		"PD2TL/Skills_New/Skill_info.lua",
	}
	for _,filename in pairs(file_names or {})do
		local fo = io.open(filename,"r")
		if fo then
			local txt = fo:read("*a")
			io.close(fo)
			if txt and type(txt) == "string" then
				local data = assert(loadstring("return {\n"..txt.."\n}"))()
				for i,v in pairs(data)do
					if v ~= "" then
						texts[i] = v
					end
				end
			end
		end
	end
	self:add_localized_strings(texts)
end)

function LocalizationManager.text( self, str, macros )

	if self._custom_localizations[str] then
		local return_str = self._custom_localizations[str]
		self._macro_context = macros
		return_str = self:_localizer_post_process( return_str )
		self._macro_context = nil
		if macros and type(macros) == "table" then
			for k, v in pairs( macros ) do
				return_str = return_str:gsub( "$" .. k, v)
			end
		end
		return return_str
	end
	return self.orig.text(self, str, macros)

end
