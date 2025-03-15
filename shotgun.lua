--shotgun
shotgun = {
	x = 64,
	y = 32,
	dy = 1,
	w = 2,
	h = 1,
	bullets = 5,
	knockback = 10,
	spr = 73,
	t = 0,
	alive = true,
	interactable = true,
	interacted = false,
	prompt = false,
	update = function(self)
		if self.t > 10 then
			self.y += self.dy
			self.dy *= -1
			self.t = 0
		else
			self.t += 1
		end
		if self.interacted then
			add(p.inventory, self)
			p.shotgun = true
			p.s_offset = 32
			self.alive = false
		end
		return self.alive
	end,
	draw = function(self)
		spr(self.spr, self.x, self.y, self.w, self.h)
		if self.prompt then
			x_interact_draw(self, fade_cols)
		end
	end,
}
add(objs, shotgun)