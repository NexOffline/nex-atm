local QBCore = exports['qb-core']:GetCoreObject()

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