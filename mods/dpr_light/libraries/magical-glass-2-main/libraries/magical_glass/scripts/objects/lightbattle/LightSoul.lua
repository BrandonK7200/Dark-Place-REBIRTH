local LightSoul, super = Class(Object, "LightSoul")

function LightSoul:init(x, y, color, options)
    super.init(self, x, y)

    -- sprite, transition_sprite, enable_grazing
    options = options or {}

    if options["sprite"] then
        self:setColor(COLORS.white)
    elseif color then
        self:setColor(color)
    else
        self:setColor(COLORS.red)
    end

    self.layer = BATTLE_LAYERS["soul"]

    self.default_sprite = options["sprite"] or "player/heart_light"
    self.transition_sprite = options["transition_sprite"] or "player/heart_menu"

    self.sprite = Sprite(self.default_sprite)
    self.sprite:setOrigin(0.5, 0.5)
    self.sprite.inherit_color = true
    self:addChild(self.sprite)

    self.debug_rect = {-8, -8, 16, 16}

    self.width = self.sprite.width
    self.height = self.sprite.height

    self.collider = CircleCollider(self, 0, 0, 8)

    self.graze_tp_factor   = 1
    self.graze_time_factor = 1
    self.graze_size_factor = 1
    for _,party in ipairs(Game.party) do
        self.graze_tp_factor   = math.min(3, self.graze_tp_factor   + party:getStat("graze_tp"))
        self.graze_time_factor = math.min(3, self.graze_time_factor + party:getStat("graze_time"))
        self.graze_size_factor = math.min(3, self.graze_size_factor + party:getStat("graze_size"))
    end

    self.graze_sprite = GrazeSprite()
    self.graze_sprite:setOrigin(0.5, 0.5)
    self.graze_sprite.inherit_color = true
    self.graze_sprite.graze_scale = self.graze_size_factor
    self:addChild(self.graze_sprite)

    self.graze_collider = CircleCollider(self, 0, 0, 20 * self.graze_size_factor)
    self.grazing = options["enable_grazing"] or false
    self.graze_collider.collidable = self.grazing

    self.speed = 4

    self.inv_timer = 0
    self.inv_flash_timer = 0

    -- 1px movement increments
    self.partial_x = (self.x % 1)
    self.partial_y = (self.y % 1)

    self.last_collided_x = false
    self.last_collided_y = false

    self.x = math.floor(self.x)
    self.y = math.floor(self.y)

    self.moving_x = 0
    self.moving_y = 0

    self.noclip = false
    self.slope_correction = true

    self.shard_x_table = {-2, 0, 2, 8, 10, 12}
    self.shard_y_table = {0, 3, 6}

    self.can_move = false
    self.allow_focus = true
end

-- Callbacks

function LightSoul:onWaveStart() end
function LightSoul:onMenuWaveStart() end

function LightSoul:onCollide(bullet)
    -- Handles damage
    bullet:onCollide(self)
end

function LightSoul:onDamage(bullet, amount)
    for _,party in ipairs(Game.battle.party) do
        for _,equip in ipairs(party.chara:getEquipment()) do
            self.inv_timer = equip:applyInvBonus(self.inv_timer)
        end
    end
end

function LightSoul:onSquished(solid)
    -- Called when the soul is squished by a solid
    solid:onSquished(self)
end

function LightSoul:onRemove(parent)
    super.onRemove(self, parent)

    if parent == Game.battle and Game.battle.soul == self then
        Game.battle.soul = nil
    end
end

-- Functions

function LightSoul:startTransition(scale, origin)
    self.sprite:setSprite(self.transition_sprite)
    self.sprite:setScale(scale or 2)
    self.sprite:setOrigin(origin or 0.5)
end

function LightSoul:reset()
    self.sprite:setSprite(self.default_sprite)
    self.sprite:setScale(1)
    self.sprite:setOrigin(0.5)
end

function LightSoul:toggle(active)
    if active == nil then
        self.collidable = not self.collidable
        self.visible = not self.visible
    else
        self.collidable = active
        self.visible = active
    end
end

