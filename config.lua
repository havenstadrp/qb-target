local Config, Players, Types, Entities, Models, Zones, Bones, PlayerData = {}, {}, {}, {}, {}, {}, {}, {}
Types[1], Types[2], Types[3] = {}, {}, {}

-- This is the vehicle bones table, this is needed to verify if the vehicle bone exists when checking them, here is a list of vehicle bones you can use, all of them are included in this table: https://wiki.rage.mp/index.php?title=Vehicle_Bones
Config.VehicleBones = {'chassis', 'chassis_lowlod', 'chassis_dummy', 'seat_dside_f', 'seat_dside_r', 'seat_dside_r1', 'seat_dside_r2', 'seat_dside_r3', 'seat_dside_r4', 'seat_dside_r5', 'seat_dside_r6', 'seat_dside_r7', 'seat_pside_f', 'seat_pside_r', 'seat_pside_r1', 'seat_pside_r2', 'seat_pside_r3', 'seat_pside_r4', 'seat_pside_r5', 'seat_pside_r6', 'seat_pside_r7', 'window_lf1', 'window_lf2', 'window_lf3', 'window_rf1', 'window_rf2', 'window_rf3', 'window_lr1', 'window_lr2', 'window_lr3', 'window_rr1', 'window_rr2', 'window_rr3', 'door_dside_f', 'door_dside_r', 'door_pside_f', 'door_pside_r', 'handle_dside_f', 'handle_dside_r', 'handle_pside_f', 'handle_pside_r', 'wheel_lf', 'wheel_rf', 'wheel_lm1', 'wheel_rm1', 'wheel_lm2', 'wheel_rm2', 'wheel_lm3', 'wheel_rm3', 'wheel_lr', 'wheel_rr', 'suspension_lf', 'suspension_rf', 'suspension_lm', 'suspension_rm', 'suspension_lr', 'suspension_rr', 'spring_rf', 'spring_lf', 'spring_rr', 'spring_lr', 'transmission_f', 'transmission_m', 'transmission_r', 'hub_lf', 'hub_rf', 'hub_lm1', 'hub_rm1', 'hub_lm2', 'hub_rm2', 'hub_lm3', 'hub_rm3', 'hub_lr', 'hub_rr', 'windscreen', 'windscreen_r', 'window_lf', 'window_rf', 'window_lr', 'window_rr', 'window_lm', 'window_rm', 'bodyshell', 'bumper_f', 'bumper_r', 'wing_rf', 'wing_lf', 'bonnet', 'boot', 'exhaust', 'exhaust_2', 'exhaust_3', 'exhaust_4', 'exhaust_5', 'exhaust_6', 'exhaust_7', 'exhaust_8', 'exhaust_9', 'exhaust_10', 'exhaust_11', 'exhaust_12', 'exhaust_13', 'exhaust_14', 'exhaust_15', 'exhaust_16', 'engine', 'overheat', 'overheat_2', 'petrolcap', 'petrolcap', 'petroltank', 'petroltank_l', 'petroltank_r', 'steering', 'hbgrip_l', 'hbgrip_r', 'headlight_l', 'headlight_r', 'taillight_l', 'taillight_r', 'indicator_lf', 'indicator_rf', 'indicator_lr', 'indicator_rr', 'brakelight_l', 'brakelight_r', 'brakelight_m', 'reversinglight_l', 'reversinglight_r', 'extralight_1', 'extralight_2', 'extralight_3', 'extralight_4', 'numberplate', 'interiorlight', 'siren1', 'siren2', 'siren3', 'siren4', 'siren5', 'siren6', 'siren7', 'siren8', 'siren9', 'siren10', 'siren11', 'siren12', 'siren13', 'siren14', 'siren15', 'siren16', 'siren17', 'siren18', 'siren19', 'siren20', 'siren_glass1', 'siren_glass2', 'siren_glass3', 'siren_glass4', 'siren_glass5', 'siren_glass6', 'siren_glass7', 'siren_glass8', 'siren_glass9', 'siren_glass10', 'siren_glass11', 'siren_glass12', 'siren_glass13', 'siren_glass14', 'siren_glass15', 'siren_glass16', 'siren_glass17', 'siren_glass18', 'siren_glass19', 'siren_glass20', 'spoiler', 'struts', 'misc_a', 'misc_b', 'misc_c', 'misc_d', 'misc_e', 'misc_f', 'misc_g', 'misc_h', 'misc_i', 'misc_j', 'misc_k', 'misc_l', 'misc_m', 'misc_n', 'misc_o', 'misc_p', 'misc_q', 'misc_r', 'misc_s', 'misc_t', 'misc_u', 'misc_v', 'misc_w', 'misc_x', 'misc_y', 'misc_z', 'misc_1', 'misc_2', 'weapon_1a', 'weapon_1b', 'weapon_1c', 'weapon_1d', 'weapon_1a_rot', 'weapon_1b_rot', 'weapon_1c_rot', 'weapon_1d_rot', 'weapon_2a', 'weapon_2b', 'weapon_2c', 'weapon_2d', 'weapon_2a_rot', 'weapon_2b_rot', 'weapon_2c_rot', 'weapon_2d_rot', 'weapon_3a', 'weapon_3b', 'weapon_3c', 'weapon_3d', 'weapon_3a_rot', 'weapon_3b_rot', 'weapon_3c_rot', 'weapon_3d_rot', 'weapon_4a', 'weapon_4b', 'weapon_4c', 'weapon_4d', 'weapon_4a_rot', 'weapon_4b_rot', 'weapon_4c_rot', 'weapon_4d_rot', 'turret_1base', 'turret_1barrel', 'turret_2base', 'turret_2barrel', 'turret_3base', 'turret_3barrel', 'ammobelt', 'searchlight_base', 'searchlight_light', 'attach_female', 'roof', 'roof2', 'soft_1', 'soft_2', 'soft_3', 'soft_4', 'soft_5', 'soft_6', 'soft_7', 'soft_8', 'soft_9', 'soft_10', 'soft_11', 'soft_12', 'soft_13', 'forks', 'mast', 'carriage', 'fork_l', 'fork_r', 'forks_attach', 'frame_1', 'frame_2', 'frame_3', 'frame_pickup_1', 'frame_pickup_2', 'frame_pickup_3', 'frame_pickup_4', 'freight_cont', 'freight_bogey', 'freightgrain_slidedoor', 'door_hatch_r', 'door_hatch_l', 'tow_arm', 'tow_mount_a', 'tow_mount_b', 'tipper', 'combine_reel', 'combine_auger', 'slipstream_l', 'slipstream_r', 'arm_1', 'arm_2', 'arm_3', 'arm_4', 'scoop', 'boom', 'stick', 'bucket', 'shovel_2', 'shovel_3', 'Lookat_UpprPiston_head', 'Lookat_LowrPiston_boom', 'Boom_Driver', 'cutter_driver', 'vehicle_blocker', 'extra_1', 'extra_2', 'extra_3', 'extra_4', 'extra_5', 'extra_6', 'extra_7', 'extra_8', 'extra_9', 'extra_ten', 'extra_11', 'extra_12', 'break_extra_1', 'break_extra_2', 'break_extra_3', 'break_extra_4', 'break_extra_5', 'break_extra_6', 'break_extra_7', 'break_extra_8', 'break_extra_9', 'break_extra_10', 'mod_col_1', 'mod_col_2', 'mod_col_3', 'mod_col_4', 'mod_col_5', 'handlebars', 'forks_u', 'forks_l', 'wheel_f', 'swingarm', 'wheel_r', 'crank', 'pedal_r', 'pedal_l', 'static_prop', 'moving_prop', 'static_prop2', 'moving_prop2', 'rudder', 'rudder2', 'wheel_rf1_dummy', 'wheel_rf2_dummy', 'wheel_rf3_dummy', 'wheel_rb1_dummy', 'wheel_rb2_dummy', 'wheel_rb3_dummy', 'wheel_lf1_dummy', 'wheel_lf2_dummy', 'wheel_lf3_dummy', 'wheel_lb1_dummy', 'wheel_lb2_dummy', 'wheel_lb3_dummy', 'bogie_front', 'bogie_rear', 'rotor_main', 'rotor_rear', 'rotor_main_2', 'rotor_rear_2', 'elevators', 'tail', 'outriggers_l', 'outriggers_r', 'rope_attach_a', 'rope_attach_b', 'prop_1', 'prop_2', 'elevator_l', 'elevator_r', 'rudder_l', 'rudder_r', 'prop_3', 'prop_4', 'prop_5', 'prop_6', 'prop_7', 'prop_8', 'rudder_2', 'aileron_l', 'aileron_r', 'airbrake_l', 'airbrake_r', 'wing_l', 'wing_r', 'wing_lr', 'wing_rr', 'engine_l', 'engine_r', 'nozzles_f', 'nozzles_r', 'afterburner', 'wingtip_1', 'wingtip_2', 'gear_door_fl', 'gear_door_fr', 'gear_door_rl1', 'gear_door_rr1', 'gear_door_rl2', 'gear_door_rr2', 'gear_door_rml', 'gear_door_rmr', 'gear_f', 'gear_rl', 'gear_lm1', 'gear_rr', 'gear_rm1', 'gear_rm', 'prop_left', 'prop_right', 'legs', 'attach_male', 'draft_animal_attach_lr', 'draft_animal_attach_rr', 'draft_animal_attach_lm', 'draft_animal_attach_rm', 'draft_animal_attach_lf', 'draft_animal_attach_rf', 'wheelcover_l', 'wheelcover_r', 'barracks', 'pontoon_l', 'pontoon_r', 'no_ped_col_step_l', 'no_ped_col_strut_1_l', 'no_ped_col_strut_2_l', 'no_ped_col_step_r', 'no_ped_col_strut_1_r', 'no_ped_col_strut_2_r', 'light_cover', 'emissives', 'neon_l', 'neon_r', 'neon_f', 'neon_b', 'dashglow', 'doorlight_lf', 'doorlight_rf', 'doorlight_lr', 'doorlight_rr', 'unknown_id', 'dials', 'engineblock', 'bobble_head', 'bobble_base', 'bobble_hand', 'chassis_Control'}

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------
-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 3.0

