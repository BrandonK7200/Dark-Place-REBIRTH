local item, super = Class(Item, "jevilstail")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Jevilstail"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A J-shaped tail that gives you devilenergy."

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false

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
        attack = 2,
        defense = 2,
        magic = 2,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
		jamm = false,
	}

    -- Character reactions
    self.reactions = {
        susie = "Figured I'd grow one someday.",
        ralsei = "I'm a good devil, OK?",
        noelle = "... (I like it...)",
        dess = "im gonna go commit a felony now",
        jamm = "It won't fit...!",
    }
end

function item:getReaction(user_id, reactor_id)
    if user_id == "jamm" and reactor_id == user_id and Game:getFlag("marcy_joined") then
		return "It won't fit either of us...!"
	end
	return super.getReaction(self, user_id, reactor_id)
end

return item