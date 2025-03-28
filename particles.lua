--particles

ps={}

function make_particle(x,y)
    local p = {
        x = x,
        y = y,
        dx = rnd(5) - 2.5,
        dy = rnd(5) - 2.5,
        r = 2,
        life = 10,
        shootable = false,
        fr = 2,
        col = 1,
        cols = {8,9,10,7},
        alive = true,
        update = function(self)
            self.life -= 1
            --check if particle is dead
            if self.life <= 0 then
                self.alive = false
            end

            --change color
            if self.life % self.fr == 0 then
                self.col += 1
            end

            self.x += self.dx
            self.y += self.dy
            self.r -= .1

            return self.alive
        end,
        draw = function(self)
            circfill(self.x, self.y, self.r, self.cols[self.col])
        end, 
    }
    add(objs, p)
end