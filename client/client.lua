local QBCore = exports['qb-core']:GetCoreObject()
print("Made by 141reaper")
print("More can be found here: https://github.com/141reaper")

CreateThread(function()
    for _, v in pairs(Config.Barkeeper) do

        RequestModel(v.model)
        local attempts = 0
        while not HasModelLoaded(v.model) do
            Wait(100)
            attempts = attempts + 1
            if attempts > 50 then
                print("Fehler: Model konnte nicht geladen werden (" .. v.model .. ")")
                return
            end
        end


        if not v.coords or not v.heading then
            print("Fehler: Ungültige Koordinaten oder Heading für den NPC.")
            return
        end


        local npc = CreatePed(4, v.model, v.coords.x, v.coords.y, v.coords.z - 1.0, v.heading, false, true)
        if DoesEntityExist(npc) then
            print("NPC erfolgreich erstellt an: " .. v.coords.x .. ", " .. v.coords.y .. ", " .. v.coords.z)
        else
            print("Fehler: NPC konnte nicht erstellt werden.")
        end

        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)

        exports['qb-target']:AddTargetEntity(npc, {
            options = {
                {
                    icon = "fas fa-beer",
                    label = "Barkeeper Menü",
                    action = function()
                        OpenBarkeeperMenu()
                    end
                }
            },
            distance = 2.5
        })
    end
end)



function OpenBarkeeperMenu()
    local options = {}
    for _, product in pairs(Config.Products) do
        table.insert(options, {
            title = ""..product.name.."",
            description = "Preis: ".. product.price.."$",
            icon = product.icon,
            event = 'barkeeper:confirmPurchase',
            args = product
        })
    end

    lib.registerContext({
        id = 'barkeeper_menu',
        title = 'Barkeeper Menü',
        options = options,
    })

    lib.showContext('barkeeper_menu')
end

RegisterNetEvent('barkeeper:confirmPurchase', function(product)
    lib.registerContext({
        id = 'confirm_purchase',
        title = 'Kauf bestätigen',
        options = {
            {
                title = "Menge eingeben und kaufen",
                description = "Für ".. product.price.."$ pro Stück kaufen",
                icon = "fa-solid fa-check",
                event = 'barkeeper:inputAmount',
                args = product
            },
            { title = "Abbrechen",icon ="fa-solid fa-x" , event = '' }
        },
    })

    lib.showContext('confirm_purchase')
end)

RegisterNetEvent('barkeeper:inputAmount', function(product)
    local input = lib.inputDialog('Kaufmenge', {
        { type = "number", label = "Wieviel "..product.name.." möchten Sie kaufen?", placeholder = '1', min = 1 }
    })

    if input then
        local amount = tonumber(input[1])
        if amount and amount > 0 then
            local totalPrice = amount * product.price
            local playerMoney = QBCore.Functions.GetPlayerData().money['cash']

            if playerMoney >= totalPrice then
                TriggerServerEvent('barkeeper:buy', product.item, totalPrice, amount)
                lib.notify({
                    title = 'Erfolg',
                    description = 'Erfolgreich ' ..product.name.. ' gekauft',
                    position = "center-right",
                    type = 'success'
                })
            else
                lib.notify({
                    title = 'Fehler',
                    description = 'Du hast nicht genügend Geld!',
                    position = "center-right",
                    type = 'error'
                })
            end
        else
            lib.notify({
                title = 'Ungultige Menge',
                description = 'Ungültige Menge eingegeben!',
                position = "center-right",
                type = 'error'
            })
        end
    else
        lib.notify({
            title = 'Abgebrochen',
            description = 'Kauf abgebrochen!',
            position = "center-right",
            type = 'error'
        })
    end
end)

RegisterNetEvent('barkeeper:buyProduct', function(product, price, amount)
    TriggerServerEvent('barkeeper:buy', product, price, amount)
end)