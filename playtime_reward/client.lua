local currentTime = 0
local threshold = 1
local reward = 0

RegisterNetEvent('playtimeReward:updateTime')
AddEventHandler('playtimeReward:updateTime', function(time, goal, amount)
    currentTime = time
    threshold = goal
    reward = amount
end)

Citizen.CreateThread(function()
    while true do
        TriggerServerEvent('playtimeReward:requestTime')
        Citizen.Wait(60000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local remaining = threshold - currentTime
        if remaining < 0 then remaining = 0 end
        local days = math.floor(remaining / 86400)
        local hours = math.floor((remaining % 86400) / 3600)
        local minutes = math.floor((remaining % 3600) / 60)
        local progress = remaining / threshold
        local width = 0.2
        local x = 0.5
        local y = 0.85

        DrawRect(x, y, width, 0.02, 0, 0, 0, 150)
        DrawRect(x - width/2 * (1 - progress), y, width * progress, 0.02, 0, 255, 0, 200)

        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.3, 0.3)
        SetTextColour(255,255,255,255)
        SetTextEntry("STRING")
        AddTextComponentString(string.format("Belohnung: $%d   Verbleibend: %dT %dH %dM", reward, days, hours, minutes))
        DrawText(x - width/2, y - 0.03)
    end
end)

RegisterNetEvent('playtimeReward:grant')
AddEventHandler('playtimeReward:grant', function(amount)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName('Du hast eine Belohnung erhalten: $'..amount)
    DrawNotification(false, false)
end)