function LightSoul:toggleGrazing(active)
    if active == nil then
        self.grazing = not self.grazing
    else
        self.grazing = active
    end
    self.graze_collider.collidable = self.grazing
end

function LightSoul:getExactPosition(x, y)
    return self.x + self.partial_x, self.y + self.partial_y
end

function LightSoul:setExactPosition(x, y)
    self.x = math.floor(x)
    self.partial_x = x - self.x
    self.y = math.floor(y)
    self.partial_y = y - self.y
end

function LightSoul:isMoving()
    return self.moving_x ~= 0 or self.moving_y ~= 0
end

function LightSoul:move(x, y, speed)
    local movex, movey = x * (speed or 1), y * (speed or 1)

    local mxa, mxb = self:moveX(movex, movey)
    local mya, myb = self:moveY(movey, movex)

    local moved = (mxa and not mxb) or (mya and not myb)
    local collided = (not mxa and not mxb) or (not mya and not myb)

    return moved, collided
end

function LightSoul:moveX(amount, move_y)
    local last_collided = self.last_collided_x and (Utils.sign(amount) == self.last_collided_x)

    if amount == 0 then
        return not last_collided, true
    end

    self.partial_x = self.partial_x + amount

    local move = math.floor(self.partial_x)
    self.partial_x = self.partial_x % 1

    if move ~= 0 then
        local moved = self:moveXExact(move, move_y)
        return moved
    else
        return not last_collided
    end
end

function LightSoul:moveY(amount, move_x)
    local last_collided = self.last_collided_y and (Utils.sign(amount) == self.last_collided_y)

    if amount == 0 then
        return not last_collided, true
    end

    self.partial_y = self.partial_y + amount

    local move = math.floor(self.partial_y)
    self.partial_y = self.partial_y % 1

    if move ~= 0 then
        local moved = self:moveYExact(move, move_x)
        return moved
    else
        return not last_collided
    end
end

function LightSoul:moveXExact(amount, move_y)
    local sign = Utils.sign(amount)
    for i = sign, amount, sign do
        local last_x = self.x
        local last_y = self.y

        self.x = self.x + sign

        if not self.noclip then
            Object.uncache(self)
            Object.startCache()
            local collided, target = Game.battle:checkSolidCollision(self)
            if self.slope_correction then
                if collided and not (move_y > 0) then
                    for j = 1, 2 do
                        Object.uncache(self)
                        self.y = self.y - 1
                        collided, target = Game.battle:checkSolidCollision(self)
                        if not collided then break end
                    end
                end
                if collided and not (move_y < 0) then
                    self.y = last_y
                    for j = 1, 2 do
                        Object.uncache(self)
                        self.y = self.y + 1
                        collided, target = Game.battle:checkSolidCollision(self)
                        if not collided then break end
                    end
                end
            end
            Object.endCache()

            if collided then
                self.x = last_x
                self.y = last_y

                if target and target.onCollide then
                    target:onCollide(self)
                end

                self.last_collided_x = sign
                return false, target
            end
        end
    end
    self.last_collided_x = 0
    return true
end

function LightSoul:moveYExact(amount, move_x)
    local sign = Utils.sign(amount)
    for i = sign, amount, sign do
        local last_x = self.x
        local last_y = self.y

        self.y = self.y + sign

        if not self.noclip then
            Object.uncache(self)
            Object.startCache()
            local collided, target = Game.battle:checkSolidCollision(self)
            if self.slope_correction then
                if collided and not (move_x > 0) then
                    for j = 1, 2 do
                        Object.uncache(self)
                        self.x = self.x - 1
                        collided, target = Game.battle:checkSolidCollision(self)
                        if not collided then break end
                    end
                end
                if collided and not (move_x < 0) then
                    self.x = last_x
                    for j = 1, 2 do
                        Object.uncache(self)
                        self.x = self.x + 1
                        collided, target = Game.battle:checkSolidCollision(self)
                        if not collided then break end
                    end
                end
            end
            Object.endCache()

            if collided then
                self.x = last_x
                self.y = last_y

                if target and target.onCollide then
                    target:onCollide(self)
                end

                self.last_collided_y = sign
                return i ~= sign, target
            end
        end
    end
    self.last_collided_y = 0
    return true
