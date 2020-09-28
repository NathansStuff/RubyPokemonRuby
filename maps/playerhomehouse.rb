require './maps/playerhomehouseupstairs.rb'
require './maps/littleroot.rb'

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
        ['1','`','`','`','`','`','`','`','2',],
        ['|','cabinet','cabinet','cabinet','cabinet','cabinet','cabinet','cabinet','3a','D','`','`','2',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['|','S','S','cabinet','cabinet','tv','S','S','S','S','S','S','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['|','S','S','chair','basket','basket','chair','S','S','S','S','S','|',],
        ['|','S','S','chair','basket','basket','chair','S','S','S','S','S','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['3','`','`','`','`','`','`','`','`','D','D','`','4',],
    ]
    @map[@pos_x][@pos_y] = 'X'
    end

    #Sets pokemon, mother + dialogue if first time
    def time_setup
        case @player.playerhomehouse
        when 'first' 
            @map[4][5] = 'P'
            @map[2][4] = 'P'
            @map[3][6] = 'box'
            @map[8][10] = 'lady'
            print_map
            slowly("MOM: See, #{ @player.name }? Isn't it nice in here, too?")
            reset_map
            slowly("The mover's POKEMON do all the work of moving us in and cleaning up after.")
            slowly("This is so convenient!")
            reset_map
            slowly("#{ @player.name }, your room is upstairs. Go check it out, dear!")
            reset_map
            slowly("DAD bought you a new clock to mark our move here.")
            slowly("Don't forget to set it!")
        when 'second'
             @map[4][5] = 'lady'
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
             @map[4][4] = 'lady'
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
             @map[4][3] = 'lady'
             print_map
             sleep 0.5
             @map[4][3] = 'S'
             @map[5][3] = 'lady'
             @player.playerhomehouse = 'third' # Never again go through this speech
             @pos_x = 4
             @pos_y = 5
             print_map
             

        else
            @map[5][3]='lady'
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