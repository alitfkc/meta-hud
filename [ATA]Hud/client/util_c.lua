----------------------------------
-- Set ping and fps
------------------------------------

local FPScount = 0
local ping = 0
local fps = 0
function updatePingAndFPS()
	ping = getPlayerPing(localPlayer)
    fps = FPScount
	FPScount = 0
end
setTimer(updatePingAndFPS, 1000, 0)

-----------------------------------------
--Bank update
-----------------------------------------
local bank_balance_update = 0
function updateBankMoney(balance)
    bank_balance_update = balance
end

----------------------------------------------------------------------
-- Render
----------------------------------------------------------------------
local money_anim_count = 0
local money_color_anim = false

local health_anim_count = 0
local health_color_anim = false

local armor_anim_count = 0
local armor_color_anim = false

local bank_money_anim_count = 0
local bank_money_color_anim = false
function rendering()
    --- get data
    local health = getElementHealth(localPlayer)
    local armor = getPedArmor(localPlayer)
	local weaponid = getPedWeapon(localPlayer)
	local weaponClip = getPedAmmoInClip(localPlayer)
	local weaponAmmo = getPedTotalAmmo(localPlayer) - weaponClip
    local money = getPlayerMoney(localPlayer)

    health = math.ceil(health)
    armor = math.ceil(armor)
    if health > 100 then 
        health = 100 
    end

    local now_count = getTickCount()
    ------------
    --set weapon data
    ------------------
    if details.weaponid ~= weaponid  then 
        guiStaticImageLoadImage(gui.weapon_img.elm,"imgs/weapons/"..tostring(weaponid)..".png")
        details.weaponid = weaponid
    end
    if details.magazine ~= weaponClip or details.ammo ~= weaponAmmo then 
        details.magazine = weaponClip 
        details.ammo = weaponAmmo
        guiSetText(gui.weapon_label.elm,tostring(details.magazine).."/30\n"..tostring(details.ammo))
    end

    ---------------------
    -- Set Money Anim
    ----------------------
    if details.money ~= money then 
        local result =   money -details.money
        if result > 0 then
            guiLabelSetColor(gui.money_label.elm,0,255,0)
            money_color_anim = true
            money_anim_count = now_count
        else
            guiLabelSetColor(gui.money_label.elm,255,0,0)
            money_color_anim = true
            money_anim_count = now_count
        end
        guiSetText(gui.money_label.elm,tostring(money).."$")
        details.money = money
    end
    if money_color_anim then 
        if (now_count - money_anim_count) >= 3000 then 
            money_color_anim = false
            money_anim_count = 0
            guiLabelSetColor(gui.money_label.elm,133,187,101)
        end
    end
    -------------------------------------
    --Set Player Health
    -------------------------------------

    if details.health ~= health then 
        guiStopAniming(gui.health_label.elm)
        guiStopAniming(gui.heart_img.elm)
        guiSetText(gui.health_label.elm,tonumber(health))
        guiSetSize(gui.health_bar.elm,((sx*0.65)*(health/100))/sx,0.05,true)
        local result = health -details.health
        if result > 0 then
            guiLabelSetColor(gui.health_label.elm,0,255,0)
            health_color_anim = true
            health_anim_count = now_count
            
        else
            guiLabelSetColor(gui.health_label.elm,255,0,0)
            health_color_anim = true
            health_anim_count = now_count
            guiAlertAnim(gui.health_label.elm,true)
            guiAlertAnim(gui.heart_img.elm,true)
        end
        details.health = health
    end

    if health_color_anim then 
        if (now_count - health_anim_count) >= 1500 then 
            health_color_anim = false
            health_anim_count = 0
            guiLabelSetColor(gui.health_label.elm,255,255,255)
        end
    end
    -------------------------------------
    --Set Playerarmor
    -------------------------------------
    if details.armor ~= armor then 
        guiStopAniming(gui.armor_label.elm)
        guiStopAniming(gui.armour_img.elm)
        guiSetText(gui.armor_label.elm,tostring(armor))
        guiSetSize(gui.armor_bar.elm,((sx*0.65)*(armor/100))/sx,0.05,true)
        local result =   armor -details.armor
        if result > 0 then
            guiLabelSetColor(gui.armor_label.elm,0,255,0)
            armor_color_anim = true
            armor_anim_count = now_count
        else
            guiLabelSetColor(gui.armor_label.elm,255,0,0)
            armor_color_anim = true
            armor_anim_count = now_count
            guiAlertAnim(gui.armor_label.elm,true)
            guiAlertAnim(gui.armour_img.elm,true)
        end
        details.armor = armor
    end
    if armor_color_anim then 
        if (now_count - armor_anim_count) >= 1500 then 
            armor_color_anim = false
            armor_anim_count = 0
            guiLabelSetColor(gui.armor_label.elm,255,255,255)
        end
    end
    --------------------------------------------
    --Bank Money
    --------------------------------------------
    if details.bank_money ~= bank_balance_update then 

   
        local result =   bank_balance_update -details.bank_money
        if result > 0 then
            guiLabelSetColor(gui.bank_label.elm,0,255,0)
            bank_money_color_anim = true
            bank_money_anim_count = now_count
        else
            guiLabelSetColor(gui.bank_label.elm,255,0,0)
            bank_money_color_anim = true
            bank_money_anim_count = now_count
        end
        guiSetText(gui.bank_label.elm,tostring(bank_balance_update).."₺")
        details.bank_money = bank_balance_update
    end
    
    ---------------------
    -- Set Bank Money Anim
    ----------------------

    if bank_money_color_anim then 
        if (now_count - bank_money_anim_count) >= 3000 then 
            bank_money_color_anim = false
            bank_money_anim_count = 0
            guiLabelSetColor(gui.bank_label.elm,133,187,101)
        end
    end
    FPScount= FPScount+1 
    dxDrawText(os.date('%d/%m/%Y %H:%M:%S').." - "..tostring(fps).." FPS".." - "..tostring(ping).."ms",sx*0.8512,sy*0.1498,nil,nil,tocolor(0,0,0),1,"default-bold","left","center",false,false,true)

    dxDrawText(os.date('%d/%m/%Y %H:%M:%S').." - "..tostring(fps).." FPS".." - "..tostring(ping).."ms",sx*0.85,sy*0.15,nil,nil,nil,1,"default-bold","left","center",false,false,true)
