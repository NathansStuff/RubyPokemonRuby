# I = Info Block
# H = House
# S = Path
# D = Door
# E = Exit
# O - Person
# P - Pokemon
require './maps.rb'
require 'colorize'
require './stuff.rb'
class Van < Map
    #Initialises the map
    def initialize()
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
        @player_icon=super(@name,@map,@pos_x,@pos_y)
        @saved_variable='S'
    end

    #Extends the Map class move direction to load the next map
    def move(direction)
        if direction == 'right' #If exiting the van, load the next map
            if @map[@pos_x][@pos_y + 1] == 'E'
                LittleRoot.new(true).begin
            end
        end
        super #Otherwise, do the normal Map move function
    end
end

class LittleRoot < Map
    def initialize(first_time=false)
        @name='Littleroot'
        @map=[
    ['1','`','`','`','`','`','`','`','`','`','`','`','`','E','E','`','`','`','`','`','`','`','`','`','`','2',],
    ['|','T','T','T','T','T','T','T','T','T','T','T','T','S','S','T','T','T','T','T','T','T','T','T','T','|',],
    ['|','T','T','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','H','H','H','H','H','S','S','S','S','S','S','H','H','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','S','H','H','H','D','H','I','S','S','S','S','I','H','D','H','H','H','S','S','T','T','|',],
    ['|','T','T','S','C','C','C','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','|',],
    ['|','T','T','S','C','C','C','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','T','T','|',],
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
    @pos_x=8
    @pos_y=7
    @player_icon=super(@name,@map,@pos_x,@pos_y)
    @first_time=first_time
    @saved_variable='S'
    end

    def is_first_time
        if @first_time==true
            print_map
            @map[7][8] = 'O'
            sleep 1
            print_map
            @map[7][8] = 'S'
            @map[8][8] = 'O'
            sleep 1
            print_map
            slowly("MOM: #{$player.name}, we're here, honey!")
            slowly("It must be tiring riding with our things in the moving truck")
            reset_map
            slowly("Well, this is LITTLEROOT TOWN.")
            slowly("How do you like it? This is our new home!")
            reset_map
            slowly("It has a quaint feel, but it seems to be an easy place to live, don't you think?")
            slowly("And, you get your own room, Name! Let's go inside.")
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
            PlayerHomeHouse.new(true).begin
        end
    end

    def begin
        is_first_time
        super
    end
end

class PlayerHomeHouse < Map
    def initialize(first_time=false)
    @name='Player Home'
    @pos_x=8
    @pos_y=9
    @first_time=first_time
    @saved_variable='D'
    @map=[
        ['1','`','`','`','`','`','`','`','`','`','`','`','2',],
        ['|','H','H','H','H','H','H','H','D','H','H','H','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['|','S','S','S','H','H','H','H','S','S','S','S','|',],
        ['|','S','S','S','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['|','S','S','S','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','S','S','S','S','S','D','D','S','|',],
        ['3','`','`','`','`','`','`','`','`','`','`','`','4',],
    ]
    @player_icon=super(@name,@map,@pos_x,@pos_y)
    end

    #Sets pokemon, mother + dialogue if first time
    def is_first_time
        if @first_time == true 
            @map[4][6] = 'P'
            @map[2][4] = 'P'
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
            move('up')            
        end
    end

    #ISSUE: IF ACTIVE, DOUBLE MOVES RIGHT/TOP
    def move(direction)

        #Extends the Map class move direction to load the next map
        case direction 
        when 'up'
            if @pos_x == 2 && @pos_y == 8
                exit!
            end
        when 'down'
            if @pos_x == 7 && ( @pos_y == 9 || @pos_y == 10)
                if @first_time == false
                    LittleRoot.new.begin
                else
                    if @pos_y == 9
                        mum_speech(7,9)
                    end
                end
            end
        when 'right'
            if @pos_x == 8 && @pos_y == 8 # Exit bottom of map from left
                if @first_time == false
                    LittleRoot.new.begin
                else
                    mum_speech(8,8) # No escape yet
                end
            end
        when 'left' # Exit bottom of the map from the right
            if @pos_x == 8 && @pos_y == 11
                if @first_time == false
                    LittleRoot.new.begin
                end
            end
        end
        super
    end

    def mum_speech(x, y)
        @map[x][y] = 'S'
        @map[8][9] = 'X'
        print_map
        slowly('Well, Name?')
        slowly("Aren't you interested in seeing your very own room?")
        @map[x][y] = 'X'
        @map[8][9] = 'D'
        print_map
    end

    def begin
        is_first_time
        super
    end

end


p=PlayerHomeHouse.new(true)
p.begin




#Issue with double moving in map
#How to save global player without making it global