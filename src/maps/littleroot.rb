require './maps/playerhomehouse.rb'
require './maps/profbirchhome.rb'
require './maps/profbirchlab.rb'
require './maps/route101.rb'

class LittleRoot < Map
    def initialize(player, x, y)
        @name='Littleroot'
        @map=[
    ['1','`','`','`','`','`','`','`','`','`','`','`','`','E','E','`','`','`','`','`','`','`','`','`','`','2',],
    ['|','T','T','T','T','T','T','T','T','T','T','T','T','S','S','T','T','T','T','T','T','T','T','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','flower','T','T','|',],
    ['|','T','T','flower','S','H','H','H','D','H','I','S','S','S','S','I','H','D','H','H','H','flower','S','T','T','|',],
    ['|','T','T','S','flower','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','flower','T','T','|',],
    ['|','T','T','flower','S','S','flower','S','S','S','S','S','S','S','S','S','S','S','S','flower','S','flower','S','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','H','H','H','H','H','H','H','S','S','S','S','S','I','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','H','H','H','H','H','H','H','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','H','H','H','H','H','H','H','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','S','S','H','H','H','H','H','D','H','S','S','S','S','S','S','S','S','T','T','T','T','|',],
    ['|','T','T','S','S','S','S','flower','flower','flower','I','S','S','S','S','S','S','S','S','S','S','T','T','T','T','|',],
    ['|','T','T','T','T','S','S','flower','flower','flower','S','S','S','S','S','S','S','S','S','T','T','T','T','T','T','|',],
    ['|','T','T','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','T','T','T','T','|',],
    ['|','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','T','|',],
    ['3','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','`','4',],
    ]
    @pos_x=x
    @pos_y=y
    @saved_variable='S'
    @player=player
    @player_icon=@player.player_icon
    @map[@pos_x][@pos_y] = "X"
    @talk = 0
    end

    # If first time, positioning overridden, dialogue and forced exit to playerhousemap
    # If second time, can't leave at top
    def time_setup
        case @player.littleroot
        when 'first' #Places car, mum animation and forces player to next map
            @map[8][6] = 'C'
            print_map
            @map[7][8] = 'lady'
            sleep 1
            print_map
            @map[7][8] = 'S'
            @map[8][8] = 'lady'
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
            @map[7][8] = 'lady'
            @map[8][8] = 'X'
            @map[@pos_x][@pos_y]='S'
            sleep 1
            print_map
            @map[7][8] = 'X'
            @map[8][8] = 'S'
            sleep 1
            print_map
            sleep 1
            @player.littleroot = 'second' # Never do this speech again
            PlayerHomeHouse.new(@player,'bot').begin
        when 'second' # Trusty little guard guy stops you from leaving
            @map[2][10] = 'boy' 
        when 'third' # Trust little guard is a nervous bystander
            @map[1][13] = 'boy'
        end
    end

    # Checks position and direction for stuff (moving to maps)
    def move(direction)
        if @player.littleroot == 'second' # Free to explore town but can't leave
            if direction == 'up'
                if @pos_x == 1 && (@pos_y == 13 || @pos_y == 14) #If trying to exit at top
                    # Little guy stops you
                    @map[2][10] = 'S'
                    @map[2][11] = 'boy'
                    reset_map 0.5
                    @map[2][11] = 'S'
                    @map[2][12] = 'boy'
                    reset_map 0.5
                    @map[2][12] = 'S'
                    @map[2][13] = 'boy'
                    reset_map 0.5
                    @map[2][13] = 'S'
                    # Top exit is two spots wide, little guy takes appropriate pathing depending on player
                    if @pos_y == 13
                        @map[2][14] = 'boy'
                        reset_map(0.5)
                        @map[2][14] = 'S'
                        @map[1][14] = 'boy'
                        reset_map 0.5
                        @map[1][14] = 'S'
                        @map[0][14] = 'boy'
                        reset_map 0.5
                        @map[0][14] = 'E'
                        @map[0][13] = 'boy'
                        reset_map 0.5
                        cant_leave_speech 
                        @map[0][13] = 'E'
                        @map[0][14] = 'boy'
                        reset_map 0.5
                        @map[0][14] = 'E'
                        @map[1][14] = 'boy'
                        reset_map 0.5
                        @map[1][14] = 'S'
                        @map[2][14] = 'boy'
                        reset_map 0.5
                        @map[2][14] = 'S'

                    else
                        @map[1][13] = 'boy'
                        reset_map 0.5
                        @map[1][13] = 'S'
                        @map[0][13] = 'boy'
                        reset_map 0.5
                        @map[0][13] = 'E'
                        @map[0][14] = 'boy'
                        reset_map 0.5
                        cant_leave_speech
                        @map[0][14] = 'E'
                        @map[0][13] = 'boy'
                        reset_map 0.5
                        @map[0][13] = 'E'
                        @map[1][13] = 'boy'
                        reset_map 0.5
                        @map[1][13] = 'S'
                    end
                    # Guy walks back to his guard spot
                    @map[2][13] = 'boy'
                    reset_map 0.5
                    @map[2][13] = 'S'
                    @map[2][12] = 'boy'
                    reset_map 0.5
                    @map[2][12] = 'S'
                    @map[2][11] = 'boy'
                    reset_map 0.5
                    @map[2][11] = 'S'
                    @map[2][10] = 'boy'
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
            when 1 
                if @pos_y == 13 || @pos_y == 14 # Exit map at top to Route101 Map

                    if @player.littleroot == 'third' && @talk == 0
                        slowly("I can hear someone shouting down the\nroad here.")
                        reset_map
                        slowly("What should I do? What should we do?\nSomeody has to go help...")
                        reset_map
                        @talk += 1 # Don't do the talk again
                    elsif @player.littleroot == 'second'
                        nil
                    else
                        @player.littleroot = 'normal' # Set the little root map to be loaded next time
                        Route101.new(@player).begin
                    end
                end
            end
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