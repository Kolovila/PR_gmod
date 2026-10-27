--[[
- Provices easy access to the build in language support of gmod
-
-	@author: 3aGl3
-	@team: SOG Modding
-
-	@project: WFTDM
-	@website: http://sogmods.net/
]]

AddCSLuaFile()
local loadedLocalizations = {}

-- create a con var to toggle fake weapon names
CreateClientConVar( "wf_use_fakenames", "0", true, false, "Use fake weapon names." )

--[[
- Loads a localization file into the gmod language interface
]]
local function loadLocalization( fname, load )
	--[[
	- Parses the localization .properties files
	]]
	local function parsePropertiesFile( fpath )
		local result = {}

	    local data = file.Read( fpath, "GAME" )
		if data then
		    local lines = string.Split( data, "\n" )

		    for _, line in pairs(lines) do
		        line = string.Trim( line )
		        if string.len( line ) == 0 then
					continue
				end

		        if string.sub(line, 0, 1) == "#" then
					continue
				end

		        local _, _, key, value = string.find(line, '([%w%p_]+)=(.+)')
				if key and value then
		        	result[key] = value
				end
		    end
		end

	    return result
	end

	local base_path = "resource/localization/%s/%s.properties"

	-- check if the file has already been loaded
	if loadedLocalizations[fname] then
		return
	end

	-- flags the file as loaded
	loadedLocalizations[fname] = true

	-- create the basePath
	local path_base = string.format( base_path, "en", fname )

	if not file.Exists( path_base, "GAME" ) then
		-- NOTE this is a console error message that should never trigger unless someone tinkered with his files
		-- there is absolutely no need to translate this message as it's mostly for debugging, error finding
        print( string.format( "ERROR! Cannot access english localization file %s.", fname ) )
        return
    end

	-- add the localization file for download
	if SERVER then
		resource.AddFile( path_base )
		return
	end

	if not load then
		return
	end

	-- create the filepath
	local loc = GetConVar('gmod_language'):GetString() or "en"
	local path_loc = string.format( base_path, loc, fname )

	-- load the english localization as a base
	local strings = parsePropertiesFile( path_base )

	-- load the users langguage atop
	table.Merge( strings, parsePropertiesFile( path_loc ) )

	-- add all strings to the language library of gmod
	for key, val in pairs(strings) do
        language.Add(key, val)
    end
end

--[[
- Loads all localizations
]]
local function loadLocalizations()

	-- see if the fake names have to be loaded
	local bLoadFake = GetConVar('wf_use_fakenames'):GetBool() or false

	-- load localizations below
	-- NOTE make sure the variable bLoadFake is passed to all fake weapon name files
	-- NOTE not bLoadFake should be passed to all real weapon name files
	-- NOTE simply true should be passed to all files, loaded always
		loadLocalization( "ma85_mw3", true )
end
loadLocalizations()

--[[
- Returns a localized string if possible
]]
function loc( text )
	if SERVER then
		return text
	end

	return language.GetPhrase(text)
end
