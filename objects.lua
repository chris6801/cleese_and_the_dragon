--object management
--a list of all the objects in the game (starts empty)
objs = {}

friction = .85

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