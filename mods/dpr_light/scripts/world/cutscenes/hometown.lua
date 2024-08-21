return {
    ---@param cutscene WorldCutscene
    i_remember_youre = function(cutscene, event, player)
        local sans_meme = cutscene:getCharacter("sans_meme")
        local trashnado = Game.world:getEvent(12)
		
        if not Game.world.sanscheck then
            Game.world.sanscheck = 0
        end

        local function flashScreen()
            local flash = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
            flash.layer = 100
            flash.color = { 1, 1, 1 }
            flash.alpha = 1
            flash.parallax_x = 0
            flash.parallax_y = 0
            Game.world:addChild(flash)
            Game.world.timer:tween(1.5, flash, { alpha = 0 }, "linear", function()
                flash:remove()
            end)
        end

        local function shakeScreen()
            cutscene:shakeCamera(10)
        end

		local function remembering()
            Game.world.music:pause()
            if Game.world.sanscheck == 1 then
                sans_meme:setSprite("neutrals")
            elseif Game.world.sanscheck == 2 then
                sans_meme:setSprite("pacifists")
            elseif Game.world.sanscheck == 3 then
                sans_meme:setSprite("non_binary")
            elseif Game.world.sanscheck == "3alt" then
                sans_meme:setSprite("transgender")
            elseif Game.world.sanscheck == 4 then
                sans_meme:setSprite("search_history")
            elseif Game.world.sanscheck == 5 then
                sans_meme:setSprite("depressed")
            elseif Game.world.sanscheck == 7 then
                sans_meme:setSprite("wtf")
            end
		end

        if Game.world.sanscheck == 0 then
            cutscene:showNametag("Sans?", {font = "sans"})
            cutscene:text("[font:sans]* human..[wait:5] i remember you're [wait:10][facec:sans/meme/genocides][func:1][func:2][sound:vineboom][style:GONER][color:red][instant]genocides.[stopinstant][color:reset]", "serious", "sans", {
                functions = {
                    flashScreen,
                    remembering,
                }
            })
            cutscene:hideNametag()
            Game.world.music:resume()
        elseif Game.world.sanscheck == 1 then
            cutscene:showNametag("Sans?", {font = "sans"})
            cutscene:text("[font:sans]* human..[wait:5] i remember you're [wait:10][facec:sans/meme/neutrals][func:1][func:2][sound:mercyadd][style:GONER][instant][color:yellow]neutrals.[stopinstant][color:reset]", "serious", "sans", {
                functions = {
                    flashScreen,
                    remembering,
                }
            })
            cutscene:hideNametag()
            Game.world.music:resume()
        elseif Game.world.sanscheck == 2 then
            cutscene:showNametag("Sans?", {font = "sans"})
            cutscene:text("[font:sans]* human..[wait:5] i remember you're [wait:10][facec:sans/meme/pacifists][func:1][func:2][sound:sparkle_glock][style:GONER][color:green][instant]pacifists.[stopinstant][color:reset]", "serious", "sans", {
                functions = {
                    flashScreen,
                    remembering,
                }
            })
            cutscene:hideNametag()
            Game.world.music:resume()
        elseif Game.world.sanscheck == 3 then
            cutscene:showNametag("Sans?", {font = "sans"})
            cutscene:text("[font:sans]* human..[wait:5] i remember you're [wait:10][facec:sans/meme/nonbinary][func:1][func:2][sound:sparkle_gem][style:GONER][instant][color:yellow]no[color:white]n-[color:purple]bin[color:404040]ary.[stopinstant][color:reset]", "serious", "sans", {
                functions = {
                    flashScreen,
                    remembering,
                }
            })
            if Game.world:getCharacter("brenda_lw") then
                cutscene:showNametag("Brenda")
                cutscene:text("* Uh,[wait:5] I'm trans,[wait:5] not non-binary.", "suspicious", "brenda")
                cutscene:showNametag("Sans?", {font = "sans"})
                cutscene:text("[font:sans]* oh.", "neutral", "sans")
                Game.world.sanscheck = "3alt"
                sans_meme:resetSprite()
                cutscene:text("[font:sans]* human..[wait:5] i remember you're [wait:10][facec:sans/meme/nonbinary][func:1][func:2][sound:sparkle_gem][style:GONER][instant][color:#00FFFF]tr[color:pink]an[color:white]sge[color:pink]nd[color:#00FFFF]er.[stopinstant][color:reset]", "serious", "sans", {
                    functions = {
                        flashScreen,
                        remembering,
                    }
                })
                Game.world.sanscheck = 3
            end
            cutscene:hideNametag()
            Game.world.music:resume()
        elseif Game.world.sanscheck == 4 then
            cutscene:showNametag("Sans?", {font = "sans"})
            cutscene:text("[font:sans]* human..[wait:5] i remember you're [wait:10][facec:sans/meme/searchhistory][func:1][func:2][sound:fartrevshort][style:GONER][instant][color:ff8000]search history.[stopinstant][color:reset]", "serious", "sans", {
                functions = {
                    flashScreen,
                    remembering,
                }
            })
            cutscene:hideNametag()
            Game.world.music:resume()
        elseif Game.world.sanscheck == 5 then
            cutscene:showNametag("Sans?", {font = "sans"})
            cutscene:text("[font:sans]* human[wait:10]\n* i am [wait:10][facec:sans/meme/depressed][func:1][func:2][sound:boowomp][style:GONER][instant][color:4782c9]depressed.[stopinstant][color:reset]", "serious", "sans", {
                functions = {
                    flashScreen,
                    remembering,
                }
            })
            cutscene:hideNametag()
            Game.world.music:resume()
        elseif Game.world.sanscheck == 6 then
            Game.world.music:pause()
            sans_meme:explode(0, 0, true)
            cutscene:wait(0.2)
            sans_meme:setSprite("bbg")
            cutscene:wait(2)
            cutscene:showNametag("Sans?", {font = "sans"})
            cutscene:text("[noskip][voice:none][font:sans]*[sound:daddygirl] baby girl?[wait:50]\n* [sound:babyhome][sound:vineboom][func:1][style:GONER][color:red]daddy's[stopinstant][style:none][color:reset] home.", "meme/bbg", "sans", {
                functions = {
                    flashScreen,
                }
            })
            cutscene:hideNametag()
            Game.world.music:resume()
        elseif Game.world.sanscheck == 7 then
            Game.world.music:pause()
            cutscene:showNametag("Sans?", {font = "sans"})
            cutscene:text("[font:sans]* what[wait:20] the [wait:20][facec:sans/meme/wtf][func:1][func:2][sound:heavydamage][instant]FUCK.[stopinstant]", "serious", "sans", {
                functions = {
                    remembering,
                    shakeScreen,
                }
            })
            cutscene:hideNametag()
            Game.world.music:resume()
        elseif Game.world.sanscheck >= 8 then
            if Game:getFlag("fun") == 8 then
                cutscene:showNametag("Sans?", {font = "sans"})
                cutscene:text("[font:sans]* human...", "eyes_closed", "sans")
                cutscene:hideNametag()
                cutscene:wait(1)
                Game.world.music:pause()
                Assets.playSound("noise")
            
                local dark = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                dark.layer = 9999
                dark.color = { 0, 0, 0 }
                dark.alpha = 1
                dark.parallax_x = 0
                dark.parallax_y = 0
                Game.world:addChild(dark)

                cutscene:wait(0.2)
                Assets.playSound("noise")
                dark.layer = sans_meme.layer - 0.1
                sans_meme:setSprite("lich")
                trashnado:remove()

                cutscene:wait(0.5)
                cutscene:text("* [facec:sans/meme/lich, -18, -10][voice:nil][sound:fall_lich][style:GONER][color:18be14]F a l l .", nil, "sans")
                cutscene:hideNametag()
			
                Assets.playSound("locker")

                for _, party in ipairs(Game.party) do
                local pc = cutscene:getCharacter(party.actor.id)
                pc:shake(4, 0)
                pc:setSprite("battle/hurt")
                if player.facing == "left" then
                    pc.flip_x = true
                end
                end
                cutscene:wait(0.25)

                Assets.stopSound("locker")
                Kristal.hideBorder(0)
                Game.state = "GAMEOVER"
                Game.world:remove()
                Game.gameover = GameOver(SCREEN_WIDTH/2, SCREEN_HEIGHT/2, "[voice:sans]You are alone,[wait:5]\nchild.")
                Game.stage:addChild(Game.gameover)
            else
                cutscene:showNametag("Sans?", {font = "sans"})
                cutscene:text("[font:sans]* human..[wait:5] i remember you're...", "serious", "sans")
                cutscene:text("[font:sans]* ...", "serious", "sans")
                cutscene:hideNametag()
                cutscene:wait(2)
                Assets.playSound("wing")
                sans_meme:setSprite("forgor")
                sans_meme:shake(4, 0)
                cutscene:wait(0.5)
                cutscene:text("[font:sans]* uhhh [wait:5][func:1][func:2][sound:vineboom][style:GONER][color:red][instant]shit[stopinstant][style:none][color:reset][wait:5] uhhh[wait:10] the [func:1][func:2][sound:vineboom][style:GONER][color:red][instant]fuck[stopinstant][style:none][color:reset]\n was i gonna say uhh", "meme/forgor", "sans", {
                    functions = {
                        flashScreen,
                        remembering,
                    }
                })
                cutscene:hideNametag()
                Game.world.music:resume()
            end
        end
        sans_meme:resetSprite()
		
        if Game.world.sanscheck < 8 then
            Game.world.sanscheck = Game.world.sanscheck + 1
        end
    end,

    hospitalpiano = function(cutscene, event)

        cutscene:text("* (It's an obligatory hospital piano,[wait:5] shrunk to fit in the corner.)")
        cutscene:text("* (As a result,[wait:5] it's missing most of the good keys.)")
        cutscene:text("* (Play it?)")
        local opinion = cutscene:choicer({"Yes", "No"})
            if opinion == 1 then
                Assets.playSound("piano")
                cutscene:text("* (Plink...)")
            else
                cutscene:text("* (Your hands linger over the keys doing nothing.)")
                
            end
        
    end,

    hospitaltoy = function(cutscene, event)

        cutscene:text("* (It's a toy with beads on a track.)")
        if Game:getFlag("POST_SNOWGRAVE") then
            cutscene:text("* (One of the blue beads is broken and torn off.)")
        else
            cutscene:text("* (The beads of the toy march on.)")
        end
        
    end,

    asgorefridge = function(cutscene, event)
        
        cutscene:text("* (It's a rusty fridge with some photos on it.)")
        local opinion = cutscene:choicer({"\nOpen\nFridge\n", "Don't", "See photos"})
        if opinion == 1 then
          cutscene:text("* (All that's inside is a jar with a single pickle in it...)")
        elseif opinion == 3 then
            local characters_who_knows_dreemurr = {
                "susie",
                "noelle",
                "berdly",
                "brenda",
                "jamm",
                "noel"
            }
            local leader_id = Mod:getLeader().id
            if leader_id == "kris" then
                cutscene:text("* (A photo of your mother and father on their wedding day.)")
            elseif leader_id == "YOU" then
                cutscene:text("* (A photo of Toriel and a random goat man on a wedding day.)")
                cutscene:text("* (Wait... Toriel was married??)")
            elseif Utils.containsValue(characters_who_knows_dreemurr, leader_id) then
                cutscene:text("* (A photo of Toriel and Asgore on their wedding day.)")
            else
                cutscene:text("* (A photo of two goat monsters on their wedding day.)")
            end
          cutscene:text("* (She's holding a bouquet of seven flowers.)")
          cutscene:text("* (A reindeer-looking monster stands nearby in a tuxedo.)")
          cutscene:text("* (They all look happy.)")
        else
          cutscene:text("* (You decide not to look.)")  
        end
    end,

    librarybook1 = function(cutscene, event)

      cutscene:text("* How To Care For A Human")
      cutscene:text("* (It's a book for monsters about how to care for humans.)")
      local opinion = cutscene:choicer({"Look in\nthe back", "Look inside"})
        if opinion == 1 then
          cutscene:text("* (According to the card in the back...)")
          cutscene:text("* (... looks like your mother took it repeatedly many years ago.)")
        else
            cutscene:text("* (There are photos of unfamiliar humans inside.)")
            local leader_id = Mod:getLeader().id
            if leader_id == "kris" then
                cutscene:text("* (You shut the book quickly.)")
            elseif leader_id == "YOU" then
                cutscene:text("* (Unfortunately, there's no photos of frogs like you.)")
            end
        end

    end,

    librarybook2 = function(cutscene, event)

      cutscene:text("* (It's BOOK 1 about SOULS. Read it?)")
      local opinion = cutscene:choicer({"Read", "Don't"})
        if opinion == 1 then
          cutscene:text("* The SOUL has been called many things.")
          cutscene:text("* The font of our compassion. The source of our will.")
          cutscene:text("* The container of our \"life force.\"")
          cutscene:text("* But even now,[wait:5] the true function of it is unknown.")
        end

    end,

    papyrushouse = function(cutscene, event)

      Assets.playSound("knock")
      cutscene:text("* (Knock knock knock...)")
      cutscene:text("* (...)")
      cutscene:text("* (No response...)\n[wait:5]* (... but the distant trousle of bones.)")

    end,

    sansplin = function(cutscene, event)

      Assets.playSound("bell")

    end,

    iceesoda = function(cutscene, event)

      cutscene:text("* (It's a soda-dispensing machine.)")
      local opinion = cutscene:choicer({"Inspect", "Not"})
        if opinion == 1 then
          cutscene:text("* (You took a look at the flavors.)")
          cutscene:text("* WATER")
          cutscene:text("* ICE")
          cutscene:text("* DOUBLE-ICE")
          cutscene:text("* BREAD")
          cutscene:text("* FLAMIN HOT CHEESE SODA")
          cutscene:text("* GAMER BLOOD ENERGY DRINK")
          cutscene:text("* Juice (Red Flavor)")
        end

    end,
	
    toilet = function(cutscene, event)
        cutscene:text("* (It's a toilet.)[wait:5]\n* (Flush it?)")
        local choice = cutscene:choicer({"Yes", "No"})
        if choice == 1 then
            Game.world.music:fade(0,0.001)
            Assets.playSound("toilet")
			
            cutscene:wait(1)
			
            Assets.playSound("won")
            cutscene:text("* (You flushed the toilet!)")
            Game.world.music:fade(1,1)
        end
    end,
	
    asriel_bed = function(cutscene, event)
        if Game.party[1].id == "YOU" then
            cutscene:text("* It looks like one of the beds from the inn you were staying at.")
            cutscene:text("* Still in perfect condition...[wait:1s] for now.")
            if Game:hasPartyMember("susie") then
                cutscene:showNametag("Susie")
                cutscene:text("* (Why do they look like they want to eat it???)", "nervous_side", "susie")
                cutscene:hideNametag()
            end
        else
            cutscene:text("* There are CDs under the bed.\n[wait:5]* Classical,[wait:5] jazz,[wait:5] religious ska...")
            cutscene:text("* There's also a game console.\n[wait:5]* It has one normal controller,[wait:5] and one knock-off one.")
        end
    end,

    torcar = function(cutscene, event)
        if Game.party[1].id == "kris" then
            cutscene:text("* (It's your mom's car.)")
            cutscene:text("* (Seems like she hasn't replaced the tires yet, judging by the slashes.)")
        elseif Game.party[1].id == "YOU" then
            cutscene:text("* (Looks like the same car that you and Toriel drove in to the orphanage.)")
            cutscene:text("* (...)")
            cutscene:text("* (Actually wait,[wait:5] wasn't it a freight train?)")
            cutscene:text("* (Wait,[wait:5] no. It was an airliner,[wait:5] wasn't it?)")
            cutscene:text("* (No no no,[wait:5] it was a tricycle that suddenly sprouted legs and ran off,[wait:5] right???)")
            cutscene:text("* (...)")
            cutscene:text("* (Well regardless,[wait:5] the car just looks familiar to you.)")
        else
            cutscene:text("* (A red car that can hold up to at least four people.)")
            cutscene:text("* (The tires on the car appear to be slashed.)")
        end
    end,
	
    secret_path = function(cutscene, event)
        local hometown_foundSecretPath = Game:getFlag("hometown_foundSecretPath", false)
        local player = Game.world.player
		
        if hometown_foundSecretPath == false then
            cutscene:text("* (!?)[wait:5]\n* (There's a secret path hidden \nin the tree line.)")
            cutscene:text("* (Will you follow it?)")

            local choice = cutscene:choicer({"Yes", "No"})
            if choice == 1 then
                Game:setFlag("hometown_foundSecretPath", true)
                Game.world:mapTransition("light/hometown/secret_path", "entry_down", "up")
            else
                cutscene:text("* (Perhaps some things are best left unexplored for now.)")
                player:walkTo(player.x, player.y + 20)
                cutscene:wait(2)
            end
        else
            Game.world:mapTransition("light/hometown/secret_path", "entry_down", "up")
        end
    end,

    berdly = function(cutscene, event)
        cutscene:wait(2.5)
        if cutscene:getCharacter("susie_lw") then
            cutscene:showNametag("Susie")
            cutscene:text("* ...", "shock", "susie")
            cutscene:text("* Is...[wait:10]\n* Is that Berdly...?", "shock_down", "susie")
            cutscene:text("* Is this where he's been this whole time...?", "sad_frown", "susie")
            cutscene:text("* ...", "sad", "susie")
            cutscene:text("* He's...[wait:10]\n* He's just sleeping...", "shy_down", "susie")
            cutscene:text("* Right...?", "bangs_neutral", "susie")
        end
        if cutscene:getCharacter("brenda_lw") then
            cutscene:showNametag("Brenda")
            cutscene:text("* Oh no...", "ohgod", "brenda")
            cutscene:text("* Oh nonononono.", "panicattack", "brenda")
            cutscene:text("* I think I'm gonna be sick...", "sad", "brenda")
        end
        if cutscene:getCharacter("dess") then
            cutscene:showNametag("Dess")
            cutscene:text("* oh...[wait:10]\n* oh that's a dead body...", "genuine", "dess")
            cutscene:text("* there is a dead body inside of the library's computer lab", "neutral", "dess")
        end
        cutscene:hideNametag()
    end,
}
