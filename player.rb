class Player

    attr_reader :name, :gender, :player_icon, :other_name, :other_gender
    attr_accessor :littleroot, :playerhomehouse, :playerhomehouseupstairs, :profbirchhome, :profbirchhomeupstairs, :profbirchlab
    def initialize(name, gender)
    @name=name
    @gender=gender
    # Prof Birch's kid changes to opposite gender of player
    if @gender == 'male'
        @other_gender = 'daughter'
        @other_name = 'May'
    else
        @other_gender = 'son'
        @other_name = 'Terry'
    end
    @littleroot = 'first'
    @playerhomehouse = 'first'
    @playerhomehouseupstairs = 'first'
    @profbirchhome = 'first'
    @profbirchhomeupstairs = 'first'
    @profbirchlab = 'first'
    @player_icon = 'X'
    @route101 = 'first'
    end

end