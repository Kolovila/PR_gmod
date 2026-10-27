local gren = {}
gren.name = "mw3_gl"
gren.display = " - 40MM HE"
gren.fireSound = ""
gren.grenadeEntity = "mw3_gl"

function gren:fireFunc()
	if SERVER then
		CustomizableWeaponry.grenadeTypes.createGrenadeEntity(self, gren.grenadeEntity)
	end
end

CustomizableWeaponry.grenadeTypes:addNew(gren)