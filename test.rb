require 'colorize'

map=[
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
def print_map(map)
    system('clear')
    $stdout.flush
    for row in map
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
            when 'C'
                print '█'.colorize(:white)
            when 'O'
                print 'O'.colorize(:blue)
            when 'P'
                print 'P'.colorize(:blue)
            end

        end
        puts ''
    end
end



continuous_map(1, map)