-- Enable debug options and distance preview
Config.Debug = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = false

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the wiki and .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {
    ["policeDuty"] = {
        name = "MissionRowDutyClipboard",
        coords = vector3(441.7989, -982.0529, 30.67834),
        length = 0.45,
        width = 0.35,
        heading = 11.0,
        debugPoly = false,
        minZ = 30.77834,
        maxZ = 30.87834,
        options = {
            {
				type = "client",
				event = "Toggle:Duty",
				icon = "fas fa-sign-in-alt",
				label = "Sign In",
				job = "police",
            },
        },
        distance = 3.5
    },
	["AmbulanceDuty"] = {
        name = "AmbulanceDuty",
        coords = vector3(310.235, -597.55, 43.28),
        length = 0.4,
        width = 0.28,
        heading = 151,
        debugPoly = false,
        minZ = 43.28,
        maxZ = 43.38,
        options = {
            {
                type = "client",
                event = "Toggle:Duty",
                icon = "fas fa-clipboard",
                label = "SIGN IN / SIGN OFF",
                job = "ambulance",
            },
        },
        distance = 1.5
    },
    ["Mechanic"] = {
        name = "Mechanic",
        coords = vector3(-199.537, -1319.87, 31.089),
        length = 0.5,
        width = 0.5,
        heading = 60.654,
        debugPoly = false,
        minZ = 30.6289,
        maxZ = 31.2,
        options = {
            {
                event = "Mech:duty", 
                icon = "far fa-clipboard",
                label = "Buy",
                job = "police",
            },
        },
        distance = 1.5
    },
}

