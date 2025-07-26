local rewardThreshold = 5 * 24 * 60 * 60 -- 5 Tage in Sekunden
local rewardAmount = 1500000

local playerTimes = {}
local saveFile = 'playtime_reward.json'

local function loadTimes()
    local data = LoadResourceFile(GetCurrentResourceName(), saveFile)
    if data then
        playerTimes = json.decode(data)
    end
end

local function saveTimes()
    SaveResourceFile(GetCurrentResourceName(), saveFile, json.encode(playerTimes), -1)
end

AddEventHandler('playerConnecting', function()
    local src = source
    if not playerTimes[src] then
        playerTimes[src] = 0
    end
end)

AddEventHandler('playerDropped', function()
    saveTimes()
end)

Citizen.CreateThread(function()
    loadTimes()
    while true do
        Citizen.Wait(60000)
        for _, player in ipairs(GetPlayers()) do
            local id = tonumber(player)
            playerTimes[id] = (playerTimes[id] or 0) + 60
            if playerTimes[id] >= rewardThreshold then
                TriggerClientEvent('playtimeReward:grant', id, rewardAmount)
                playerTimes[id] = playerTimes[id] - rewardThreshold
            end
        end
        saveTimes()
    end
end)

RegisterNetEvent('playtimeReward:requestTime')
AddEventHandler('playtimeReward:requestTime', function()
    local src = source
    local time = playerTimes[src] or 0
    TriggerClientEvent('playtimeReward:updateTime', src, time, rewardThreshold, rewardAmount)
end)
