--game loop and game obj

game={
	init=function(self)
		game.update=title_update
		game.draw=title_draw
	end,
	update=function(self) end,
	draw=function(self) end	
}

function _init()
	game:init()
end

function _update()
	game:update()
end

function _draw()
	if game.draw==nil then
		print("nil value")
	else
		game:draw()
	end	
end

--title screen

title_t = 0
title_c = 7

prompt_t = 0
prompt_idx = 1

fade_cols = {7, 5, 0, 5}

function title_init()
	game.update=title_update
	game.draw=title_draw
	print("title initialized")
end

--game_init=title_init

function title_update()
	if btnp(❎) then
		cr_init()
	end	
end

function title_draw()
	cls()
	map(1,0,32,32,8,8)
	print("welcome to the jungle",
	24,100,7)
	if title_t<10 then
		title_c=7
	elseif title_t<20 then
		title_c=5
	elseif title_t<30 then
		title_c=0
	elseif title_t<40 then
		title_c=5
	elseif title_t<50 then
		title_t=0
	end
	print("press ❎ to start",
	32,110,title_c)
	title_t+=1
end

function x_prompt(x, y, cols)
	if prompt_idx > #cols then
		prompt_idx = 1
	end
	print("press ❎ to continue", x, y, cols[prompt_idx])
	prompt_t += 1
	if prompt_t > 10 then
		prompt_t = 0
		prompt_idx += 1
	end
end

--game scene

function play_init()
	x=32
	y=32
	game.update=play_update
	game.draw=play_draw
	make_player()
	make_pike()
end

function play_update()
	p:input()
	obj_update()
end

function play_draw()
	cls()
	map(10,3,0,0,20,20)
	camera(p.x-64,p.y-64)
	obj_draw()
end

--utils

function swap_tile(x,y)
	tile=mget(x,y)
	mset(x,y,tile+1)
end

function unswap_tile(x,y)
	tile=mget(x,y)
	mset(x,y,tile-1)
end

function x_interact_draw(obj, cols)
	rect(obj.x - 8, obj.y - 2, obj.x + 8, obj.y - 10)
	if prompt_idx > #cols then
		prompt_idx = 1
	end
	print("❎", obj.x - 3, obj.y - 8, cols[prompt_idx])
	prompt_t += 1
	if prompt_t > 10 then
		prompt_t = 0
		prompt_idx += 1
	end
end

function x_interact(obj)
	if btnp(❎) then
		obj.interacted = true
	end
end

function get_distance(x0,y0,x1,y1) do
			return sqrt((x1 - x0) ^ 2 + (y1 - y0) ^ 2)
end

--physics
friction = .85

