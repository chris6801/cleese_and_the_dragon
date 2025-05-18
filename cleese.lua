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

--game scene

function play_init()
	x=32
	y=32
	game.update=play_update
	game.draw=play_draw
	setup_map()
	make_enemy(140,32)
	make_player()
	make_pike()
end

function play_update()
	p:input()
	upd_keys()
	obj_update()
end

function play_draw()
	cls()
	map(10,3,0,0)
	camera(p.x-64,p.y-64)
	obj_draw()
	print(flr(time()))
end