end

function LightSoul:doMovement()
    local speed = self.speed

    -- Do speed calculations here if required.

    if self.allow_focus then
        if Input.down("cancel") then speed = speed / 2 end -- Focus mode.
    end

    local move_x, move_y = 0, 0

    -- Keyboard input:
    if Input.down("left")  then move_x = move_x - 1 end
    if Input.down("right") then move_x = move_x + 1 end
    if Input.down("up")    then move_y = move_y - 1 end
    if Input.down("down")  then move_y = move_y + 1 end

    self.moving_x = move_x
    self.moving_y = move_y

    if move_x ~= 0 or move_y ~= 0 then
        if not self:move(move_x, move_y, speed * DTMULT) then
            self.moving_x = 0
            self.moving_y = 0
        end
    end
end

function LightSoul:shatter(count)
    Assets.playSound("break2")

    local shard_count = count or 6

    self.shards = {}
    for i = 1, shard_count do
        local x_pos = self.shard_x_table[((i - 1) % #self.shard_x_table) + 1]
        local y_pos = self.shard_y_table[((i - 1) % #self.shard_y_table) + 1]
        local shard = Sprite("player/heart_shard", self.x + x_pos, self.y + y_pos)
        shard:setColor(self:getColor())
        shard.physics.direction = math.rad(Utils.random(360))
        shard.physics.speed = 7
        shard.physics.gravity = 0.2
        shard.layer = self.layer
        shard:play(5/30)
        table.insert(self.shards, shard)
        self.stage:addChild(shard)
    end

    self:remove()
end

function LightSoul:update()
    -- Input movement
    if self.can_move then
        self:doMovement()
    end

    -- Bullet collision
    if self.inv_timer > 0 then
        self.inv_timer = Utils.approach(self.inv_timer, 0, DT)
    end

    local collided_bullets = {}
    Object.startCache()
    for _,bullet in ipairs(Game.stage:getObjects(Bullet)) do
        if bullet:collidesWith(self.collider) then
            -- Store collided bullets to a table before calling onCollide
            -- to avoid issues with cacheing inside onCollide
            table.insert(collided_bullets, bullet)
        end
        if self.inv_timer == 0 and Game.battle:getState() == "DEFENDING" then
            if bullet.tp ~= 0 and bullet:collidesWith(self.graze_collider) then
                if bullet.grazed then
                    Game:giveTension(bullet.tp * DT * self.graze_tp_factor)
                    if Game.battle.wave_timer < Game.battle.wave_length - (1/3) then
                        Game.battle.wave_timer = Game.battle.wave_timer + (bullet.time_bonus * (DT / 30) * self.graze_time_factor)
                    end
                    if self.graze_sprite.timer < 0.1 then
                        self.graze_sprite.timer = 0.1
                    end
                else
                    Assets.playSound("graze")
                    Game:giveTension(bullet.tp * self.graze_tp_factor)
                    if Game.battle.wave_timer < Game.battle.wave_length - (1/3) then
                        Game.battle.wave_timer = Game.battle.wave_timer + ((bullet.time_bonus / 30) * self.graze_time_factor)
                    end
                    self.graze_sprite.timer = 1/3
                    bullet.grazed = true
                end
            end
        end
    end
    Object.endCache()
    for _,bullet in ipairs(collided_bullets) do
        self:onCollide(bullet)
    end

    if self.inv_timer > 0 then
        self.inv_flash_timer = self.inv_flash_timer + DT
        local amt = math.floor(self.inv_flash_timer / (2/30)) -- flashing is faster in ut
        if (amt % 2) == 1 then
            self.sprite:setColor(0.5, 0.5, 0.5)
        else
            self.sprite:setColor(1, 1, 1)
        end
    else
        self.inv_flash_timer = 0
        self.sprite:setColor(1, 1, 1)
    end

    super.update(self)
end

function LightSoul:draw()
    super.draw(self)

    if DEBUG_RENDER then
        self.collider:draw(0, 1, 0)
        if self.grazing then
            self.graze_collider:draw(1, 1, 1, 0.33)
        end
    end
end

return LightSoul