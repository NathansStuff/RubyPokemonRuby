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
                when '`'
                    print '─'.colorize(:light_blue)
                when '|'
                    print '|'.colorize(:light_blue)
                when '1'
                    print '┌'.colorize(:light_blue)
                when '2'
                    print '┐'.colorize(:light_blue)
                when '3'
                    print '└'.colorize(:light_blue)
                when '4'
                    print '┘'.colorize(:light_blue)
                when 'R'
                    print '█'.colorize(:red)
                when 'S'
                    print '█'.colorize(:light_black)
                when 'X'
                    print 'X'.colorize(:blue)
                end
            end
            puts ''
        end
    end

    def move(direction)
        #Uses direction from input to check if there is a valid spot to move to. 
        #If yes, updates old x/y to current spot, puts the saved variable in that spot (aka, recreating the original map)
        #Then updates x/y position to spot moved to, updates map to represent player at that spot.
        @old_x = @pos_x
        @old_y = @pos_y
        @map[@old_x][@old_y] = @saved_variable
        if direction == 'up' && (@map[@pos_x - 1][@pos_y] == 'R' && @map[@pos_x - 1][@pos_y] != 'T')
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
        ['1','`','`','`','`','`','2',],
        ['|','R','R','R','R','S','|',],
        ['|','R','S','S','S','S','E',],
        ['|','R','S','S','S','S','E',],
        ['|','R','R','R','S','S','E',],
        ['|','R','R','R','R','S','|',],
        ['3','`','`','`','`','`','4',]
    ],2,2)

van.input



