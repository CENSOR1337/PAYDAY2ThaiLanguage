Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_THLoc", function(self)
	local texts = {}
--[[
			--------------- Work in Procress ---------------
		local file_names = {
			"mods/PD2TH/localization_new/systemmenu.lua",
			"mods/PD2TH/localization_new/savefile.lua",
			"mods/PD2TH/localization_new/system_text.lua",
			"mods/PD2TH/localization_new/skills/enforcer_skill.lua",
			"mods/PD2TH/localization_new/skills/fugitive_skill.lua",
			"mods/PD2TH/localization_new/skills/ghost_skill.lua",
			"mods/PD2TH/localization_new/skills/mastermind_skill.lua",
			"mods/PD2TH/localization_new/skills/technician_skill.lua",
		}
]]--
		local file_names = {
			---------------------------- Skills ----------------------------
			"mods/PD2TH/localization/Skills_New/Mastermind_skill.lua",
			"mods/PD2TH/localization/Skills_New/Enforcer_skill.lua",
			"mods/PD2TH/localization/Skills_New/Technician_skill.lua",
			"mods/PD2TH/localization/Skills_New/Ghost_skill.lua",
			"mods/PD2TH/localization/Skills_New/Fugitive_skill.lua",
			"mods/PD2TH/localization/Skills_New/Skill_info.lua",
			---------------------------- Perk Deck ----------------------------
			"mods/PD2TH/localization/PERK/Armorer.lua",
			"mods/PD2TH/localization/PERK/Burglar.lua",
			"mods/PD2TH/localization/PERK/Crew-Chief.lua",
			"mods/PD2TH/localization/PERK/Crook.lua",
			"mods/PD2TH/localization/PERK/Ex_president.lua",
			"mods/PD2TH/localization/PERK/Gambler.lua",
			"mods/PD2TH/localization/PERK/Grinder.lua",
			"mods/PD2TH/localization/PERK/Hitman.lua",
			"mods/PD2TH/localization/PERK/Infiltrator.lua",
			"mods/PD2TH/localization/PERK/Muscle.lua",
			"mods/PD2TH/localization/PERK/Perk_all.lua",
			"mods/PD2TH/localization/PERK/Perk_info.lua",
			"mods/PD2TH/localization/PERK/Rogue.lua",
			"mods/PD2TH/localization/PERK/Sociopath.lua",
			"mods/PD2TH/localization/PERK/Yakuza.lua",
			---------------------------- Contact ----------------------------
			---- Bain ----
			"mods/PD2TH/localization_new/contact/bain/bank_heist.lua",
			---- The Elephant ----
			"mods/PD2TH/localization_new/contact/the_elephant/framing_frame.lua",
			---- The Dentist ----
			"mods/PD2TH/localization_new/contact/the_dentist/hoxton_breakout.lua",
			---------------------------- old update soon ----------------------------
			"mods/PD2TH/localization/SafeHouse/Trophies.lua",
			"mods/PD2TH/localization/SafeHouse/Menu.lua",
			"mods/PD2TH/localization/achievement.lua",
			"mods/PD2TH/localization/Action_Key.lua",
			"mods/PD2TH/localization/Bot_Custom.lua",
			"mods/PD2TH/localization/Crew_AI.lua",
			"mods/PD2TH/localization/Casino.lua",
			"mods/PD2TH/localization/CrimeSpree.lua",
			"mods/PD2TH/localization/Dialog.lua",
			"mods/PD2TH/localization/End_Heist.lua",
			"mods/PD2TH/localization/HUD.lua",
			"mods/PD2TH/localization/Loadout.lua",
			"mods/PD2TH/localization/Menu_Contact_Crimenet.lua",
			"mods/PD2TH/localization/menu_Crimenet.lua",
			"mods/PD2TH/localization/Menu_inside_lobby.lua",
			"mods/PD2TH/localization/Menu_Inventory.lua",
			"mods/PD2TH/localization/menu_lobby.lua",
			"mods/PD2TH/localization/menu_lobby_filters.lua",
			"mods/PD2TH/localization/Menu_Main.lua",
			"mods/PD2TH/localization/Menu_Option.lua",
			"mods/PD2TH/localization/Menu_Option_Control.lua",
			"mods/PD2TH/localization/Menu_Option_Control_EditKey.lua",
			"mods/PD2TH/localization/Menu_Option_Network.lua",
			"mods/PD2TH/localization/Menu_Option_Sound.lua",
			"mods/PD2TH/localization/Menu_Option_Video.lua",
			"mods/PD2TH/localization/Menu_Option_Video_Advanced.lua",
			"mods/PD2TH/localization/No_location.lua",
			"mods/PD2TH/localization/PAYDAY_CardPick.lua",
			"mods/PD2TH/localization/Screen.lua",
			"mods/PD2TH/localization/Steam_inventory.lua",
			"mods/PD2TH/localization/System_text.lua",
			"mods/PD2TH/localization/INVENTORY/Armor.lua",
			"mods/PD2TH/localization/INVENTORY/Character.lua",
			"mods/PD2TH/localization/INVENTORY/Equip.lua",
			"mods/PD2TH/localization/INVENTORY/Gun_inventory.lua",
			"mods/PD2TH/localization/INVENTORY/INVENTORY_info.lua",
			"mods/PD2TH/localization/INVENTORY/Mask_inventory.lua",
			"mods/PD2TH/localization/INVENTORY/Melee_Weapon.lua",
			"mods/PD2TH/localization/INVENTORY/Stat.lua",
			"mods/PD2TH/localization/INVENTORY/Throw.lua",
			--"mods/PD2TH/localization_new/menu.lua",
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
