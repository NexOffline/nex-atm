local QBCore = exports['qb-core']:GetCoreObject()
OnCooldown = false


RegisterServerEvent("nex:server:removeitem")
AddEventHandler("nex:server:removeitem", function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local item = data
	Player.Functions.RemoveItem(item, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', 1)
end)


RegisterNetEvent('nex:server:givecash')
AddEventHandler('nex:server:givecash', function()
	local src = source
	local pData = QBCore.Functions.GetPlayer(src)
	pData.Functions.AddMoney('cash', Config.Withdrawal, "ATM")
end)

RegisterNetEvent('nex:server:startrobbery')
AddEventHandler('nex:server:startrobbery', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if not OnCooldown then
		TriggerClientEvent('nex:client:starthack', src)
	OnCooldown = true
	local timer = Config.Cooldown * (60 * 1000)
        if timer == 0 then
			OnCooldown = false	
		end
	else 
		TriggerClientEvent('QBCore:Notify', src, "Security defenses are currently too high to hack...", "error")
	end

end) 