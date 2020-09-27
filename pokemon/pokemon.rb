class Pokemon
    
    attr_accessor :name, :level, :moves, :max_hp, :current_hp, :defense, :status, :attack_base, :speed
    def initialize(name, level)
        @name=name
        @level=level
        @moves=moves
        @max_hp=20 + @level * 10
        @current_hp=max_hp
        @defense=2 + @level * 1
        @status=[]
        @attack_base=@leve
    end

    def move(action)
        puts "#{ @name } uses #{ action }"
        gets.chomp
    end

end

class Poochyena < Pokemon

    attr_accessor :name, :level, :moves, :max_hp, :current_hp, :defense, :status
    def initialize(level)
        @name='Poochyena'
        @level=level
        @moves=['Tackle']
        @max_hp=super(@name, @level)
        @current_hp=max_hp
        @defense=super(@name, @level)
        @status=super(@name, @level)
        @attack_base=super(@name, @level)
    end
end

class Treecko < Pokemon

    attr_accessor :name, :level, :moves, :max_hp, :current_hp, :defense, :status
    def initialize(level)
        @name='Treecko'
        @level=level
        @moves=['Pound', 'Leer']
        @max_hp=super(@name, @level)
        @current_hp=max_hp
        @defense=super(@name, @level)
        @status=super(@name, @level)
        @attack_base=super(@name, @level)
    end
end

class Torchic < Pokemon

    attr_accessor :name, :level, :moves, :max_hp, :current_hp, :defense, :status
    def initialize(level)
        @name='Torchic'
        @level=level
        @moves=['Scratch', 'Growl']
        @max_hp=super(@name, @level)
        @current_hp=max_hp
        @defense=super(@name, @level)
        @status=super(@name, @level)
        @attack_base=super(@name, @level)
    end
end

class Mudkip < Pokemon

    attr_accessor :name, :level, :moves, :max_hp, :current_hp, :defense, :status
    def initialize(level)
        @name='Mudkip'
        @level=level
        @moves=['Tackle', 'Growl']
        @max_hp=super(@name, @level)
        @current_hp=max_hp
        @defense=super(@name, @level)
        @status=super(@name, @level)
        @attack_base=super(@name, @level)
    end
end


print Poochyena.new(2).name
