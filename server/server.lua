local Config = require 'shared.config'
local zombieCount = 0
local zombies = {}

-- Register Spawn Command
RegisterCommand(Config.Commands.spawn, function(source, args, rawCommand)
    local numZombies = tonumber(args[1]) or 5
    if numZombies > Config.SpawnSettings.maxZombies then
        numZombies = Config.SpawnSettings.maxZombies
    end
    TriggerClientEvent('zombie:spawn', source, numZombies)
    TriggerClientEvent('chat:addMessage', source, {
        args = {'Zombie System', 'Spawning ' .. numZombies .. ' zombies...'}
    })
end)

-- Register Despawn Command
RegisterCommand(Config.Commands.despawn, function(source, args, rawCommand)
    TriggerClientEvent('zombie:despawn', source)
    TriggerClientEvent('chat:addMessage', source, {
        args = {'Zombie System', 'Despawning zombies...'}
    })
end)

-- Register Clear Command
RegisterCommand(Config.Commands.clear, function(source, args, rawCommand)
    TriggerClientEvent('zombie:clear', source)
    TriggerClientEvent('chat:addMessage', source, {
        args = {'Zombie System', 'All zombies cleared!'}
    })
end)

-- Register Info Command
RegisterCommand(Config.Commands.info, function(source, args, rawCommand)
    TriggerClientEvent('zombie:info', source, zombieCount)
    TriggerClientEvent('chat:addMessage', source, {
        args = {'Zombie System', 'Active Zombies: ' .. zombieCount}
    })
end)

-- Update zombie count
RegisterNetEvent('zombie:updateCount')
AddEventHandler('zombie:updateCount', function(count)
    zombieCount = count
end)

-- Log zombie deaths
RegisterNetEvent('zombie:death')
AddEventHandler('zombie:death', function(zombieId)
    TriggerClientEvent('chat:addMessage', -1, {
        args = {'Zombie System', 'Zombie eliminated!'}
    })
end)

print('^2Zombie Script Server Started^7')