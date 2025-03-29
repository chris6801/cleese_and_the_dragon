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
		charging = false,
		charge_time = 0,
		inventory = {},
		shootable = false,
		knocked_back = false,
		kb_intensity = .05,
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
		--knock back
		knock_back = function(self, intensity)
			self.dx = -self.dir.x * (self.kb_intensity * shotgun.knock_back)
			self.dy = -self.dir.y * (self.kb_intensity * shotgun.knock_back)
			self.knocked_back = false
		end,
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
			if self.shotgun and shotgun.ready then
				if is_held(🅾️) then
					shotgun.charge += 1
					if shotgun.charge > shotgun.charge_max then
						self.charge = 30
					end
					if shotgun.charge > 0 then
						self.charging = true
					end
				else
					self.charging = false
				end
				if is_released(🅾️) then
					self.kb_intensity += shotgun.charge * .1
					shoot(self, shotgun) 	
					self.knock_back(self, self.kb_intensity)
					shotgun.ready = false
					shotgun.charge = 0
					self.kb_intensity = 0
				end
			end
		end,
		update = function(self)
			--multiply friction
			self.dx *= friction
			self.dy *= friction
			
			--knock back
			if self.knocked_back then
				self.dx = -self.dir.x * (self.kb_intensity * shotgun.knock_back)
				self.dy = -self.dir.y * (self.kb_intensity * shotgun.knock_back)
				self.knocked_back = false
			end

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
			--charging pallet swap by using the frame counter
			if self.charging then
				self.charge_time += 1
				if self.charge_time % 2 == 0 and shotgun.charge < shotgun.charge_max then
					if toggled then	
						pal(8,13)
						toggled = false
					else
						pal(13,8)
						toggled = true
					end
			
				end
			else
				self.charge_time = 0
				pal()
			end
			spr(self.spr + self.s_offset, self.x,
			self.y, 2, 2, self.flip)
			pal()
		end,
	}
	add(objs, p)	 
end