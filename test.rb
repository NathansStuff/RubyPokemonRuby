require 'colorize'
require 'pastel'
require 'tty-box'

def health_bar(hp_percent)
    # hp_percent = pokemon.current_hp.to_f / pokemon.max_hp.to_f
    if hp_percent >= 1
        18.times do print "\u2588".colorize(:green) end
            2.times do print "\u2588".colorize(:light_black) end
        
        # puts Pastel.new.green('████████████████████')# + Pastel.new.blue('████████████████████')
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
        ){Pastel.new.black("  NAME             Lv: 1\n       #{health_bar()}")
    
    
    
    }
    puts opponent_box
    print "         "
    health_bar(1)
end

battle_screen