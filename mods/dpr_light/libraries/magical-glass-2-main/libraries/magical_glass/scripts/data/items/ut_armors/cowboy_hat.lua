local cowboy_hat, super = Class(LightEquipItem, "mg_item/cowboy_hat")

function cowboy_hat:init()
    super.init(self)

    -- Display name
    self.name = "Cowboy Hat"
    -- Name displayed in the normal item select menu
    self.short_name = "CowboyHat"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Whether this item is for the light world
    self.light = true

    -- Shop description
    self.shop = "ATTACK up\nwhen worn."
    -- Default shop price (sell price is halved)
    self.price = 350
    -- Default shop sell price
    self.sell_price = 100
    -- Whether the item can be sold
    self.can_sell = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "This battle-worn hat makes you want to grow a beard."

    -- Light world check text
    self.check = {
        "Armor DF 12\n* This battle-worn hat makes you\nwant to grow a beard.",
        "* It also raises ATTACK by 5.",
        --"* EIGHTEEN NAKED COWBOYS IN THE SHOWERS AT RAM RAAAANCH"
    }

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        defense = 12,
        attack = 5
    }
end

return cowboy_hat