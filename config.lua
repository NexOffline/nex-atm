Config = {}

Config.ATMModels = {
    "prop_atm_01", -- 20 on map
    "prop_atm_02", -- 37 on map
    "prop_atm_03", -- 30 on map
    "prop_fleeca_atm" -- 4 on map
}


Config.Withdrawal = math.random(700,2500) -- $ received for winning

-- Items 

Config.HackDeviceItem = "hackdevice" -- this is the item players need to hack an ATM

Config.RemovalChance = false -- set to true if you want to be a chance of removing the hack device (Players will have a 50/50 Chance to not loose the item)

Config.RemoveOnFail = true -- set to true if you want the item to be removed on failing

-- Hack Settings 

Config.ThermiteSize = 7 -- How big the hack size is (if 7, players will get a 7x7 thermite hack)
Config.CorrectBoxes = 5 -- How many boxes the player has to get correct to finish a stage of the hack
Config.ThermiteTime = 10000 -- How much time players have to finish the hack (milliseconds)
Config.ThermiteFail = 2 -- How many boxes the player can get wrong before the hack fails 
Config.ThermiteRounds = 2 -- How many rounds of the minigame the player has to play before finishing the entire hack
Config.ThermiteShowtime = 3000 -- How long players have to look at the boxes before they have to guess the correct ones 

-- Progress Times 

Config.HackDeviceInsertTIme = 15000 -- How long it takes the progress bar before finishing while inserting the hack device (milliseconds)
Config.PayoutTime = 7000 -- How long it takes the progress bar before finishing while grabbing the money (milliseconds)