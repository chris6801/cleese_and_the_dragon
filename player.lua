--player

function make_player()
	p = {
		x = 32,
		y = 32,
		dx = 0,
		dy = 0,
		ax = 0,
		ay = 0,
		dir = {x = 0, y = 0},
		play = "idle",
		a_idx = 0,
		t = 1,
		inventory = {},
		flip = false,
		spr = 1,
		shotgun = false,
		alive = true,
		prompt = false,
		s_offset = 0,
		anims = {
			idle = {fr=15, 128, 130},
			walkx = {fr=10, 132, 134}
		},
		input = function(self)
			if btn(⬅️) then
				self.dx = -1
				self.dir.x = -1
			end
			if btn(➡️) then
				self.dx = 1
				self.dir.x = 1
			end
			if btn(⬆️) then
				self.dy = -1
				self.dir.y = -1
			end
			if btn(⬇️) then
				self.dy = 1
				self.dir.y = 1
			end

			--set last main facing direction for bullet direction logic
			if btnp(⬆️) or btnp(⬇️) and (not btnp(➡️) and not btnp(⬅️)) then
				self.dir.x = 0
			elseif btnp(➡️) or btnp(⬅️) and (not btnp(⬇️) and not btnp(⬆️)) then
				self.dir.y = 0
			end

			--interactable objs
			for obj in all(objs) do
				if abs(obj.x - p.x) < 8 and abs(obj.y - p.y) < 8 and obj.interactable then
					x_interact(obj)
					obj.prompt = true
				else
					obj.prompt = false
				end
			end

			--shotgun 
			if self.shotgun then
				if btnp(🅾️) then
					shoot(self)
				end
			end
		end,
		update = function(self)
			--multiply friction
			self.dx *= friction
			self.dy *= friction

			self.x += self.dx
			self.y += self.dy

			--manage state
			if abs(self.dx) > 0.4 then
				if self.dx < 0 then
					self.flip = true
				elseif self.dx > 0 then
					self.flip = false
				end
				self.play = "walkx"
			else
				self.play = "idle"
			end
			animate(self)
			return self.alive
		end,
		draw = function(self)
			spr(self.spr + self.s_offset, self.x,
			self.y, 2, 2, self.flip)
		end
	}
	add(objs, p)	 
end