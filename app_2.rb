require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Veuillez saisir votre prénom:"
humanplayer_name = gets.chomp
human_player = HumanPlayer.new(humanplayer_name)

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = []
enemies << player1
enemies << player2

while human_player.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  puts "Voici votre état:"
  puts
  human_player.show_state
  puts
  puts "Quelle action veux-tu effectuer?"
  puts 
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
  puts "Attaquer un joueur en vue:"
  puts
  enemies.each_with_index do |enemy, index|
    print "#{index} -"
    enemy.show_state
  end
  
  choice = gets.chomp
  case choice
  when "a" then human_player.search_weapon
  when "s" then human_player.search_health_pack
  else
    if choice.to_i.to_s == choice && choice.to_i.between?(0, enemies.length - 1) 
      index = choice.to_i
      human_player.attacks(enemies[index]) #choice.to_i.between?(0, enemies.length -1) vérifie que le chiffre est un index valide
    else
      puts "Choix Invalide"
    end
  end

  puts "Les autres joueurs t'attaquent!"

  enemies.each do |enemy|
    if enemy.life_points > 0
      puts "#{enemy.name} t'attaque!"
      enemy.attacks(human_player)
    end
  end
  puts ""
  puts "-------------------"
  puts ""
end

puts "La partie est finie!"
if human_player.life_points > 0
  puts "Bravo! Tu as gagné la partie!"
else
  puts "Dommage! Tu as perdu la partie!"
end