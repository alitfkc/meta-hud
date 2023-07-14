gui = {}
sx, sy = guiGetScreenSize ()
function createHud()

    --------------
    --fonts
    ----------------+
    local boldFont = guiCreateFont("imgs/fonts/fontBold.ttf",13*( sy / 1080 ))
    local boldFont2 = guiCreateFont("imgs/fonts/fontBold.ttf",24*( sy / 1080 ))
    local LightFont = guiCreateFont("imgs/fonts/fontLight.ttf",9*( sy / 1080 ))
    -----------------------
    -- close default hud
    ------------------------
    for _, component in ipairs( hud_components ) do
		setPlayerHudComponentVisible( component, false )
	end


    --------------------
    --Main
    ---------------------

    local main = guiCreateStaticImage(0.835,0.008,0.16,0.15,"imgs/main.png",true)
    guiSetProperty(main,"ImageColours","tl:ff".."252432".." tr:ff".."252432".." bl:00".."252432".." br:00".."252432".."")

    gui.main = {
        elm = main,
    }



    -------------------------------
    --Health Gui
    local health_bar_background = guiCreateStaticImage(0.08,0.6,0.65,0.05,"imgs/bar.png",true,main)
    guiSetProperty(health_bar_background,"ImageColours","tl:ff".."252432".." tr:ff".."252432".." bl:ff".."252432".." br:ff".."252432".."")

    gui.health_bar_background = {
        elm = health_bar_background,
    }

    
    local health_bar = guiCreateStaticImage(0.08,0.6,0.65,0.05,"imgs/bar.png",true,main)
    guiSetProperty(health_bar,"ImageColours","tl:ff".."c42156".." tr:ff".."ef3038".." bl:ff".."c42156".." br:ff".."ef3038".."")

    gui.health_bar = {
        elm = health_bar,
    }

    local heart_img = guiCreateStaticImage(0.78,0.58,0.06,0.1,"imgs/icons/heart.png",true,main)

    gui.heart_img = {
        elm = heart_img,
    }

    local health_label = guiCreateLabel(0.865,0.575,0.1,0.1,"100",true,main)
    guiSetFont(health_label,boldFont)

    gui.health_label = {
        elm = health_label,
    }
    ------------------------------------
    -- armour gui
    -------------------------------
    local armor_bar_background = guiCreateStaticImage(0.08,0.8,0.65,0.05,"imgs/bar.png",true,main)
    guiSetProperty(armor_bar_background,"ImageColours","tl:ff".."252432".." tr:ff".."252432".." bl:ff".."252432".." br:ff".."252432".."")

    gui.armor_bar_background = {
        elm = armor_bar_background,
    }

    
    local armor_bar = guiCreateStaticImage(0.08,0.8,0,0.05,"imgs/bar.png",true,main)
    guiSetProperty(armor_bar,"ImageColours","tl:ff".."bf00ff".." tr:ff".."6600ff".." bl:ff".."bf00ff".." br:ff".."6600ff".."")

    gui.armor_bar = {
        elm = armor_bar,
    }

    local armour_img = guiCreateStaticImage(0.78,0.77,0.06,0.1,"imgs/icons/armor.png",true,main)
    gui.armour_img = {
        elm = armour_img,
    }
    local armor_label = guiCreateLabel(0.865,0.765,0.1,0.1,"0",true,main)
    guiSetFont(armor_label,boldFont)

    gui.armor_label = {
        elm = armor_label,
    }

    -------------------------
    -- Player Money
    -------------------------
    local money_img = guiCreateStaticImage(0.08,0.12,0.12,0.2,"imgs/icons/money.png",true,main)
    gui.money_img = {
        elm = money_img,
    }
    local money_label = guiCreateLabel(0.23,0.16,0.4,0.1,"0₺",true,main)
    guiSetFont(money_label,boldFont)

    gui.money_label = {
        elm = money_label,
    }
    guiLabelSetColor(gui.money_label.elm,133,187,101)
    -------------------------
    -- Player Bank
    -------------------------
    local bank_img = guiCreateStaticImage(0.08,0.34,0.12,0.2,"imgs/icons/bank.png",true,main)
    gui.bank_img = {
        elm = bank_img,
    }
    local bank_label = guiCreateLabel(0.23,0.389,0.5,0.1,"0₺",true,main)
    guiSetFont(bank_label,boldFont)
    gui.bank_label = {
        elm = bank_label,
    }
    guiLabelSetColor(gui.bank_label.elm,133,187,101)
    -----------------------------------------
    --Weapon İmg
    -----------------------------------------
    local weapon_img = guiCreateStaticImage(0.57,0,0.4,0.4,"imgs/weapons/0.png",true,main)
    
    gui.weapon_img = {
        elm = weapon_img,
    }

    local weapon_label = guiCreateLabel(0.83,0.3,0.2,0.4,"",true,main)
    guiSetFont(weapon_label,LightFont)

    gui.weapon_label = {
        elm = weapon_label,
    }


    ------------------------
    --Ranks panel
    ------------------------
    local ranks_panel = guiCreateStaticImage(0.7405 ,0.008,0.09,0.15,"imgs/main.png",true)
    guiSetProperty(ranks_panel,"ImageColours","tl:ff".."252432".." tr:ff".."252432".." bl:00".."252432".." br:00".."252432".."")
    gui.ranks_panel = {
        elm = ranks_panel,
    }

    ---------------------------
    --Level
    ---------------------------
    local level_circle_background = guiCreateStaticImage(0.08,0.05,0.4,0.4,"imgs/icons/circle.png",true,ranks_panel)
    -- guiSetProperty(level_circle_background,"ImageColours","tl:ff".."252432".." tr:ff".."252432".." bl:ff".."252432".." br:ff".."252432".."")
    guiSetProperty(level_circle_background,"ImageColours","tl:ff".."f15a24".." tr:ff".."ed1c24".." bl:ff".."f15a24".." br:ff".."ed1c24".."")
    gui.level_circle_background = {
        elm = level_circle_background,
    }

    local level_label = guiCreateLabel(0.175,0.16,0.3,0.3,"61",true,ranks_panel)
    guiSetFont(level_label,boldFont2)

    gui.level_label = {
        elm = level_label,
    }

    local level_info_label = guiCreateLabel(0.6,0.12,0.3,0.3,"61.Lv\n1967/1967\n%61",true,ranks_panel)
    guiSetFont(level_info_label,LightFont)

    gui.level_info_label = {
        elm = level_info_label,
    }
    ---------------------------
    --Ranks
    ---------------------------
    local rank_img = guiCreateStaticImage(0.08,0.52,0.4,0.4,"imgs/ranks/ascendant3-64.png",true,ranks_panel)

    gui.rank_img = {
        elm = rank_img,
    }

    local rank_info_label = guiCreateLabel(0.6,0.52,0.32,0.5,"K/D\n61.61\nSıralama\n1967.\nYücelik 3",true,ranks_panel)
    guiSetFont(rank_info_label,LightFont)

    gui.rank_info_label = {
        elm = rank_info_label,
    }
    for k,v in pairs(gui) do 
        guiSetEnabled(v.elm,false)
    end

    if not getElementData(localPlayer,"loggedin") then 
        guiSetVisible(main,false)
        guiSetVisible(ranks_panel,false)
    end
end


addEventHandler("onClientResourceStart",resourceRoot,createHud)




--Change language Function
-------------------------------
function change_language(lng)
    language_selection = lng 
    ---------------------
    --Set Text for all gui
    ----------------------
    for k,v in pairs(gui) do 
        if v.language_row then 
            guiSetText(v.elm,language[lng][v.language_row])
        end
        if v.label_elm then 
            guiSetText(v.label_elm,language[lng][v.language_row])
        end
    end
    
end
addEvent("language:change",true)
addEventHandler("language:change",localPlayer,change_language)
