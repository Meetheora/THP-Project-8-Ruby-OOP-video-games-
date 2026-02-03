class Player
attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(dmg)
  @life_points = @life_points - dmg
    if @life_points <= 0
      @life_points = 0 #Pour que les points de vie soit zéro même en cas de valeur négative
      puts "Le joueur #{@name} a été tué!"
    end
  end

  def attacks(player)
  puts "Le joueur #{@name} attaque le joueur #{player.name}"
  damage = compute_damage
  player.gets_damage(damage)
  puts "#{player.name} a recu #{damage} points de dommage"
  end
  
  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
attr_accessor :weapon_level

  def initialize(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * weapon_level
  end
  
  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou! Elle est meilleure que ton arme actuelle: tu la prends"
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)

    if health_pack == 1
      puts "Tu n'as rien trouvé"
    elsif health_pack >= 2 && health_pack <= 5 #On peut aussi écrire elsif health_pack.between?(2, 5)
      @life_points = @life_points + 50
      if @life_points > 100
        @life_points = 100
      end
    puts "Bravo, tu as trouvé un pack de +50 points de vie"
    elsif health_pack == 6
    @life_points = @life_points + 80
      if @life_points > 100
        @life_points = 100
      end
    puts "Waow, tu as trouvé un pack de +80 points de vie"
    end
  end
end