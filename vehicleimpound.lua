ESX = nil

local DiscordWebHook = "webhook1"
local PoliceWebHook = "webhook2"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local cityimpoundcount = 0
local sandyimpoundcount = 0

Citizen.CreateThread(function()
	Citizen.Wait(2000)
	getimpoundcount()
	Citizen.Wait(3000)
	print("Impound Loaded\n City: "..cityimpoundcount.."\nSandy: "..sandyimpoundcount)
end)

--Get number of vehicles in the impound on server start
function getimpoundcount()
	MySQL.ready(function()
		local cityresult = MySQL.Sync.fetchAll('SELECT fourrieremecano FROM owned_vehicles WHERE fourrieremecano=@city',
		{
			['@city'] = 1
		})
		cityimpoundcount = #cityresult

		local sandyresult = MySQL.Sync.fetchAll('SELECT fourrieremecano FROM owned_vehicles WHERE fourrieremecano=@sandy',
		{
			['@sandy'] = 2
		})
		sandyimpoundcount = #sandyresult
	end)
end

--Server callback to check if there is space
ESX.RegisterServerCallback('checkspace', function(source, cb, state)
	if state == 1 then
		if cityimpoundcount <= 30 then
			cb(true)
		else
			cb(false)
		end
	elseif state == 2 then
		if sandyimpoundcount <= 30 then
			cb(true)
		else
			cb(false)
		end
	end
end)

--Recover vehicles
ESX.RegisterServerCallback('getVehicles', function(source, cb, impound)
	local _source = source
	local impoundedveh = {}
	local impounded = impound

	MySQL.Async.fetchAll("SELECT vehicle, fourrieremecano FROM owned_vehicles WHERE fourrieremecano=@impounded",
		{
			['@impounded'] = impounded
		},
		function(data)
		for key, vehicleData in ipairs(data) do
			table.insert(impoundedveh, {
				--["plate"] = vehicleData["plate"],
				["props"] = json.decode(vehicleData["vehicle"]),
				["impound"] = vehicleData["fourrieremecano"],
			})
		end
		cb(impoundedveh)
		impoundedveh = nil
	end)
end)

RegisterServerEvent('modifyimpound')
AddEventHandler('modifyimpound', function(plate, state, vehname, lot)
	local _source = source
	if vehname == "CARNOTFOUND" then
		vehname = "vehicle"
	end
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local plate = plate
	MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
		if result[1] then
			MySQL.Sync.execute("UPDATE owned_vehicles SET fourrieremecano=@state WHERE plate=@plate",{['@state'] = state , ['@plate'] = plate})
			if state == 1 then
				cityimpoundcount = cityimpoundcount + 1
				PoliceLogs('Impound', xPlayer.name.." Impounded a "..vehname.." plate : ["..plate.. "] @ City Impound", 16711680)
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'City Impound is now at '..cityimpoundcount})
			elseif state == 2 then
				sandyimpoundcount = sandyimpoundcount + 1
				PoliceLogs('Impound', xPlayer.name.." Impounded a "..vehname.." plate : ["..plate.. "] @ Sandy Impound", 16711680)
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'City Impound is now at '..sandyimpoundcount})
			elseif state == 0 then
				if lot == 1 then
					cityimpoundcount = cityimpoundcount - 1
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'City Impound is now at '..cityimpoundcount})
				elseif lot == 2 then
					sandyimpoundcount = sandyimpoundcount - 1
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'City Impound is now at '..sandyimpoundcount})
				end
				PoliceLogs('Impound', xPlayer.name.." Unimpounded a "..vehname.." plate : ["..plate.."]", 56108)
			end
		end
	end)	
end)

function PoliceLogs (name,message,color)
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
	    {
	        ["title"]=message,
	        ["type"]="rich",
	        ["color"] =color,
	        ["footer"]=  {
	        ["text"]= "Impound-Log",
	       },
	    }
	}

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
	PerformHttpRequest(PoliceWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end