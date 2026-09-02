-- Sets Range In Use
RegisterNetEvent('complex-gunrange:server:setInUse', function()
    TriggerClientEvent('complex-gunrange:setInUse', -1)
end)

-- Event to Give Results Receipt
RegisterNetEvent('complex-gunrange:giveResultReceipt', function(score)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end
    local date = os.date('%Y-%m-%d %H:%M')
    local fullname = ''..Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname..''
    local info = {
        citizenname = fullname,
        score = score,
        date = date,
    }
    local success = exports.ox_inventory:AddItem(
    src,
    'gunrangereceipt',
    1,
    info
    )

    if not success then
        TriggerClientEvent('ox_lib:notify', src, {
            id = 'range_item_sent',
            title = 'Range System',
            description = 'Youre pockets was full, You couldnt receive the test results receipt!',
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
            },
            icon = 'fas fa-exclamation',
            iconColor = '#C53030'
        })
        return
    end
    TriggerClientEvent('ox_lib:notify', src, {
        id = 'range_item_sent',
        title = 'Range System',
        description = 'You have received a receipt with your test results!',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
        },
        icon = 'fas fa-exclamation',
        iconColor = '#C53030'
    })
end)