require_relative './maps.rb'
require_relative './profbirchhome.rb'

class ProfBirchHomeUpstairs < Map
    def initialize(player)
        @map = [
            ['1','`','D','`','`','`','`','`','`','`','2',],
            ['|','S','S','S','S','clock','tv','S','books','pc','|',],
            ['|','S','S','S','S','S','S','S','S','chair','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','bed','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['3','`','`','`','`','`','`','`','`','`','4',],
        ]
        @name = 'Prof Birch House | Level 1'
        @pos_x = 1
        @pos_y = 2
        @saved_variable = 'S'
        @player = player
        @player_icon = @player.player_icon
        @other_icon = @player.other_icon
        @map[@pos_x][@pos_y] = 'X'

    end

    # Map specific stuff - map exit & interactions with Prof. Birch child
    def move(direction) 
        # Exit map check
        if direction == 'up' && @pos_y == 2 && @pos_x == 1
            ProfBirchHome.new(@player, 'top').begin
        # If interacting with Prof Birch Child in first time instance, do a speech & animation
        elsif @player.profbirchhomeupstairs == 'first' 
            if (direction == 'up' && @pos_y == 8 && @pos_x == 3) || (direction == 'right' && @pos_y ==7 && @pos_x == 2) || (direction == 'left' && @pos_x == 2 && @pos_y == 9)
                slowly("POKEMON fully restored!\nItems ready, and... Huh?")
                reset_map
                slowly("Huh? Who... Who are you?")
                reset_map
                slowly("... ... ... ... ... ... ... ...\n... ... ... ... ... ... ... ...")
                reset_map
                slowly("Oh, you're #{ @player.name }.\nSo your move was today.")
                reset_map
                slowly("Um... I'm #{ @player.other_name }.\nGlad to meet you!")
                reset_map
                slowly("I...\nI have this dream of becoming friends")
                slowly("with POKEMON all over the world.")
                reset_map
                slowly("I... I heard about you, #{ @player.name }, from\nmy dad, PROF. BIRCH.")
                reset_map
                slowly("I was hoping that you would be nice,\n#{ @player.name }, and that we could be friends.")
                reset_map
                slowly("On, this is silly, isn't it?\nI... I've just met you, #{ @player.name }.")
                reset_map
                slowly("Eheheh...")
                reset_map
                slowly("Oh, no! I forgot!")
                reset_map
                slowly("I was supposed to go help Dad catch\nsome wild POKEMON!")
                reset_map
                slowly("#{ @player.name }, I'll catch you later!")
                @map[2][8] = 'S'
                if @pos_y != 7
                    print_map
                    @map[2][7] = 'other_icon'
                    reset_map 0.5
                    @map[2][7] = 'S'
                    @map[2][6] = 'other_icon'
                    reset_map 0.5
                else
                    @map[3][8] = 'other_icon'
                    reset_map 0.5
                    @map[3][8] = 'S'
                    @map[3][7] = 'other_icon'
                    reset_map 0.5
                    @map[3][7] = 'S'
                    @map[3][6] = 'other_icon'
                    reset_map 0.5
                    @map[3][6] = 'S'
                    @map[2][6] = 'other_icon'
                    reset_map 0.5
                end
                @map[2][6] = 'S'
                @map[2][5] = 'other_icon'
                reset_map 0.5
                @map[2][5] = 'S'
                @map[2][4] = 'other_icon'
                reset_map 0.5
                @map[2][4] = 'S'
                @map[2][3] = 'other_icon'
                reset_map 0.5
                @map[2][3] = 'S'
                @map[2][2] = 'other_icon'
                reset_map 0.5
                @map[2][2] = 'S'
                @map[1][2] = 'other_icon'
                reset_map 0.5
                @map[1][2] = 'S'
                reset_map 0.5
                @player.profbirchhomeupstairs = 'second'
                @player.littleroot = 'third'
            end
        end
        super
    end

    # Places Prof Birch child in her room
    def time_setup
        @player.profbirchhomeupstairs == 'first' ? @map[2][8] = 'other_icon' : nil
    end

    # Check for time setup (first time shenanigans)
    def begin
        time_setup
        super
    end

end