--animation
function animate(x)
	print("animating")
	if x.state~=x.play then
		x.state=x.play
		x.a_idx=1
		x.t=0
		print(x.state)
	elseif #x.anims[x.state] > 1
	then
		x.t += 1
		if x.t % 
		(x.anims[x.state].fr) == 0 
		then
			x.a_idx = (x.a_idx 
			% #x.anims[x.state]) + 1
			if x.a_idx == 1 and
			x.anims[x.state].next then
				x.play = x.anims[x.state].next
				x.state = x.play
			end	
		end
	end
	x.spr = 
	x.anims[x.state][x.a_idx]
end


--collision detection
function det_colls(subject,objects)
	for obj in all(objects) do
		if subject.x+subject.w*tile_size > obj.x 
		and subject.x+subject.w*tile_size < obj.x+obj.w*tile_size
	 and	subject.y+subject.h*tile_size > obj.y 
	 and subject.y+subject.h*tile_size < obj.y+obj.h*tile_size then
			subject.col=obj
			if subject.dx > 0 then
				return "right"
			elseif subject.dx < 0 then
			 return "left"
			elseif subject.dy > 0 then
			 return "down"
			elseif subject.dy < 0 then
				return "up" 
			end
		else	
			subject.col=nil	
		end
	end
end

--object management
objs = {}                    --a list of all the objects in the game (starts empty)
function bullet_draw(o)
  if o.time % o.fr == 0 then
	o.a_idx = (o.a_idx % #o.cols) + 1
  end  	          --a basic function for drawing objects,
   circfill(o.x, o.y, o.r, o.cols[o.a_idx])            --as long as those objects have spr, x, and y values inside
end
function bulletupdate(b)     --a function for moving bullets a little bit at a time
 b.x += b.dx * b.speed                --x moves by the change in x every frame (dx)
 b.y += b.dy * b.speed
 b.r += 0.1               --y moves by the change in y every frame (dy)
 b.time -= 1                 --if bullets have existed for too long, erase them
 return b.time > 0           --returns true if still alive, false if it needs to be removed
end
function newbullet(x,y,w,h,dx,dy)--bullets have position x,y, width, height, and move dx,dy each frame
 local b = {                 --only use the b table inside this function, it's "local" to it
  x=x,y=y,dx=dx,dy=dy,       --the x=x means let b.x = the value stored in newbullet()'s x variable
  w=w,h=h,                   --b.w and b.h are also set to the function's w and h args
  time=30,
  r=2,
  fr=10,
  speed=5,
  a_idx=1,
  cols = {7,5,0},                   --this is how long a bullet will last before disappearing
  update=bulletupdate,       --you can put functions in tables just like any other value
  spr=0,draw= bullet_draw         --bullets don't have special drawing code, so re-use a basic object draw
 }
 add(objs,b)                 --now we can manage all bullets in a list
 return b                    --and if some are special, we can adjust them a bit outside of this function
end

function obj_draw()             --the game's draw function, only called 30 times/second when there's no lag
 for o in all(objs) do o:draw() end --o:draw() is the same as o.draw(o). this is useful here!
end

function obj_update()           --the game's update function, always called 30 times/second
 local i,j=1,1               --to properly support objects being deleted, can't use del() or deli()
 while(objs[i]) do           --if we used a for loop, adding new objects in object updates would break
  if objs[i]:update() then
   if(i!=j) objs[j]=objs[i] objs[i]=nil --shift objects if necessary
   j+=1
  else objs[i]=nil end       --remove objects that have died or timed out
  i+=1                       --go to the next object (including just added objects)
 end
end

function shoot_shotgun(shooter)
	local dx = shooter.dir.x
	local dy = shooter.dir.y

	for i=0,7 do
		newbullet(shooter.x, shooter.y + 8, 2, 2, dx + (rnd(0.5) - 0.25), dy + (rnd(0.5) - 0.25))
	end
end

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
					shoot_shotgun(self)
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

			--determine state
			for e in all(enemies) do
							local d = get_distance(self.x, self.y, e.x, e.y
							if d < 30 then
										self.play = "idle"
							end
			end

		 
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

--enemies
enemies = {}

--dialogue

open_credits = {
    "arthur cleese is in a", 
	"swanky apartment party,", 
	"a going away party...",
    "▒",
}
open_credits_cont = {
	"cleese is what they call",
	"him: friends and coworkers,",
	"even his girlfriend doris.",
	"▒",
	"cleese wanders around the ",
	"party saying goodbye, cleese",
	"is leaving the job he hates,",
	"▒"
   }

function draw_op_bg()
	spr(10, 32, 32)
	spr(11, 40, 32)
	spr(11, 48, 32)
end
   
current_line = 1
clip_width = 0
base_y = 34
line_height = 7
reveal_speed = 3
paused = false
visible_lines = 0
cr_idx = 1

function cr_init()
	game.update = cr_update
	game.draw = cr_draw
end

function cr_update()
	if open_credits[current_line] == '▒' then
		paused = true
		if btnp(❎) then
			paused = false
			if current_line == #open_credits then
				play_init()
			else
				current_line += 1
				clip_width = 0
				visible_lines += 1
			end
		end
	end

	if not paused then
		if clip_width >= 120 then
			clip_width = 0
			if open_credits[current_line] != "▒" then
				visible_lines += 1 
			end
			current_line += 1
		else
			clip_width += reveal_speed
		end
	end
end	

function cr_draw()
	cls()
	rect(1,78,120,127,3)
	draw_op_bg()

	--Draw previously completed lines
	local y_offset = 0
	local lines_drawn = 0

	if visible_lines > 6 then
		cr_idx = current_line - 6 - 1
	end

	for i=cr_idx, current_line-1 do
		if open_credits[i] != "▒" then
			print(open_credits[i], 10, 80 + y_offset, 2)
			y_offset += line_height
			lines_drawn += 1
			if lines_drawn  >= 6 then
		    	break
			end
		end
	end

	if lines_drawn < 6 and open_credits[current_line] != "▒" then
		clip(1, 80 + y_offset, clip_width, line_height)
		print(open_credits[current_line], 10, 80 + y_offset, 2)
		clip()
	end

	if paused then
		x_prompt(20, 121, fade_cols)
	end
end