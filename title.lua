--title screen

title_t = 0
title_c = 7

prompt_t = 0
prompt_idx = 1
tile_size = 8
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