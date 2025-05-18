--enemies
enms={} 

function make_enemy(x,y)
    local e = {
        x = x,
		y = y,
		dx = 0,
		dy = 0,
		ax = 0,
		ay = 0,
        w = 8,
        h = 8,
        hit=false,
        health = 5,
        shootable = true,
		dir = {x = 0, y = 0},
		play = "idle",
		a_idx = 0,
		t = 1,
		inventory = {},
		flip = false,
		spr = 200,
        mood = "idle",
        move_wait = 30,
        move_time = 15,
        moving = false,
		alive = true,
		prompt = false,
		s_offset = 0,
		anims = {
			idle = {fr=15, 200, 201},
			walkx = {fr=10, 202, 203}
		},
        update = function(self)
            self.x+=self.dx
            self.y+=self.dy

            --manage mood
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
                if (self.moving) self.move_time -= 1
            end
            
            --check health
            if self.health <= 0 then
                self.alive = false
            end

            --manage anims
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
			self.y, 1, 1, self.flip)
            if self.hit then
                print("-1", self.x+4,self.y+4)
            end
		end,
    }
    add(objs,e)
    --add(enms,e)
end