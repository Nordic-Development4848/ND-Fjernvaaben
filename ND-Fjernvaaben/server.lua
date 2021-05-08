--[[
_________________________________________________________________________________________________________________________
   ______   ____     ____     _   __   _____    __    ___   __  __   _____     __ __    ____    ____    ____    ____ 
  / ____/  / __ \   / __ \   / | / /  |__  /   / /   <  /  / / / /  / ___/  __/ // /_  / __ \  / __ \  / __ \  / __ \
 / /      / / / /  / /_/ /  /  |/ /    /_ <   / /    / /  / / / /   \__ \  /_  _  __/ / /_/ / / /_/ / / /_/ / / /_/ /
/ /___   / /_/ /  / _, _/  / /|  /   ___/ /  / /___ / /  / /_/ /   ___/ / /_  _  __/  \__, /  \__, /  \__, /  \__, / 
\____/   \____/  /_/ |_|  /_/ |_/   /____/  /_____//_/   \____/   /____/   /_//_/    /____/  /____/  /____/  /____/  
_______________________________________________________________________________________________________________________                                                                                                                                                                                              
]]--

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","ND-Fjernvaaben")

RegisterNetEvent("ND_fjernvaaben:perm")
AddEventHandler("ND_fjernvaaben:perm", function()
  local source = source
  local user_id = vRP.getUserId({source})
  if vRP.hasGroup({user_id,ND.RemoveWeaponGroup}) then
    TriggerClientEvent('ND_fjernvaaben:fjern', source)
  else
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke adgang', length = 2500, style = { ['background-color'] = '#dc1313', ['color'] = '#ffffff' } }) 
  end
end)
