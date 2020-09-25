module PlayerCreated
    def create_player
        puts 'name?'
        name = get.chomp
        puts 'gender?'
        gender = gets.chomp
        player = Player.new.(name, gender)
    end

end

class Player
    
    include PlayerCreated

    attr_reader :name
    def initialize(name, gender)
    @name=name
    @gender=gender
    end

end


