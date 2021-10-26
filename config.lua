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

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

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

    -- Kapsalon
    {
        model = 'a_f_m_soucent_01', -- Model name as a hash. 
        coords = vector4(135.9377, -1711.68, 28.291, 120.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Kapsalon
    {
        model = 'a_f_y_gencaspat_01', -- Model name as a hash. 
        coords = vector4(-1284.20, -1115.45, 4.9901, 113.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Kapsalon
    {
        model = 'cs_denise', -- Model name as a hash. 
        coords = vector4(-822.784, -183.904, 35.568, 206.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Kapsalon
    {
        model = 's_m_m_hairdress_01', -- Model name as a hash. 
        coords = vector4(-811.222, -185.651, 35.569, 88.44), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Kapsalon
    {
        model = 'a_f_o_ktown_01', -- Model name as a hash. 
        coords = vector4(-31.0871, -151.643, 55.076, 350.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Kapsalon
    {
        model = 'a_f_y_soucent_03', -- Model name as a hash. 
        coords = vector4(1934.439, 3728.405, 30.844, 147.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Bennys City 1
    {
        model = 'a_m_y_latino_01', -- Model name as a hash. 
        coords = vector4(-212.759, -1309.39, 30.287, 341.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Bennys City 2
    {
        model = 'a_m_y_salton_01', -- Model name as a hash. 
        coords = vector4(-211.318, -1309.10, 30.291, 65.31), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Bennys City 3
    {
        model = 'mp_m_waremech_01', -- Model name as a hash. 
        coords = vector4(-211.829, -1308.03, 30.290, 136.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING_POT'
    },

    -- Bennys City 4
    {
        model = 's_m_y_armymech_01', -- Model name as a hash. 
        coords = vector4(-213.368, -1308.19, 30.290, 218.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Bennys City 5
    {
        model = 's_m_y_xmech_02', -- Model name as a hash. 
        coords = vector4(-201.514, -1309.54, 30.2914, 3.795), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_LEANING'
    },

    -- Bennys Palito
    {
        model = 's_m_y_xmech_02', -- Model name as a hash. 
        coords = vector4(112.4977, 6619.634, 31.823, 222.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Bennys Palito
    {
        model = 's_m_y_armymech_01', -- Model name as a hash. 
        coords = vector4(113.3952, 6619.192, 31.850, 64.67), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Kleren City 1
    {
        model = 'a_f_m_bevhills_01', -- Model name as a hash. 
        coords = vector4(73.96094, -1392.59, 28.376, 273.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren City 2
    {
        model = 'a_f_m_bevhills_01', -- Model name as a hash. 
        coords = vector4(427.0431, -806.152, 28.491, 90.09), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren City 3
    {
        model = 'a_f_y_bevhills_04', -- Model name as a hash. 
        coords = vector4(126.9375, -224.306, 53.557, 83.80), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren City 4
    {
        model = 'a_f_y_clubcust_01', -- Model name as a hash. 
        coords = vector4(-164.565, -301.780, 38.733, 252.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren City 5
    {
        model = 'a_f_y_genhot_01', -- Model name as a hash. 
        coords = vector4(-823.076, -1072.31, 10.328, 216.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren City 6
    {
        model = 'a_f_y_hipster_02', -- Model name as a hash. 
        coords = vector4(-1193.97, -767.061, 16.316, 226.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren City 7
    {
        model = 'a_m_m_bevhills_01', -- Model name as a hash. 
        coords = vector4(-708.086, -153.257, 36.415, 112.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren City 8
    {
        model = 'a_m_m_mexcntry_01', -- Model name as a hash. 
        coords = vector4(-1449.63, -238.814, 48.813, 56.85), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren City 9
    {
        model = 'a_m_m_polynesian_01', -- Model name as a hash. 
        coords = vector4(-3169.53, 1042.814, 19.863, 64.34), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren Sandy 1
    {
        model = 'a_m_o_genstreet_01', -- Model name as a hash. 
        coords = vector4(-1102.36, 2711.713, 18.107, 214.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren Sandy 2
    {
        model = 'a_m_o_soucent_01', -- Model name as a hash. 
        coords = vector4(612.9338, 2762.959, 41.088, 269.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren Sandy 3
    {
        model = 'a_m_y_gay_01', -- Model name as a hash. 
        coords = vector4(1197.067, 2711.688, 37.222, 182.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren Sandy 4
    {
        model = 'a_m_y_gay_02', -- Model name as a hash. 
        coords = vector4(1695.493, 4822.088, 41.063, 95.20), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Kleren Palito 1
    {
        model = 'a_m_y_soucent_01', -- Model name as a hash. 
        coords = vector4(5.628123, 6511.193, 30.877, 42.36), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Carwash City 1
    {
        model = 's_m_y_winclean_01', -- Model name as a hash. 
        coords = vector4(170.9022, -1722.91, 28.391, 125.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_JANITOR'
    },

    -- Carwash City 2
    {
        model = 's_m_y_winclean_01', -- Model name as a hash. 
        coords = vector4(35.75711, -1387.86, 28.315, 1.732), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_JANITOR'
    },

    -- Carwash City 3
    {
        model = 's_m_y_winclean_01', -- Model name as a hash. 
        coords = vector4(-697.417, -942.762, 18.357, 100.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_JANITOR'
    },

    -- Carwash Sandy 1
    {
        model = 's_m_y_winclean_01', -- Model name as a hash. 
        coords = vector4(1361.922, 3603.470, 33.953, 202.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_JANITOR'
    },

    -- Carwash Palito 1
    {
        model = 's_m_y_winclean_01', -- Model name as a hash. 
        coords = vector4(-70.2224, 6425.012, 30.439, 37.08), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_JANITOR'
    },

    -- Hotdog Palito
    {
        model = 'u_m_y_burgerdrug_01', -- Model name as a hash. 
        coords = vector4(41.98967, -1005.64, 28.287, 339.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Hotdog Palito
    {
        model = 'u_f_y_beth', -- Model name as a hash. 
        coords = vector4(43.83732, -1005.50, 29.287, 333.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- KFC City 1
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(183.7803, -1454.03, 28.130, 238.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'PROP_HUMAN_BBQ'
    },

    -- KFC City 2
    {
        model = 's_m_y_chef_01', -- Model name as a hash. 
        coords = vector4(188.1583, -1448.83, 28.130, 230.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- KFC City 3
    {
        model = 'u_m_y_burgerdrug_01', -- Model name as a hash. 
        coords = vector4(175.5029, -1447.02, 28.130, 48.87), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- KFC City 4
    {
        model = 'u_m_y_burgerdrug_01', -- Model name as a hash. 
        coords = vector4(178.6793, -1450.85, 28.130, 54.71), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Taco City
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(9.509819, -1604.97, 28.371, 226.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Pizzeria City
    {
        model = 's_m_y_chef_01', -- Model name as a hash. 
        coords = vector4(282.8589, -973.496, 28.433, 83.01), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'PROP_HUMAN_BBQ'
    },

    -- Pizzeria City
    {
        model = 'ig_roccopelosi', -- Model name as a hash. 
        coords = vector4(289.3381, -980.625, 28.433, 149.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_LEANING'
    },

    -- Bean Machine City
    {
        model = 'a_f_y_bevhills_02', -- Model name as a hash. 
        coords = vector4(-634.993, 235.1399, 80.881, 269.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Split Sides Comedy
    {
        model = 'a_f_y_bevhills_03', -- Model name as a hash. 
        coords = vector4(-434.345, 274.0298, 82.422, 81.25), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Split Sides Comedy
    {
        model = 'csb_djblamadon', -- Model name as a hash. 
        coords = vector4(-442.347, 279.6195, 82.022, 171.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Split Sides Comedy
    {
        model = 'u_m_y_mani', -- Model name as a hash. 
        coords = vector4(-451.911, 271.4347, 82.623, 249.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_MUSICIAN'
    },

    -- Split Sides Comedy
    {
        model = 's_m_m_mariachi_01', -- Model name as a hash. 
        coords = vector4(-452.596, 273.0269, 82.623, 308.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_MUSICIAN'
    },

    -- Split Sides Comedy
    {
        model = 's_m_m_mariachi_01', -- Model name as a hash. 
        coords = vector4(-452.665, 269.6605, 82.623, 219.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_MUSICIAN'
    },

    -- Split Sides Comedy
    {
        model = 'a_f_y_vinewood_04', -- Model name as a hash. 
        coords = vector4(-437.653, 274.4372, 82.422, 26.72), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_TOURIST_MOBILE'
    },

    -- Split Sides Comedy
    {
        model = 'a_f_y_smartcaspat_01', -- Model name as a hash. 
        coords = vector4(-449.299, 265.7165, 82.022, 43.33), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Split Sides Comedy
    {
        model = 's_m_y_doorman_01', -- Model name as a hash. 
        coords = vector4(-427.731, 260.6364, 82.035, 183.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_STAND'
    },

    -- Tequi-la-la
    {
        model = 'ig_ashley', -- Model name as a hash. 
        coords = vector4(-561.812, 286.8063, 81.176, 271.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Tequi-la-la
    {
        model = 'ig_lacey_jones_02', -- Model name as a hash. 
        coords = vector4(-551.780, 284.1249, 81.976, 96.22), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Tequi-la-la
    {
        model = 'ig_kerrymcintosh', -- Model name as a hash. 
        coords = vector4(-555.430, 284.2690, 81.176, 283.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'
    },

    -- Tequi-la-la
    {
        model = 'ig_mp_agent14', -- Model name as a hash. 
        coords = vector4(-555.651, 288.5875, 81.176, 261.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Tequi-la-la
    {
        model = 'ig_bride', -- Model name as a hash. 
        coords = vector4(-554.333, 287.8311, 81.176, 58.89), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Tequi-la-la
    {
        model = 'a_m_m_mlcrisis_01', -- Model name as a hash. 
        coords = vector4(-564.171, 279.5989, 81.976, 165.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Fruitkraam City
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(148.7122, 1670.697, 227.65, 159.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Fruitkraam Sandy
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(1262.776, 3546.524, 34.138, 177.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Fruitkraam Sandy 2
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(1477.823, 2722.810, 36.604, 24.17), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Fruitkraam Sandy 3
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(2474.093, 4445.073, 34.418, 269.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Fruitkraam Palito 1
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(1087.537, 6510.363, 20.059, 185.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Pops Diner
    {
        model = 'a_m_m_hillbilly_01', -- Model name as a hash. 
        coords = vector4(1593.884, 6454.404, 25.013, 143.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Pops Diner
    {
        model = 'a_f_m_eastsa_01', -- Model name as a hash. 
        coords = vector4(1588.718, 6456.754, 25.013, 166.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- City Hall Sandy
    {
        model = 'a_f_m_business_02', -- Model name as a hash. 
        coords = vector4(1699.461, 3785.008, 33.766, 211.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Liquor Sandy
    {
        model = 's_f_y_shop_low', -- Model name as a hash. 
        coords = vector4(1391.795, 3606.031, 34.980, 200.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Liquor Sandy
    {
        model = 's_m_y_doorman_01', -- Model name as a hash. 
        coords = vector4(1395.061, 3608.847, 33.980, 101.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_LEANING'
    },

    -- Yacht Shop Palito
    {
        model = 'cs_terry', -- Model name as a hash. 
        coords = vector4(-673.791, 5837.194, 16.340, 133.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Motel Palito
    {
        model = 's_f_m_maid_01', -- Model name as a hash. 
        coords = vector4(-707.083, 5769.288, 16.511, 326.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- McDonald's Palito
    {
        model = 'csb_burgerdrug', -- Model name as a hash. 
        coords = vector4(-400.162, 6070.484, 30.500, 89.57), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- McDonald's Palito
    {
        model = 's_m_y_chef_01', -- Model name as a hash. 
        coords = vector4(-392.592, 6070.261, 30.500, 217.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'PROP_HUMAN_BBQ'
    },

    -- McDonald's Palito
    {
        model = 'csb_burgerdrug', -- Model name as a hash. 
        coords = vector4(-397.091, 6070.384, 30.500, 85.50), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- McDonald's Palito
    {
        model = 's_f_m_maid_01', -- Model name as a hash. 
        coords = vector4(-405.976, 6075.617, 30.500, 232.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_JANITOR'
    },

    -- Fitness Palito
    {
        model = 'a_f_y_fitness_01', -- Model name as a hash. 
        coords = vector4(-373.521, 6053.154, 30.452, 149.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Fitness Palito
    {
        model = 'a_f_y_fitness_02', -- Model name as a hash. 
        coords = vector4(-372.921, 6044.191, 30.475, 322.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Fitness Palito
    {
        model = 'a_m_y_musclbeac_01', -- Model name as a hash. 
        coords = vector4(-378.555, 6047.296, 30.480, 82.73), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SIT_UPS'
    },

    -- Mojito Bar Palito
    {
        model = 'cs_tanisha', -- Model name as a hash. 
        coords = vector4(-115.196, 6388.015, 31.180, 35.85), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Mojito Bar Palito
    {
        model = 'csb_anita', -- Model name as a hash. 
        coords = vector4(-115.782, 6382.985, 31.180, 315.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Mojito Bar Palito
    {
        model = 'mp_f_chbar_01', -- Model name as a hash. 
        coords = vector4(-124.725, 6380.183, 31.379, 316.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Mojito Bar Palito
    {
        model = 'mp_m_weapexp_01', -- Model name as a hash. 
        coords = vector4(-123.553, 6375.997, 31.379, 33.91), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_LEANING'
    },

    -- Mojito Bar Palito
    {
        model = 's_f_y_shop_low', -- Model name as a hash. 
        coords = vector4(-122.201, 6383.205, 31.180, 94.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Mojito Bar Palito
    {
        model = 's_m_y_strvend_01', -- Model name as a hash. 
        coords = vector4(-121.480, 6381.897, 31.180, 95.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Mojito Bar Palito
    {
        model = 's_m_m_bouncer_01', -- Model name as a hash. 
        coords = vector4(-112.428, 6395.459, 31.180, 128.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_LEANING_CASINO_TERRACE'
    },

    -- Motor Club Palito
    {
        model = 'ig_terry', -- Model name as a hash. 
        coords = vector4(-20.9814, 6480.743, 30.493, 137.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING_CLUBHOUSE'
    },

    -- Motor Club Palito
    {
        model = 'ig_natalia', -- Model name as a hash. 
        coords = vector4(-26.2044, 6483.552, 30.501, 233.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_LEANING'
    },

    -- 24/7 Shop Palito
    {
        model = 's_f_y_shop_mid', -- Model name as a hash. 
        coords = vector4(-160.864, 6321.077, 30.586, 312.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    },

    -- Firestation Palito
    {
        model = 'u_m_m_vince', -- Model name as a hash. 
        coords = vector4(-370.403, 6110.292, 35.523, 40.73), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Firestation Palito
    {
        model = 's_m_y_fireman_01', -- Model name as a hash. 
        coords = vector4(-366.674, 6130.023, 30.440, 128.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Firestation Palito
    {
        model = 's_m_y_fireman_01', -- Model name as a hash. 
        coords = vector4(-367.048, 6129.081, 30.440, 15.55), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    },

    -- Vanilla Unicorn City
    {
        model = 'g_f_y_lost_01', -- Model name as a hash. 
        coords = vector4(129.0652, -1283.33, 28.273, 124.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Vanilla Unicorn City
    {
        model = 'csb_stripper_01', -- Model name as a hash. 
        coords = vector4(123.4446, -1294.81, 28.269, 18.94), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'
    },

    -- Vanilla Unicorn City
    {
        model = 'csb_stripper_02', -- Model name as a hash. 
        coords = vector4(119.9634, -1296.64, 28.269, 25.30), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PROSTITUTE_LOW_CLASS'
    },

    -- Vanilla Unicorn City
    {
        model = 'mp_f_stripperlite', -- Model name as a hash. 
        coords = vector4(113.4033, -1288.03, 27.458, 299.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'
    },

    -- Vanilla Unicorn City
    {
        model = 's_f_y_stripper_01', -- Model name as a hash. 
        coords = vector4(111.9986, -1286.04, 27.458, 300.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'
    },

    -- Vanilla Unicorn City
    {
        model = 'u_m_y_dancerave_01', -- Model name as a hash. 
        coords = vector4(104.3691, -1294.96, 28.258, 354.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PROSTITUTE_LOW_CLASS'
    },

    -- Vanilla Unicorn City
    {
        model = 'u_f_y_dancerave_01', -- Model name as a hash. 
        coords = vector4(101.8776, -1290.97, 28.258, 249.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PROSTITUTE_LOW_CLASS'
    },

    -- Vanilla Unicorn City
    {
        model = 'cs_lestercrest', -- Model name as a hash. 
        coords = vector4(114.8361, -1285.98, 27.258, 122.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STRIP_WATCH_STAND'
    },

    -- Vanilla Unicorn City
    {
        model = 's_m_m_bouncer_01', -- Model name as a hash. 
        coords = vector4(127.7900, -1299.73, 28.233, 227.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_PATROL'
    },

    -- Apple Store City
    {
        model = 'a_f_y_soucent_01', -- Model name as a hash. 
        coords = vector4(148.8922, -234.587, 53.424, 343.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Apple Store City
    {
        model = 'a_m_m_prolhost_01', -- Model name as a hash. 
        coords = vector4(159.2022, -229.665, 53.424, 56.18), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_STAND_FACILITY'
    },

    -- Apple Store City
    {
        model = 'cs_taocheng', -- Model name as a hash. 
        coords = vector4(160.5667, -220.361, 53.298, 130.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_WINDOW_SHOP_BROWSE'
    },

    -- Stadhuis City
    {
        model = 'a_f_m_business_02', -- Model name as a hash. 
        coords = vector4(-554.964, -184.219, 37.280, 14.41), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Stadhuis City
    {
        model = 'cs_molly', -- Model name as a hash. 
        coords = vector4(-555.937, -184.840, 37.280, 309.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_IMPATIENT'
    },

    -- Stadhuis City
    {
        model = 's_m_y_doorman_01', -- Model name as a hash. 
        coords = vector4(-546.794, -206.652, 37.218, 209.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_STAND_FACILITY'
    },

    -- Stadhuis City
    {
        model = 's_m_y_doorman_01', -- Model name as a hash. 
        coords = vector4(-542.398, -204.048, 37.215, 198.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_STAND_FACILITY'
    },

    -- Blokkenpark City
    {
        model = 's_f_y_shop_low', -- Model name as a hash. 
        coords = vector4(228.4995, -907.389, 30.119, 62.61), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Blokkenpark City
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(222.0549, -915.929, 30.303, 64.55), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Blokkenpark City
    {
        model = 's_m_m_lathandy_01', -- Model name as a hash. 
        coords = vector4(211.5953, -927.951, 29.692, 221.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_HAMMERING'
    },

    -- Blokkenpark City
    {
        model = 's_m_y_dealer_01', -- Model name as a hash. 
        coords = vector4(210.3697, -927.012, 29.692, 220.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'PROP_HUMAN_STAND_IMPATIENT'
    },

    -- Blokkenpark City
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(188.3214, -918.962, 30.434, 322.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Blokkenpark City
    {
        model = 'a_f_y_skater_01', -- Model name as a hash. 
        coords = vector4(178.2817, -905.164, 32.055, 294.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PICNIC'
    },

    -- Blokkenpark City
    {
        model = 'a_f_y_skater_01', -- Model name as a hash. 
        coords = vector4(187.9675, -901.252, 30.178, 171.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_CHEERING'
    },

    -- Blokkenpark City
    {
        model = 'a_m_y_skater_01', -- Model name as a hash. 
        coords = vector4(188.6176, -902.751, 30.179, 24.30), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Blokkenpark City
    {
        model = 'a_m_y_skater_02', -- Model name as a hash. 
        coords = vector4(193.4164, -908.376, 30.854, 17.54), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PAPARAZZI'
    },

    -- Blokkenpark City
    {
        model = 'a_f_y_fitness_01', -- Model name as a hash. 
        coords = vector4(175.8383, -940.963, 29.109, 1.701), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Blokkenpark City
    {
        model = 'a_f_m_fatwhite_01', -- Model name as a hash. 
        coords = vector4(172.5944, -936.936, 29.109, 192.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Blokkenpark City
    {
        model = 'a_f_o_ktown_01', -- Model name as a hash. 
        coords = vector4(176.7937, -936.438, 29.109, 180.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Blokkenpark City
    {
        model = 'a_f_y_eastsa_01', -- Model name as a hash. 
        coords = vector4(178.7410, -933.258, 29.109, 173.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Blokkenpark City
    {
        model = 'a_f_y_yoga_01', -- Model name as a hash. 
        coords = vector4(174.1969, -932.941, 29.109, 176.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Blokkenpark City
    {
        model = 'a_m_m_fatlatin_01', -- Model name as a hash. 
        coords = vector4(174.3397, -935.950, 29.112, 190.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Blokkenpark City
    {
        model = 'a_m_m_genfat_01', -- Model name as a hash. 
        coords = vector4(179.0584, -935.411, 29.112, 177.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Blokkenpark City
    {
        model = 'a_m_o_genstreet_01', -- Model name as a hash. 
        coords = vector4(176.5561, -933.065, 29.112, 183.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_YOGA'
    },

    -- Blokkenpark City
    {
        model = 'cs_nervousron', -- Model name as a hash. 
        coords = vector4(172.3592, -933.053, 29.112, 179.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_SLUMPED'
    },

    -- Blokkenpark City
    {
        model = 's_m_m_gardener_01', -- Model name as a hash. 
        coords = vector4(174.4920, -974.228, 29.751, 261.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GARDENER_LEAF_BLOWER'
    },

    -- Blokkenpark City
    {
        model = 's_m_m_gardener_01', -- Model name as a hash. 
        coords = vector4(183.9589, -987.726, 29.091, 11.89), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_JANITOR'
    },

    -- Blokkenpark City
    {
        model = 's_m_m_gardener_01', -- Model name as a hash. 
        coords = vector4(196.4462, -937.138, 29.701, 295.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GARDENER_PLANT'
    },

    -- Blokkenpark City
    {
        model = 's_m_m_gardener_01', -- Model name as a hash. 
        coords = vector4(205.7406, -918.730, 29.692, 334.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Blokkenpark City
    {
        model = 'a_f_m_fatbla_01', -- Model name as a hash. 
        coords = vector4(205.1418, -875.669, 31.122, 327.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_TOURIST_MAP'
    },

    -- Blokkenpark City
    {
        model = 'a_f_y_epsilon_01', -- Model name as a hash. 
        coords = vector4(205.0697, -877.261, 31.122, 322.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT'
    },

    -- Blokkenpark City
    {
        model = 'a_f_y_indian_01', -- Model name as a hash. 
        coords = vector4(222.2328, -912.839, 29.692, 269.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING_POT'
    },

    -- Blokkenpark City
    {
        model = 'a_f_y_indian_01', -- Model name as a hash. 
        coords = vector4(222.7112, -913.894, 29.692, 1.241), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING_POT'
    },

    -- Apotheek Prik
    {
        model = 'cs_zimbor', -- Model name as a hash. 
        coords = vector4(318.4893, -1078.39, 28.478, 357.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Apotheek Prik
    {
        model = 'u_f_y_corpse_01', -- Model name as a hash. 
        coords = vector4(326.8047, -1078.23, 28.481, 185.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    },

    -- Straatbende
    {
        model = 's_m_y_dealer_01', -- Model name as a hash. 
        coords = vector4(315.8828, -1093.63, 28.401, 85.48), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_LEANING'
    },

    -- Straatbende
    {
        model = 'a_m_y_latino_01', -- Model name as a hash. 
        coords = vector4(315.1950, -1092.56, 28.401, 228.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRUG_DEALER'
    },

    -- Straatbende
    {
        model = 'csb_chin_goon', -- Model name as a hash. 
        coords = vector4(315.3396, -1094.51, 28.401, 311.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRUG_DEALER'
    },

    -- Straatbende
    {
        model = 'a_m_m_tramp_01', -- Model name as a hash. 
        coords = vector4(314.8370, -1089.56, 28.401, 272.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_SLUMPED'
    },

    -- Straatbende
    {
        model = 'a_f_o_indian_01', -- Model name as a hash. 
        coords = vector4(245.7658, -814.412, 29.164, 142.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PICNIC'
    },

    -- Straatbende
    {
        model = 'a_f_y_indian_01', -- Model name as a hash. 
        coords = vector4(243.9526, -815.628, 29.185, 278.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PICNIC'
    },


    -- Straatbende
    {
        model = 'a_m_m_indian_01', -- Model name as a hash. 
        coords = vector4(245.4410, -816.565, 29.133, 356.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PICNIC'
    },


    -- Straatbende
    {
        model = 'a_m_y_indian_01', -- Model name as a hash. 
        coords = vector4(218.5871, -864.428, 29.272, 314.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING_POT'
    },

    -- Straatbende
    {
        model = 'a_m_y_indian_01', -- Model name as a hash. 
        coords = vector4(218.1487, -862.796, 29.281, 216.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING_POT'
    },

    -- Rechtbank
    {
        model = 's_m_m_security_01', -- Model name as a hash. 
        coords = vector4(239.1305, -1077.63, 29.294, 278.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- Rechtbank
    {
        model = 'a_f_y_business_02', -- Model name as a hash. 
        coords = vector4(243.4282, -1092.33, 29.294, 352.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Rechtbank
    {
        model = 'mp_m_securoguard_01', -- Model name as a hash. 
        coords = vector4(259.2331, -1105.80, 29.294, 79.49), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_STAND'
    },

    -- Blokkenpark Bar
    {
        model = 's_m_y_barman_01', -- Model name as a hash. 
        coords = vector4(125.4516, -1036.00, 28.277, 66.56), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Blokkenpark Bar
    {
        model = 's_f_y_clubbar_01', -- Model name as a hash. 
        coords = vector4(122.3978, -1037.75, 28.277, 314.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Blokkenpark Bar
    {
        model = 's_m_y_barman_01', -- Model name as a hash. 
        coords = vector4(130.0805, -1054.60, 21.960, 343.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Blokkenpark Bar
    {
        model = 's_m_y_chef_01', -- Model name as a hash. 
        coords = vector4(143.4767, -1055.71, 21.960, 65.61), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'PROP_HUMAN_BUM_BIN'
    },

    -- Blokkenpark Bar
    {
        model = 's_m_y_chef_01', -- Model name as a hash. 
        coords = vector4(147.5283, -1057.85, 21.960, 250.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Car Dealer City
    {
        model = 'mp_f_execpa_02', -- Model name as a hash. 
        coords = vector4(-55.6255, -1098.09, 25.422, 335.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Car Dealer City
    {
        model = 'mp_m_waremech_01', -- Model name as a hash. 
        coords = vector4(-36.5584, -1086.71, 25.422, 249.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_LEANING'
    },

    -- Car Dealer City
    {
        model = 'mp_m_waremech_01', -- Model name as a hash. 
        coords = vector4(-35.2099, -1087.36, 25.422, 82.37), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Hotdogstand 1
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(-1683.27, -1124.64, 12.152, 101.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Hotdogstand 2
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(-1720.27, -1104.14, 12.017, 37.89), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Hotdogstand 3
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(-1638.12, -1083.24, 12.076, 248.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Hamburgerstand 1
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(-1692.09, -1136.00, 12.155, 7.067), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING'
    },

    -- Kermis 1
    {
        model = 's_m_y_clown_01', -- Model name as a hash. 
        coords = vector4(-1705.88, -1091.48, 12.152, 26.13), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_MUSICIAN'
    },

    -- Kermis 2
    {
        model = 's_m_y_mime', -- Model name as a hash. 
        coords = vector4(-1704.79, -1089.84, 12.174, 91.85), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_HUMAN_STATUE'
    },

    -- Kermis 3
    {
        model = 'a_f_y_genhot_01', -- Model name as a hash. 
        coords = vector4(-1708.79, -1088.36, 12.023, 220.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_HANG_OUT_STREET'
    },

    -- Kermis 4
    {
        model = 'a_m_y_genstreet_01', -- Model name as a hash. 
        coords = vector4(-1709.55, -1088.91, 12.017, 236.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_TOURIST_MOBILE'
    },

    -- Kermis 5
    {
        model = 'a_m_y_ktown_02', -- Model name as a hash. 
        coords = vector4(-1708.15, -1087.92, 12.149, 174.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_HANG_OUT_STREET'
    },

    -- Kermis 6
    {
        model = 'u_m_y_pogo_01', -- Model name as a hash. 
        coords = vector4(-1611.53, -1048.48, 12.097, 273.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Kermis 7
    {
        model = 'u_m_y_rsranger_01', -- Model name as a hash. 
        coords = vector4(-1610.32, -1049.88, 12.078, 292.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SUPERHERO'
    },

    -- Kermis 8
    {
        model = 'u_m_y_juggernaut_01', -- Model name as a hash. 
        coords = vector4(-1609.47, -1046.56, 12.094, 230.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PROSTITUTE_HIGH_CLASS'
    },

    -- Kermis 9
    {
        model = 'u_f_y_lauren', -- Model name as a hash. 
        coords = vector4(-1605.59, -1047.09, 12.059, 121.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_MOBILE_FILM_SHOCKING'
    },

    -- Kermis 10
    {
        model = 'u_f_y_taylor', -- Model name as a hash. 
        coords = vector4(-1607.09, -1046.10, 12.078, 124.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_CHEERING'
    },

    -- Kermis 11
    {
        model = 'u_m_o_tramp_01', -- Model name as a hash. 
        coords = vector4(-1604.55, -1058.15, 12.017, 32.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STUPOR'
    },

    -- Kermis 12
    {
        model = 'a_c_retriever', -- Model name as a hash. 
        coords = vector4(-1603.39, -1057.69, 12.017, 21.33), -- Hawick Ave (X, Y, Z, Heading)
        scenario = 'WORLD_DOG_BARKING_RETRIEVER'
    },

    -- General shop 1
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(-1686.83, -1103.92, 12.585, 147.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- General shop 2
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(-1679.18, -1110.68, 12.770, 142.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- General shop 3
    {
        model = 's_f_y_sweatshop_01', -- Model name as a hash. 
        coords = vector4(-1645.37, -1102.27, 12.451, 323.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- General shop 4
    {
        model = 's_f_y_shop_low', -- Model name as a hash. 
        coords = vector4(-1636.82, -1092.09, 12.576, 313.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- ISLAND

    -- Island Festival 1
    {
        model = 'a_f_y_beach_01', -- Model name as a hash. 
        coords = vector4(4903.175, -4942.96, 3.3950, 60.92), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Island Festival 2
    {
        model = 'a_m_y_beach_02', -- Model name as a hash. 
        coords = vector4(4905.878, -4944.21, 3.3767, 229.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Island Festival 3
    {
        model = 'a_f_m_beach_01', -- Model name as a hash. 
        coords = vector4(4906.425, -4940.89, 3.3837, 9.936), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STAND_MOBILE'
    },

    -- Island Festival 4
    {
        model = 'u_f_y_danceburl_01', -- Model name as a hash. 
        coords = vector4(4877.317, -4921.37, 2.8017, 278.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SUNBATHE'
    },

    -- Island Festival 5
    {
        model = 'u_m_y_danceburl_01', -- Model name as a hash. 
        coords = vector4(4877.074, -4922.65, 2.8017, 276.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SUNBATHE_BACK'
    },

    -- Island Festival 6
    {
        model = 'a_f_m_beach_01', -- Model name as a hash. 
        coords = vector4(4871.417, -4936.39, 1.7803, 71.84), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SUNBATHE'
    },

    -- Island Festival 7
    {
        model = 'a_m_y_beach_01', -- Model name as a hash. 
        coords = vector4(4870.531, -4937.44, 1.7009, 63.69), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SUNBATHE'
    },

    -- Island Festival 8
    {
        model = 's_m_y_baywatch_01', -- Model name as a hash. 
        coords = vector4(4855.368, -4955.15, 0.5023, 23.69), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BINOCULARS'
    },

    -- Island Festival 9
    {
        model = 's_f_y_baywatch_01', -- Model name as a hash. 
        coords = vector4(4836.689, -4905.75, 1.0411, 147.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PICNIC'
    },

    -- Island Festival 8
    {
        model = 'csb_porndudes', -- Model name as a hash. 
        coords = vector4(4873.115, -4914.53, 2.0009, 280.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SUNBATHE_BACK'
    },

    -- Island Festival 9
    {
        model = 'a_f_y_smartcaspat_01', -- Model name as a hash. 
        coords = vector4(4897.582, -4921.55, 2.3727, 116.07), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Island Festival 10
    {
        model = 'a_f_y_clubcust_01', -- Model name as a hash. 
        coords = vector4(4897.259, -4922.57, 2.3697, 341.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Island Festival 11
    {
        model = 'ig_bride', -- Model name as a hash. 
        coords = vector4(4896.297, -4921.01, 2.3677, 243.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_CHEERING'
    },

    -- Island Festival 12
    {
        model = 'cs_milton', -- Model name as a hash. 
        coords = vector4(4891.881, -4933.79, 2.3688, 355.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Island Festival 13
    {
        model = 'cs_barry', -- Model name as a hash. 
        coords = vector4(4890.889, -4932.62, 2.3690, 177.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_SMOKING_POT'
    },

    -- Island Festival 12
    {
        model = 'a_m_y_smartcaspat_01', -- Model name as a hash. 
        coords = vector4(4888.755, -4924.40, 2.3696, 326.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Island Festival 13
    {
        model = 'a_f_y_bevhills_01', -- Model name as a hash. 
        coords = vector4(4890.217, -4925.00, 2.3674, 8.987), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },

    -- Island Festival DJ
    {
        model = 'u_m_m_jesus_01', -- Model name as a hash. 
        coords = vector4(4893.459, -4905.36, 2.4866, 198.987), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_MUSICIAN'
    },

    -- Island Festival Guard
    {
        model = 's_m_y_doorman_01', -- Model name as a hash. 
        coords = vector4(4897.969, -4907.53, 2.3652, 173.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_PATROL'
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

-- These options don't represent the actual way of making TargetBones or filling out Config.TargetBones, refer to the TEMPLATES.md for a template on that, this is only the way to add it without affecting the config table

if Config.EnableDefaultOptions then
	Bones['seat_dside_f'] = {
		["Toggle Front Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Front Door",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 0)
			end,
			distance = 1.2
		}
	}

	Bones['seat_pside_f'] = {
		["Toggle Front Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Front Door",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'door_pside_f') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 1)
			end,
			distance = 1.2
		}
	}

	Bones['seat_dside_r'] = {
		["Toggle Rear Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Rear Door",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'door_dside_r') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 2)
			end,
			distance = 1.2
		}
	}

	Bones['seat_pside_r'] = {
		["Toggle Rear Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Rear Door",
			canInteract = function(entity)
				return GetEntityBoneIndexByName(entity, 'door_pside_r') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 3)
			end,
			distance = 1.2
		}
	}

	Bones['bonnet'] = {
		["Toggle Hood"] = {
			icon = "fa-duotone fa-engine",
			label = "Toggle Hood",
			action = function(entity)
				Config.ToggleDoor(entity, 4)
			end,
			distance = 0.9
		}
	}
end

-------------------------------------------------------------------------------
return Config, Players, Types, Entities, Models, Zones, Bones, PlayerData
-------------------------------------------------------------------------------
