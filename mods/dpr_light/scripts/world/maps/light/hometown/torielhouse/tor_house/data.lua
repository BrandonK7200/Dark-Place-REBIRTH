return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 35,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 38,
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
      image = "../../../../../../../assets/sprites/world/maps/hometown/torielhouse/living_room.png",
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
          x = 342,
          y = 80,
          width = 44,
          height = 236,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          class = "",
          shape = "rectangle",
          x = 386,
          y = 276,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          class = "",
          shape = "polygon",
          x = 428,
          y = 316,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = 40, y = -40 }
          },
          properties = {}
        },
        {
          id = 4,
          name = "",
          class = "",
          shape = "rectangle",
          x = 468,
          y = 236,
          width = 228,
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
          x = 684,
          y = 280,
          width = 134,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          class = "",
          shape = "polygon",
          x = 818,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = 40, y = -40 }
          },
          properties = {}
        },
        {
          id = 7,
          name = "",
          class = "",
          shape = "rectangle",
          x = 818,
          y = 218,
          width = 40,
          height = 62,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          class = "",
          shape = "rectangle",
          x = 858,
          y = 218,
          width = 290,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          class = "",
          shape = "polygon",
          x = 1192,
          y = 324,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = -40, y = -40 }
          },
          properties = {}
        },
        {
          id = 11,
          name = "",
          class = "",
          shape = "polygon",
          x = 1156,
          y = 282,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -40, y = 40 },
            { x = -120, y = 0 },
            { x = 0, y = -40 }
          },
          properties = {}
        },
        {
          id = 13,
          name = "",
          class = "",
          shape = "polygon",
          x = 1270,
          y = 402,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = -40, y = -40 }
          },
          properties = {}
        },
        {
          id = 14,
          name = "",
          class = "",
          shape = "polygon",
          x = 246,
          y = 314,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -40, y = 0 },
            { x = -40, y = 40 }
          },
          properties = {}
        },
        {
          id = 15,
          name = "",
          class = "",
          shape = "polygon",
          x = 138,
          y = 422,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = 40, y = -40 }
          },
          properties = {}
        },
        {
          id = 16,
          name = "",
          class = "",
          shape = "rectangle",
          x = 236,
          y = 80,
          width = 40,
          height = 236,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          class = "",
          shape = "rectangle",
          x = 158,
          y = 400,
          width = 1112,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          class = "",
          shape = "rectangle",
          x = 418,
          y = 384,
          width = 308,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          class = "",
          shape = "rectangle",
          x = 854,
          y = 382,
          width = 282,
          height = 18,
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
          id = 17,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 166,
          y = 342,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 0.3,
            ["exit_sound"] = "doorclose",
            ["facing"] = "left",
            ["map"] = "light/hometown/torielhouse/toriel_bathroom",
            ["marker"] = "spawn",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 18,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 1192,
          y = 320,
          width = 40,
          height = 42,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 0.3,
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "light/hometown/krisyard",
            ["marker"] = "entryhouse",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 19,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 276,
          y = 154,
          width = 66,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 0.3,
            ["facing"] = "down",
            ["map"] = "light/hometown/torielhouse/toriel_hallway",
            ["marker"] = "entryeast",
            ["sound"] = "escaped"
          }
        },
        {
          id = 21,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 754,
          y = 280,
          width = 44,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* It's a landline phone.\n[wait:5]* But you already have a cell phone."
          }
        },
        {
          id = 22,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 458,
          y = 236,
          width = 76,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* It's a sink. You could wash your hands here.",
            ["text2"] = "* ...[wait:5] but,[wait:5] isn't the sink in the bathroom better?"
          }
        },
        {
          id = 23,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 534,
          y = 236,
          width = 82,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Mom didn't cooked anything today.)"
          }
        },
        {
          id = 24,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 616,
          y = 236,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Cookie cutters for gingerbread monsters and gingerbread humans.)"
          }
        },
        {
          id = 25,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 412,
          y = 260,
          width = 44,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* There's a photo on the fridge.[wait:5] It's of you,[wait:5] your mother, and your brother."
          }
        },
        {
          id = 26,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 948,
          y = 258,
          width = 94,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (The Tv is broken.)"
          }
        },
        {
          id = 27,
          name = "",
          class = "",
          shape = "rectangle",
          x = 370,
          y = 400,
          width = 830,
          height = 94,
          rotation = 0,
          gid = 38,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 1148,
          y = 382,
          width = 52,
          height = 18,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* It's a book of hymns."
          }
        },
        {
          id = 31,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 684,
          y = 280,
          width = 44,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* It's a trashcan.\n[wait:5]* Somehow,[wait:5] its floral scent has increased."
          }
        },
        {
          id = 36,
          name = "",
          class = "",
          shape = "rectangle",
          x = 846,
          y = 324,
          width = 94,
          height = 104,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 852,
          y = 280,
          width = 88,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (It's Chairiel!)\n[wait:5]* (The beloved living room chair!)"
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
          id = 33,
          name = "entrybathroom",
          class = "",
          shape = "point",
          x = 246,
          y = 366,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "spawn",
          class = "",
          shape = "point",
          x = 310,
          y = 222,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "entryeast",
          class = "",
          shape = "point",
          x = 1158,
          y = 346,
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
