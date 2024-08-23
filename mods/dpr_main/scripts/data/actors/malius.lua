local actor, super = Class(Actor, "malius")

function actor:init()
    super.init(self)

    self.name = "Malius"

    self.width = 43
    self.height = 52

    self.hitbox = {6, 35, 28, 14}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "world/npcs/malius"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
    }

    self.offsets = {
        ["idle"] = {0, 0},
    }
end

return actor