return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 47,
  height = 21,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 45,
  properties = {
    ["border"] = "leaves",
    ["light"] = true,
    ["music"] = "deltarune/mus_school"
  },
  tilesets = {
    {
      name = "school",
      firstgid = 1,
      filename = "../../../../../tilesets/school.tsx"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../../assets/sprites/world/maps/hometown/school/school_lobby.png",
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
      id = 4,
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
          shape = "polygon",
          x = 80,
          y = 520,
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
          id = 2,
          name = "",
          class = "",
          shape = "polygon",
          x = 120,
          y = 480,
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
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 160,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          class = "",
          shape = "rectangle",
          x = 278,
          y = 400,
          width = 522,
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
          x = 760,
          y = 80,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          class = "",
          shape = "rectangle",
          x = 800,
          y = 80,
          width = 80,
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
          x = 840,
          y = 0,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1000,
          y = 0,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1000,
          y = 80,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1080,
          y = 80,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1080,
          y = 400,
          width = 560,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1718,
          y = 400,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1760,
          y = 400,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1080,
          y = 520,
          width = 680,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1080,
          y = 560,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1000,
          y = 640,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          class = "",
          shape = "rectangle",
          x = 1000,
          y = 680,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          class = "",
          shape = "rectangle",
          x = 840,
          y = 680,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          class = "",
          shape = "rectangle",
          x = 760,
          y = 640,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          class = "",
          shape = "rectangle",
          x = 760,
          y = 560,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          class = "",
          shape = "rectangle",
          x = 80,
          y = 520,
          width = 720,
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
      id = 5,
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
          id = 22,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 200,
          y = 400,
          width = 78,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 1,
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "light/hometown/school/kris_class",
            ["marker"] = "spawn",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 23,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 1640,
          y = 400,
          width = 78,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 1,
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "light/hometown/school/toriel_class",
            ["marker"] = "spawn",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 24,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 880,
          y = 820,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "light/hometown/town_school",
            ["marker"] = "entryschool"
          }
        },
        {
          id = 25,
          name = "transition",
          class = "",
          shape = "rectangle",
          x = 880,
          y = -40,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "up",
            ["map"] = "light/hometown/school/school_door",
            ["marker"] = "spawn"
          }
        },
        {
          id = 30,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 1208,
          y = 360,
          width = 114,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* Do you like,[wait:5] breathing?[wait:5] Moving fast,[wait:5] with or without,[wait:5] legs?",
            ["text2"] = "* But usually,[wait:5] with legs?",
            ["text3"] = "* Join the Cross Country Team with Jockington,[wait:5] and Noelle!"
          }
        },
        {
          id = 31,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 1112,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (You ran the water fountain.)\n[wait:5]* (It's lukewarm.)"
          }
        },
        {
          id = 32,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 592,
          y = 360,
          width = 114,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (Are you ready for the Sadie Hawkman's dance?)",
            ["text2"] = "* (At this dance,[wait:5] all the chaperones wear giant hawk heads...)",
            ["text3"] = "* (... and screech at any students that make contact while dancing.)"
          }
        },
        {
          id = 33,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 1400,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Locker.[wait:5] It's locked.)"
          }
        },
        {
          id = 35,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 1440,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Locker.[wait:5] It's locked.)"
          }
        },
        {
          id = 36,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 1480,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Locker.[wait:5] It's locked.)"
          }
        },
        {
          id = 37,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 1560,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (It's your locker.)\n[wait:5]* (It's empty.)"
          }
        },
        {
          id = 38,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 1520,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (This used to be your brother's locker.)"
          }
        },
        {
          id = 39,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 320,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* The locker is locked."
          }
        },
        {
          id = 41,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 360,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* The locker is locked."
          }
        },
        {
          id = 42,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 400,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* The locker is locked."
          }
        },
        {
          id = 43,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 440,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* The locker is locked."
          }
        },
        {
          id = 44,
          name = "interactable",
          class = "",
          shape = "rectangle",
          x = 480,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (The locker is covered in Jockington memorabilia.)"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
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
          id = 26,
          name = "entrykris",
          class = "",
          shape = "point",
          x = 240,
          y = 480,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "spawn",
          class = "",
          shape = "point",
          x = 940,
          y = 800,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "entrytoriel",
          class = "",
          shape = "point",
          x = 1680,
          y = 480,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "entrydark",
          class = "",
          shape = "point",
          x = 940,
          y = 40,
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
