class Game
attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight

def initialize(name)
  @human_player =  HumanPlayer.new(name)
  @enemies = []
  @enemies << Player.new("José")
  @enemies << Player.new("Josiane")
  @enemies << Player.new("Daniel")
  @enemies << Player.new("Dana")
  @players_left = 10
  @enemies_in_sight = []
end

  def show_players
    puts "Voici votre état:"
    @human_player.show_state
    puts "Il reste #{@players_left} joueurs à éliminer"
    puts "Ennemis en vue: #{enemies_in_sight.length}"
end

def menu
  puts "Quelle action veux-tu effectuer?"
  puts 
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
  puts "Attaquer un joueur en vue:"
  puts
  enemies_in_sight.each_with_index do |enemy, index|
    print "#{index} -"
    enemy.show_state
  end
end

def menu_choice(choice)
  case choice
  when "a" then human_player.search_weapon
  when "s" then human_player.search_health_pack 
  else
    if choice.to_i.to_s == choice && choice.to_i.between?(0, enemies_in_sight.length - 1) 
      index = choice.to_i
      human_player.attacks(enemies_in_sight[index]) #choice.to_i.between?(0, enemies.length -1) vérifie que le chiffre est un index valide      
      kill_player(enemies_in_sight[index]) if enemies_in_sight[index].life_points <= 0
    else
      puts "Choix Invalide"
    end
  end
end

def kill_player(player)
  @enemies_in_sight.delete(player)
  @players_left -= 1 #Pour baisser le total des joueurs quand l'un d'eux est supprimé
end

def enemies_attack
  puts "Les autres joueurs t'attaquent!"
  enemies_in_sight.each do |enemy|
    if enemy.life_points > 0
      puts "#{enemy.name} t'attaque!"
      enemy.attacks(human_player)
    end
  end
end

def is_still_ongoing?
  @human_player.life_points > 0 && (@players_left > 0 || !@enemies_in_sight.empty?)
end

def new_players_in_sight
  if @enemies_in_sight.length == @players_left
    puts "Tous les joueurs sont déjà en vue"
  else
    dice = rand(1..6)
    if dice == 1
      puts "Aucun joueur n'arrive"
    elsif dice.between?(2, 4)
      name = "Joueur_#{rand(1000..9999)}" #Pour générer aléatoirement un pseudo de joueur
      new_player = Player.new(name)
      @enemies_in_sight << new_player 
      puts "Un nouveau joueur apparait: #{name} !"
    elsif dice.between?(5, 6)
      2.times do 
      name = "Joueur_#{rand(1000..9999)}" #Pour générer aléatoirement un pseudo de joueur
      new_player = Player.new(name)
      @enemies_in_sight << new_player
      puts "Un nouveau joueur apparait: #{name} !"
      end
    end
  end
end

def ending
  puts "La partie est finie!"
  if human_player.life_points > 0
  puts "Bravo! Tu as gagné la partie!"
  else
  puts "Dommage! Tu as perdu la partie!"
  end 
end
end