end

----------------------------------------------
-- player details
-----------------------------------------------

details = {}
function setPlayerDetails()
    details.health = 0
    details.armor = 0
    details.weaponid = 0
    details.magazine = 0
    details.ammo = 0
    details.money = 0
    details.bank_money = 0
    bank_balance_update = exports["[ATA]Bank"]:get_balance()
    addEventHandler("onClientRender",root,rendering)

end
if getElementData(localPlayer,"loggedin") then 
    setPlayerDetails()
end

------------------------------------------
--player login
-----------------------------------------
function loggedIn()
    guiSetVisible(gui.main.elm,true)
    guiSetVisible(gui.ranks_panel.elm,true)
    setPlayerDetails()
end



-----------------------
--panel on off
-----------------------
function onoffrankpanel()
    local state = guiGetVisible(gui.ranks_panel.elm)
    guiSetVisible(gui.ranks_panel.elm,not state)
end

----------------------------------------
--Add Gui Events
----------------------------------------

addEventHandler("onClientResourceStart",resourceRoot,function()
    functions_client = {
        -------------
        --Panel on/off

    }
    addCommandHandler(close_panel_cmd,onoffrankpanel)
    --we add bindkey for panel 


    for k,v in pairs(gui) do
        if v.language_row and functions_client[v.language_row] then 
            addEventHandler("onClientGUIClick",v.elm,functions_client[v.language_row])
            --[[
            here i used the language row name to choose which guin goes to which function. 
            Otherwise, there would be another unnecessary variable.
            ]]--
        end
    end

    events = {
        {event_name = "ata-login:loggedin",func = loggedIn},
        {event_name = "ata-bank:updated_balance", func =updateBankMoney },
    }
    
    for k,v in ipairs(events) do
        if v.event_name and v.func then 
            addEvent(v.event_name,true)
            addEventHandler(v.event_name,localPlayer,v.func)
        end
    end
    
end)

