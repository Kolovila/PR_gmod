-- Пехота патрулей, клиент: цвет плеермодели на трупе бойца и отладка pr_inf_debug 1
-- (состояние бойцов, шкала обнаружения, метки врага — sv_infantry.lua)

-- Труп npc_pr_soldier — рэгдолл без владельца, прокси цвета брал бы синий
hook.Add("NetworkEntityCreated", "PR_SoldierCorpseColor", function(e)
	if e:GetClass() == "prop_ragdoll" then
		e.GetPlayerColor = function(s) return s:GetNW2Vector("PR_Col", Vector(0.24, 0.35, 0.42)) end
	end
end)

CreateClientConVar("pr_inf_debug", "0", false, true, "Показать мысли бойцов патрулей (только админам)")

local rows = {}
net.Receive("PR_InfDebug", function()
	rows = net.ReadTable() or {}
end)

local SRC_COLOR = {
	seen = Color(255, 70, 60), heard = Color(255, 200, 60), radio = Color(90, 170, 255),
	voice = Color(150, 120, 255), fire = Color(255, 120, 0)
}

surface.CreateFont("PR_InfDebug", {font = "Tahoma", size = 28, weight = 700, extended = true})

hook.Add("PostDrawTranslucentRenderables", "PR_InfDebug", function(depth, sky)
	if sky or GetConVarNumber("pr_inf_debug") ~= 1 then return end
	render.SetColorMaterial()
	local eyeAng = EyeAngles()
	for _, r in ipairs(rows) do
		if IsValid(r.ent) then
			local head = r.ent:GetPos() + Vector(0, 0, 90)
			for _, c in ipairs(r.contacts or {}) do
				local col = SRC_COLOR[c.src] or color_white
				render.DrawWireframeSphere(c.pos, math.min(c.r, 3000), 12, 12, col, true)
				render.DrawLine(r.ent:WorldSpaceCenter(), c.pos, col, true)
			end
			cam.Start3D2D(head, Angle(0, eyeAng.y - 90, 90), 0.15)
				draw.SimpleTextOutlined(string.format("%s %s", r.state or "?", r.gait or ""), "PR_InfDebug", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 2, color_black)
				draw.SimpleTextOutlined(string.format("видит %.0f%% %s  подавл. %.0f%%", (r.meter or 0) * 100, r.mstate or "", (r.supp or 0) * 100),
					"PR_InfDebug", 0, 30, Color(255, 220, 120), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 2, color_black)
			cam.End3D2D()
		end
	end
end)
