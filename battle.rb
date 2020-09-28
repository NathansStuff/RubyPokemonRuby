require 'colorize'
require 'tty-prompt'
require 'pastel'
require 'tty-box'
require './stuff.rb'

class Battle
    attr_accessor
    def initialize(players_pokemon, opponent_pokemon)
    # @player=player
    @players_pokemon = players_pokemon
    @opponent_pokemon = opponent_pokemon
    @turn_count = 1
    @prompt=TTY::Prompt.new
    end

    def health_bar(pokemon)
        hp_percent = pokemon.current_hp.to_f / pokemon.max_hp.to_f
        if hp_percent >= 1
            20.times do print "\u2588".colorize(:green) end
        elsif hp_percent >= 0.9
            18.times do print "\u2588".colorize(:green) end
            2.times do print "\u2588".colorize(:light_black) end
        elsif hp_percent >= 0.8
            16.times do print "\u2588".colorize(:green) end
            4.times do print "\u2588".colorize(:light_black) end
        elsif hp_percent >= 0.7
            14.times do print "\u2588".colorize(:green) end
            6.times do print "\u2588".colorize(:light_black) end
        elsif hp_percent >= 0.6
            12.times do print "\u2588".colorize(:green) end
            8.times do print "\u2588".colorize(:light_black) end
        elsif hp_percent >= 0.5
            10.times do print "\u2588".colorize(:green) end
            10.times do print "\u2588".colorize(:light_black) end
        elsif hp_percent >= 0.4
            8.times do print "\u2588".colorize(:green) end
            12.times do print "\u2588".colorize(:light_black) end
        elsif hp_percent >= 0.3
            6.times do print "\u2588".colorize(:yellow) end
            14.times do print "\u2588".colorize(:light_black) end
        elsif hp_percent >= 0.2
            4.times do print "\u2588".colorize(:yellow) end
            16.times do print "\u2588".colorize(:light_black) end
        elsif pokemon.current_hp <= 0
            20.times do print "\u2588".colorize(:light_black) end
        else
            2.times do print "\u2588".colorize(:red) end
            18.times do print "\u2588".colorize(:light_black) end
        end
        # print bar1
    end

    def battle_screen
        system("clear")
        opponent_box = TTY::Box.frame(
            height: 5,
            width: 30,
            style:{
                bg: :bright_yellow
            },
            ){Pastel.new.black("  #{ @opponent_pokemon.name }           Lv: #{ @opponent_pokemon.level }\n       ")}
        puts opponent_box
        print "         "
        health_bar(@opponent_pokemon)
        puts "\n\n"
        player_box = TTY::Box.frame(
            height: 5,
            width: 30,
            style:{
                bg: :bright_yellow
            },
            ){Pastel.new.black("  #{ @players_pokemon.name }            Lv: #{ @players_pokemon.level }\n       ")}
            puts player_box
            print "         "
            health_bar(@players_pokemon)
            puts "\n\n"
    end
    
    def get_action
        #Checks to see if it is player or opponents turn
        if @turn_count % 2 == 0
            #If opponent turn, gets a random move from available moves
            @prompt.keypress
            num_of_moves = @opponent_pokemon.moves.length
            rand_move = rand(1..num_of_moves)
            rand_move -=1
            move = @opponent_pokemon.moves[rand_move]
            @prompt.keypress("#{ @opponent_pokemon.name } uses #{ move }")
            perform_move(@opponent_pokemon, @players_pokemon, move)
        else
            #If player's turn, gets action input
            action = TTY::Prompt.new.select("What should #{ @players_pokemon.name } do?",%w(FIGHT BAG POKEMON RUN))
            case action
            when 'FIGHT'
                move = TTY::Prompt.new.select("", @players_pokemon.moves)
                @players_pokemon.move(move)
                @flee_attempts=0
                perform_move(@players_pokemon, @opponent_pokemon, move)
            when 'POKEMON'
                TTY::Prompt.new.select("Choose a POKEMON", %w(#{@players_pokemon.name} CANCEL))
            when 'RUN'
                slowly("PROF. BIRCH: D-don't leave\nme here like this!")
                battle_screen
                get_action
            when 'BAG'
                puts "There's no items in the bag.."
                battle_screen
                get_action
            when 'POKEMON'
                puts "You only have one POKEMON!"
                battle_screen
                get_action
            end
        end
    end

    #Checks the move
    def perform_move(attacking_pokemon, attacked_pokemon, action)
        case action
        when 'Growl' 
            growl(attacked_pokemon)
        when 'Pound'
            attack(attacking_pokemon, attacked_pokemon, 1)
        when 'Leer'
            leer(attacked_pokemon) 
        when 'Tackle'
            attack(attacking_pokemon, attacked_pokemon, 1)
        when 'Scratch'
            attack(attacking_pokemon, attacked_pokemon, 1)
        end
        battle_screen
    end

    #Growl lowers enemies attack damage
    #Lowers attack base by 1 (min 1)
    def growl(attacked_pokemon)
        attacked_pokemon.attack_base >1 ? attacked_pokemon.attack_base -=1 : nil
    end

    #Leer lowers enemies defense
    #Can't lower to negative values
    def leer(attacked_pokemon)
        attacked_pokemon.defense >1 ? attacked_pokemon.defense -=1 : nil
    end

    #Calculates attack damage & displayess messages
    def attack(attacking_pokemon, attacked_pokemon, attack_value)
        #Calculates attack, defense and actual damage
        attack = attacking_pokemon.attack_base * attacking_pokemon.level
        defense = attacked_pokemon.defense
        damage = attack - defense
        #Minimum damage is 1
        damage <= 0 ? damage = 1 : nil
        #Messages based on damage value
        if damage <=5
            @prompt.keypress(puts "It's not very effective..")
        elsif damage >=20
            @prompt.keypress(puts "It's super effective!")
        end
        #Update attacked pokemon's health
        attacked_pokemon.current_hp -= damage
    end

    # Checks to ensure no pokemon has died
    def check_status
        @players_pokemon.current_hp <= 0 ? player_lost : nil
        @opponent_pokemon.current_hp <= 0 ? player_won : nil
    end

    # If player loses
    def player_lost
        puts "#{ @players_pokemon.name } has fainted!"
        system('clear')
        slowly("PROF. BIRCH: I have no idea how\nyou did it.")
        system('clear')
        slowly("But you lost. I died. You killed\nme...")
        exit
    end

    def player_won
        puts "#{ @opponent_pokemon.name } has fainted!"
        system('clear')
        slowly("PROF. BIRCH: YOU DID IT!\nYou finished the tutorial and saved me!")
        system('clear')
        slowly("Now you are a real POKEMON trainer...")
        exit
    end



    #The battle loop
    def begin
        loop do
            while true
                check_status
                battle_screen
                get_action
                @turn_count +=1
            end
        end
    end
    
end

# require './pokemon/pokemon.rb'
# p1 = Torchic.new(5)
# p2 = Poochyena.new(2)
# # # puts p1.current_hp
# Battle.new(p1,p2).begin

# puts p1.name






#Issue: Printing Name and level on the battle screen -> If one name is longer can push the level out of place