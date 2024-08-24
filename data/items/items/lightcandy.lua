local item, super = Class(HealItem, "lightcandy")

function item:init()
    super.init(self)

    -- Display name
    self.name = "LightCandy"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\n120HP"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "White candy with a chalky texture.\nIt'll recover 120HP."

    -- Amount healed (HealItem variable)
    self.heal_amount = 120

    -- Default shop price (sell price is halved)
    self.price = 200
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {
        susie = "Hey, this rules!",
        ralsei = "Nice and chalky.",
        noelle = "(I-isn't this the chalk I gave her?)",
        jamm = "Not the first time I ate chalk. Not the last, either.",
    }
end

return item