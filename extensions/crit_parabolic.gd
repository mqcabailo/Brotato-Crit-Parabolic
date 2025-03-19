extends "res://entities/units/unit/unit.gd"


func take_damage(value: int, args: TakeDamageArgs) -> Array:
	var hitbox = args.hitbox
	if hitbox == null:
		return .take_damage(value, args)
	
	else:
		var hitbox_crit_chance = hitbox.crit_chance
		var hitbox_crit_damage = hitbox.crit_damage
		
		var crit_power = floor(hitbox_crit_chance)
		var chance_remainder = fmod(hitbox_crit_chance, 1.0)
		var crit_on_remainder = Utils.get_chance_success(chance_remainder)
		
		if crit_on_remainder:
			crit_power += 1
		
		var result: Array
		
		if crit_power <= 0:
			hitbox.crit_chance = 0.0
			hitbox.crit_damage = 1.0
			
			result = .take_damage(value, args)
			
		else:
			var parabolic_crit_damage = round(value * pow(hitbox_crit_damage, crit_power)) as int
			
			hitbox.crit_chance = 1.0
			hitbox.crit_damage = 1.0
			
			result = .take_damage(parabolic_crit_damage, args)
			
		hitbox.crit_chance = hitbox_crit_chance
		hitbox.crit_damage = hitbox_crit_damage
			
		return result
