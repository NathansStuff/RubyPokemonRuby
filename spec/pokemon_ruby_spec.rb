require_relative '../src/pokemon/pokemon.rb'
require_relative '../src/player.rb'

describe Pokemon do
    it 'should be able to add a pokemon' do
        name = 'Pikachu'
        level = 5
        pokemon = Pokemon.new(name, level)
        expect(pokemon.name).to eq('Pikachu')
    end
end

describe Player do
    it 'it should create a new player' do
    name = 'Nathan'
    gender = 'BOY'
    player = Player.new(name, gender)
    expect(player.name).to eq('Nathan')
    end
end