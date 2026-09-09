-- Loading Screen Client
local Config = require 'shared.config'
local isLoadingScreenActive = false
local currentMusicIndex = Config.SelectedMusic

-- Show loading screen
local function showLoadingScreen()
    isLoadingScreenActive = true
    SetNuiFocus(true, true)
    SendReactMessage('setVisible', true)
    
    -- Play music
    playLoadingMusic(currentMusicIndex)
    
    -- Start progress animation
    local startTime = GetGameTimer()
    local duration = Config.LoadingScreen.duration
    
    while isLoadingScreenActive and (GetGameTimer() - startTime) < duration do
        local progress = ((GetGameTimer() - startTime) / duration) * 100
        
        -- Send progress to NUI
        SendReactMessage('updateProgress', {
            progress = math.min(progress, 100)
        })
        
        Wait(50)
    end
    
    -- Close loading screen
    closeLoadingScreen()
end

-- Close loading screen
local function closeLoadingScreen()
    isLoadingScreenActive = false
    SetNuiFocus(false, false)
    SendReactMessage('setVisible', false)
end

-- Play loading music
local function playLoadingMusic(index)
    if index > 0 and index <= #Config.LoadingScreenMusic then
        currentMusicIndex = index
        local music = Config.LoadingScreenMusic[index]
        
        SendReactMessage('setMusic', {
            index = index - 1,
            name = music.name,
            volume = music.volume
        })
    end
end

-- Show loading screen on resource start
Citizen.CreateThread(function()
    if Config.LoadingScreen.enabled then
        showLoadingScreen()
    end
end)

-- Listen for NUI messages
RegisterNUICallback('musicChanged', function(data, cb)
    currentMusicIndex = data.index + 1
    cb('ok')
end)

RegisterNUICallback('volumeChanged', function(data, cb)
    -- Volume change handled in NUI
    cb('ok')
end)

print('^2Loading Screen Client Started^7')