Config.PolyZones = {

}

Config.TargetBones = {
    ["main"] = {
        bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r"
        },
        options = {
            {
                type = "client",
                event = "vehiclekeys:client:GiveKeys",
                icon = "fad fa-key",
                label = "GIVE KEYS",
            },
            {
                type = "client",
                event = "police:client:PutPlayerInVehicle",
                icon = "fas fa-chevron-circle-left",
                label = "PLACE IN VEHICLE",
            },
            {
                type = "client",
                event = "police:client:SetPlayerOutVehicle",
                icon = "fas fa-chevron-circle-right",
                label = "TAKE OUT OF VEHICLE",
            },
            {
                type = "client",
                event = "police:client:ImpoundVehicle",
                icon = "fas fa-car",
                label = "IMPOUND VEHICLE",
                job = "police"
            },
            {
                type = "client",
                event = "qb-trunk:client:GetIn",
                icon = "fas fa-user-secret",
                label = "GET IN TRUNK",
            },
            {
                type = "client",
                event = "CheckVehStatus",
                icon = "fas fa-wrench",
                label = "Examine Vehicle",
            },
            {
                type = "client",
                event = "vehicle:flipit",
                icon = "fad fa-car-tilt",
                label = "FLIP VEHICLE",
                canInteract = function()
                    vehicle = QBCore.Functions.GetClosestVehicle()
                    return not IsVehicleOnAllWheels(vehicle)
                end,
            },
        },  
        distance = 3.0
    },
}

