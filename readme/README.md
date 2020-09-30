# Purpose and Scope

The purpose of this application was to recreate Pokemon Ruby in Ruby. In doing so, there would be a variety of things to choose from to recreate including:

- Character Creation
- Maps
- Pokemon selection
- Pokemon encounters
- Battle System
- Saving
- Time, Date, Playtime Tracking
- Dynamic Characters based on player gender
- Gym system
- Trainer battles

After thinking it over, the idea was to start the game and implement as many features as possible as needed. This had the benefit of ensuring a smooth player experience instead of trying to force the player to do things in a random, un-storylike order based on what features were implemented.

The main problem that this application solves is player's boredom. It is designed to recreate a popular game, Pokemon Ruby so that players could experience the game in the terminal. 

Accordingly, the target audience is people that are bored. In particular, people that have played the game during their childhood, that are in 20-30 years of age.

The application is designed to be used through the use of keyboard movements.

- A = Left
- w = Up
- S = Down
- D = Right
- Any key = prompt

As with the original Pokemon Ruby, whenever text is typed to the screen the game waits for user acknowledgement before outputting more. At this stage, any key will satisfy this requirement.

# Features

The three featured features of this applcation are:

1. Player Creation and Name Retention
1. Battle System
1. Map Creation and Movement

### Player Creation and Name Retention

At the beginning of the game, the player to choose their gender and their name. The name is only allowed to be comprised of letters and the (.)(,) symbols and will error check to ensure this. After naming, the player is asked to confirm their choice and loops back to gender selection unless a 'YES' is selected.

Several times throughout the game, when addressed by different characters this player name variable is displayed back to the user.

/image

Additionally, the gender of PROF. BIRCH's child will is conditional upon the player's gender. They will be the opposite of whatever gender the player is and this shows through: 

- Their mother will refer to them as son/daughter
- Their map icon will be a boy or girl
- Their name will be Terry or May

/image

### Battle System

The battle system comprises of a loop of status checking and turn taking. Turns can only take place if the status check returns that both pokemon still have a health above zero, otherwise it will exit the battle loop. 

The battle screen displays both pokemon's names, levels and a sliding health bar indicating their current health percentage.

There is a turn tracker to alternate between the AI and player's turns. During the player's turn, they can choose between attacking, running away, bag and swapping out pokemon. 

Damage is calculated based on the move chosen's base modifier, the attacker's attack and the defender's defense. The 'leer' and 'growl' moves don't actually do damage but work to reduce the opposing pokemon's defense and attack, respectively.

### Map Creation and Movement