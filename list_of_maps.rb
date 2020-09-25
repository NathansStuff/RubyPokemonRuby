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

    # If first time, positioning overridden, dialogue and forced exit to playerhousemap
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

    # Makes begin method check for first time before beginning
    def begin
        is_first_time
        super
    end
end

class PlayerHomeHouse < Map
    def initialize(position, time='normal')
    @name='Player Home'
    @time=time  
    if position == 'top'
        @pos_x=2
        @pos_y=9
        @saved_variable='S'
    else
        @pos_x=7
        @pos_y=9  
        @saved_variable='D'  
    end
    @map=[
        ['1','`','`','`','`','`','`','`','`','`','`','`','2',],
        ['|','H','H','H','H','H','H','H','H','D','H','H','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['|','S','S','H','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','S','S','S','S','S','S','S','S','|',],
        ['|','S','S','S','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','H','H','S','S','S','S','S','S','|',],
        ['|','S','S','S','S','S','S','S','S','D','D','S','|',],
        ['3','`','`','`','`','`','`','`','`','`','`','`','4',],
    ]
    @player_icon=super(@name,@map,@pos_x,@pos_y)
    end

    #Sets pokemon, mother + dialogue if first time
    def time_setup
        case @time
        when 'first' 
            @map[4][5] = 'P'
            @map[2][4] = 'P'
            @map[3][6] = 'H'
            @map[7][10] = 'O'
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
        when 'second'
             @map[4][5] = 'O'
             print_map
             slowly('MOM: Oh! Name, Name! Quick! Come quickly!')
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
                if @time == 'first' #What instance of the map to load
                    PlayerHomeHouseUpstairs.new('first').begin
                else
                    PlayerHomeHouseUpstairs.new.begin
                end
            end
        when 'down'
            if @pos_x == 6 && ( @pos_y == 9 || @pos_y == 10) #Exit bottom of map from top
                if @time == 'first' && @pos_y == 9
                    mum_speech(6,9) # No escape yet
                else
                   LittleRoot.new.begin
                end
            end
        when 'right'
            if @pos_x == 7 && @pos_y == 8 # Exit bottom of map from left
                if @time == 'first'
                    mum_speech(7,8) # No escape yet
                else
                    LittleRoot.new.begin
                end
            end
        when 'left' # Exit bottom of the map from the right
            if @pos_x == 7 && @pos_y == 11
                if @time == 'first' # No escape yet
                    mum_speech(8,7)
                end
            end
        end
        super
    end

    # Prevents player from exiting bottom of map
    def mum_speech(x, y)
        @map[x][y] = 'S'
        @map[7][9] = 'X'
        print_map
        slowly('Well, Name?')
        slowly("Aren't you interested in seeing your very own room?")
        @map[x][y] = 'X'
        @map[7][9] = 'D'
        print_map
    end

    #When beginning, check if it is first time or not
    def begin
        time_setup
        super
    end

end

class PlayerHomeHouseUpstairs < Map
    def initialize(time='second')
        @name = 'Home | Level 1'
        @saved_variable = 'S'
        @time=time #Only used for passing setting instance of next map when exiting
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
        @player_icon = super(@name, @map, @pos_x, @pos_y)
    end

    # Map specific moves (exit)
    def move(direction)
        if direction == 'up'
            if @pos_x == 1 && @pos_y == 8 # Player in correct position
                if @time == 'first' # What instance of the map to load
                    PlayerHomeHouse.new('top', 'second').begin
                else
                    PlayerHomeHouse.new('top').begin
                end
            end
        end
        super
    end
end

p=PlayerHomeHouse.new('top','second')
p.begin



