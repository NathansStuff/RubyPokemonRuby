# I = Info Block
# H = House
# S = Path
# D = Door
# E = Exit
# O - Person
# P - Pokemon
# E = Empty
# G = Grass
# C - Car
# L = cLiff

## AWS
require './maps.rb'
require 'colorize'
require './stuff.rb'

class Van < Map
    #Initialises the map
    def initialize(player)
        @player = player
        @name='van'
        @map=[
            ['1','`','`','`','`','`','2',],
            ['|','R','R','R','R','S','|',],
            ['|','R','S','S','S','S','E',],
            ['|','R','S','S','S','S','E',],
            ['|','R','R','R','S','S','E',],
            ['|','R','R','R','R','S','|',],
            ['3','`','`','`','`','`','4',]
            ]
        @pos_x = 2
        @pos_y = 2
        @player_icon=player.player_icon
        @saved_variable='S'
        @map[@pos_x][@pos_y] = 'X'
    end

    #Extends the Map class move direction to load the next map
    def move(direction)
        if direction == 'right' #If exiting the van, load the next map
            if @map[@pos_x][@pos_y + 1] == 'E'
                LittleRoot.new(@player,8,7).begin
            end
        end
        super #Otherwise, do the normal Map move function
    end
end

class LittleRoot < Map
    def initialize(player, x, y)
        @name='Littleroot'
        @map=[
    ['1','`','`','`','`','`','`','`','`','`','`','`','`','E','E','`','`','`','`','`','`','`','`','`','`','2',],
    ['|','T','T','T','T','T','T','T','T','T','T','T','T','S','S','T','T','T','T','T','T','T','T','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','H','H','H','D','H','I','S','S','S','S','I','H','D','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','H','H','H','H','H','H','H','S','S','S','S','S','I','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','H','H','H','H','H','H','H','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','H','H','H','H','H','H','H','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','H','H','H','H','H','D','H','S','S','S','S','S','S','S','S','T','T','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','I','S','S','S','S','S','S','S','S','S','S','T','T','T','T','|',],
    ['|','T','T','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','T','T','T','T','|',],
    ['|','T','T','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','T','T','T','T','|',],
    ['|','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','|',],
    ['3','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','4',],
    ]
    @pos_x=x
    @pos_y=y
    @saved_variable='S'
    @player=player
    @player_icon=@player.player_icon
    @map[@pos_x][@pos_y] = @player_icon
    end

    # If first time, positioning overridden, dialogue and forced exit to playerhousemap
    # If second time, can't leave at top
    def time_setup
        case @player.littleroot
        when 'first' #Places car, mum animation and forces player to next map
            @map[7][4] = 'C'
            @map[7][5] = 'C'
            @map[7][6] = 'C'
            @map[8][4] = 'C'
            @map[8][5] = 'C'
            @map[8][6] = 'C'
            print_map
            @map[7][8] = 'O'
            sleep 1
            print_map
            @map[7][8] = 'S'
            @map[8][8] = 'O'
            sleep 1
            print_map
            slowly("MOM: #{ @player.name }, we're here, honey!")
            slowly("It must be tiring riding with our things in the moving truck")
            reset_map
            slowly("Well, this is LITTLEROOT TOWN.")
            slowly("How do you like it? This is our new home!")
            reset_map
            slowly("It has a quaint feel, but it seems to be an easy place to live, don't you think?")
            reset_map
            slowly("And, you get your own room, #{ @player.name }! Let's go inside.")
            @map[7][8] = 'O'
            @map[8][8] = @player_icon
            @map[@pos_x][@pos_y]='S'
            sleep 1
            print_map
            @map[7][8] = @player_icon
            @map[8][8] = 'S'
            sleep 1
            print_map
            sleep 1
            @player.littleroot = 'second' # Never do this speech again
            PlayerHomeHouse.new(@player,'bot').begin
        when 'second' # Trusty little guard guy stops you from leaving
            @map[2][10] = 'O' 
        when 'third' # Trust little guard is a nervous bystander
            @map[1][13] = 'O'
        end
    end

    # Checks position and direction for stuff (moving to maps)
    def move(direction)
        if @player.littleroot == 'second' # Free to explore town but can't leave
            if direction == 'up'
                if @pos_x == 1 && (@pos_y == 13 || @pos_y == 14) #If trying to exit at top
                    # Little guy stops you
                    @map[2][10] = 'S'
                    @map[2][11] = 'O'
                    reset_map 0.5
                    @map[2][11] = 'S'
                    @map[2][12] = 'O'
                    reset_map 0.5
                    @map[2][12] = 'S'
                    @map[2][13] = 'O'
                    reset_map 0.5
                    @map[2][13] = 'S'
                    # Top exit is two spots wide, little guy takes appropriate pathing depending on player
                    if @pos_y == 13
                        @map[2][14] = 'O'
                        reset_map(0.5)
                        @map[2][14] = 'S'
                        @map[1][14] = 'O'
                        reset_map 0.5
                        @map[1][14] = 'S'
                        @map[0][14] = 'O'
                        reset_map 0.5
                        @map[0][14] = 'D'
                        @map[0][13] = 'O'
                        reset_map 0.5
                        cant_leave_speech 
                        @map[0][13] = 'D'
                        @map[0][14] = 'O'
                        reset_map 0.5
                        @map[0][14] = 'D'
                        @map[1][14] = 'O'
                        reset_map 0.5
                        @map[1][14] = 'S'
                        @map[2][14] = 'O'
                        reset_map 0.5
                        @map[2][14] = 'S'

                    else
                        @map[1][13] = 'O'
                        reset_map 0.5
                        @map[1][13] = 'S'
                        @map[0][13] = 'O'
                        reset_map 0.5
                        @map[0][13] = 'D'
                        @map[0][14] = 'O'
                        reset_map 0.5
                        cant_leave_speech
                        @map[0][14] = 'D'
                        @map[0][13] = 'O'
                        reset_map 0.5
                        @map[0][13] = 'D'
                        @map[1][13] = 'O'
                        reset_map 0.5
                        @map[1][13] = 'S'
                    end
                    # Guy walks back to his guard spot
                    @map[2][13] = 'O'
                    reset_map 0.5
                    @map[2][13] = 'S'
                    @map[2][12] = 'O'
                    reset_map 0.5
                    @map[2][12] = 'S'
                    @map[2][11] = 'O'
                    reset_map 0.5
                    @map[2][11] = 'S'
                    @map[2][10] = 'O'
                end
            end
        end

        if direction == 'up'
            case @pos_x
            when 7
                case @pos_y
                when 8 # Enter Player Home
                    PlayerHomeHouse.new(@player, 'bot').begin
                when 17 # Prof Birch's House
                    ProfBirchHome.new(@player).begin
                end
            when 15
                if @pos_y ==  11 # Prof Birch's Pokemon Lab
                    ProfBirchLab.new(@player).begin
                end
            end
        end

        # Trusty litte guy has to give his 'save the prof plz' speech
        #                                                   player moves into little guy               player moves up past                          player moves into from left
        if @player.littleroot == 'third' && (direction == 'up' && (@pos_x == 2 && @pos_y == 13) || (@pos_x == 1 && @pos_y == 14)) || (direction == 'left' && @pos_x == 1 && @pos_y == 14) 
            slowly("I can hear someone shouting down the\nroad here.")
            slowly("What should I do? What should we do?\nSomeody has to go help...")
        end

        super # Carry on as normal
    end

    # Own method so don't have to write it twice (for 2x player position)
    def cant_leave_speech
        slowly("If you go in the tall grass at the sides\nof this road, wild POKEMON will appear.")
        reset_map
        slowly("It's not safe to go out there if you\ndon't have any POKEMON with you.")
    end

    # Makes begin method check and place time stuff (objects) before beginning
    def begin
        time_setup
        super
    end
