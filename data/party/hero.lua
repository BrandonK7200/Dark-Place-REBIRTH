local character, super = Class(PartyMember, "hero")

function character:init()
    super.init(self)

    self.name = "Hero"

    self:setActor("kris") -- Placeholder
    self:setLightActor("kris_lw") -- Placeholder
    self:setDarkTransitionActor("kris_dark_transition") -- Placeholder

    self.love = 1
    self.level = self.love
    self.title = "Protagonist\nLeads in battle\nusing many ACTs."

    self.soul_priority = 2
    self.soul_color = {1, 0, 0}

    self.has_act = true
    self.has_spells = false

    self.has_xact = true
    self.xact_name = "H-Action"

    self.health = 90

    self.stats = {
        health = 90,
        attack = 14,
        defense = 3,
        magic = 1
    }
    self.max_stats = {}

    self.weapon_icon = "ui/menu/equip/sword"

    self:setWeapon("wood_blade") -- Placeholder
    self:setArmor(1, "amber_card") -- Placeholder
    self:setArmor(2, "amber_card") -- Placeholder

    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    self.color = {0, 1, 1}
    self.dmg_color = {0.5, 1, 1}
    self.attack_bar_color = {0, 162/255, 232/255}
    self.attack_box_color = {0, 0, 1}
    self.xact_color = {0.5, 1, 1}

    self.menu_icon = "party/hero/head"
    self.head_icons = "party/kris/icon" -- Placeholder
    self.name_sprite = "party/kris/name" -- Placeholder

    self.attack_sprite = "effects/attack/cut"
    self.attack_sound = "laz_c"
    self.attack_pitch = 1

    self.battle_offset = {2, 1}
    self.head_icon_offset = nil
    self.menu_icon_offset = {3, 0}

    self.gameover_message = nil

    self.flags = {
        ["karma"] = 0
    }
end

function character:onLevelUp(level)
    self:increaseStat("health", 2)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/exclamation")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Chosen One:", x, y, 0, 0.8, 1)
        love.graphics.print("Yes", x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/demon")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Karma:", x, y)
        love.graphics.print(self:getFlag("karma"), x+130, y)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        Draw.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        Draw.draw(icon, x+90, y+6, 0, 2, 2)
        Draw.draw(icon, x+110, y+6, 0, 2, 2)
        Draw.draw(icon, x+130, y+6, 0, 2, 2)
        return true
    end
end

function character:addKarma(ammount)
    local newkarma = self:getFlag("karma") + ammount
    if newkarma > 100 then newkarma = 100 end
    if newkarma < -100 then newkarma = -100 end
    self:setFlag("karma", newkarma)
end

return character