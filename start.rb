require 'tty-prompt'
require './stuff.rb'

prompt=TTY::Prompt.new

# slowly('Hi! Sorry to keep you waiting!')
# slowly('Welcome to the world of POKEMON!')
# slowly('My name is BIRCH.')
# slowly('But everyone calls me the POKEMON PROFESSOR')
# slowly('This is what we call a "POKEMON."')
# ascii_1
# slowly('This world is widely inhabited by creatures known as POKEMON.')
# slowly('We humans live alongside POKEMON, at times friendly playmates, and')
# slowly('at times as cooperative workmates.')
# slowly('And sometimes, we band together and battle others like us.')
# slowly("But despite out closeness, we don't know everything about POKEMON")
# slowly('In fact, there are many, many secrets surrounding POKEMON.')
# slowly("To unravel POKEMON mysteries, I've been undertaking research.")
# slowly("That's what I do.")
# slowly("And you are?")
# loop do
#     slowly("Are you a boy? Or are you a girl?")
#     gender = prompt.select("", %w(BOY GIRL))
#     if gender == 'BOY'
#         slowly("All right. What's your name?")
#         name = prompt.select("", %w(NEW LANDON TERRY SETH TOM)) #ISSUE
#     else 
#         slowly("All right. What's your name?")
#         name = prompt.select("", %w(NEW TERRA KIMMY NICOLA SARA)) 
#     end
#     if name == 'NEW'
#         slowly("Enter your name")
#         name = prompt.ask("") do |q|
#             q.required true
#             q.validate /^[a-zA-Z.,]+$/ 
#             # /regex/ works like quotation marks for print; they encapsulate data
#             # ^..$ is the start and stop of the regex
#             # + means you can have more then one character matching
#             # [a-zA-z] is checking for characters a..z + caps
#             # ., allows the symbols
#             q.modify :capitalize
#         end
#     end
#     slowly("So it's #{ name }?")
#     check = prompt.select("", %w(YES NO))
#     if check == 'YES'
#         break
#     end
# end
# slowly('Ah, okay!')
# slowly("You're #{ name } who's moving to my hometown of LITTLEROOT.")
# slowly("I get it now!")
# slowly("All right, are you ready?")
# slowly("Your very own adventure is about to unfold.")
# slowly("Take courage, and leap into the world of POKEMON where dreams,")
# slowly("adventure, and friendships await!")
# slowly("Well, I'll be expecting you later. Come see me in my POKEMON LAB.")

