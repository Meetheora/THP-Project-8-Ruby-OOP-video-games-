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
