local QBCore = exports['qb-core']:GetCoreObject()
local playerPed, playerCoords, Tablet
local Hacked = {}


exports['qb-target']:AddTargetModel(Config.ATMModels, {
	options = {
		{
			type = "server",
			event = "nex:server:startrobbery",
			icon = "fas fa-piggy-bank",
			label = "Hack ATM",
			item = Config.HackDeviceItem,
		}
	},
	distance = 1.5
})


RegisterNetEvent('nex:client:starthack')
AddEventHandler('nex:client:starthack', function()
	ATMHack()
end)


function ATMHack()
	playerPed = PlayerPedId()
	playerCoords = GetEntityCoords(playerPed, true)
	local nearATM = false
	local hackStarted = false
	local beenHacked = false

			for k, v in pairs(Config.ATMModels) do
				local hash = GetHashKey(v)
				Citizen.Wait(50)
				nearATM = IsObjectNearPoint(hash, playerCoords.x, playerCoords.y, playerCoords.z, 1.5)
				Citizen.Wait(50)
				if nearATM then
					hackStarted = true
					local ATM = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 1.5, hash, false, false, false)
					for i = 1, #Hacked do
						if Hacked[i] == ATM then
							beenHacked = true
						end
					end
					if not beenHacked then
						RequestAnimDict('amb@prop_human_atm@male@enter')
						while not HasAnimDictLoaded('amb@prop_human_atm@male@enter') do
							Citizen.Wait(5)
						end
						if HasAnimDictLoaded('amb@prop_human_atm@male@enter') then
							TaskPlayAnim(playerPed, 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 3000, 1, 1, true, true, true)
							Citizen.Wait(1000)
							Tablet = CreateObject(GetHashKey("hei_prop_dlc_tablet"), 0, 0, 0, true, true, true)
							AttachEntityToEntity(Tablet, playerPed, GetPedBoneIndex(GetPlayerPed(-1), 18905), 0.20, 0.12, 0.05, 58.0, 122.0, 180.0, true, true, false, true, 1, true)
							RequestAnimDict('missfam4')
							while not HasAnimDictLoaded('missfam4') do
								Citizen.Wait(5)
							end
							if HasAnimDictLoaded('missfam4') then
								TaskPlayAnim(playerPed, "missfam4", "base", 1.0, 4.0, -1, 33, 0.0, false, false, false)
								Citizen.Wait(2000)
							end
						end
                        Dispatch()
                        QBCore.Functions.Progressbar("search_register", "Inserting Hacking Device...", Config.HackDeviceInsertTIme, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function()

                        local success = exports['SN-Hacking']:Thermite(Config.ThermiteSize, Config.CorrectBoxes, Config.ThermiteTime, Config.ThermiteFail, Config.ThermiteRounds, Config.ThermiteShowtime) --Thermite(boxes(number), correctboxes(number), time(milliseconds), lifes(number), rounds(number), showTime(milliseconds))
                        if success then
                            Citizen.Wait(500)
	                        ClearPedTasks(PlayerPedId())
	                        Citizen.Wait(500)
	                        DeleteObject(Tablet)
                            QBCore.Functions.Progressbar('atm_grabing_cash', 'Grabing cash', Config.PayoutTime, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                            animDict = 'oddjobs@shop_robbery@rob_till',
                                anim = 'loop',
                                flags = 17,
                            }, {}, {}, function()
                                ClearPedTasks(PlayerPedId())
                                TriggerServerEvent("nex:server:givecash")
                            QBCore.Functions.Notify("You've successfully hacked the ATM!", 'success')
                            if Config.RemovalChance then 
                                local RemovalLuck = math.random(1,10)
                                if RemovalLuck <5 then 
                            TriggerServerEvent("nex:server:removeitem", Config.HackDeviceItem)
                                else 
                                end
                            else 
                                TriggerServerEvent("nex:server:removeitem", Config.HackDeviceItem)
                            end
                    
                            end) 
                        else
                            Citizen.Wait(500)
	                        ClearPedTasks(PlayerPedId())
	                        Citizen.Wait(500)
	                        DeleteObject(Tablet)
                            if Config.RemoveOnFail then
                            TriggerServerEvent("nex:server:removeitem", Config.HackDeviceItem)
                            QBCore.Functions.Notify("You've Failed Hacking the ATM... Police have been alerted!", 'error')
                        else
                            QBCore.Functions.Notify("You've Failed Hacking the ATM... Police have been alerted!", 'error')
                        end
                        end
                    end) 
					else
						QBCore.Functions.Notify('Already hacked!', 'error', 3000)
					end
				else
					if not hackStarted and k == #Config.ATMModels then
						QBCore.Functions.Notify('You cannot do that here.', 'error', 3000)
					end
				end
			end
		end



        function Dispatch() -- change this if you use a different dispatch or want to change the call
            exports['ps-dispatch']:SuspiciousActivity()
        end