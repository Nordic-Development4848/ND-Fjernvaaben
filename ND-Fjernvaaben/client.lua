--[[
_______________________________________________________________________________________________________________________
   ______   ____     ____     _   __   _____    __    ___   __  __   _____     __ __    ____    ____    ____    ____ 
  / ____/  / __ \   / __ \   / | / /  |__  /   / /   <  /  / / / /  / ___/  __/ // /_  / __ \  / __ \  / __ \  / __ \
 / /      / / / /  / /_/ /  /  |/ /    /_ <   / /    / /  / / / /   \__ \  /_  _  __/ / /_/ / / /_/ / / /_/ / / /_/ /
/ /___   / /_/ /  / _, _/  / /|  /   ___/ /  / /___ / /  / /_/ /   ___/ / /_  _  __/  \__, /  \__, /  \__, /  \__, / 
\____/   \____/  /_/ |_|  /_/ |_/   /____/  /_____//_/   \____/   /____/   /_//_/    /____/  /____/  /____/  /____/  
_______________________________________________________________________________________________________________________                                                                                                                                                                                              
]]--

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ND-Fjernvaaben")


Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(1)
        local player = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(player, 0)
        for _, place in pairs(ND.RemoveWeaponCoord) do
            local distance = GetDistanceBetweenCoords(place.x, place.y, place.z,  playerCoords["x"], playerCoords["y"], playerCoords["z"], true)
            if(distance <= 5) then
                DrawMarker(27, place.x,place.y,place.z  - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001,22, 122, 252, 255, 0, 0, 0,0)
                if(distance <= 1) then
                    info_tekst("Tryk ~INPUT_CONTEXT~ for at lægge dine våben")
                    if IsControlJustReleased(1, 38) then
                        TriggerServerEvent("ND_fjernvaaben:perm")
                        Citizen.Wait(200)
                    end
                end
            end
        end
    end
end)
          


RegisterNetEvent('ND_fjernvaaben:fjern')
AddEventHandler('ND_fjernvaaben:fjern', function()
    local player = GetPlayerPed(-1)
    exports[ND.Progressbar]:startUI(6000, "Lægger våben i våbenskabet...")
    FreezeEntityPosition(PlayerPedId(), true)
    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
    Citizen.Wait(6000)
    ClearPedTasks(player)
    RemoveAllPedWeapons(player)
    FreezeEntityPosition(PlayerPedId(), false)
    exports['mythic_notify']:SendAlert('inform', 'Du lagde dine våben i skabet') 
end)




function info_tekst(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

