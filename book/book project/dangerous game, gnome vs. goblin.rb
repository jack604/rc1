#Rudimentary fighting system D&D (test)
#Nästa steg: change equipment causes stats to change (one calculation per change of equipment)

class Creature
	attr_accessor :name, :type, :ac, :attack_bonus, :hp, :damage #damage is an array first el: number of rolls, second el: which dice.
	def initialize(name, type, ac, attack_bonus, hp, damage)
		@name=name
		@type=type
		@ac=ac
		@attack_bonus=attack_bonus
		@hp=hp
		@damage=damage
	end

	#ok hur ska objekten påverkas? vem ska påverka vad?
	#test1 : get attacked

#attack formula: hit or miss: result=roll+attack-ac
	def attacked(attacker)
		roll=rand(20)
		is_hit=(roll+attacker.attack_bonus-self.ac)>0 #normal 3.5 rules if it did hit or not.
		if(is_hit)
			damage_done=self.calc_damage(@damage)
#			puts "hp: #{@hp}, damage done: #{damage_done}"
			@hp=@hp-damage_done
			puts "Hit:  #{attacker.name} the #{attacker.type}  hits  #{self.name} the #{self.type} for #{damage_done} HP"
		else
			puts "Miss: #{attacker.name} the #{attacker.type} misses #{self.name} the #{self.type}"
		end
	end

	def calc_damage(dmg)
		total_damage=0
		numrolls=dmg[0]
		dietype=dmg[1]
		while numrolls > 0
			total_damage+=rand(dietype-1)+1
			numrolls-=1
		end
		return total_damage
	end

end

goblin=Creature.new("Grob", "Goblin", 15, 3, 5, [1,6]) #attack_bonus: size mod: +1 small	strength mod: +0 11 str 	base attack mod: +0 1st lvl	weapon mod: +2 morning star ? vet inte om man ska addera base attack och weapon bonus attack.
gnome=Creature.new("Hugenbok", "Gnome", 16, 3, 6, [1,6])

while(goblin.hp>0 and gnome.hp>0)
	goblin.attacked(gnome)
	gnome.attacked(goblin)
end
p goblin
p gnome

#Info about D&D:
#No AD&D above 2.0, only D&D
#weapons give bonus attack only if special or magical or other. ? eller? t.ex. goblin har morningstar +2 melee, är det attack bonus eller damage?
#Frågor:
#Hur hänger lvl och standard  monsters in monster book ihop?
#? i monster book, ska man addera base attack och weapon +n attack bonus?



