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