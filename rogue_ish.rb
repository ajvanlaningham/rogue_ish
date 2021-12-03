require 'io/console'

#add a little bit of spice (color)
class String
    def black;          "\e[30m#{self}\e[0m" end
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def brown;          "\e[33m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    def magenta;        "\e[35m#{self}\e[0m" end
    def cyan;           "\e[36m#{self}\e[0m" end
    def gray;           "\e[37m#{self}\e[0m" end
    
    def bg_black;       "\e[40m#{self}\e[0m" end
    def bg_red;         "\e[41m#{self}\e[0m" end
    def bg_green;       "\e[42m#{self}\e[0m" end
    def bg_brown;       "\e[43m#{self}\e[0m" end
    def bg_blue;        "\e[44m#{self}\e[0m" end
    def bg_magenta;     "\e[45m#{self}\e[0m" end
    def bg_cyan;        "\e[46m#{self}\e[0m" end
    def bg_gray;        "\e[47m#{self}\e[0m" end
    
    def bold;           "\e[1m#{self}\e[22m" end
    def italic;         "\e[3m#{self}\e[23m" end
    def underline;      "\e[4m#{self}\e[24m" end
    def blink;          "\e[5m#{self}\e[25m" end
    def reverse_color;  "\e[7m#{self}\e[27m" end
end

# wishlist
# blinking characters
# loot color change
def unicode_converter unicode
    unicode_to_convert = "#{unicode}"
    actual_symbol =  unicode_to_convert.encode('utf-8')
    return actual_symbol
end

eyeball = unicode_converter("\u25C9")

money_bag = unicode_converter("\u0024")

sword_unicode = "\u2694"
sword = sword_unicode.encode('utf-8')

heart_unicode = "\u2764"
heart = heart_unicode.encode('utf-8')

num_hearts = 3
life_counter = heart * num_hearts
life_counter = life_counter.red
input = ""

board = []
height = 10
width = 10

# variable declaration
lil_dude = "  0_o  "
happy_dude = "  ^_^  "
happy_dude = happy_dude.bg_magenta.red
dungeon_floor = "░░░·░░░"
loot = "   #{money_bag}   "
enemy = "<|#{eyeball}_#{eyeball}|>"
point_counter = 0

def unicode_converter unicode
    unicode_to_convert = "#{unicode}"
    actual_symbol =  unicode_to_convert.encode('utf-8')
    return actual_symbol
end

eyeball = unicode_converter("\u25C9")
puts eyeball

sword_unicode = "\u2694"
sword = sword_unicode.encode('utf-8')

heart_unicode = "\u2764"
heart = heart_unicode.encode('utf-8')

num_hearts = 3


# setup loop

(0..height).each do |y|
    board[y] = []
    (0..width).each do |x|
        board[y][x] = dungeon_floor
    end
end

def title
    puts ' _______  _______ _________            _______    _______  _        _______  _______  _        _______ 
(  ____ \(  ____ \\__   __/  |\     /|(  ____ \  (  ____ \( \      (  ___  )(  ____ \| \    /\(  ____ \
| (    \/| (    \/   ) (     ( \   / )| (    \/  | (    \/| (      | (   ) || (    \/|  \  / /| (    \/
| |      | (__       | |      \ (_) / | (__      | (__    | |      | (___) || (_____ |  (_/ / | (_____ 
| | ____ |  __)      | |       \   /  |  __)     |  __)   | |      |  ___  |(_____  )|   _ (  (_____  )
| | \_  )| (         | |        ) (   | (        | (      | |      | (   ) |      ) ||  ( \ \       ) |
| (___) || (____/\   | |        | |   | (____/\  | )      | (____/\| )   ( |/\____) ||  /  \ \/\____) |
(_______)(_______/   )_(        \_/   (_______/  |/       (_______/|/     \|\_______)|_/    \/\_______)
                                                                                                           '
end
                                                                     
                                               
def win_screen
puts"    
`MM'    `MM`MM'     `M'MMMMMMMMMMMP MMMMMMMMMMMP       dM.     (M) (M) (M)                                           
 MM      MM MM       M /       dMP  /       dMP       ,MMb     (M) (M) (M)                                           
 MM      MM MM       M        dMP          dMP        d'YM.    (M) (M) (M)                                           
 MM      MM MM       M       dMP          dMP        ,P `Mb     M   M   M                                            
 MMMMMMMMMM MM       M      dMP          dMP         d'  YM.    M   M   M                                            
 MM      MM MM       M     dMP          dMP         ,P   `Mb    M   M   M                                            
 MM      MM MM       M    dMP          dMP          d'    YM.   8   8   8                                            
 MM      MM YM       M   dMP          dMP          ,MMMMMMMMb                                                        
 MM      MM  8b     d8  dMP       /  dMP       /   d'      YM. 68b 68b 68b                                           
_MM_    _MM_  YMMMMM9  dMMMMMMMMMMM dMMMMMMMMMMM _dM_     _dMM_Y89 Y89 Y89                                           
                                                                                                                     
                                                                                                                      
                                                                                                                     
                                                                                                                     
____     ___                      ___                                                                             8  
`MM(     )M'                      `MM                                                                            (M) 
 `MM.    d'                        MM                                                                            (M) 
  `MM.  d' _____  ___   ___        MM  __      ___  ____    ___  ____         ____    _    ___  _____  ___  __   (M) 
   `MM d' 6MMMMMb `MM    MM        MM 6MMb   6MMMMb `MM(    )M' 6MMMMb        `MM(   ,M.   )M' 6MMMMMb `MM 6MMb   M  
    `MM' 6M'   `Mb MM    MM        MMM9 `Mb 8M'  `Mb `Mb    d' 6M'  `Mb        `Mb   dMb   d' 6M'   `Mb MMM9 `Mb  M  
     MM  MM     MM MM    MM        MM'   MM     ,oMM  YM.  ,P  MM    MM         YM. ,PYM. ,P  MM     MM MM'   MM  M  
     MM  MM     MM MM    MM        MM    MM ,6MM9'MM   MM  M   MMMMMMMM         `Mb d'`Mb d'  MM     MM MM    MM  8  
     MM  MM     MM MM    MM        MM    MM MM'   MM   `Mbd'   MM                YM,P  YM,P   MM     MM MM    MM     
     MM  YM.   ,M9 YM.   MM        MM    MM MM.  ,MM    YMP    YM    d9          `MM'  `MM'   YM.   ,M9 MM    MM 68b 
    _MM_  YMMMMM9   YMMM9MM_      _MM_  _MM_`YMMM9'Yb.   M      YMMMM9            YP    YP     YMMMMM9 _MM_  _MM_Y89 
                                                                                                                     
                                                                                                                     
                                                                                                                     
                                                                               
"
end

def lose_screen
puts"
____         _     ___       ____________          ____   ____     ___ __________ ________                                           
6MMMMb/      dM.    `MMb     dMM`MMMMMMMMM         6MMMMb  `Mb(     )d' `MMMMMMMMM `MMMMMMMb.                                         
8P    YM     ,MMb     MMM.   ,PMM MM               8P    Y8  YM.     ,P   MM         MM    `Mb                                         
6M      Y     d'YM.    M`Mb   d'MM MM              6M      Mb `Mb     d'   MM         MM     MM                                         
MM           ,P `Mb    M YM. ,P MM MM    ,         MM      MM  YM.   ,P    MM    ,    MM     MM                                         
MM           d'  YM.   M `Mb d' MM MMMMMMM         MM      MM  `Mb   d'    MMMMMMM    MM    .M9                                         
MM     ___  ,P   `Mb   M  YM.P  MM MM    `         MM      MM   YM. ,P     MM    `    MMMMMMM9'                                         
MM     `M'  d'    YM.  M  `Mb'  MM MM              MM      MM   `Mb d'     MM         MM  MM                                           
YM      M  ,MMMMMMMMb  M   YP   MM MM              YM      M9    YM,P      MM         MM   MM                                          
8b    d9  d'      YM. M   `'   MM MM      /        8b    d8     `MM'      MM      /  MM    MM                                         
YMMMM9 _dM_     _dMM_M_      _MM_MMMMMMMMM         YMMMM9       YP      _MMMMMMMMM _MM_    MM_                                       
                                                                                                                                      
"
end

#player positioning
player_y = (height-(height/2))
player_x = (width-(width/2))
board[player_y][player_x] = lil_dude

#loot positioning
loot_y = rand(height)
loot_x = rand(width)

while loot_y == player_y && loot_x == player_x
    loot_y = rand(height)
    loot_x = rand(width)
    point_counter += 1
end
board[loot_y][loot_x] = loot

# enemy positioning
enemy_y = rand(height)
enemy_x = rand(width)
while enemy_y == player_y && enemy_x == player_x
    enemy_y = rand(height)
    enemy_x = rand(width)
end
board[enemy_y][enemy_x] = enemy

# we loop printing the board to print out the enemy 'movement' every two seconds
# when the player moves, the board will print again, but it won't update the enemy movement until the enemy timecycle is complete 

def board_writer height, width, board, lil_dude, loot, enemy
    (0..height).each do |y|
        (0..width).each do |x|
            if board[y][x] == lil_dude
                print board[y][x].magenta.bold
            elsif board[y][x] == loot
                print board[y][x].bg_blue.black
            elsif board[y][x] == enemy
                print board[y][x].bg_red.black
            else
                print board[y][x].green
            end
        end
        puts
        puts
        puts
    end
end

def buy point_counter, heart, buy_yes
    buy_yes = false

    puts "Would you like to buy a health potion? y or n... 1 #{heart} = 5 points!"
    input = STDIN.getch
    

    if input == "y"
        if point_counter >= 5
            puts "ok! here you go!"
            sleep(3)
            buy_yes = true
            return buy_yes
        else 
            puts "you don't have enough points!"
            sleep(5)
            return buy_yes
        end
    elsif input == "n"
        puts "well nevermind then..."
        sleep(5)
        return buy_yes
    else
        puts "I'm disappointed in you"
        sleep(5)
        return buy_yes
    end
end


# print loop

play = true
while(play == true)
    #title()
    # print the board
    life_counter = heart * num_hearts
    life_counter = life_counter.red
    buy_yes = false
    puts "Total points: #{point_counter} | Life Counter: #{life_counter} | Swords? #{sword}"

    board_writer(height, width, board, lil_dude, loot, enemy)

    # player movement
    direction = ""
    puts "What direction do you want to go? (w, a, s, d, or q)"
        puts "type 'b' if you want to buy something!"
    direction = STDIN.getch # accept user input for a letter key

    if direction == 'w'
       # it's warpin' time
        if player_y == 0
            board[player_y][player_x] = dungeon_floor
            board[height][player_x] = lil_dude  # change player position 
            player_y = height
        else
            board[player_y][player_x] = dungeon_floor
            board[player_y - 1][player_x] = lil_dude  # change player position 
            player_y = player_y - 1
        end
    elsif direction == 'a'
        if player_x == 0
            board[player_y][player_x] = dungeon_floor
            board[player_y][width] = lil_dude  # change player position 
            player_x = width
        else
            board[player_y][player_x] = dungeon_floor
            board[player_y][player_x - 1] = lil_dude  # change player position 
            player_x = player_x - 1
        end
    
    elsif direction == 's'
        if player_y == height
            board[player_y][player_x] = dungeon_floor
            board[0][player_x] = lil_dude  # change player position 
            player_y = 0
        else
            board[player_y][player_x] = dungeon_floor
            board[player_y + 1][player_x] = lil_dude  # change player position 
            player_y = player_y + 1
        end
    elsif direction == 'd'
        if player_x == width
            board[player_y][player_x] = dungeon_floor
            board[player_y][0] = lil_dude  # change player position 
            player_x = 0
        else
            board[player_y][player_x] = dungeon_floor
            board[player_y][player_x + 1] = lil_dude  # change player position 
            player_x = player_x + 1
        end
    elsif direction == 'q'
        play = false
    elsif direction == 'b'
        buy_yes = buy(point_counter, heart, buy_yes)
        if buy_yes == true
            point_counter = point_counter -5
            num_hearts = num_hearts +1
        end
    end
    
    # loot update
    while loot_y == player_y && loot_x == player_x
        loot_y = rand(height)
        loot_x = rand(width)
        point_counter += 1
            if point_counter == 10 # win condition
                win_screen()
                sleep(5)
                play = false
            end
    end

    while enemy_y == player_y && enemy_x == player_x
        player_y = rand(height)
        player_x = rand(width)
        if num_hearts > 1
            num_hearts -= 1
            life_counter = heart * num_hearts
            life_counter = life_counter.red
        else
            lose_screen()
            sleep(5)
            play = false
        end
    end
    
    board[enemy_y][enemy_x] = enemy
    board[loot_y][loot_x] = loot
    board[player_y][player_x] = lil_dude
    system("cls") || system("clear")
end