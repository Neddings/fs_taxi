RegisterServerEvent('fs_taxi:payCab')
AddEventHandler('fs_taxi:payCab', function(meters)
	local src = source
	
	local totalPrice = meters / 40.0
	local price = math.floor(totalPrice)
	
	if optional.use_essentialmode then
		TriggerEvent('es:getPlayerFromId', src, function(user)
			if user.getMoney() >= tonumber(price) then
				user.removeMoney(tonumber(price))
				TriggerClientEvent('fs_taxi:payment-status', src, true)
			else
				TriggerClientEvent('fs_taxi:payment-status', src, false)
			end
		end)
	else
		TriggerClientEvent('fs_taxi:payment-status', src, true)	
	end
end)