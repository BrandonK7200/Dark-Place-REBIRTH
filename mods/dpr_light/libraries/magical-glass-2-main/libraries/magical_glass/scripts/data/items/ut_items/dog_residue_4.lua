local item, super = Class(Item, "mg_item/dog_residue_4")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Dog Residue"
    self.short_name = "DogResidu"
    self.serious_name = "D.Residue"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Whether this item is for the light world
    self.light = true

    -- Default shop sell price
    self.sell_price = 1
    -- Whether the item can be sold
    self.can_sell = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "Glowing crystals secreted by a dog."

    -- Light world check text
    self.check = "Dog Item\n* Glowing crystals secreted\nby a dog."

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
end

function item:onWorldUse(target)
    Game.world.timer:script(function(wait)
        Assets.playSound("item")
        wait(0.4)
        Assets.playSound("dogresidue")
    end)

    local text
    if #Game.inventory:getStorage("items") < Game.inventory:getStorage("items").max then
        text = {
            "* You used the Dog Residue.",
            "* The rest of your inventory\nfilled up with Dog Residue."
        }
    else
        text = {
            "* You used the Dog Residue.",
            "* ...",
            "* You finished using it.",
            "* An uneasy atmosphere fills\nthe room."
        }
    end
    Game.world:showText(text)

    Game.inventory:removeItem(self)
    while #Game.inventory:getStorage("items") < Game.inventory:getStorage("items").max do
        local items = {
            "mg_item/dog_salad",
            "mg_item/dog_residue_1",
            "mg_item/dog_residue_2",
            "mg_item/dog_residue_3",
            "mg_item/dog_residue_4",
            "mg_item/dog_residue_5",
            "mg_item/dog_residue_6",
        }
        Game.inventory:addItem(Utils.pick(items))
    end
    return false
end

function item:getLightBattleText(user, target)
    local text
    if #Game.inventory:getStorage("items") + 1 < Game.inventory:getStorage("items").max then
        text = {
            "* You used the Dog Residue.",
            "* The rest of your inventory\nfilled up with Dog Residue."
        }
    else
        text = {
            "* You used the Dog Residue.",
            "* ...",
            "* You finished using it.",
            "* An uneasy atmosphere fills\nthe room."
        }
    end
    return text
end

function item:onLightBattleUse(user, target)
    Game.battle.timer:script(function(wait)
        Assets.playSound("item")
        wait(0.4)
        Assets.playSound("dogresidue")
    end)

    local text = self:getLightBattleText(user, target)
    while #Game.inventory:getStorage("items") < Game.inventory:getStorage("items").max do
        local items = {
            "mg_item/dog_salad",
            "mg_item/dog_residue_1",
            "mg_item/dog_residue_2",
            "mg_item/dog_residue_3",
            "mg_item/dog_residue_4",
            "mg_item/dog_residue_5",
            "mg_item/dog_residue_6",
        }
        Game.inventory:addItem(Utils.pick(items))
    end
    Game.battle:battleText(text)
    return true
end

return item