function make_pike()
	pike = {
		x = 40,
		y = 40,
		dx = 0,
		dy = 0,
		spr = 192,
		dir = {x = 0, y = 0},
		play = "idle",
		mood = "idle",
		move_wait = 30,
		move_time = 20,	
		moving = false,
		end_idx = 0,
		alive = true,
		flip = false,
		anims = {
			idle = {fr=15, 192, 194},
			walkx = {fr=10, 196, 198}
		},
		update = function(self)
			self.x += self.dx
			self.y += self.dy

			if self.mood=="idle" then
                if self.move_wait <= 0 then
                    self.dx = rnd(2)-1
                    self.dy = rnd(2)-1
                    self.move_wait = 30
                    self.moving = true
                end
                if self.move_time <= 0 then
                    self.dx = 0
                    self.dy = 0
                    self.move_time = 15
                    self.moving = false
                end
                if self.moving == false then
                    self.move_wait -= 1
                end
                if self.moving then
                    self.move_time -= 1
                end
            end

			distance = sqrt((p.x - self.x) ^ 2 + (p.y - self.y) ^ 2)
			if abs(p.x - self.x) > 50 then
				self.dx = p.x - self.x
				self.dx /= distance
			elseif abs(p.y - self.y) > 50 then
				self.dy = p.y - self.y
				self.dy /= distance
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