Config.TargetEntities = {

}

Config.EntityZones = {

}

Config.TargetModels = {
	["atm"] = {
        models = {
            'prop_atm_01',
            'prop_atm_02',
            'prop_atm_03',
            'prop_fleeca_atm',
        },
        options = {
            {
                type = "client",
                event = "qb-atms:client:loadATM",
                icon = "fab fa-cc-visa",
                label = "Use ATM",
            },
        },
        distance = 1.0
    },
	["bank"] = {
        models = {
            'ig_bankman',
        },
        options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fal fa-money-check-edit-alt",
                label = "Access Bank",
            },
        },
        distance = 2.5
    },
	["shops"] = {
		models = {
            'cs_josef',
            'mp_m_shopkeep_01',
            'mp_m_waremech_01',
            'a_m_y_smartcaspat_01',
            's_f_m_maid_01',
            's_m_m_linecook',
            's_f_y_beachbarstaff_01',
            'u_m_o_finguru_01',
            's_f_y_beachbarstaff_01',
            'u_m_o_finguru_01',
            's_m_y_ammucity_01',
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-circle",
                label = "Winkelen",
            },
        },
        distance = 3.5
    },
	["emial"] = { -- SCAPYARD
        models = {
            'csb_mp_agent14',
        },
        options = {
            {
                type = "client",
                event = "qb-scapyard:client:RequestEmail",
                icon = "fas fa-circle",
                label = "Request Vehicle List",
            },
        },
        distance = 2.5
    },
	["cityhall"] = { -- SCAPYARD
        models = {
            'ig_molly',
        },
        options = {
            {
                type = "client",
                event = "qb-jobcenter:client:openCityHall",
                icon = "fas fa-circle",
                label = "Open CitiyHall",
            },
        },
        distance = 2.5
    },
	["pillboxcheckin"] = {
        models = {
            's_f_y_scrubs_01',
        },
        options = {
            {
                type = "client",
                event = "Hospital:CheckIn",
                icon = "fas fa-circle",
                label = "Help, ik heb pijn!",
            },
        },
        distance = 2.5
    },
    ["pillboxpoliceduty"] = {
        models = {
            's_m_y_cop_01',
        },
        options = {
            {
                type = "client",
                event = "Toggle:Duty",
                icon = "fas fa-circle",
                label = "Help, ik heb pijn!",
            },
        },
        distance = 2.5
    },
    ["fuel"] = {
        models = {
            'prop_gas_pump_1d',
            'prop_gas_pump_1a',
            'prop_gas_pump_1b',
            'prop_gas_pump_1c',
            'prop_vintage_pump',
            'prop_gas_pump_old2',
            'prop_gas_pump_old3',
        },
        options = {
            {
                type = "client",
                event = "LegacyFuel:client:fuel",
                icon = "fas fa-gas-pump",
                label = "Refuel Vehicle",
            },
        },
        distance = 5.0
    },
    ["normalgarage"] = {
        models = {
            'cs_floyd',
        },
        options = {
            {
                type = "client",
                event = "GarageOUT",
                icon = "fas fa-car",
                label = "GARAGE",
            },
        },
        distance = 4.0
    },
    ["impound"] = {
        models = {
            'ig_floyd',
        },
        options = {
            {
                type = "client",
                event = "Impound",
                icon = "fas fa-car",
                label = "Retrieve Seized Vehicle",
            },
        },
        distance = 4.0
    },

