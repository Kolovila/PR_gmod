local TPIK = ArcCW_TPIK

hook.Add("PopulateToolMenu", "ArcCW_TPIK.Settings", function()
    spawnmenu.AddToolMenuOption("Options", "ArcCW", "arccw_tpik_settings", "Third Person IK", "", "", function(panel)
        panel:ClearControls()

        panel:CheckBox("Enable TPIK", "arccw_tpik")
        panel:ControlHelp("Draws ArcCW weapons on player models using the real viewmodel animations.")

        panel:CheckBox("Apply to other players", "arccw_tpik_others")

        panel:CheckBox("Aim down sights in third person", "arccw_tpik_aim_align")
        panel:ControlHelp("Brings the sights onto the eye line while aiming instead of leaving the gun in the hand.")

        panel:CheckBox("Enable aim animation", "arccw_tpik_aim_animation")
        panel:ControlHelp("The head turns towards the sights and the off eye closes.")

        panel:CheckBox("Head follows the weapon's camera animation", "arccw_tpik_head_motion")
        panel:ControlHelp("Reloads and inspects nudge the head the way the animator moved the viewmodel camera.")

        panel:CheckBox("Keep running while sprinting", "arccw_tpik_sprint")

        panel:CheckBox("Drop magazines during reloads", "arccw_tpik_magdrop")
        panel:ControlHelp("Only fires on weapons whose reload animation has a magdrop sound in it, " ..
            "which is what tells us a magazine leaves the gun and exactly when. Weapons without one " ..
            "are left alone rather than guessed at.")

        panel:CheckBox("Suppress ArcCW third person gestures", "arccw_tpik_suppress_gestures")
        panel:ControlHelp("ArcCW's own reload gesture was written for a welded world model and fights the mirrored animation.")

        panel:CheckBox("Enable individual positions", "arccw_tpik_individual_positions")
        panel:ControlHelp("Use the per-weapon offsets. Turn off to see every weapon on its automatic alignment.")

        panel:CheckBox("Solve the viewmodel's own hand IK", "arccw_tpik_viewmodel_ik")

        panel:NumSlider("Aim alignment", "arccw_tpik_ads_align", 0, 1, 2)
        panel:ControlHelp("How far the weapon comes up to the eye line when aiming. 1 puts the sights " ..
            "exactly on the eye the way first person does; lower it if rifles ride up level with the head.")

        panel:NumSlider("Aim to shoulder", "arccw_tpik_ads_shoulder", 0, 2, 2)
        panel:ControlHelp("Slides the weapon across to the firing shoulder while aiming. Without it the " ..
            "sights line up with the middle of the face and the stock passes through the head. This is " ..
            "the one to raise if the weapon clips into the body when aiming.")

        panel:NumSlider("Aim forward", "arccw_tpik_ads_forward", 0, 2, 2)
        panel:ControlHelp("Pushes the weapon forward while aiming. A sight offset drags the stock behind " ..
            "the eye, which is invisible in first person but puts the grip beside the head on a body. " ..
            "1 cancels that pull completely; go above 1 if long rifles still sit too far back.")

        panel:NumSlider("Weapon drop", "arccw_tpik_drop", 0, 2, 2)
        panel:ControlHelp("How far the weapon sits below eye level when not aiming. 0 holds it at the " ..
            "eye the way first person does, 1 puts it on the shoulder line. Turn it up if weapons ride " ..
            "too high, down if they hang too low.")

        panel:NumSlider("Sway and bob", "arccw_tpik_sway", 0, 3, 2)
        panel:ControlHelp("How much the weapon lags behind the view and bobs while walking. 0 holds it rigid.")

        panel:Help("Per-weapon on/off")

        panel:ControlHelp("Leave this on \"Every ArcCW weapon\" to run everywhere. " ..
            "Blacklist turns TPIK off for the weapons you list; whitelist turns it off " ..
            "for everything except the weapons you list. The list is shared between the " ..
            "two modes, so you can switch without losing it.")

        local mode = panel:ComboBox("Which weapons", "arccw_tpik_filter")
        mode:AddChoice("Every ArcCW weapon", "0", true)
        mode:AddChoice("All except the listed ones (blacklist)", "1")
        mode:AddChoice("Only the listed ones (whitelist)", "2")

        local toggle = panel:Button("Add / remove the weapon I am holding")
        toggle.DoClick = function() RunConsoleCommand("arccw_tpik_list_toggle") end
        panel:ControlHelp("Also on the console as arccw_tpik_list_toggle. " ..
            "arccw_tpik_list_print shows the list, arccw_tpik_list_clear empties it.")

        local listed = panel:Button("Print the list to console")
        listed.DoClick = function() RunConsoleCommand("arccw_tpik_list_print") end

        local clear = panel:Button("Clear the list")
        clear.DoClick = function() RunConsoleCommand("arccw_tpik_list_clear") end

        panel:Help("Per-weapon tuning")

        local editor = panel:Button("Open weapon editor")
        editor.DoClick = function() TPIK.Editor.Open() end
        panel:ControlHelp("Tunes whatever you are holding. Also on the console as arccw_tpik_editor.")

        panel:Help("Performance")
        panel:NumSlider("Solve rate - you", "arccw_tpik_framerate_local", 5, 120, 0)
        panel:NumSlider("Solve rate - others", "arccw_tpik_framerate_others", 5, 120, 0)
        panel:ControlHelp("How often the arm IK is recalculated. Motion between solves is smoothed, so low values still look continuous.")

        panel:NumSlider("Draw distance - others", "arccw_tpik_distance_others", 0, 8192, 0)
        panel:ControlHelp("Other players past this distance keep their plain world model. 0 removes the limit.")

        panel:Help("Global gun offset")
        panel:ControlHelp("Nudges every weapon at once. For a single weapon, use the editor above.")
        panel:NumSlider("Right / left", "arccw_tpik_offset_x", -10, 10, 2)
        panel:NumSlider("Forward / back", "arccw_tpik_offset_y", -10, 10, 2)
        panel:NumSlider("Up / down", "arccw_tpik_offset_z", -10, 10, 2)
        panel:NumSlider("Pitch", "arccw_tpik_angle_p", -45, 45, 1)
        panel:NumSlider("Yaw", "arccw_tpik_angle_y", -45, 45, 1)
        panel:NumSlider("Roll", "arccw_tpik_angle_r", -45, 45, 1)

        local reset = panel:Button("Reset offsets")

        reset.DoClick = function()
            for _, name in ipairs({
                "arccw_tpik_offset_x", "arccw_tpik_offset_y", "arccw_tpik_offset_z",
                "arccw_tpik_angle_p", "arccw_tpik_angle_y", "arccw_tpik_angle_r"
            }) do
                RunConsoleCommand(name, "0")
            end
        end
    end)
end)
