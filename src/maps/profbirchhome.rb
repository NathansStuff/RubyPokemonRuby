require './maps/profbirchhomeupstairs.rb'
require './maps/littleroot.rb'

class ProfBirchHome < Map
    def initialize(player, position='bot')
        @position=position
        @player=player
        @map=[
            ['E','E','E','E','1','`','`','`','`','`','`','`','2',],
            ['1','`','`','D','4a','S','S','cabinet','cabinet','cabinet','cabinet','cabinet','|',],
            ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','tv','cabinet','cabinet','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','chair','basket','basket','chair','S','S','|',],
            ['|','S','S','S','S','S','chair','basket','basket','lady','S','S','|',],
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
        @map[@pos_x][@pos_y] = 'X'
    end

    # Creates Birch wife's dialogue for first time entering the house
    def time_setup
        if @player.profbirchhome =='first'
            reset_map 0.5
            @map[6][9] = 'chair'
            @map[7][9] = 'lady'
            reset_map 0.5
            @map[7][9] = 'S'
            @map[7][8] = 'lady'
            reset_map 0.5
            @map[7][8] = 'S'
            @map[7][7] = 'lady'
            reset_map 0.5
            @map[7][7] = 'S'
            @map[7][6] = 'lady'
            reset_map 0.5
            @map[7][6] = 'S'
            @map[7][5] = 'lady'
            reset_map 0.5
            @map[7][5] = 'S'
            @map[7][4] = 'lady'
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
            @map[7][5] = 'lady'
            reset_map 0.5
            @map[7][5] = 'S'
            @map[7][6] = 'lady'
            reset_map 0.5
            @map[7][6] = 'S'
            @map[7][7] = 'lady'
            reset_map 0.5
            @map[7][7] = 'S'
            @map[7][8] = 'lady'
            reset_map 0.5
            @map[7][8] = 'S'
            @map[7][9] = 'lady'
            reset_map 0.5
            @map[7][9] = 'S'
            @map[6][9] = 'lady'
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