-- --POLICE GARAGE/EMS GARAGE
--     ["policegarage"] = {
--         objects = {
--             'csb_trafficwarden',
--         },
--         options = {
--             {
--                 type = "client",
--                 event = "garage:menu",
--                 icon = "fas fa-car",
--                 label = "PD GARAGE",
--                 job = "police",
--             },
--             {
--                 type = "client",
--                 event = "garage:menu2",
--                 icon = "fas fa-car",
--                 label = "EMS GARAGE",
--                 job = 'ambulance',
--             }
--         },
--         distance = 2.5
--     },

--PD HELICOPTER GARAGE
    ["polcoptergarage"] = {
        models = {
            's_m_m_pilot_02',
        },
        options = {
            {
                type = "client",
                event = "garage:menu3",
                icon = "fas fa-car",
                label = "PD Helicopter",
                job = "police",
            },
        },
        distance = 2.5
    },
    ["cityhall"] = {
        models = {
            's_m_m_highsec_02',
        },
        options = {
            {
                type = "client",
                event = "QBJobs",
                icon = "fas fa-money-bill",
                label = "Apply for job",
            },
        },
        distance = 4.0
    },
    ["Clothing"] = {
        models = {
            'cs_natalia',
        },
        options = {
            {
                type = "client",
                event = "qb-clothing:client:openclothes",
                icon = "fas fa-tshirt",
                label = "Open Clothing Store",

            },
        },
        distance = 2.5
    },
    ["burgershotgarage"] = {
        models = {
            'ig_floyd',
        },
        options = {
            {
                type = "client",
                event = "garage:BurgerShotGarage",
                icon = "fas fa-car",
                label = "BurgerShot Garage",
                job = "burgershot",
            },
        },
        distance = 2.5
    },
    ["Scrapyard"] = {
        models = {
            's_m_y_construct_02',
        },
        options = {
            {
                type = "client",
                event = "qb-scapyard:client:setNewVehicles",
                icon = "fas fa-wrench",
                label = "Car List",
                --job = "police",
            },
        },
        distance = 2.5
    },
    ["MechanicJob"] = {
        models = {
            's_m_y_construct_02',
        },
        options = {
            {
                type = "client",
                event = "qb-mechanic:client:setNewVehicles",
                icon = "fas fa-wrench",
                label = "Mechanic",
                --job = "Mechanic",
            },
        },
        distance = 2.5
    },
    ["MechanicJob"] = {
        models = {
            'csb_cop',
        },
        options = {
            {
                type = "client",
                event = "qb-mechanic:client:setNewVehicles",
                icon = "fas fa-wrench",
                label = "Mechanic",
                --job = "Mechanic",
            },
        },
        distance = 2.5
    },
    ["pillboxarmoury"] = {
        models = {
            's_f_y_cop_01',
        },
        options = {
            {
                type = "client",
                event = "MRPDPoliceArmory",
                icon = "fas fa-boxes",
                label = "Armory",
                job = "police",
            },
        },
        distance = 2.5,
    },
    ["apartmamentped"] = {
        models = {
            'mp_m_securoguard_01',
        },
        options = {
            {
                type = "client",
                event = "GarageOUT",
                icon = "fas fa-money-bill-wave",
                label = "Access Garage",
            },
        },
        distance = 3.0
    },
}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {
    options = {
        {
            type = "client",
            event = "police:client:CuffPlayer",
            icon = "fas fa-circle",
            label = "Cuff / Uncuff",
            --item = 'handcuffs',
            job = {
                ["police"] = 0,
                ["ambulance"] = 0,
            }
        },
        {
            type = "client",
            event = "qb-phone:client:GiveContactDetails",
            icon = "fas fa-circle",
            label = "Give Contact Details"
        },
        {
            type = "client",
            event = "police:client:RobPlayer",
            icon = "fas fa-circle",
            label = "Rob Person"
        },
        {
            type = "client",
            event = "police:client:EscortPlayer",
            icon = "fas fa-circle",
            label = "Escort",
            job = {
                ["police"] = 9,
                ["ambulance"] = 9,
            }
        }

    },
    distance = 2.5,
}

