local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('barkeeper:buy', function(item, totalPrice, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    local itemData = exports.ox_inventory:GetItem(src, 'money', nil, false)

    if itemData and itemData.count >= totalPrice then
        if exports.ox_inventory:CanCarryItem(src, item, amount) then
            if exports.ox_inventory:RemoveItem(src, 'money', totalPrice) then
                exports.ox_inventory:AddItem(src, item, amount)
    
                local job = Config.Job
                local amountToAdd = totalPrice
                
                TriggerEvent('qb-management:AddMoney', job, amountToAdd)

                lib.notify({
                    title = 'Kauf erfolgreich',
                    description = amount..'x '..item..' gekauft',
                    position = "center-right",
                    type = 'success'
                })
            else
                lib.notify({
                    title = 'Fehler',
                    description = 'Nicht genügend Geld',
                    position = "center-right",
                    type = 'error'
                })
            end
        else
            lib.notify({
                title = 'Fehler',
                description = 'Nicht genügend Platz im Inventar',
                position = "center-right",
                type = 'error'
            })
        end
    else
        lib.notify({
            title = 'Fehler',
            description = 'Nicht genügend Geld im Inventar',
            type = 'error'
        })
    end
    
end)
