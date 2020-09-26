class Player

    attr_reader :name, :gender, :player_icon
    attr_accessor :littleroot, :playerhomehouse, :playerhomehouseupstairs, :profbirchhome, :profbirchhomeupstairs
    def initialize(name, gender)
    @name=name
    @gender=gender
    @littleroot = 'first'
    @playerhomehouse = 'first'
    @playerhomehouseupstairs = 'first'
    @profbirchhome = 'first'
    @profbirchhomeupstairs = 'first'
    @player_icon = 'X'
    end

end