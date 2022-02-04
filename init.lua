function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 5.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target
Config.OpenKey = 'LMENU' -- Left Alt
Config.OpenControlKey = 19 -- Control for keypress detection also Left Alt for the eye itself, controls are found here https://docs.fivem.net/docs/game-references/controls/

-- Key to open the menu
Config.MenuControlKey = 238 -- Control for keypress detection on the context menu, this is the Right Mouse Button, controls are found here https://docs.fivem.net/docs/game-references/controls/

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
    -- CQC-Mugshot
    ['CQCMugshot'] = {
        name = 'CQCMugshot',
        coords = vector3(-556.26, -132.99, 33.75),
        debugPoly = false,
        length = 0.50,
        width = 0.65,
        heading = 131.24,
        maxZ = 34.30,
        minZ = 33.75,
        options = {
            {
                icon = 'fas fa-camera',
                label = 'Take Suspects Mugshots',
                job = {
                    ['police'] = 0,
                    ['sast'] = 0,
                },
                event = 'cqc-mugshot:client:takemugshot',
                type = 'client'
            },
        },
        distance = 2.0,
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
    ["qb-slots"] = {
		models = {
			`ch_prop_casino_slot_01a`,
			`ch_prop_casino_slot_02a`,
			`ch_prop_casino_slot_03a`,
			`ch_prop_casino_slot_04a`,
			`ch_prop_casino_slot_04b`,
			`ch_prop_casino_slot_05a`,
			`ch_prop_casino_slot_06a`,
			`ch_prop_casino_slot_07a`,
			`ch_prop_casino_slot_08a`,
			`vw_prop_casino_slot_01a`,
			`vw_prop_casino_slot_02a`,
			`vw_prop_casino_slot_03a`,
			`vw_prop_casino_slot_04a`,
			`vw_prop_casino_slot_05a`,
			`vw_prop_casino_slot_06a`,
			`vw_prop_casino_slot_07a`,
			`vw_prop_casino_slot_08a`,
		},
		options = {
			{
				type = "client",
				event = "qb-slots:enterBets",
				icon = "fa-solid fa-slot-machine",
				label = "Play Slot Machine",
			},
		},
		distance = 2.5,
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

    -- GABZ - ARCADE
    {
        model = 'csb_anita', -- Model name as a hash. 
        coords = vector4(-1658.55, -1061.94, 12.160, 233.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },

    -- GABZ - ARCADE
    {
        model = 'csb_sol', -- Model name as a hash. 
        coords = vector4(-1653.99, -1061.87, 12.160, 135.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },
    
    -- GABZ - BOWLING
    {
        model = 's_f_y_clubbar_01', -- Model name as a hash. 
        coords = vector4(756.3672, -774.667, 26.337, 88.20), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },    

    -- GABZ - BOWLING
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(756.5151, -767.988, 26.337, 89.80), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },  
    
    -- GABZ - BOWLING
    {
        model = 'ig_dix', -- Model name as a hash. 
        coords = vector4(756.8413, -779.857, 26.337, 0.701), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },  
    
    -- GABZ - UWU CAFE
    {
        model = 'a_f_y_bevhills_02', -- Model name as a hash. 
        coords = vector4(-584.799, -1060.50, 22.344, 280.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },  
    
    -- UWU CAFE
    {
        model = 'a_f_y_indian_01', -- Model name as a hash. 
        coords = vector4(-584.577, -1064.51, 22.344, 265.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },  
    
    -- UWU CAFE
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(-588.583, -1059.64, 22.356, 268.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },  
    
    -- GABZ - DAVIS POLICE DEPARTMENT
    {
        model = 's_f_y_cop_01', -- Model name as a hash. 
        coords = vector4(382.4777, -1596.81, 30.051, 50.35), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },  
    
    -- GABZ - DAVIS POLICE DEPARTMENT
    {
        model = 's_m_y_cop_01', -- Model name as a hash. 
        coords = vector4(368.8227, -1604.95, 30.051, 332.2), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_STAND'
    },  
    
    -- GABZ - POP'S DINER
    {
        model = 'u_m_y_burgerdrug_01', -- Model name as a hash. 
        coords = vector4(1593.579, 6454.587, 26.014, 155.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },  
    
    -- GABZ - POP'S DINER
    {
        model = 'u_f_m_debbie_01', -- Model name as a hash. 
        coords = vector4(1588.706, 6456.757, 26.014, 158.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    },
    
    -- GABZ - EAST SIDE BALLAS LTD GASOLINE 
    {
        model = 'mp_m_shopkeep_01', -- Model name as a hash. 
        coords = vector4(-47.0242, -1758.35, 29.421, 51.35), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    },

    -- GABZ - FIRE STATION (1 LOCATIONS)
    {
        model = 'mp_f_boatstaff_01', -- Model name as a hash. 
        coords = vector4(1186.537, -1468.61, 34.857, 11.06), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },
    
    -- GABZ - FIRE STATION (1 LOCATIONS)
    {
        model = 's_m_y_fireman_01', -- Model name as a hash. 
        coords = vector4(1190.185, -1462.56, 34.896, 318.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },
    
    -- GABZ - FIRE STATION (1 LOCATIONS)
    {
        model = 's_m_y_fireman_01', -- Model name as a hash. 
        coords = vector4(1190.026, -1460.82, 34.881, 225.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },
    
    -- GABZ - FIRE STATION (2 LOCATIONS)
    {
        model = 'mp_f_boatstaff_01', -- Model name as a hash. 
        coords =vector4(197.9233, -1638.51, 29.800, 330.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },
    
    -- GABZ - FIRE STATION (2 LOCATIONS)
    {
        model = 's_m_y_fireman_01', -- Model name as a hash. 
        coords = vector4(223.5240, -1646.28, 29.786, 15.84), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },
    
    -- GABZ - FIRE STATION (2 LOCATIONS)
    {
        model = 's_m_y_fireman_01', -- Model name as a hash. 
        coords = vector4(222.5586, -1645.02, 29.783, 229.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },

    -- GABZ - HARMONY REPAIR
    {
        model = 'mp_f_bennymech_01', -- Model name as a hash. 
        coords = vector4(1187.371, 2650.055, 37.835, 52.92), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },
    
    -- GABZ - HATERS SHOP
    {
        model = 's_f_y_clubbar_01', -- Model name as a hash. 
        coords = vector4(-1127.32, -1439.27, 5.2283, 299.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },
    
    -- GABZ - HATERS SHOP
    {
        model = 'csb_fos_rep', -- Model name as a hash. 
        coords = vector4(-1121.13, -1436.73, 5.2283, 140.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_MUSICIAN'
    },
    
    --  GABZ - HAYES AUTO
    {
        model = 's_m_y_xmech_01', -- Model name as a hash. 
        coords = vector4(-1429.64, -455.003, 35.909, 28.54), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },
    
    --  GABZ - HAYES AUTO
    {
        model = 's_m_y_xmech_02', -- Model name as a hash. 
        coords = vector4(-1414.74, -451.330, 35.909, 97.47), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },
    
    -- GABZ - NEW HUB
    {
        model = 's_m_y_xmech_02', -- Model name as a hash. 
        coords = vector4(-47.9135, -1048.01, 28.141, 82.12), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },
    
    -- GABZ - IMPORT GARAGE
    {
        model = 's_m_y_xmech_02', -- Model name as a hash. 
        coords = vector4(938.6456, -987.720, 38.492, 167.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },    

    --  GABZ - LOST MC
    {
        model = 'g_f_y_lost_01', -- Model name as a hash. 
        coords = vector4(951.4368, -135.944, 74.460, 202.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    }, 
    
    -- GABZ - LOST MC
    {
        model = 'g_m_y_lost_02', -- Model name as a hash. 
        coords = vector4(950.8547, -137.987, 74.460, 342.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },     


    --   GABZ - MISSION ROW POLICE DEPARTMENT (MRPD)
    {
        model = 's_f_y_cop_01', -- Model name as a hash. 
        coords = vector4(442.7057, -981.679, 30.689, 85.68), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    }, 

    -- GABZ - MISSION ROW POLICE DEPARTMENT (MRPD)
    {
        model = 's_m_y_cop_01', -- Model name as a hash. 
        coords = vector4(480.4046, -996.554, 30.689, 99.24), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    }, 
    
    -- GABZ - MISSION ROW POLICE DEPARTMENT (MRPD)
    {
        model = 's_f_y_cop_01', -- Model name as a hash. 
        coords = vector4(473.6764, -1005.85, 26.273, 139.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    }, 
    
    -- GABZ - PACIFIC BANK
    {
        model = 'mp_m_securoguard_01', -- Model name as a hash. 
        coords = vector4(259.6734, 225.3038, 107.08, 157.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_PATROL'
    }, 
    
    -- GABZ - PALETO 24/7
    {
        model = 'mp_m_shopkeep_01', -- Model name as a hash. 
        coords = vector4(161.1193, 6642.303, 31.698, 223.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    }, 
    
    -- GABZ - PALETO ROBS & LIQUOR
    {
        model = 'mp_m_shopkeep_01', -- Model name as a hash. 
        coords = vector4(-160.851, 6321.020, 31.586, 321.3), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    }, 
    
    -- GABZ - PALETO POLICE DEPARTMENT
    {
        model = 's_f_y_cop_01', -- Model name as a hash. 
        coords = vector4(-448.373, 6014.062, 32.288, 224.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    }, 
    
    -- GABZ - PALETO POLICE DEPARTMENT
    {
        model = 's_m_y_cop_01', -- Model name as a hash. 
        coords = vector4(-445.784, 6014.911, 36.995, 230.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    }, 
    
    -- GABZ - PARK RANGER
    {
        model = 's_f_y_sheriff_01', -- Model name as a hash. 
        coords = vector4(384.8343, 794.4106, 187.46, 264.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    }, 
    
    --  GABZ - PARK RANGER
    {
        model = 's_m_m_security_01', -- Model name as a hash. 
        coords = vector4(377.1194, 790.9773, 190.40, 136.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    }, 
    
    -- GABZ - PARK RANGER
    {
        model = 's_m_m_snowcop_01', -- Model name as a hash. 
        coords = vector4(378.2799, 790.9429, 190.40, 185.4), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    }, 
    
    -- GABZ - PILLBOX V2
    {
        model = 's_f_y_scrubs_01', -- Model name as a hash. 
        coords = vector4(308.3979, -595.438, 43.284, 72.94), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    }, 
    
    -- GABZ - PILLBOX V2
    {
        model = 's_m_m_doctor_01', -- Model name as a hash. 
        coords = vector4(362.7812, -593.236, 43.284, 78.73), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    }, 
    
    -- GABZ - PILLBOX V2
    {
        model = 's_m_y_autopsy_01', -- Model name as a hash. 
        coords = vector4(308.5482, -563.270, 43.284, 144.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    }, 
    
    -- GABZ - PIZZERIA
    {
        model = 'csb_sol', -- Model name as a hash. 
        coords = vector4(812.0891, -752.774, 26.780, 99.26), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },     

    -- GABZ - PIZZERIA
    {
        model = 's_m_m_linecook', -- Model name as a hash. 
        coords = vector4(809.9719, -761.009, 26.780, 105.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },   
    
    -- GABZ - BOLINGBROKE PENITENTIARY
    {
        model = 's_m_y_cop_01', -- Model name as a hash. 
        coords = vector4(1840.398, 2577.732, 46.014, 353.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },   
    
    -- GABZ - BOLINGBROKE PENITENTIARY
    {
        model = 's_f_y_cop_01', -- Model name as a hash. 
        coords = vector4(1840.574, 2584.186, 46.014, 359.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },   
    
    -- GABZ - BOLINGBROKE PENITENTIARY
    {
        model = 's_f_y_cop_01', -- Model name as a hash. 
        coords = vector4(1777.290, 2549.933, 45.673, 318.7), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },   
    
    -- GABZ - BOLINGBROKE PENITENTIARY
    {
        model = 's_m_m_strvend_01', -- Model name as a hash. 
        coords = vector4(1780.928, 2560.783, 45.673, 188.1), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },   
    
    -- GABZ - BOLINGBROKE PENITENTIARY
    {
        model = 's_m_y_cop_01', -- Model name as a hash. 
        coords = vector4(1773.040, 2493.644, 45.740, 118.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },   
    
    -- GABZ - BOLINGBROKE PENITENTIARY
    {
        model = 's_m_m_doctor_01', -- Model name as a hash. 
        coords = vector4(1768.936, 2586.767, 45.729, 169.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    },   
    
    -- 
    {
        model = 's_f_y_scrubs_01', -- Model name as a hash. 
        coords = vector4(1769.771, 2571.808, 45.729, 139.5), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_BUM_STANDING'
    },   
    
    --  GABZ - TRIAD RECORDS
    {
        model = 'ig_agatha', -- Model name as a hash. 
        coords = vector4(-818.531, -697.843, 28.060, 93.77), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_COFFEE'
    },   
    
    -- GABZ - TUNERS SHOP
    {
        model = 'ig_ashley', -- Model name as a hash. 
        coords = vector4(148.1236, -3013.40, 7.0408, 176.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_PARTYING'
    },   
    
    -- GABZ - TUNERS SHOP
    {
        model = 's_m_y_winclean_01', -- Model name as a hash. 
        coords = vector4(138.4583, -3037.76, 7.0408, 306.9), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_AA_SMOKE'
    },   
    
    -- GABZ - VANILLA UNICORN
    {
        model = 's_m_y_doorman_01', -- Model name as a hash. 
        coords = vector4(126.9742, -1299.88, 29.232, 226.8), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_GUARD_PATROL'
    },   
    
    -- GABZ - VANILLA UNICORN
    {
        model = 's_f_y_stripper_01', -- Model name as a hash. 
        coords = vector4(129.7509, -1284.53, 29.269, 120.0), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'female', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_DRINKING'
    },   
    
    -- GABZ - VANILLA UNICORN 
    {
        model = 'cs_lestercrest', -- Model name as a hash. 
        coords = vector4(111.0194, -1287.98, 28.260, 115.6), -- Hawick Ave (X, Y, Z, Heading)
        gender = 'male', -- The gender of the ped, used for the CreatePed native.
        scenario = 'WORLD_HUMAN_STRIP_WATCH_STAND'
    },   
    
    -- -- 
    -- {
    --     model = '', -- Model name as a hash. 
    --     coords = , -- Hawick Ave (X, Y, Z, Heading)
    --     gender = '', -- The gender of the ped, used for the CreatePed native.
    --     scenario = ''
    -- },   
    
    -- -- 
    -- {
    --     model = '', -- Model name as a hash. 
    --     coords = , -- Hawick Ave (X, Y, Z, Heading)
    --     gender = '', -- The gender of the ped, used for the CreatePed native.
    --     scenario = ''
    -- },   
    
    -- -- 
    -- {
    --     model = '', -- Model name as a hash. 
    --     coords = , -- Hawick Ave (X, Y, Z, Heading)
    --     gender = '', -- The gender of the ped, used for the CreatePed native.
    --     scenario = ''
    -- },   
    
    -- -- 
    -- {
    --     model = '', -- Model name as a hash. 
    --     coords = , -- Hawick Ave (X, Y, Z, Heading)
    --     gender = '', -- The gender of the ped, used for the CreatePed native.
    --     scenario = ''
    -- },   
    
    -- -- 
    -- {
    --     model = '', -- Model name as a hash. 
    --     coords = , -- Hawick Ave (X, Y, Z, Heading)
    --     gender = '', -- The gender of the ped, used for the CreatePed native.
    --     scenario = ''
    -- },   
    
    -- -- 
    -- {
    --     model = '', -- Model name as a hash. 
    --     coords = , -- Hawick Ave (X, Y, Z, Heading)
    --     gender = '', -- The gender of the ped, used for the CreatePed native.
    --     scenario = ''
    -- },   
    
    -- -- 
    -- {
    --     model = '', -- Model name as a hash. 
    --     coords = , -- Hawick Ave (X, Y, Z, Heading)
    --     gender = '', -- The gender of the ped, used for the CreatePed native.
    --     scenario = ''
    -- },       


}
-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCount() return true end
local function CitizenCheck() return true end

CreateThread(function()
	if not Config.Standalone then
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCount = function(item)
			for _, v in pairs(PlayerData.items) do
				if v.name == item then
					return true
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	else
		local firstSpawn = false
		AddEventHandler('playerSpawned', function()
			if not firstSpawn then
				SpawnPeds()
				firstSpawn = true
			end
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCount(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end