

def ascii_1
    printf("  _..__                                    ___\n")
    printf(" /     `._                          ,--\"\"\"\"   `\"-.\n")
    printf("|         `.                    _.'\"\"/`.        |/`-.\n")
    printf("|           `.                ,+ `..' | |       |'...+.\n")
    printf("|     \\       \\              / /\\____,' '    __ `.`._,\".\n")
    printf("|      ..      \\           ,'  \\      .' ,-\"'  `. `.._,'`.\n")
    printf("|       .`.     \\         /     `-..-'  .  _.... |._      \\\n")
    printf("'        ' `     \\       /          ,-\"\"`.____...'  `.     \\\n")
    printf(" `        `.`.    \\     '         ,'   _,--------.`.  `.    L\n")
    printf("  `         ` `.   \\   j         /  .,' ,\"_.....`.`.`   \\   |\n")
    printf("   `.        `. `.  \\  |        / ,'/ .','..... `.\\ \\|   .  |\n")
    printf("     `.        `. .  \\ |       j . / ..'.,-\"\". \\ || ||   |  |\n")
    printf("       `.        `.`. \\'.      | | | |||.   .,.','/ /'   |  |\n")
    printf("         `-.       `. .:\\      | | | ||'`..___.'.','/   j   |\n")
    printf("            `-._     `-._\\      \\'.`.`..`..__....','   ,   /\n")
    printf("                `--......-\\      \\ `.`.`.......-\"'   ,'   /\n")
    printf("                           `.     `. `-..____,.-\" _.'   ,'\n")
    printf("                             >.     '--...___,..-'   _.\"\n")
    printf("                           ,'  `--,__            _,-\"  `-.\n")
    printf("                       _.-'      '   `'--------\"' `.      `-.\n")
    printf("                     .'        ,'                   \\        `.\n")
    printf("                    .        .'                      `.        .\n")
    printf("                    |      ,'                          `._     |\n")
    printf("                     `----'                               `\"--\" \n")
    printf("\n")
    printf("\n")

end

def slowly(str)
    str.each_char do |c|
        sleep 0.1
        print c
    end
    gets
end