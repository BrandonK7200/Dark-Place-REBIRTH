local item, super = Class(Item, "bshotbowtie")

function item:init()
    super.init(self)

    -- Display name
    self.name = "B.ShotBowtie"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "A handsome\nbowtie."
    -- Menu description
    self.description = "A handsome bowtie. Looks like the brand\nname has been cut off."

    -- Default shop price (sell price is halved)
    self.price = 300
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        defense = 2,
        magic = 1,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions
    self.reactions = {
        susie = "Ugh, I look like a nerd.",
        ralsei = "Can I have suspenders?",
        noelle = "... do I put it in my hair?",
        dess = "holy shit is that a spamtong reference????",
    }
end

return item