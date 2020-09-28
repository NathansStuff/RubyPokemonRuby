require './maps/littleroot.rb'

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
            ['|','cabinet','cabinet','S','pc','basket','S','basket','basket','basket','basket','S','S','books','|',],
            ['|','box','S','S','S','S','S','S','S','S','S','S','S','books','|',],
            ['|','box','S','S','S','chair','S','S','S','S','S','S','S','basket','|',],
            ['|','S','S','S','S','S','S','S','S','S','box','box','S','basket','|',],
            ['|','S','S','S','S','S','S','S','S','S','S','S','S','S','|',],
            ['|','cabinet','cabinet','cabinet','cabinet','S','S','S','S','S','S','cabinet','cabinet','S','|',],
            ['|','cabinet','cabinet','cabinet','cabinet','S','S','S','S','S','S','cabinet','cabinet','cabinet','|',],
            ['|','S','S','S','S','S','S','S','S','S','assistant','S','S','S','|',],
            ['|','S','pc','S','S','S','S','S','S','S','S','S','pc','flower','|',],
            ['|','books','basket','chair','S','S','S','S','S','S','S','chair','basket','S','|',],
            ['|','books','basket','S','S','S','S','S','S','S','S','S','basket','box','|',],
            ['|','S','S','S','flower','S','S','S','S','S','S','S','S','S','|',],
            ['3','`','`','`','`','`','`','D','D','`','`','`','`','`','4',],
        ]
        @map[@pos_x][@pos_y] = 'X'
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

