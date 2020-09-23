require 'colorize'

class Map
    def initialize(name, map, pos_x, pos_y)
    @name=name
    @map=map
    @pos_x=pos_x
    @pos_y=pos_y
    @old_x=0
    @old_y=0
    @player_icon='X'
    @saved_variable=@map[@pos_x][@pos_y]
    @map[@pos_x][@pos_y]=@player_icon
    end

    def print_map
        system('clear')
        for row in @map
            for letter in row
                case letter
                when 'R'
                    print '██'.colorize(:red)
                when 'S'
                    print '██'.colorize(:light_black)
                when 'X'
                    print 'X '.colorize(:blue)
                end
            end
            puts ''
        end
    end

    def move(direction)
        #For movement up
        #Checks if eligible space to move to
        #Todo-check if game exiting square
        #Todo-Check if 'G' square and then diceroll
        #Updates current position with old value to simulate moving through a map
        #Saves new position's overriden value for next move
        #Moves the character
    
        @old_x = @pos_x
        @old_y = @pos_y
        @map[@old_x][@old_y] = @saved_variable
        if direction == 'up' && (@map[@pos_x - 1][@pos_y] != 'R' && @map[@pos_x - 1][@pos_y] != 'T')
            @pos_x -=1
        elsif direction == 'down'&& (@map[@pos_x + 1][@pos_y] != 'R' && @map[@pos_x + 1][@pos_y] != 'T')
            @pos_x +=1
        elsif direction == 'left'&& (@map[@pos_x][@pos_y - 1] != 'R' && @map[@pos_x][@pos_y - 1] != 'T')
            @pos_y -=1
        elsif direction == 'right'&& (@map[@pos_x][@pos_y + 1] != 'R' && @map[@pos_x][@pos_y + 1] != 'T')
            @pos_y +=1
        end
    
        @map[@pos_x][@pos_y] = @player_icon
        system("clear")
        print_map
    end

    def input
        loop do
            #case STDIN.getch.upcase!
            case gets.chomp.upcase!
            when 'A' then move('left')
            when 'S' then move('down')
            when 'D' then move('right')
            when 'W' then move('up')
            end
        end
    end

end

van = Map.new('van',[
        ['R','R','R','R','S'],
        ['R','S','S','S','S'],
        ['R','S','S','S','S'],
        ['R','R','R','S','S'],
        ['R','R','R','R','S']
    ],2,2)

van.input



