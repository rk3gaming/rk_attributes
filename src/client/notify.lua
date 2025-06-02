RegisterNetEvent("rk_attributes:notify", function(title, message, type, duration, icon, iconColor)
    lib.notify({
        title = title,
        description = message,
        type = type,
        duration = duration or 5000,
        icon = icon,
        iconColor = iconColor,
        position = "top"
    })
end)
