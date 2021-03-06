if Holo:ShouldModify("Hud", "Interaction") then
	Holo:Post(HUDInteraction, "show_interact", function(self) 
		local text = self._hud_panel:child(self._child_name_text)
		text:set_color(Color.white)
		text:set_w(text:parent():w())
	end)
	Holo:Pre(HUDInteraction, "_animate_interaction_complete", function(self, bitmap, circle)
		bitmap:set_blend_mode("normal")
		bitmap:set_image("guis/textures/custom/Circle" .. (Holo.RadialNames[Holo.Options:GetValue("Colors/Progress")]))
		circle._circle:set_blend_mode("normal")
	end)
	Holo:Post(HUDInteraction, "set_bar_valid", function(self, valid)
		self._interact_circle:set_image("guis/textures/custom/Circle" .. (Holo.RadialNames[Holo.Options:GetValue("Colors/Progress" .. (valid and "" or "Red"))]))
	end)
end