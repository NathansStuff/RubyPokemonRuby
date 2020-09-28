require './maps/playerhomehouse.rb'

class PlayerHomeHouseUpstairs < Map
    def initialize(player, time='second')
        @name = 'Home | Level 1'
        @saved_variable = 'S'
        @map = [
            ['1','`','`','`','`','`','`','`','D','`','2',],
            ['|','pc','cabinet','S','cabinet','clock','tv','S','S','S','|',],
            ['|','chair','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','bed','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['|','S','S','S','S','S','S','S','S','S','|',],
            ['3','`','`','`','`','`','`','`','`','`','4',]
        ]
        @pos_x = 1
        @pos_y = 8
        @player = player
        @player_icon = @player.player_icon
        @map[@pos_x][@pos_y] = 'X'
    end

    # Map specific moves (exit)
    def move(direction)
        if direction == 'up' && @pos_x == 1 && @pos_y == 8 # Player in correct position
            PlayerHomeHouse.new(@player,'top').begin
        end
        super
    end
end