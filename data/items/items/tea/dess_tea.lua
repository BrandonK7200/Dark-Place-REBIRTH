local item, super = Class(HealItem, "dess_tea")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Dess Tea"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Healing\nvaries"
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "It's own-flavored tea.\nThe flavor just says \"Dess.\""
    -- Amount that this item heals the owner
    self.heal_amount = 75
    -- Party member this tea is from
    self.tea_self = "dess"

    -- Default shop price (sell price is halved)
    self.price = 10
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
	kris = {
	    susie = "(Is Kris good?)",
	    ralsei = "(They don't like it...)",
	    noelle = "K-kris!",
	    brenda = "Not a fan, huh?",
	    noyno = "We should buy more!",
	    dess = "C'mon, man...",
        },
	YOU = {
	    susie = "(Oh, damn...)",
	    ralsei = "(That looked gross.)",
	    noelle = "(I hope they're fine...)",
	    brenda = "Yeesh.",
	    noyno = "Haha! Yes!",
	    dess = "It's not that bad",
	},
	susie = {
	    susie = "AUGH, rotten milk!",
	    ralsei = "Are you okay??",
	    noelle = "Susie! Do you need something?",
	    brenda = "(That didn't look pleasant.)",
	    noyno = "Rotten milk isn't *that* bad.",
	    dess = "Really?",
	},
	ralsei = {
	    susie = "Ralsei, are you good?!",
	    ralsei = "It's... erm...",
	    noelle = "That's not good...",
	    brenda = "Yikes.",
	    noyno = "Oh, toughen up!",
	    dess = "God dammit.",
	},
	noelle = {
	    susie = "What's it like?",
	    ralsei = "It's a mystery!",
	    noelle = "Tastes like a mix...",
	    brenda = "Weird.",
	    noyno = "I wanna know! Tell me!",
	},
        dess = {
	    dess = "Hell yeah, Wayside School reference.",
	    susie = "(Why does she like it?!)",
	    ralsei = "(I'm glad someone likes it?)",
	    noelle = "Self-esteem is important!",
	    brenda = "(SHE LIKES IT??)",
	    noyno = "(Her ego is bigger than mine?!)",
	},
	brenda = {
	    susie = "(Jeez...)",
	    ralsei = "Do you need a bag?",
	    noelle = "(Oh...)",
	    brenda = "I think I'm gonna be sick...",
	    noyno = "And I thought *I* hated her.",
	    dess = "yea",
	},
	noyno = {
	    susie = "Heh.",
	    ralsei = "Uh...",
	    noelle = "(I'll just... look away.)",
	    brenda = "Terrible, isn't it?",
	    noyno = "This is disgusting!",
	    dess = "Hm",
	},
	robo_susie = {
	    robo_susie = "It's better than paint.",
	    susie = "You can stomach it?",
	    ralsei = "That's... good?",
	    noelle = "Okay!",
	    brenda = "Wow, really??",
	    noyno = "Same diets, I suppose.",
	    dess = "Dang, finally",
    },
	ceroba = {
		ceroba = "It's... Uh...",
	    susie = "Terrible?",
	    brenda = "Disgusting?",
	    dess = "Literally perfect?",
	},
    }
end

function item:getHealAmount(id)
    if id ~= self.tea_self then
        local user = Game:getPartyMember(id)
        return user:getOpinion(self.tea_self)
    end
    return self.heal_amount
end

function item:getBattleHealAmount(id)
    -- Dont heal less than 40HP in battles
    return math.max(40, super.getBattleHealAmount(self, id))
end

return item