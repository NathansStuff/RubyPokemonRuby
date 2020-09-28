require './maps/littleroot.rb'

class Van < Map
    #Initialises the map
    def initialize(player)
        @player = player
        @name='van'
        @map=[
            ['1','`','`','`','`','`','2',],
            ['|','box','box','box','couch','S','|',],
            ['|','box','S','S','S','S','E',],
            ['|','box','S','S','S','S','E',],
            ['|','box','box','box','S','S','E',],
            ['|','box','box','box','box','S','|',],
            ['3','`','`','`','`','`','4',]
            ]
        @pos_x = 2
        @pos_y = 2
        @player_icon=@player.player_icon
        @saved_variable='S'
        @map[@pos_x][@pos_y] = "X"
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