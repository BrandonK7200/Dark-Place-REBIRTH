local actor, super = Class(Actor, "darkbeard")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Captain Darkbeard"

    -- Width and height for this actor, used to determine its center
    self.width = 25
    self.height = 47

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {5, 34, 15, 13}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0, 0}

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "world/npcs/darkbeard"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "darkbeard"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = {0, 4}

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false
	
	self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},
    }
end

return actor