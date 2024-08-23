---@class PartyMember : Class
---@overload fun(...) : PartyMember
local PartyMember = Class()

function PartyMember:init()
    -- Display name
    self.name = "Player"

    -- Actor (handles overworld/battle sprites)
    self.actor = nil
    -- Light World Actor (handles overworld/battle sprites in light world maps) (optional)
    self.lw_actor = nil
    -- Dark Transition Actor (handles sprites during the dark world transition) (optional)
    self.dark_transition_actor = nil

    -- Default title / class (saved to the save file)
    self.title = "Player"
    -- Display level (saved to the save file)
    self.level = 1

    -- Light world LV (saved to the save file)
    self.lw_lv = 1
    -- Light world EXP (saved to the save file)
    self.lw_exp = 0

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 2
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {1, 0, 0}

    -- Whether the party member can act / use spells
    self.has_act = true
    self.has_spells = false

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "?-Action"

    -- Spells
    self.spells = {}

    -- Current health (saved to the save file)
    self.health = 100
    -- Current light world health (saved to the save file)
    self.lw_health = 20

    -- Base stats (saved to the save file)
    self.stats = {
        health = 100,
        attack = 10,
        defense = 2,
        magic = 0
    }
    -- Max stats from level-ups
    self.max_stats = {}

    -- Light world stats (saved to the save file)
    self.lw_stats = {
        health = 20,
        attack = 10,
        defense = 10
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword"

    -- Equipment (saved to the save file)
    self.equipped = {
        weapon = nil,
        armor = {}
    }

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {1, 1, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = nil
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = nil
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = nil
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = nil

    -- Head icon in the equip / power menu
    self.menu_icon = "party/kris/head"
    -- Path to head icons used in battle
    self.head_icons = "party/kris/icon"
    -- Name sprite (optional)
    self.name_sprite = nil

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = nil
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil

    -- Character flags (saved to the save file)
    self.flags = {}

    -- Temporary stat buffs in battles
    self.stat_buffs = {}

    -- Light world EXP requirements
    self.lw_exp_needed = {
        [ 1] = 0,
        [ 2] = 10,
        [ 3] = 30,
        [ 4] = 70,
        [ 5] = 120,
        [ 6] = 200,
        [ 7] = 300,
        [ 8] = 500,
        [ 9] = 800,
        [10] = 1200,
        [11] = 1700,
        [12] = 2500,
        [13] = 3500,
        [14] = 5000,
        [15] = 7000,
        [16] = 10000,
        [17] = 15000,
        [18] = 25000,
        [19] = 50000,
        [20] = 99999
    }

    self.flee_text = {}
    
    self.has_command = false

    -- Combos
    self.combos = {}
    
    self.love = 1
    self.exp = 0
    self.max_exp = 99999

    -- Party member specific EXP requirements
    -- The size of this table is the max LV
    self.exp_needed = {
        [ 1] = 0,
        [ 2] = 10,
        [ 3] = 30,
        [ 4] = 70,
        [ 5] = 120,
        [ 6] = 200,
        [ 7] = 300,
        [ 8] = 500,
        [ 9] = 800,
        [10] = 1200,
        [11] = 1700,
        [12] = 2500,
        [13] = 3500,
        [14] = 5000,
        [15] = 7000,
        [16] = 10000,
        [17] = 15000,
        [18] = 25000,
        [19] = 50000,
        [20] = 99999
    }

    self.future_heals = {}

    self.ribbit = false

    self.opinions = {}
    self.default_opinion = 50
end

-- Callbacks

function PartyMember:onAttackHit(enemy, damage) end

function PartyMember:onTurnStart(battler) end
function PartyMember:onActionSelect(battler, undo) end

function PartyMember:onLevelUp(level) end

function PartyMember:onPowerSelect(menu) end
function PartyMember:onPowerDeselect(menu) end

function PartyMember:drawPowerStat(index, x, y, menu) end

function PartyMember:onSave(data)
    data.opinions = self.opinions

    data.exp = self.exp
    data.love = self.love
	
    data.combos = self:saveCombos()
end
function PartyMember:onLoad(data)
    self.opinions = data.opinions or self.opinions

    self.exp = data.exp or self.exp
    self.love = data.love or self.love
	
    self:loadCombos(data.combos or {})
end

function PartyMember:onEquip(item, item2) return true end
function PartyMember:onUnequip(item, item2) return true end

function PartyMember:onActionBox(box, overworld) end

-- Getters

function PartyMember:getName() return self.name end
function PartyMember:getTitle() return "LV"..self:getLevel().." "..self.title end
function PartyMember:getLevel() return self.level end

function PartyMember:getLightLV() return self.lw_lv end
function PartyMember:getLightEXP() return self.lw_exp end
function PartyMember:getLightEXPNeeded(lv) return self.lw_exp_needed[lv] or 0 end

function PartyMember:getSoulPriority() return self.soul_priority end
function PartyMember:getSoulColor() return Utils.unpackColor(self.soul_color or {1, 0, 0}) end

function PartyMember:hasAct() return self.has_act end
function PartyMember:hasSpells() return self.has_spells end
function PartyMember:hasXAct() return self.has_xact end

function PartyMember:getXActName() return self.xact_name end

function PartyMember:getWeaponIcon() return self.weapon_icon end

function PartyMember:getHealth() return Game:isLight() and self.lw_health or self.health end
function PartyMember:getBaseStats(light)
    if light or (light == nil and Game:isLight()) then
        return self.lw_stats
    else
        return self.stats
    end
end

function PartyMember:getMaxStats() return self.max_stats end
function PartyMember:getMaxStat(stat)
    local max_stats = self:getMaxStats()
    return max_stats[stat]
end

function PartyMember:getStatBuffs() return self.stat_buffs end
function PartyMember:getStatBuff(stat)
    return self:getStatBuffs()[stat] or 0
end

function PartyMember:getColor() return Utils.unpackColor(self.color) end
function PartyMember:getDamageColor()
    if self.dmg_color then
        return Utils.unpackColor(self.dmg_color)
    else
        return self:getColor()
    end
end
function PartyMember:getAttackBarColor()
    if self.attack_bar_color then
        return Utils.unpackColor(self.attack_bar_color)
    else
        return self:getColor()
    end
end
function PartyMember:getAttackBoxColor()
    if self.attack_box_color then
        return Utils.unpackColor(self.attack_box_color)
    else
        local r, g, b, a = self:getColor()
        return r * 0.5, g * 0.5, b * 0.5, a
    end
end
function PartyMember:getXActColor()
    if self.xact_color then
        return Utils.unpackColor(self.xact_color)
    else
        return self:getColor()
    end
end

function PartyMember:getMenuIcon() return self.menu_icon end
function PartyMember:getHeadIcons() return self.head_icons end
function PartyMember:getNameSprite() return self.name_sprite end

function PartyMember:getAttackSprite() return self.attack_sprite end
function PartyMember:getAttackSound() return self.attack_sound end
function PartyMember:getAttackPitch() return self.attack_pitch end

function PartyMember:getBattleOffset() return unpack(self.battle_offset or {0, 0}) end
function PartyMember:getHeadIconOffset() return unpack(self.head_icon_offset or {0, 0}) end
function PartyMember:getMenuIconOffset() return unpack(self.menu_icon_offset or {0, 0}) end

function PartyMember:getGameOverMessage() return self.gameover_message end

-- Functions / Getters & Setters

function PartyMember:heal(amount, playsound)
    if playsound == nil or playsound then
        Assets.stopAndPlaySound("power")
    end
    self:setHealth(math.min(self:getStat("health"), self:getHealth() + amount))
    return self:getStat("health") == self:getHealth()
end

function PartyMember:setHealth(health)
    if Game:isLight() then
        self.lw_health = health
    else
        self.health = health
    end
end

function PartyMember:increaseStat(stat, amount, max)
    local base_stats = self:getBaseStats()
    base_stats[stat] = (base_stats[stat] or 0) + amount
    max = max or self:getMaxStat(stat)
    if max and base_stats[stat] > max then
        base_stats[stat] = max
    end
    if stat == "health" then
        self:setHealth(math.min(self:getHealth() + amount, base_stats[stat]))
    end
end

function PartyMember:addStatBuff(stat, amount, max)
    local buffs = self:getStatBuffs()
    buffs[stat] = (buffs[stat] or 0) + amount
    if max and buffs[stat] > max then
        buffs[stat] = max
    end
    self.stat_buffs = buffs
end

function PartyMember:setStatBuff(stat, amount)
    self.stat_buffs[stat] = amount
end

function PartyMember:resetBuff(stat)
    if self.stat_buffs[stat] then
        self.stat_buffs[stat] = nil
    end
end

function PartyMember:resetBuffs()
    self.stat_buffs = {}
end

function PartyMember:getReaction(item, user)
    if item then
        return item:getReaction(user.id, self.id)
    end
end

function PartyMember:getActor(light)
    if light == nil then
        light = Game.light
    end
    if light then
        return self.lw_actor or self.actor
    else
        return self.actor
    end
end

function PartyMember:getDarkTransitionActor()
    return self.dark_transition_actor
end

function PartyMember:setActor(actor)
    if type(actor) == "string" then
        actor = Registry.createActor(actor)
    end
    self.actor = actor
end

function PartyMember:setLightActor(actor)
    if type(actor) == "string" then
        actor = Registry.createActor(actor)
    end
    self.lw_actor = actor
end

function PartyMember:setDarkTransitionActor(actor)
    if type(actor) == "string" then
        actor = Registry.createActor(actor)
    end
    self.dark_transition_actor = actor
end

function PartyMember:getSpells()
    return self.spells
end

function PartyMember:addSpell(spell)
    if type(spell) == "string" then
        spell = Registry.createSpell(spell)
    end
    table.insert(self.spells, spell)
end

function PartyMember:removeSpell(spell)
    for i,v in ipairs(self.spells) do
        if v == spell or (type(spell) == "string" and v.id == spell) then
            table.remove(self.spells, i)
            return
        end
    end
end

function PartyMember:hasSpell(spell)
    for i,v in ipairs(self.spells) do
        if v == spell or (type(spell) == "string" and v.id == spell) then
            return true
        end
    end
    return false
end

function PartyMember:replaceSpell(spell, replacement)
    local tempspells = {}
    for _,v in ipairs(self.spells) do
        if v == spell or (type(spell) == "string" and v.id == spell) then
            table.insert(tempspells, Registry.createSpell(replacement))
        else
            table.insert(tempspells, v)
        end
    end
    self.spells = tempspells
end

function PartyMember:getEquipment()
    local result = {}
    if self.equipped.weapon then
        table.insert(result, self.equipped.weapon)
    end
    for i = 1, 2 do
        if self.equipped.armor[i] then
            table.insert(result, self.equipped.armor[i])
        end
    end
    return result
end

function PartyMember:getWeapon()
    return self.equipped.weapon
end

function PartyMember:getArmor(i)
    return self.equipped.armor[i]
end

function PartyMember:setWeapon(item)
    if type(item) == "string" then
        item = Registry.createItem(item)
    end
    self.equipped.weapon = item
end

function PartyMember:setArmor(i, item)
    if type(item) == "string" then
        item = Registry.createItem(item)
    end
    self.equipped.armor[i] = item
end

function PartyMember:checkWeapon(id)
    return self:getWeapon() and self:getWeapon().id == id or false
end

function PartyMember:checkArmor(id)
    local result, count = false, 0
    for i = 1, 2 do
        if self:getArmor(i) and self:getArmor(i).id == id then
            result = true
            count = count + 1
        end
    end
    return result, count
end

function PartyMember:canEquip(item, slot_type, slot_index)
    if item then
        return item:canEquip(self, slot_type, slot_index)
    else
        return slot_type ~= "weapon"
    end
end

function PartyMember:canAutoHeal()
    return true
end

function PartyMember:autoHealAmount()
    -- TODO: Is this round or ceil? Both were used before this function was added.
    return Utils.round(self:getStat("health") / 8)
end

function PartyMember:getEquipmentBonus(stat)
    local total = 0
    for _,item in ipairs(self:getEquipment()) do
        total = total + item:getStatBonus(stat)
    end
    return total
end

function PartyMember:getStats(light)
    local stats = Utils.copy(self:getBaseStats(light))
    for _,item in ipairs(self:getEquipment()) do
        for stat, amount in pairs(item:getStatBonuses()) do
            if stats[stat] then
                stats[stat] = stats[stat] + amount
            else
                stats[stat] = amount
            end
        end
    end
    return stats
end

function PartyMember:getStat(name, default, light)
    return (self:getBaseStats(light)[name] or (default or 0)) + self:getEquipmentBonus(name) + self:getStatBuff(name)
end

function PartyMember:getBaseStat(name, default, light)
    return (self:getBaseStats(light)[name] or (default or 0))
end

function PartyMember:getFlag(name, default)
    local result = self.flags[name]
    if result == nil then
        return default
    else
        return result
    end
end

function PartyMember:setFlag(name, value)
    self.flags[name] = value
end

function PartyMember:addFlag(name, amount)
    self.flags[name] = (self.flags[name] or 0) + (amount or 1)
    return self.flags[name]
end

function PartyMember:convertToLight()
    local last_weapon = self:getWeapon()
    local last_armors = {self:getArmor(1), self:getArmor(2)}

    self.equipped = {weapon = nil, armor = {}}

    if last_weapon then
        local result = last_weapon:convertToLightEquip(self)
        if result then
            if type(result) == "string" then
                result = Registry.createItem(result)
            end
            if isClass(result) then
                self.equipped.weapon = result
            end
        end
    end
    for i = 1, 2 do
        if last_armors[i] then
            local result = last_armors[i]:convertToLightEquip(self)
            if result then
                if type(result) == "string" then
                    result = Registry.createItem(result)
                end
                if isClass(result) then
                    self.equipped.armor[1] = result
                end
                break
            end
        end
    end

    if not self.equipped.weapon then
        self.equipped.weapon = Registry.createItem(self.lw_weapon_default)
    end
    if not self.equipped.armor[1] then
        self.equipped.armor[1] = Registry.createItem(self.lw_armor_default)
    end

    self.equipped.weapon.dark_item = last_weapon
    self.equipped.armor[1]:setFlag("dark_armors", {
        ["1"] = last_armors[1] and last_armors[1]:save(),
        ["2"] = last_armors[2] and last_armors[2]:save()
    })

    -- For deltarune accuracy, you heal here, bc health conversion code is broken
    self.lw_health = self:getStat("health")
end

function PartyMember:convertToDark()
    local last_weapon = self:getWeapon()
    local last_armor = self:getArmor(1)

    self.equipped = {weapon = nil, armor = {}}

    if last_weapon then
        local result = last_weapon:convertToDarkEquip(self)
        if result then
            if type(result) == "string" then
                result = Registry.createItem(result)
            end
            if isClass(result) then
                self.equipped.weapon = result
            end
        end
    end
    if last_armor then
        local result = last_armor:convertToDarkEquip(self)
        if result then
            if type(result) == "string" then
                result = Registry.createItem(result)
            end
            if isClass(result) then
                self.equipped.armor[1] = result
            end
        end
    end
end

-- Saving & Loading

function PartyMember:saveEquipment()
    local result = {weapon = nil, armor = {}}
    if self.equipped.weapon then
        result.weapon = self.equipped.weapon:save()
    end
    for i = 1, 2 do
        if self.equipped.armor[i] then
            result.armor[tostring(i)] = self.equipped.armor[i]:save()
        end
    end
    return result
end

function PartyMember:loadEquipment(data)
    if type(data.weapon) == "table" then
        if Registry.getItem(data.weapon.id) then
            local weapon = Registry.createItem(data.weapon.id)
            if weapon then
                weapon:load(data.weapon)
                self:setWeapon(weapon)
            else
                Kristal.Console:error("Could not load weapon \""..data.weapon.id.."\"")
            end
        else
            Kristal.Console:error("Could not load weapon \"".. data.weapon.id .."\"")
        end
    else
        if Registry.getItem(data.weapon) then
            self:setWeapon(data.weapon)
        else
            Kristal.Console:error("Could not load weapon \"".. (data.weapon or "nil") .."\"")
        end
    end
    for i = 1, 2 do
        self:setArmor(i, nil)
    end
    if data.armor then
        for k,v in pairs(data.armor) do
            if type(v) == "table" then
                if Registry.getItem(v.id) then
                    local armor = Registry.createItem(v.id)
                    if armor then
                        armor:load(v)
                        self:setArmor(tonumber(k), armor)
                    else
                        Kristal.Console:error("Could not load armor \""..v.id.."\"")
                    end
                else
                    Kristal.Console:error("Could not load armor \""..v.id.."\"")
                end
            else
                if Registry.getItem(v) then
                    self:setArmor(tonumber(k), v)
                else
                    Kristal.Console:error("Could not load armor \"".. (v or "nil") .."\"")
                end
            end
        end
    end
end

function PartyMember:saveSpells()
    local result = {}
    for _,v in pairs(self.spells) do
        table.insert(result, v.id)
    end
    return result
end

function PartyMember:loadSpells(data)
    self.spells = {}
    for _,v in ipairs(data) do
        self:addSpell(v)
    end
end

function PartyMember:save()
    local data = {
        id = self.id,
        title = self.title,
        level = self.level,
        health = self.health,
        stats = self.stats,
        lw_lv = self.lw_lv,
        lw_exp = self.lw_exp,
        lw_health = self.lw_health,
        lw_stats = self.lw_stats,
        spells = self:saveSpells(),
        equipped = self:saveEquipment(),
        flags = self.flags
    }
    self:onSave(data)
    return data
end

function PartyMember:load(data)
    self.title = data.title or self.title
    self.level = data.level or self.level
    self.stats = data.stats or self.stats
    self.lw_lv = data.lw_lv or self.lw_lv
    self.lw_exp = data.lw_exp or self.lw_exp
    self.lw_stats = data.lw_stats or self.lw_stats
    if data.spells then
        self:loadSpells(data.spells)
    end
    if data.equipped then
        self:loadEquipment(data.equipped)
    end
    self.flags = data.flags or self.flags
    self.health = data.health or self:getStat("health", 0, false)
    self.lw_health = data.lw_health or self:getStat("health", 0, true)

    self:onLoad(data)
end

function PartyMember:canDeepCopy()
    return false
end

function PartyMember:getCombos()
    return self.combos
end

function PartyMember:addCombo(combo)
    if type(combo) == "string" then
        combo = Registry.createCombo(combo)
    end
    table.insert(self.combos, combo)
end

function PartyMember:removeCombo(combo)
    for i,v in ipairs(self.combos) do
        if v == combo or (type(combo) == "string" and v.id == combo) then
            table.remove(self.combos, i)
            return
        end
    end
end

function PartyMember:hasCombo(combo)
    for i,v in ipairs(self.combos) do
        if v == combo or (type(combo) == "string" and v.id == combo) then
            return true
        end
    end
    return false
end

function PartyMember:replaceCombo(combo, replacement)
    local tempcombos = {}
    for _,v in ipairs(self.combos) do
        if v == combo or (type(combo) == "string" and v.id == combo) then
            table.insert(tempcombos, Mod:createCombo(replacement))
        else
            table.insert(tempcombos, v)
        end
    end
    self.combos = tempcombos
end

function PartyMember:saveCombos()
    local result = {}
    for _,v in pairs(self.combos) do
        table.insert(result, v.id)
    end
    return result
end

function PartyMember:loadCombos(data)
    self.combos = {}
    for _,v in ipairs(data) do
        self:addCombo(v)
    end
end

function PartyMember:getMaxShield()
    return self:getStat("health") / 2
end

function PartyMember:hasSkills()
	local has_stuff = 0
	if self:hasAct() then
		has_stuff = has_stuff + 1
	end
	if self:hasSpells() then
		has_stuff = has_stuff + 1
	end
	if #self.combos > 0 then
		has_stuff = has_stuff + 1
	end
    return (has_stuff > 1)
end

function PartyMember:getSkills()
    local color = {1, 1, 1, 1}
    for _,spell in ipairs(self:getSpells()) do
        if spell:hasTag("spare_tired") and spell:isUsable(spell) and spell:getTPCost(spell) <= Game:getTension() then
            local has_tired = false
            for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
                if enemy.tired then
                    has_tired = true
                    break
                end
            end
            if has_tired then
                color = {0, 178/255, 1, 1}
            end
        end
    end
	local skills = {}
	if self:hasAct() then
		table.insert(skills, {"ACT", "Do all\nsorts of\nthings", nil, function() Game.battle:setState("ENEMYSELECT", "ACT") end})
	end
	if self:hasSpells() then
		table.insert(skills, {"Magic", "Cast\nSpells", color, function()
            Game.battle:clearMenuItems()

            -- First, register X-Actions as menu items.

            if Game.battle.encounter.default_xactions and self:hasXAct() then
                local spell = {
                    ["name"] = Game.battle.enemies[1]:getXAction(self.battler),
                    ["target"] = "xact",
                    ["id"] = 0,
                    ["default"] = true,
                    ["party"] = {},
                    ["tp"] = 0
                }

                Game.battle:addMenuItem({
                    ["name"] = self:getXActName() or "X-Action",
                    ["tp"] = 0,
                    ["color"] = {self:getXActColor()},
                    ["data"] = spell,
                    ["callback"] = function(menu_item)
                        Game.battle.selected_xaction = spell
                        Game.battle:setState("XACTENEMYSELECT", "SPELL")
                    end
                })
            end

            for id, action in ipairs(Game.battle.xactions) do
                if action.party == self.id then
                    local spell = {
                        ["name"] = action.name,
                        ["target"] = "xact",
                        ["id"] = id,
                        ["default"] = false,
                        ["party"] = {},
                        ["tp"] = action.tp or 0
                    }

                    Game.battle:addMenuItem({
                        ["name"] = action.name,
                        ["tp"] = action.tp or 0,
                        ["description"] = action.description,
                        ["color"] = action.color or {1, 1, 1, 1},
                        ["data"] = spell,
                        ["callback"] = function(menu_item)
                            Game.battle.selected_xaction = spell
                            Game.battle:setState("XACTENEMYSELECT", "SPELL")
                        end
                    })
                end
            end

            -- Now, register SPELLs as menu items.
            for _,spell in ipairs(self:getSpells()) do
                local color = spell.color or {1, 1, 1, 1}
                if spell:hasTag("spare_tired") then
                    local has_tired = false
                    for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
                        if enemy.tired then
                            has_tired = true
                            break
                        end
                    end
                    if has_tired then
                        color = {0, 178/255, 1, 1}
                    end
                end
                Game.battle:addMenuItem({
                    ["name"] = spell:getName(),
                    ["tp"] = spell:getTPCost(self),
                    ["unusable"] = not spell:isUsable(self),
                    ["description"] = spell:getBattleDescription(),
                    ["party"] = spell.party,
                    ["color"] = color,
                    ["data"] = spell,
                    ["callback"] = function(menu_item)
                        Game.battle.selected_spell = menu_item

                        if not spell.target or spell.target == "none" then
                            Game.battle:pushAction("SPELL", nil, menu_item)
                        elseif spell.target == "ally" then
                            Game.battle:setState("PARTYSELECT", "SPELL")
                        elseif spell.target == "enemy" then
                            Game.battle:setState("ENEMYSELECT", "SPELL")
                        elseif spell.target == "party" then
                            Game.battle:pushAction("SPELL", Game.battle.party, menu_item)
                        elseif spell.target == "enemies" then
                            Game.battle:pushAction("SPELL", Game.battle:getActiveEnemies(), menu_item)
                        end
                    end
                })
            end

            Game.battle:setState("MENUSELECT", "SPELL")
        end})
	end
	if #self.combos > 0 then
		table.insert(skills, {"Combos", "Multi\nParty\nAction", nil, function()
            Game.battle:clearMenuItems()

            -- Now, register SPELLs as menu items.
            for _,combo in ipairs(self:getCombos()) do
                Game.battle:addMenuItem({
                    ["name"] = combo:getName(),
                    ["tp"] = combo:getTPCost(self),
                    ["unusable"] = not combo:isUsable(self),
                    ["description"] = combo:getBattleDescription(),
                    ["party"] = combo.party,
                    ["color"] = {1, 1, 1, 1},
                    ["data"] = combo,
                    ["callback"] = function(menu_item)
						Game.battle.selected_combo = menu_item

                        if not combo.target or combo.target == "none" then
                            Game.battle:pushAction("COMBO", nil, menu_item)
                        elseif combo.target == "ally" then
                            Game.battle:setState("PARTYSELECT", "COMBO")
                        elseif combo.target == "enemy" then
                            Game.battle:setState("ENEMYSELECT", "COMBO")
                        elseif combo.target == "party" then
                            Game.battle:pushAction("COMBO", Game.battle.party, menu_item)
                        elseif combo.target == "enemies" then
                            Game.battle:pushAction("COMBO", Game.battle:getActiveEnemies(), menu_item)
                        end
                    end
                })
            end

            Game.battle:setState("MENUSELECT", "COMBO")
        end})
	end
    return skills
end

function PartyMember:hasLightSkills()
    return (self:hasAct() and self:hasSpells())
end

function PartyMember:getLightSkills()
    local color = {1, 1, 1, 1}
    for _,spell in ipairs(self:getSpells()) do
        if spell:hasTag("spare_tired") and spell:isUsable(spell) and spell:getTPCost(spell) <= Game:getTension() then
            local has_tired = false
            for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
                if enemy.tired then
                    has_tired = true
                    break
                end
            end
            if has_tired then
                color = {0, 178/255, 1, 1}
            end
        end
    end
    return {
        {"ACT", "Do all\nsorts of\nthings", nil, function() Game.battle:setState("ENEMYSELECT", "ACT") end},
        {"Spell", Kristal.getLibConfig("library_main", "magic_description") or "Cast\nSpells", color, function()
            Game.battle:clearMenuItems()
			Game.battle.current_menu_columns = 2
			Game.battle.current_menu_rows = 3

			if Game.battle.encounter.default_xactions and Game.battle.party[1].chara:hasXAct() then
				local spell = {
					["name"] = Game.battle.enemies[1]:getXAction(Game.battle.party[1]),
					["target"] = "xact",
					["id"] = 0,
					["default"] = true,
					["party"] = {},
					["tp"] = 0
				}

				Game.battle:addMenuItem({
					["name"] = Game.battle.party[1].chara:getXActName() or "X-Action",
					["tp"] = 0,
					["color"] = { Game.battle.party[1].chara:getXActColor() },
					["data"] = spell,
					["callback"] = function(menu_item)
						Game.battle.selected_xaction = spell
						Game.battle:setState("XACTENEMYSELECT", "SPELL")
					end
				})
			end

			for id, action in ipairs(Game.battle.xactions) do
				if action.party == Game.battle.party[1].chara.id then
					local spell = {
						["name"] = action.name,
						["target"] = "xact",
						["id"] = id,
						["default"] = false,
						["party"] = {},
						["tp"] = action.tp or 0
					}

					Game.battle:addMenuItem({
						["name"] = action.name,
						["tp"] = action.tp or 0,
						["description"] = action.description,
						["color"] = action.color or { 1, 1, 1, 1 },
						["data"] = spell,
						["callback"] = function(menu_item)
							Game.battle.selected_xaction = spell
							Game.battle:setState("XACTENEMYSELECT", "SPELL")
						end
					})
				end
			end

			-- Now, register SPELLs as menu items.
			for _, spell in ipairs(Game.battle.party[1].chara:getSpells()) do
				local color = spell.color or { 1, 1, 1, 1 }
				if spell:hasTag("spare_tired") then
					local has_tired = false
					for _, enemy in ipairs(Game.battle:getActiveEnemies()) do
						if enemy.tired then
							has_tired = true
							break
						end
					end
					if has_tired then
						color = { 0, 178 / 255, 1, 1 }
					end
				end
				Game.battle:addMenuItem({
					["name"] = spell:getName(),
					["tp"] = spell:getTPCost(Game.battle.party[1].chara),
					["unusable"] = not spell:isUsable(Game.battle.party[1].chara),
					["description"] = spell:getBattleDescription(),
					["party"] = spell.party,
					["color"] = color,
					["data"] = spell,
					["callback"] = function(menu_item)
						Game.battle.selected_spell = menu_item

						if not spell.target or spell.target == "none" then
							Game.battle:pushAction("SPELL", nil, menu_item)
						elseif spell.target == "ally" and #Game.battle.party == 1 then
							Game.battle:pushAction("SPELL", Game.battle.party[1], menu_item)
						elseif spell.target == "ally" then
							Game.battle:setState("PARTYSELECT", "SPELL")
						elseif spell.target == "enemy" then
							Game.battle:setState("ENEMYSELECT", "SPELL")
						elseif spell.target == "party" then
							Game.battle:pushAction("SPELL", Game.battle.party, menu_item)
						elseif spell.target == "enemies" then
							Game.battle:pushAction("SPELL", Game.battle:getActiveEnemies(), menu_item)
						end
					end
				})
			end

			Game.battle:setState("MENUSELECT", "SPELL")
        end}
    }
end

function PartyMember:getLevel()
    return self.level
end

function PartyMember:getLOVE()
    return self.love
end

function PartyMember:addExp(amount)
    self.exp = Utils.clamp(self.exp + amount, 0, self.max_exp)

    local leveled_up = false
    while self.exp >= self:getNextLvRequiredEXP() and self.love < #self.exp_needed do
        leveled_up = true
        self.love = self.love + 1
        self:onLevelUpLVLib(self.love)
    end

    return leveled_up
end

function PartyMember:onLevelUpLVLib(level)
    self:increaseStat("health", 10)
    self:increaseStat("attack", 2)
    self:increaseStat("defense", 2)
end

function PartyMember:getExp()
    return self.exp
end

function PartyMember:getNextLvRequiredEXP()
    return self.exp_needed[self.love + 1] or 0
end

function PartyMember:getNextLv()
    return Utils.clamp(self:getNextLvRequiredEXP() - self.exp, 0, self.max_exp)
end

function PartyMember:getCommandOptions()
    return {"FIGHT", "ACT", "MAGIC"}, {"ITEM", "SPARE", "DEFEND"}
end

--- Called whenever a HealItem is used. \
--- Calculates the amount of healing an item should apply based on the character's healing bonuses.
---@param amount integer The amount of base healing for the item.
---@param item any The HealItem that is being used.
function PartyMember:applyHealBonus(amount, item)
    -- Check to see whether this item allows heal bonuses, return original amount if it does not.
    if item.block_heal_bonus then
        return amount
    end
    
    -- Doesn't apply bonuses if the original heal amount is 0 or less, unless the config overrides this behaviour.
    if amount <= 0 and not Kristal.getLibConfig("pie", "alwaysApplyHealBonus", true) then
        return amount
    end
    
    local equipment = self:getEquipment()
    local final_amount = amount
    local multiplier = 1
    local bonus = 0

    -- Gathers all the heal bonuses from the character's equipment.
    for _,equipitem in ipairs(equipment) do
        if equipitem:includes(Item) then
            multiplier = multiplier * equipitem:getHealMultiplier(self, item)
            bonus = bonus + equipitem:getHealBonus(self, item)
        end
    end

    -- Applies the heal bonus, based on the order set in the config.
    if Kristal.getLibConfig("pie", "healMultiplierTakesPriority", true) then
        final_amount = (final_amount * multiplier) + bonus
    else
        final_amount = (final_amount + bonus) * multiplier
    end

    return math.floor(final_amount)
end

--- Registers a future heal for this party member.
---@param amount integer Amount of HP to restore.
---@param turns integer Amount of turns this heal happens in.
function PartyMember:addFutureHeal(amount, turns)
    table.insert(self.future_heals, {amount = amount, turns = turns})
end

--- Callback for when a future heal activates. \
--- If this function returns `true`, the future heal will be cancelled.
---@param amount integer The amount of HP restored by this heal.
---@param battler PartyBattler The PartyBattler associated with this character.
function PartyMember:onFutureHeal(amount, battler) end

---@param other_party string|PartyMember
function PartyMember:getOpinion(other_party)
    if type(other_party) == "table" and other_party:includes(PartyMember) then
        other_party = other_party.id
    end
    if self.opinions[other_party] ~= nil then return self.opinions[other_party] end
    return self.default_opinion
end

---@param other_party string|PartyMember
function PartyMember:setOpinion(other_party, amount)
    if type(other_party) == "table" and other_party:includes(PartyMember) then
        other_party = other_party.id
    end
    self.opinions[other_party] = amount
    return amount
end

---@param other_party string|PartyMember
function PartyMember:addOpinion(other_party, amount)
    if type(other_party) == "table" and other_party:includes(PartyMember) then
        other_party = other_party.id
    end
    self.opinions[other_party] = self:getOpinion(other_party) + amount
    return self.opinions[other_party]
end

return PartyMember
