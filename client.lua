function onEnter(self)
    lib.notify({
        title = 'Green Zone', 
        description = 'You have entered a greenzone',
        type = 'success',
        position = 'top',
        duration = 6000,
        style = {
        backgroundColor = '#0f0f0f',
        color = '#0fff57',
            ['.description'] = {
                color = '#8a8a8a',
            }
        },
        icon = 'circle-info',
        iconColor = '#0fff57'
    })
    local ped = PlayerPedId()
    SetPedCanRagdoll(ped, false)
    SetPedDiesWhenInjured(ped, false)
    SetPedDiesInVehicle(ped, false)
    SetPedDiesInSinkingVehicle(ped, false)
    god = SetInterval(function()
        if CanPedRagdoll(PlayerPedId()) then
            SetPedCanRagdoll(PlayerPedId(), false)
        end
    end, 0)
    NetworkSetFriendlyFireOption(false)
end
 
function onExit(self)
    lib.notify({
        title = 'Green Zone', 
        description = 'You have exited a greenzone',
        type = 'error',
        position = 'top',
        style = {
        backgroundColor = '#0f0f0f',
        color = '#ffffff',
            ['.description'] = {
                color = '#8a8a8a',
            }
        },
        icon = 'circle-info',
        iconColor = '#ffffff'
    })
    SetPedCanRagdoll(PlayerPedId(), true)
    SetPedDiesWhenInjured(PlayerPedId(), true)
    SetPedDiesInVehicle(PlayerPedId(), true)
    SetPedDiesInSinkingVehicle(PlayerPedId(), true)
    ClearInterval(god)
    NetworkSetFriendlyFireOption(true)
    
end

function inside(self)
    DisablePlayerFiring(player,true) 
    DisableControlAction(0, 106, true)
    DisableControlAction(0, 140, true)
    SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
end


Citizen.CreateThread(function()
    
    local poly = lib.zones.poly({
        name = "mudak",
        points = {
            vec3(-2067.0, -408.0, -20.25),
            vec3(-2160.0, -512.0, -20.25),
            vec3(-2160.0, -512.0, -20.25),
            vec3(-2068.0, -602.0, -20.25),
            vec3(-1966.0, -491.0, -20.25),
        },
        thickness = 94.25,
        debug = false,
        inside = inside,
        onEnter = onEnter,
        onExit = onExit
    })
    local poly = lib.zones.poly({
        nname = "main gr",
        points = {
            vec3(-206.0, -900.0, -101.0),
            vec3(-306.0, -866.0, -101.0),
            vec3(-371.0, -845.0, -101.0),
            vec3(-372.0, -969.0, -101.0),
            vec3(-247.0, -1015.0, -101.0),
        },
        thickness = 384.0,
        debug = false,
        inside = inside,
        onEnter = onEnter,
        onExit = onExit
    })
    
end)
