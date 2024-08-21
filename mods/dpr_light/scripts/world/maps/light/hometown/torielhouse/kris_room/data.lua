return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 21,
  properties = {
    ["border"] = "leaves",
    ["light"] = true,
    ["music"] = "deltarune/home"
  },
  tilesets = {
    {
      name = "hometownobjects",
      firstgid = 1,
      filename = "../../../../../tilesets/hometownobjects.tsx",
      exportfilename = "../../../../../tilesets/hometownobjects.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../../assets/sprites/world/maps/hometown/torielhouse/kris_room.png",
      id = 2,
      name = "room",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          class = "",
          shape = "rectangle",
          x = 80,
          y = 400,
          width = 210,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          class = "",
          shape = "rectangle",
          x = 250,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 40,
          y = 80,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          class = "",
          shape = "rectangle",
          x = 40,
          y = 40,
          width = 520,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          class = "",
          shape = "rectangle",
          x = 560,
          y = 40,
          width = 40,
          height = 400,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          class = "",
          shape = "rectangle",
          x = 370,
          y = 400,
          width = 190,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          class = "",
          shape = "rectangle",
          x = 370,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 8,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 190,
          y = 200,
          width = 82,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* A very old school ID with an embarrassing haircut."
          }
        },
        {
          id = 9,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 378,
          y = 200,
          width = 82,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* There's nothing useful in the drawer."
          }
        },
        {
          id = 10,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 272,
          y = 160,
          width = 106,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* (It's a beautiful day outside.)",
            ["text2"] = "* (...)",
            ["text3"] = "* (Human, i remember you're [color:red]GENOCIDES[color:reset].)"
          }
        },
        {
          id = 11,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 80,
          y = 196,
          width = 100,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown.asriel_bed",
            ["solid"] = true
          }
        },
        {
          id = 12,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 466,
          y = 200,
          width = 94,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* Underneath the bed is an old cartridge of \"Cat Petters RPG\".",
            ["text2"] = "* \"catti `& catty\" can be seen faintly written on it in worn gel pen."
          }
        },
        {
          id = 13,
          name = "",
          class = "",
          shape = "rectangle",
          x = 470,
          y = 390,
          width = 74,
          height = 60,
          rotation = 0,
          gid = 34,
          visible = true,
          properties = {
            ["solid"] = true
          }
        },
        {
          id = 14,
          name = "",
          class = "",
          shape = "rectangle",
          x = 466,
          y = 274,
          width = 92,
          height = 76,
          rotation = 0,
          gid = 35,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          class = "",
          shape = "rectangle",
          x = 84,
          y = 400,
          width = 106,
          height = 64,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 88,
          y = 366,
          width = 92,
          height = 34,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* On the computer's desktop is a folder called \"EPIC games Stuff!!!!\"",
            ["text2"] = "* It's a poorly-drawn design for a game...",
            ["text3"] = "* Seems the last boss is a creature with giant rainbow wings.",
            ["text4"] = "* Doesn't seem like this game ever saw the light of day..."
          }
        },
        {
          id = 17,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 486,
          y = 354,
          width = 58,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* It's a cage."
          }
        },
        {
          id = 18,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 532,
          y = 322,
          width = 24,
          height = 28,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* It's stained."
          }
        },
        {
          id = 20,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 290,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "light/hometown/torielhouse/toriel_hallway",
            ["marker"] = "spawn"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 19,
          name = "spawn",
          class = "",
          shape = "point",
          x = 330,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