Config.Peds = {
	{
		model = 'mp_m_shopkeep_01', -- Model name as a hash.
		coords = vector4(24.40255, -1347.44, 29.497, 267.2), -- Hawick Ave (X, Y, Z, Heading)
		gender = 'male' -- The gender of the ped, used for the CreatePed native.
	},

	{
		model = 'ig_josef',
		coords = vector4(-279.89, 6227.61, 31.71, 50.0), -- Paleto Bay
		gender = 'male'
	},

	-- Ammunations

    -- Legion Square
    {
        model = 's_m_y_ammucity_01',
        coords = vector4(22.59, -1105.55, 29.80, 159.83),
        gender = 'male'
    },

    -- Popular Street
    {
        model = 's_m_y_ammucity_01',
        coords = vector4(810.21, -2159.02, 29.62, 1.43),
        gender = 'male'
    },

    -- Vespucci Boulevard
    {
        model = 's_m_y_ammucity_01',
        coords = vector4(842.42, -1035.31, 28.19, 358.67),
        gender = 'male'
    },

    -- Little Seoul
    {
        model = 's_m_y_ammucity_01',
        coords = vector4(662.34, -933.61, 21.83, 180.99),
        gender = 'male'
    },

    -- Vinewood Hills
    {
        model = 's_m_y_ammucity_01',
        coords = vector4(253.87, -50.58, 69.94, 67.39),
        gender = 'male'
    },

    -- Palomino Freeway
    {
        model = 's_m_y_ammucity_01',
        coords = vector4(2567.97, 292.64, 108.73, 358.18),
        gender = 'male'
    },

    -- Sandy Shores
    {
        model = 's_m_y_ammucity_01',
        coords = vector4(1692.21, 3760.91, 34.71, 229.39),
        gender = 'male'
    },

    -- Paleto
    {
        model = 's_m_y_ammucity_01',
        coords = vector4(-331.61, 6084.92, 31.45, 226.57),
        gender = 'male'
    },  

	-- Casino Shops --

	-- Chips
	{
		model = 'a_m_y_smartcaspat_01',
		coords = vector4(950.3713, 33.25741, 70.838, 55.42),
		gender = 'male',
		scenario = 'WORLD_HUMAN_GUARD_STAND_CASINO'
	},

	-- Hardware Stores --

	-- South Side
	{
		model = 'mp_m_waremech_01',
		coords = vector4(45.54233, -1748.56, 29.586, 48.71),
		gender = 'male',
		scenario = 'WORLD_HUMAN_CLIPBOARD'
	},
	-- LS Freeway
	{
		model = 'mp_m_waremech_01',
		coords = vector4(2748.02, 3473.83, 55.67, 226.21),
		gender = 'male',
		scenario = 'WORLD_HUMAN_CLIPBOARD'
	},
	-- Paleto
	{
		model = 'mp_m_waremech_01',
		coords = vector4(-421.83, 6136.09, 31.87, 205.39),
		gender = 'male',
		scenario = 'WORLD_HUMAN_CLIPBOARD'
	},
	-- 24/7 Shops --

	-- Grove Street
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(24.5, -1346.63, 29.5, 273.18),
		gender = 'male',
	},
	-- South Side
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-46.86, -1758.22, 29.42, 45.15),
		gender = 'male'
	},
	-- Little Soul
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-706.02, -913.9, 19.22, 86.17),
		gender = 'male'
	},
	-- Carrson Ave
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(372.6, 327.06, 103.57, 258.49),
		gender = 'male'
	},
	-- North Rockford
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-1819.96, 794.04, 138.09, 126.36),
		gender = 'male'
	},
	-- Great Ocean South
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-3039.89, 584.21, 7.91, 16.15),
		gender = 'male'
	},
	-- Barbareno Road
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(-3243.19, 999.94, 12.83, 352.25),
		gender = 'male'
	},
	-- Mirror Park
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1164.72, -323.04, 69.21, 93.92),
		gender = 'male'
	},
	-- Route 68
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(549.24, 2670.37, 42.16, 94.15),
		gender = 'male'
	},
	-- Sandy
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1959.72, 3740.68, 32.34, 297.43),
		gender = 'male'
	},
	-- Grape Seed
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1697.8, 4923.14, 42.06, 321.33),
		gender = 'male'
	},
	-- Great Ocean North
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(1728.33, 6416.21, 35.04, 241.78),
		gender = 'male'
	},
	-- Ls Freeway
	{
		model = 'mp_m_shopkeep_01',
		coords = vector4(2677.32, 3279.69, 55.24, 323.82),
		gender = 'male'
	},   
	-- Hospital
	{
		model = 's_f_y_scrubs_01',
		coords = vector4(308.4648, -595.217, 43.284, 70.26),
		gender = 'male'
	},  
    -- Hospital Palito
    {
		model = 's_f_y_scrubs_01',
		coords = vector4(-256.989, 6327.257, 32.408, 5.526),
		gender = 'male'
	},  

	-- Garages
    {
        model = 'cs_floyd',
        coords = vector4(214.5521, -806.6836, 30.8109, 344.9621), --pilbox garage
        gender = 'male',
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },
    {
        model = 'cs_floyd',
        coords = vector4(-341.9556, -773.9421, 33.9687, 189.1588), -- san andreas
        gender = 'male',
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },
    {
        model = 'cs_floyd',
        coords = vector4(886.0934, -0.9179, 78.7650, 142.2141), -- casino
        gender = 'male',
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },
    {
        model = 'cs_floyd',
        coords = vector4(276.31, -343.51, 44.92, 330.61), -- Pillbox Uppper Parking
        gender = 'male',
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },
    {
        model = 'cs_floyd',
        coords = vector4(68.68, 14.51, 69.07, 338.6), -- Garages
        gender = 'male',
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },

    -- Impound (city)
    {
    model = 'hc_driver', -- Model name as a hash. 
    coords = vector4(-347.142, -128.657, 38.109, 67.93), -- Hawick Ave (X, Y, Z, Heading)
    gender = 'male', -- The gender of the ped, used for the CreatePed native.
    scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Police station --

    -- Armory
    {
        model = 's_f_y_cop_01',
        coords = vector4(480.41,-996.69, 30.69, 86.97), -- MRPD Armoury
        gender = 'male',
        scenario = 'WORLD_HUMAN_COP_IDLES'
    },

    -- Impound (city)
    {
    model = 'ig_floyd', -- Model name as a hash. 
    coords = vector4(490.25, -1319.65, 29.2, 288.97), -- Hawick Ave (X, Y, Z, Heading)
    gender = 'male', -- The gender of the ped, used for the CreatePed native.
    scenario = 'WORLD_HUMAN_AA_COFFEE'
    },

    -- Paleto Duty
    {
    model = 's_m_y_cop_01', -- Model name as a hash. 
    coords = vector4(-448.461, 6012.780, 31.716, 336.2), -- Hawick Ave (X, Y, Z, Heading)
    gender = 'male', -- The gender of the ped, used for the CreatePed native.
    scenario = 'WORLD_HUMAN_AA_COFFEE'
    },

    -- Paleto armoury
    {
    model = 's_f_y_cop_01', -- Model name as a hash. 
    coords = vector4(-436.140, 5999.770, 31.716, 40.87), -- Hawick Ave (X, Y, Z, Heading)
    gender = 'male', -- The gender of the ped, used for the CreatePed native.
    scenario = 'WORLD_HUMAN_AA_COFFEE'
    },

    -- BANK PED'S
    {
        model = 'ig_bankman',
        coords = vector4(241.44, 227.19, 106.29, 170.43),
        gender = 'male', 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        animName = 'cop_b_idle'
    },
    {
        model = 'ig_bankman',
        coords = vector4(313.84, -280.58, 54.16, 338.31), 
        gender = 'male', 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        animName = 'cop_b_idle'
    },
    {
        model = 'ig_bankman', 
        coords = vector4(149.46, -1042.09, 29.37, 335.43), 
        gender = 'male', 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        animName = 'cop_b_idle'
    },
    {
        model = 'ig_bankman', 
        coords = vector4(-351.23, -51.28, 49.04, 341.73), 
        gender = 'male', 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        animName = 'cop_b_idle'
    },
    {
        model = 'ig_bankman', 
        coords = vector4(-1211.9, -331.9, 37.78, 20.07), 
        gender = 'male', 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        animName = 'cop_b_idle'
    },
    {
        model = 'ig_bankman', 
        coords = vector4(-2961.14, 483.09, 15.7, 83.84), 
        gender = 'male', 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        animName = 'cop_b_idle'
    },
    {
        model = 'ig_bankman', 
        coords = vector4(1174.8, 2708.2, 38.09, 178.52), 
        gender = 'male', 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        animName = 'cop_b_idle'
    },
    {
        model = 'ig_bankman', 
        coords = vector4(-112.22, 6471.01, 31.63, 134.18), 
        gender = 'male', 
        animDict = 'anim@heists@prison_heiststation@cop_reactions',
        animName = 'cop_b_idle'
    },
}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

