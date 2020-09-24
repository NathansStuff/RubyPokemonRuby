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

    #Clears terminal, prints map according to characters
    def print_map
        system('clear')
        for row in @map
            for letter in row
                case letter
                when '`'
                    print '─'.colorize(:light_blue)
                when '|'
                    print '│'.colorize(:light_blue)
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
                when 'T'
                    print '█'.colorize(:green)
                when 'X'
                    print 'X'.colorize(:blue)
                when 'H'
                    print '█'.colorize(:light_magenta)
                when 'I'
                    print '█'.colorize(:cyan)
                when 'E'
                    print ' '
                when 'D'
                    print ' '
                end

            end
            puts ''
        end
    end

    #Adjusts player position
    def move(direction)
        #Sets current map spot equal to saved varibale (recreates the original map)
        @old_x = @pos_x
        @old_y = @pos_y
        @map[@old_x][@old_y] = @saved_variable

        #Checks the direction headed and sees if valid
        #If valid, moves there
        case direction 
        when 'up'
            case @map[@pos_x - 1][@pos_y]
            when 'S'
                @pos_x -= 1
            when 'E'
                exit!
            end
        when 'down'
            case @map[@pos_x + 1][@pos_y]
            when 'S'
                @pos_x += 1
            when 'E'
                exit!
            end
        when 'left'
            case @map[@pos_x][@pos_y - 1]
            when 'S'
                @pos_y -= 1
            when 'E'
                exit!
            end
        when 'right'
            case @map[@pos_x][@pos_y + 1]
            when 'S'
                @pos_y += 1
            when 'E'
                exit!
            end
        end
        
        #Places the player's icon on the map
        @map[@pos_x][@pos_y] = @player_icon
        print_map
    end

    #Get user input
    def input
        loop do
            # case STDIN.getch.upcase!
            case gets.chomp.upcase!
            when 'A' then move('left')
            when 'S' then move('down')
            when 'D' then move('right')
            when 'W' then move('up')
            end
        end
    end

    #Main loop
    def begin
        print_map
        input
    end

end



