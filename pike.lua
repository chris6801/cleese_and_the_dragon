function make_pike()
	pike = {
		x = 40,
		y = 40,
		dx = 0,
		dy = 0,
		spr = 192,
		dir = {x = 0, y = 0},
		play = "idle",
		a_idx = 0,
		alive = true,
		flip = false,
		anims = {
			idle = {fr=15, 192, 194},
			walkx = {fr=10, 196, 198}
		},
		update = function(self)
			self.x += self.dx
			self.y += self.dy

			distance = sqrt((p.x - self.x) ^ 2 + (p.y - self.y) ^ 2)
			if abs(p.x - self.x) > 20 then
				self.dx = p.x - self.x
				self.dx /= distance
			elseif abs(p.y - self.y) > 20 then
				self.dy = p.y - self.y
				self.dy /= distance
			else
				self.dx = rnd(1) - 0.5
				self.dy = rnd(1) - 0.5
			end

			animate(self)
			return self.alive
		end,
		draw = function(self)
			spr(self.spr, self.x, self.y, 2, 2, self.flip)
		end,
	}
	add(objs, pike)
end