if Config.EnableDefaultOptions then
	Config.ToggleDoor = function(vehicle, door)
		if GetVehicleDoorLockStatus(vehicle) ~= 2 then
			if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
				SetVehicleDoorShut(vehicle, door, false)
			else
				SetVehicleDoorOpen(vehicle, door, false)
			end
		end
	end
end

-------------------------------------------------------------------------------
-- Default options
-------------------------------------------------------------------------------

if Config.EnableDefaultOptions then
	Bones['seat_dside_f'] = {
		options = {
			{
				icon = "fas fa-door-open",
				label = "Toggle front Door",
				canInteract = function(entity)
					return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
				end,
				action = function(entity)
					Config.ToggleDoor(entity, 0)
				end
			},
		},
		distance = 1.2
	}

	Bones['seat_pside_f'] = {
		options = {
			{
				icon = "fas fa-door-open",
				label = "Toggle front Door",
				canInteract = function(entity)
					return GetEntityBoneIndexByName(entity, 'door_pside_f') ~= -1
				end,
				action = function(entity)
					Config.ToggleDoor(entity, 1)
				end
			},
		},
		distance = 1.2
	}

	Bones['seat_dside_r'] = {
		options = {
			{
				icon = "fas fa-door-open",
				label = "Toggle rear Door",
				canInteract = function(entity)
					return GetEntityBoneIndexByName(entity, 'door_dside_r') ~= -1
				end,
				action = function(entity)
					Config.ToggleDoor(entity, 2)
				end
			},
		},
		distance = 1.2
	}

	Bones['seat_pside_r'] = {
		options = {
			{
				icon = "fas fa-door-open",
				label = "Toggle rear Door",
				canInteract = function(entity)
					return GetEntityBoneIndexByName(entity, 'door_pside_r') ~= -1
				end,
				action = function(entity)
					Config.ToggleDoor(entity, 3)
				end
			},
		},
		distance = 1.2
	}

	Bones['bonnet'] = {
		options = {
			{
				icon = "fa-duotone fa-engine",
				label = "Toggle Hood",
				action = function(entity)
					Config.ToggleDoor(entity, 4)
				end
			},
		},
		distance = 0.9
	}
end

-------------------------------------------------------------------------------
return Config, Players, Types, Entities, Models, Zones, Bones, PlayerData
-------------------------------------------------------------------------------
