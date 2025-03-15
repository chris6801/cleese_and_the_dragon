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

  function shoot(shooter)
	local dx = shooter.dir.x
	local dy = shooter.dir.y

	for i=0,7 do
		newbullet(shooter.x, shooter.y + 8, 2, 2, dx + (rnd(0.5) - 0.25), dy + (rnd(0.5) - 0.25))
	end
end