end

class PlayerHomeHouse < Map
    def initialize(player, position)
    @name='Player Home'
    @player=player
    @player_icon = @player.player_icon
    if position == 'top'
        @pos_x=2
        @pos_y=9
        @saved_variable='S'
    else
        @pos_x=7
        @pos_y=9  
        @saved_variable='S'  
    end
    @map=[
        ['1','`','`','`','`','`','`','`','`','`','`','`','2',],
        ['|','H','H','H','H','H','H','H','H','D','H','H','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['|','S','S','H','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['|','S','S','S','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['3','`','`','`','`','`','`','`','`','D','D','`','4',],
    ]
    @map[@pos_x][@pos_y] = @player_icon
    end

    #Sets pokemon, mother + dialogue if first time
    def time_setup
        case @player.playerhomehouse
        when 'first' 
            @map[4][5] = 'P'
            @map[2][4] = 'P'
            @map[3][6] = 'H'
            @map[8][10] = 'O'
            print_map
            slowly("MOM: See, Name? Isn't it nice in here, too?")
            reset_map
            slowly("The mover's POKEMON do all the work of moving us in and cleaning up after.")
            slowly("This is so convenient!")
            reset_map
            slowly("Name, your room is upstairs. Go check it out, dear!")
            reset_map
            slowly("DAD bought you a new clock to mark our move here.")
            slowly("Don't forget to set it!")
        when 'second'
             @map[4][5] = 'O'
             print_map
             slowly("MOM: Oh! #{ @player.name }, #{ @player.name }! Quick! Come quickly!")
             @map[2][9] = 'S'
             @map[3][9] = 'X'
             print_map
             sleep 0.5
             @map[3][9] = 'S'
             @map[4][9] = 'X'
             print_map         
             sleep 0.5
             @map[4][9] = 'S'
             @map[4][8] = 'X'
             print_map
             sleep 0.5
             @map[4][8] = 'S'
             @map[4][7] = 'X'
             print_map
             sleep 0.5
             @map[4][7] = 'S'
             @map[4][6] = 'X'
             print_map
             slowly("MOM: Look! It's PETALBURG GYM! Maybe DAD will be on!")
             @map[4][6] = 'S'
             @map[4][5] = 'X'
             @map[4][4] = 'O'
             print_map
             slowly("INTERVIEWER: ...We brought you this report from in front of PETALBURG GYM.")
             slowly("MOM: Oh... It's over.")
             print_map
             slowly("I think DAD was on, but we missed him. Too bad.")
             print_map
             slowly("Oh, yes. One of DAD's friends lives in town.")
             slowly("PROF. BIRCH is his name.")
             print_map
             slowly("He lives right next door, so you should go over and introduce yourself.")
             @map[4][4] = 'S'
             @map[4][3] = 'O'
             print_map
             sleep 0.5
             @map[4][3] = 'S'
             @map[5][3] = 'O'
             @player.playerhomehouse = 'third' # Never again go through this speech
             @pos_x = 4
             @pos_y = 5
             print_map
             

        else
            @map[5][3]='O'
        end
    end

    # Extends map class to check for specific map stuff (locations)
    def move(direction)

        case direction 
        # Load the next map
        when 'up'
            if @pos_x == 2 && @pos_y == 9
                if @player.playerhomehouse == 'first'
                    @player.playerhomehouse = 'second'   # Never do this speech again
                end
                PlayerHomeHouseUpstairs.new(@player).begin # Load the map!
            end
        when 'down'
            if @pos_x == 7 && ( @pos_y == 9 || @pos_y == 10) #Exit bottom of map from top
                if @player.playerhomehouse == 'first' # No escape yet
                    slowly("Well, #{ @player.name }?")
                    slowly("Aren't you interested in seeing your very own room?") 
                else
                    LittleRoot.new(@player, 7,8).begin # Load the map!
                end
            end
        end
        super
    end

    #When beginning, check if it is first time or not
    def begin
        time_setup
        super
    end

end

class PlayerHomeHouseUpstairs < Map
    def initialize(player, time='second')
        @name = 'Home | Level 1'
        @saved_variable = 'S'
        @map = [
            ['1','`','`','`','`','`','`','`','D','`','2',],
            ['|','H','I','S','H','H','I','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','H','H','S','S','S','S','S','S','|',],
            ['|','S','H','H','S','S','S','S','S','S','|',],
            ['|','S','H','H','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['3','`','`','`','`','`','`','`','`','`','4',]
        ]
        @pos_x = 1
        @pos_y = 8
        @player = player
        @player_icon = @player.player_icon
        @map[@pos_x][@pos_y] = @player_icon
    end

    # Map specific moves (exit)
    def move(direction)
        if direction == 'up' && @pos_x == 1 && @pos_y == 8 # Player in correct position
            PlayerHomeHouse.new(@player,'top').begin
        end
        super
    end
end

class ProfBirchHome < Map
    def initialize(player, position='bot')
        @position=position
        @player=player
        @map=[
            ['E','E','E','E','1','`','`','`','`','`','`','`','2',],
            ['1','`','`','D','4','S','S','H','H','H','H','H','|',],
            ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','H','H','H','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','H','H','S','S','S','|',],
            ['|','S','S','S','S','S','S','H','H','O','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
            ['3','`','D','D','`','`','`','`','`','`','`','`','4',],
        ]
        if @position=='bot'
            @pos_x = 7
            @pos_y = 3
        else
            @pos_x = 2
            @pos_y = 3
        end
        @player_icon=@player.player_icon
        @saved_variable='S'
        @map[@pos_x][@pos_y] = @player_icon
    end

    # Creates Birch wife's dialogue for first time entering the house
    def time_setup
        if @player.profbirchhome =='first'
            reset_map 0.5
            @map[6][9] = 'S'
            @map[7][9] = 'O'
            reset_map 0.5
            @map[7][9] = 'S'
            @map[7][8] = 'O'
            reset_map 0.5
            @map[7][8] = 'S'
            @map[7][7] = 'O'
            reset_map 0.5
            @map[7][7] = 'S'
            @map[7][6] = 'O'
            reset_map 0.5
            @map[7][6] = 'S'
            @map[7][5] = 'O'
            reset_map 0.5
            @map[7][5] = 'S'
            @map[7][4] = 'O'
            reset_map 0.5
            slowly("Oh, hello. And you are?")
            reset_map
            slowly("... ... ... ... ... ... ... ... ... \n... ... ... ... ... ... ... ... ... ")
            reset_map
            slowly("Oh, you're #{ @player.name }, our new next-door\nneighbor! Hi!")
            reset_map
            slowly("We have a #{ @player.other_gender } about the same\nage as you.")
            reset_map
            slowly("Our #{ @player.other_gender } was excited about making\na new friend.")
            reset_map
            slowly("Our #{ @player.other_gender } is upstairs I think.")
            reset_map
            @map[7][4] = 'S'
            @map[7][5] = 'O'
            reset_map 0.5
            @map[7][5] = 'S'
            @map[7][6] = 'O'
            reset_map 0.5
            @map[7][6] = 'S'
            @map[7][7] = 'O'
            reset_map 0.5
            @map[7][7] = 'S'
            @map[7][8] = 'O'
            reset_map 0.5
            @map[7][8] = 'S'
            @map[7][9] = 'O'
            reset_map 0.5
            @map[7][9] = 'S'
            @map[6][9] = 'O'
            reset_map
            @player.profbirchhome = 'second'
        end
    end

    # Special movement! (Upstairs or back to town)
    def move(direction)
        # Upstairs
        if direction =='up' && @pos_x == 2 && @pos_y == 3
            ProfBirchHomeUpstairs.new(@player).begin
        # Exit to LittleRoot
        elsif direction == 'down' && @pos_x == 7 && (@pos_y == 2 || @pos_y == 3)
            LittleRoot.new(@player,7, 17).begin
        end
        # Otherwise, move as normal
        super
    end

    # Do time setup first then act as normal
    def begin
        time_setup
        super
    end
end

class ProfBirchHomeUpstairs < Map
    def initialize(player)
        @map = [
            ['1','`','D','`','`','`','`','`','`','`','2',],
            ['|','S','S','S','S','H','H','S','H','H','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','H','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['3','`','`','`','`','`','`','`','`','`','4',],
        ]
        @name = 'Prof Birch House | Level 1'
        @pos_x = 1
        @pos_y = 2
        @saved_variable = 'S'
        @player = player
        @player_icon = @player.player_icon
        @map[@pos_x][@pos_y] = @player_icon

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
                    @map[2][7] = 'O'
                    reset_map 0.5
                    @map[2][7] = 'S'
                    @map[2][6] = 'O'
                    reset_map 0.5
                else
                    @map[3][8] = 'O'
                    reset_map 0.5
                    @map[3][8] = 'S'
                    @map[3][7] = 'O'
                    reset_map 0.5
                    @map[3][7] = 'S'
                    @map[3][6] = 'O'
                    reset_map 0.5
                    @map[3][6] = 'S'
                    @map[2][6] = 'O'
                    reset_map 0.5
                end
                @map[2][6] = 'S'
                @map[2][5] = 'O'
                reset_map 0.5
                @map[2][5] = 'S'
                @map[2][4] = 'O'
                reset_map 0.5
                @map[2][4] = 'S'
                @map[2][3] = 'O'
                reset_map 0.5
                @map[2][3] = 'S'
                @map[2][2] = 'O'
                reset_map 0.5
                @map[2][2] = 'S'
                @map[1][2] = 'O'
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
        @player.profbirchhomeupstairs == 'first' ? @map[2][8] = 'O' : nil
    end

    # Check for time setup (first time shenanigans)
    def begin
        time_setup
        super
    end

end

class ProfBirchLab < Map
    def initialize(player)
        @name = "Prof. Birch's Lab"
        @player = player
        @player_icon = @player.player_icon
        @pos_x = 12
        @pos_y = 7
        @saved_variable = 'S'
        @map = [
            ['1','`','`','`','`','`','`','`','`','`','`','`','`','`','2',],
            ['|','H','H','S','H','H','S','H','H','H','H','S','S','H','|',],
            ['|','H','S','H','S','S','S','S','S','S','S','S','S','H','|',],
            ['|','H','S','H','S','S','S','S','S','S','S','S','S','H','|',],
            ['|','S','S','S','S','S','S','S','S','S','H','H','S','H','|',],
            ['|','S','S','S','S','S','S','S','S','S','S','S','S','S','|',],
            ['|','H','H','H','H','S','S','S','S','S','S','H','H','S','|',],
            ['|','H','H','H','H','S','S','S','S','S','S','H','H','H','|',],
            ['|','S','S','S','S','S','S','S','S','S','O','S','S','S','|',],
            ['|','S','H','S','S','S','S','S','S','S','S','S','H','H','|',],
            ['|','H','H','S','S','S','S','S','S','S','S','S','H','S','|',],
            ['|','H','H','S','S','S','S','S','S','S','S','S','H','H','|',],
            ['|','S','S','S','H','S','S','S','S','S','S','S','S','S','|',],
            ['3','`','`','`','`','`','`','D','D','`','`','`','`','`','4',],
        ]
        @map[@pos_x][@pos_y] = @player_icon
    end

    # Check for map exit
    def move(direction)
        if direction == 'down' && @pos_x == 12 && (@pos_y == 7 || @pos_y == 8)
            LittleRoot.new(@player,15,11).begin # Load the map!
        end
        super
    end

    # Modifies the map depending on what time you visit it
    def time_setup
    end

    # Check for time setup modifications before beginning
    def begin
        time_setup
        super
    end

end

class Route101 < Map
    def initialize(player,position='bot')
        @player=player
        @player_icon=player.player_icon
        @position=position
        @name = 'Route 101'
        @map = [
            ['T','T','T','T','T','T','T','T','S','S','S','S','T','T','T','T','T','T','T','T',],
            ['T','T','G','G','G','S','S','S','S','S','S','S','S','G','G','G','T','T','T','T',],
            ['T','T','G','G','G','G','S','S','S','S','S','S','G','G','G','G','T','T','T','T',],
            ['G','G','G','G','G','G','S','S','S','S','S','S','G','G','G','G','G','G','T','T',],
            ['G','G','G','G','G','S','S','S','S','S','S','S','G','G','G','G','G','G','T','T',],
            ['T','T','G','G','S','S','L','L','L','L','L','T','T','G','G','G','G','S','S','S',],
            ['T','T','L','L','L','L','L','S','S','S','S','T','T','T','T','S','S','S','S','S',],
            ['T','T','S','S','S','S','S','S','S','S','S','T','T','T','T','S','S','S','S','S',],
            ['T','T','T','T','S','S','S','S','S','S','S','T','T','G','G','S','S','S','S','S',],
            ['T','T','T','T','S','S','S','S','S','S','S','G','G','G','G','G','S','S','S','S',],
            ['T','T','T','T','S','S','S','S','S','S','S','G','G','G','G','G','G','S','S','S',],
            ['T','T','T','T','S','S','S','S','S','S','S','G','G','G','G','G','G','S','S','S',],
            ['T','T','G','G','S','S','S','S','L','L','L','L','G','G','G','G','G','S','S','S',],
            ['G','G','G','G','G','S','S','S','S','S','S','S','T','T','G','G','S','S','T','T',],
            ['G','G','G','G','G','S','S','S','S','S','S','S','T','T','G','G','S','S','T','T',],
            ['T','T','G','G','G','G','S','S','S','S','S','S','T','T','T','T','T','T','T','T',],
            ['T','T','G','G','G','S','S','S','S','S','S','S','T','T','T','T','T','T','T','T',],
            ['T','T','T','T','T','T','T','T','T','T','S','S','T','T','T','T','T','T','T','T',],
            ['T','T','T','T','T','T','T','T','T','T','S','S','T','T','T','T','T','T','T','T',],
        ]
        @saved_variable = 'S'
        @pos_x = 2
        @pos_y = 10
        @map[@pos_x][@pos_y] = @player_icon
    end
end



require './player.rb'
p = Player.new('Nathan', 'male')
# p.littleroot = 'third'


# p.littleroot = 'third'
Route101.new(p).begin
# require 'colorize'
# puts String.colors