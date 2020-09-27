class Player

    attr_reader :name, :gender, :player_icon, :other_name, :other_gender, :other_icon
    attr_accessor :littleroot, :playerhomehouse, :playerhomehouseupstairs, :profbirchhome, :profbirchhomeupstairs, :profbirchlab, :route101
    def initialize(name, gender)
    @name=name
    @gender=gender
    # Prof Birch's kid changes to opposite gender of player
    if @gender == 'boy'
        @other_gender = 'daughter'
        @other_name = 'May'
        @other_icon = "\u{1F467}"
        @player_icon = "\u{1F466}"
    else
        @other_gender = 'son'
        @other_name = 'Terry'
        @other_icon = "\u{1F466}"
        @player_icon = "\u{1F467}"
    end
    @littleroot = 'first'
    @playerhomehouse = 'first'
    @playerhomehouseupstairs = 'first'
    @profbirchhome = 'first'
    @profbirchhomeupstairs = 'first'
    @profbirchlab = 'first'
    @route101 = 'first'
    end

end