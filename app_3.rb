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
my_game = Game.new(humanplayer_name)
puts


while my_game.is_still_ongoing?
  puts
  my_game.new_players_in_sight
  puts
  my_game.show_players
  puts
  my_game.menu
  puts
  choice = gets.chomp
  puts
  my_game.menu_choice(choice)
  puts
  my_game.enemies_attack
  puts
  puts "------------"
  puts
end

my_game.ending  