--shotgun
shotgun = {
	x = 64,
	y = 32,
	off = 0,
	dy = 1,
	w = 2,
	h = 1,
	user = nil,
	equipped = false,
	bullets = 5,
	shot_num = 5,
	knockback = 10,
	spr = 73,
	t = 0,
	alive = true,
	interactable = true,
	interacted = false,
	prompt = false,
	update = function(self)
		if self.equipped == false then
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
				self.equipped = true
				self.spr = 75
				p.s_offset = 32
				del(objs, shotgun)
				self.spr = 0
				self.w = 1
				--self.x = p.x 
				--self.y = p.y
				add(objs, shotgun)
				self.interactable = false
			end
		elseif self.equipped then
			local x_off = 0
			local y_off = 0
			if p.flip then
				x_off = 0
			else
				x_off = 12
			end
			self.x = p.x + x_off	
			self.y = p.y
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
add(objs,shotgun)