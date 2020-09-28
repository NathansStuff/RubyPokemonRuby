require './maps/littleroot.rb'
require './pokemon/pokemon.rb'
require './battle.rb'
class Route101 < Map
    def initialize(player,position='bot')
        @player=player
        @player_icon=player.player_icon
        @position=position
        @name = 'Route 101'
        @map = [
            ['1','`','`','`','`','`','`','`','`','E','E','E','E','`','`','`','`','`','`','`','`','2',],
            ['|','T','T','T','T','T','T','T','T','S','S','S','S','T','T','T','T','T','T','T','T','|',],
            ['|','T','T','G','G','G','S','S','S','S','S','S','S','S','G','G','G','T','T','T','T','|',],
            ['|','T','T','G','G','G','G','S','S','S','S','S','S','G','G','G','G','T','T','T','T','|',],
            ['|','G','G','G','G','G','G','S','S','S','S','S','S','G','G','G','G','G','G','T','T','|',],
            ['|','G','G','G','G','G','S','S','S','S','S','S','S','G','G','G','G','G','G','T','T','|',],
            ['|','T','T','G','G','S','S','L','L','L','L','L','T','T','G','G','G','G','S','S','S','|',],
            ['|','T','T','L','L','L','L','L','S','S','S','S','T','T','T','T','S','S','S','S','S','|',],
            ['|','T','T','S','S','S','S','S','S','S','S','S','T','T','T','T','S','S','S','S','S','|',],
            ['|','T','T','T','T','S','S','S','S','S','S','S','T','T','G','G','S','S','S','S','S','|',],
            ['|','T','T','T','T','S','S','S','S','S','S','S','G','G','G','G','G','S','S','S','S','|',],
            ['|','T','T','T','T','S','S','S','S','S','S','S','G','G','G','G','G','G','S','S','S','|',],
            ['|','T','T','T','T','S','S','S','S','S','S','S','G','G','G','G','G','G','S','S','S','|',],
            ['|','T','T','G','G','S','S','S','S','L','L','L','L','G','G','G','G','G','S','S','S','|',],
            ['|','G','G','G','G','G','S','S','S','S','S','S','S','T','T','G','G','S','S','T','T','|',],
            ['|','G','G','G','G','G','S','S','S','S','S','S','S','T','T','G','G','S','S','T','T','|',],
            ['|','T','T','G','G','G','G','S','S','S','S','S','S','T','T','T','T','T','T','T','T','|',],
            ['|','T','T','G','G','G','S','S','S','S','S','S','S','T','T','T','T','T','T','T','T','|',],
            ['|','T','T','T','T','T','T','T','T','T','T','S','S','T','T','T','T','T','T','T','T','|',],
            ['|','T','T','T','T','T','T','T','T','T','T','S','S','T','T','T','T','T','T','T','T','|',],
            ['3','`','`','`','`','`','`','`','`','`','`','E','E','`','`','`','`','`','`','`','`','4',],
        ]
        @saved_variable = 'S'
        if @position == 'bot'
            @pos_x = 19
            @pos_y = 12
        else
            @pos_x = 1
            @pos_y = 10
        end
        @map[@pos_x][@pos_y] = 'X'
    end

    # Checks for map exit at top & bot
    def move(direction)
        
        # Exit map at bottom
        if direction == 'down' && @pos_x == 19 && (@pos_y == 11 || @pos_y == 12) 
            if @player.route101 == 'first' # No escape!
                cant_leave_speech('up')
            else # Load map
                LittleRoot.new(@player,0,14).begin
            end
        end
        
        # Because cliff moves 2 spots down & bottom is always 'L', stops odd scenarios where 'G' moves
        if direction =='down' && @map[@pos_x - 1][@pos_y] == "L"
            @saved_variable = 'S'
        end

        # Exit map at top
        direction == 'up' && @pos_x == 1 && (@pos_y == 9 || @pos_y == 10 || @pos_y == 11 || @pos_y == 12) ? exit! : nil

        # Can't go around the bag
        if @player.route101 == 'first' && direction == 'left' && @pos_y == 8 && (@pos_x == 15 || @pos_x == 16 || @pos_x == 17)
            cant_leave_speech('right')
        end
        
        # Interact with bag
        if @player.route101 == 'first'
            if (direction == 'left' && @pos_x == 14 && @pos_y == 9) || (direction == 'up' && @pos_x == 15 && @pos_y == 8)
                loop do
                    pokemon = TTY::Prompt.new.select("Prof. BIRCH is in trouble!\nRelease a POKEMON and rescue him!",%w(TREECKO TORCHIC MUDKIP))
                    case pokemon
                    when 'TREECKO'
                        puts "GRASS POKEMON"
                        choice = TTY::Prompt.new.select("Do you choose this POKEMON?", %w(YES NO))
                        if choice == 'YES'
                            choice = Treecko.new(5)
                            battle(choice)
                        else
                            reset_map
                        end
                    when 'TORCHIC'
                        puts "FIRE POKEMON"
                        choice = TTY::Prompt.new.select("Do you choose this POKEMON?", %w(YES NO))
                        if choice == 'YES'
                            choice = Torchic.new(5)
                            battle(choice)
                        else
                            reset_map
                        end
                    when 'MUDKIP'
                        puts "WATER POKEMON"
                        choice = TTY::Prompt.new.select("Do you choose this POKEMON?", %w(YES NO))
                        if choice == 'YES'
                            choice = Mudkip.new(5)
                            battle(choice)
                        else
                            reset_map
                        end
                    end
                end
            end
        end

        super # Otherwise act as normal
    end

    def battle(choice)
        p2 = Poochyena.new(2)
        Battle.new(choice, p2).begin
    end

    def cant_leave_speech(movement)
        slowly("Wh-Where are you going?!\nDOn't leave me like this!")
        move(movement)
        move(movement)
    end

    # Sets specific stuff to happen if time conditions met
    def time_setup
        if @player.route101 == 'first'
            # Set the initial professor and bag
            @map[15][5] = 'prof'
            @map[14][8] = 'bag'
            reset_map 0.5
            slowly("H-help me!")
            # Animation of player moving
            move('up')
            reset_map 0.5
            move('up')
            reset_map 0.5
            move('up')
            reset_map 0.5
            move('up')
            reset_map 0.5
            # Animation of the professor getting chased
            @map[15][5] = 'P'
            @map[14][5] = 'prof'
            reset_map 0.5
            @map[15][5] = 'G'
            @map[14][5] = 'P'
            @map[13][5] = 'prof'
            reset_map 0.5
            @map[14][5] = 'G'
            @map[13][5] = 'P'
            @map[12][5] = 'prof'
            reset_map 0.5
            @map[12][5] = 'P'
            @map[13][5] = 'S'
            @map[11][5] = 'prof'
            reset_map 0.5
            @map[12][5] = 'S'
            @map[11][5] = 'P'
            @map[11][6] = 'prof'
            reset_map 0.5
            @map[11][5] = 'S'
            @map[11][6] = 'P'
            @map[11][7] = 'prof'
            reset_map 0.5
            @map[11][6] = 'S'
            @map[11][7] = 'P'
            @map[11][8] = 'prof'
            reset_map 0.5
            @map[11][7] = 'S'
            @map[11][8] = 'P'
            @map[12][8] = 'prof'
            reset_map 0.5
            @map[11][8] = 'S'
            @map[12][8] = 'P'
            @map[13][8] = 'prof'
            reset_map 0.5
            @map[12][8] = 'S'
            @map[13][8] = 'P'
            @map[13][7] = 'prof'
            reset_map 0.5
            @map[13][8] = 'S'
            @map[13][7] = 'P'
            @map[13][6] = 'prof'
            reset_map 0.5
            @map[13][7] = 'S'
            @map[13][6] = 'P'
            @map[13][5] = 'prof'
            reset_map 0.5
            slowly("Hello! You over there!\nPlease! Help!")
            reset_map
            slowly("In my BAG!\nThere's a POKEBALL!")
        end
    end

    # Check for time stuff
    def begin
        time_setup
        super
    end

end