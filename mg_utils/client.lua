-- /armor
RegisterCommand('armor', function(source, args)
    local input = tonumber(args[1])
    if not input or input == "" then
        print("Add some value for armor (1 - 100)")
        SendMessage("Add some value for armor (1 - 100)")
        return
    end
    SetPedArmour(PlayerPedId(0), tonumber(input))
    SendMessage("Armor seted to " .. input, {0, 255, 0})

end)

-- /id
RegisterCommand('id', function()
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            local id = tostring(GetPlayerServerId(player))
            SendMessage("ID : " .. id)
            libNotification("ID : " .. id, false, "right-top", "success")
        end
    end
end)

-- /clear chat
RegisterCommand('clear', function()
    TriggerEvent("chat:clear")
end, true)-- Only Admin can clear chat true/false




-- Reusable Functions
function SendMessage(msg, color)
    TriggerEvent("chatMessage", "", color, msg)
end

function addSuggestion(cmd, name, description)
    TriggerEvent('chat:addSuggestion', '/' .. cmd, name, {
        {name = name, help = description},
    })
end
addSuggestion("armor", "body armor", "value 1 to 100")-- For Armor Command


-- Lib Notification
function libNotification(title, description, position, type )
    -- body
    lib.notify({
        title = title,
        description = description,
        position = position,
        type  = type 
    })
end

