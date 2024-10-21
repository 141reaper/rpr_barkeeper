Config = {}


-- Icons die vor den Angeboten sind. Bereitgestellt durch https://fontawesome.com/
-- Jederzeit Änderbar
local drink = "fa-solid fa-wine-bottle"
local food = "fa-solid fa-utensils"

-- Position des NPCs + das Ped
Config.Barkeeper = {
    {coords = vector3(-1379.0929, -598.1324, 30.2165), heading = 126.6301, model = 's_m_m_bouncer_01'},
   -- {coords = vector3(-1385.7953, -624.4665, 35.8962), heading = 305.8752, model = 's_m_m_bouncer_01'}
}

-- Produkte die im Menü Angezeigt werden sollen. 
Config.Products = {
    {icon = food, name = "Burger", price = 400, item = "burger"},
    {icon = food, name = "Sandwich", price = 400, item = "sandwich"},
    {icon = drink, name = "Wein", price = 750, item = "wine"},
    {icon = drink, name = "Cola", price = 380, item = "kurkakola"},
    {icon = drink, name = "Wasser", price = 300, item = "water"},
    {icon = drink, name = "Sprunk", price = 380, item = "sprunk"},
}




Config.Job = "bahamas"  -- Job wo das Geld auf das Firmenkonto drauf soll


