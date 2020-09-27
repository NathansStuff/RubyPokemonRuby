require 'colorize'
require 'io/console'
require './stuff.rb'
class Map
    # include ResetMap

    def initialize(player,name, map, pos_x, pos_y)
    @name=name
    @map=map
    @pos_x=pos_x
    @pos_y=pos_y
    @old_x=0
    @old_y=0
    @map[@pos_x][@pos_y]=@player_icon
    @player=player
    @player_icon=@player.player_icon
    end

    #Clears terminal, prints map according to characters
    def print_map
        system('clear')
        for row in @map
            for letter in row
                case letter
                when '`'
                    print '──'.colorize(:light_blue)
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
                    print "\u{1F4E6}".colorize(:red)
                when 'S'
                    print '██'.colorize(:light_black)
                when 'T'
                    print "\u{1F333}".colorize(:green)
                when 'X'
                    print "#{@player_icon}"
                when 'H'
                    print '██'.colorize(:light_magenta)
                when 'I'
                    print "\u{1F233}".colorize(:cyan)
                when 'E'
                    print '  '
                when 'D'
                    print "\u{1F6AA}".colorize(:light_magenta)
                when 'C'
                    print "\u{1F69A}"
                when 'O'
                    print ' O'.colorize(:blue)
                when 'P'
                    print 'P'.colorize(:blue)
                when 'G'
                    print '█'.colorize(:yellow)
                when 'L'
                    print '█'
                when 'B' 
                    print '█'.colorize(:blue)
                when 'box'
                    print "\u{1F4E6}"
                when 'couch'
                    print "\u{1F6CB} "
                when 'lady'
                    print "\u{1F475}"
                when 'boy'
                    print "\u{1F466}"
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
                @saved_variable = 'S'
                @pos_x -= 1
            when 'G'
                @saved_variable = 'G'
                @pos_x -= 1
            end
        when 'down'
            case @map[@pos_x + 1][@pos_y]
            when 'S'
                @saved_variable = 'S'
                @pos_x += 1
            when 'L'
                @pos_x += 2
            when 'G'
                @saved_variable = 'G'
                @pos_x += 1
            end
        when 'left'
            case @map[@pos_x][@pos_y - 1]
            when 'S'
                @saved_variable = 'S'
                @pos_y -= 1
            when 'G'
                @saved_variable = 'G'
                @pos_y -= 1
            end
        when 'right'
            case @map[@pos_x][@pos_y + 1]
            when 'S'
                @saved_variable = 'S'
                @pos_y += 1
            when 'G'
                @saved_variable = 'G'
                @pos_y += 1
            end
        end
        
        #Places the player's icon on the map
        @map[@pos_x][@pos_y] = "X"
        print_map
    end

    #Get user input
    def input
        loop do
            # Necessary insted of straight case STDIN
            # Reset input so doesn't automatically return a value and interfere with dialogue gets function
            button = STDIN.getch.upcase!
            case button
            # case gets.chomp.upcase!
            when 'A' then move('left')
            when 'S' then move('down')
            when 'D' then move('right')
            when 'W' then move('up')
            else
                button = '' # Aka, delete value
            end
        end
    end

    #Main loop
    def begin
        print_map
        input
    end

end