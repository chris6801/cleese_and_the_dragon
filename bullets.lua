--bullets
bs = {}

  function bullet_draw(o)
    if o.time % o.fr == 0 then
      o.a_idx = (o.a_idx % #o.cols) + 1
    end  	          --a basic function for drawing objects,
     circfill(o.x, o.y, o.r, o.cols[o.a_idx])            --as long as those objects have spr, x, and y values inside
  end
  function bulletupdate(b)
   det_colls(b, objs  )     --a function for moving bullets a little bit at a time
   b.x += b.dx * b.speed                --x moves by the change in x every frame (dx)
   b.y += b.dy * b.speed             --y moves by the change in y every frame (dy)
   b.r += 0.05               
   b.time -= 1
   if (b.time <= 0) b.alive = false                 --if bullets have existed for too long, erase them
   return b.alive           --returns true if still alive, false if it needs to be removed
  end
  function explosion(b)
    for i=0,15 do
      make_particle(b.x, b.y)
    end
  end
  --collision
function det_colls(b,objs)
  for obj in all(objs) do
    if obj.shootable then
      if obj.x < b.x + b.r and b.x + b.r < obj.x + obj.w and
        obj.y < b.y + b.r and b.y + b.r < obj.y + obj.h then
          obj.health -= b.power
          b.alive = false
          explosion(b)
      end
    end
  end
end
  function newbullet(x,y,w,h,dx,dy)--bullets have position x,y, width, height, and move dx,dy each frame
   local b = {                 --only use the b table inside this function, it's "local" to it
    x=x,y=y,dx=dx,dy=dy,       --the x=x means let b.x = the value stored in newbullet()'s x variable
    w=w,h=h,                   --b.w and b.h are also set to the function's w and h args
    time=15,
    alive=true,
    power=1,
    r=2,
    fr=3,
    speed=5,
    shootable=false,
    a_idx=1,
    cols = {7,5,0},                   --this is how long a bullet will last before disappearing
    update=bulletupdate,       --you can put functions in tables just like any other value
    spr=0,draw= bullet_draw         --bullets don't have special drawing code, so re-use a basic object draw
   }
   add(objs,b)
   add(bs,b)                 --now we can manage all bullets in a list
   return b                    --and if some are special, we can adjust them a bit outside of this function
  end
