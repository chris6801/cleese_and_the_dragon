--title screen

title_t = 0
prompt_col = 7
title_col = 10
title_col_idx = 1
title_fr = 15
title_cols = {8,9,13,14}

prompt_t = 0
prompt_idx = 1
tile_size = 8
fade_cols = {7, 5, 0, 5}
prompt_fr = 10

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

title_graphic = {
	"****************************************",
	"***###**#****####**####***###****####***",
	"**#*****#****#*****#*****##**#***#******",
	"**#*****##***####**####****#*****####***",
	"**#*****##***##****##****#**##***##*****",
	"***###**####*####**####***###****####***",
	"****************************************",
	"****##***##**#**###****####**#**#**###**",
	"***#**#**#*#*#**#**#*****#***#**#**#****",
	"***####**#**##**#**#*****#***####**##***",
	"***#**#**#***#**###******#***#**#**###**",
	"****************************************",
	"**###***###****###***####**###***##**##*",
	"**#**#**#**#**#***#*#*****#***#**###*##*",
	"**#***#*###***#####*#**##*#***#**#**###*",
	"**#***#*#**#**#***#*##**#*#***#**#***##*",
	"**####**#***#*#***#**###***###***#****#*",
	"****************************************"

}	

test_graphic = {


" 	▄████▄   ██▓    ▓█████ ▓█████   ██████ ▓█████           ",
"   ▒██▀ ▀█  ▓██▒    ▓█   ▀ ▓█   ▀ ▒██    ▒ ▓█   ▀          ",
"	▒▓█    ▄ ▒██░    ▒███   ▒███   ░ ▓██▄   ▒███            ",
"	▒▓▓▄ ▄██▒▒██░    ▒▓█  ▄ ▒▓█  ▄   ▒   ██▒▒▓█  ▄          ",
"	▒ ▓███▀ ░░██████▒░▒████▒░▒████▒▒██████▒▒░▒████▒         ",
"	░ ░▒ ▒  ░░ ▒░▓  ░░░ ▒░ ░░░ ▒░ ░▒ ▒▓▒ ▒ ░░░ ▒░ ░         ",
"	  ░  ▒   ░ ░ ▒  ░ ░ ░  ░ ░ ░  ░░ ░▒  ░ ░ ░ ░  ░         ",                                                       
"	 ▄▄▄       ███▄    █ ▓█████▄    ▄▄▄█████▓ ██░ ██ ▓█████ ",
"	▒████▄     ██ ▀█   █ ▒██▀ ██▌   ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀ ",
"	▒██  ▀█▄  ▓██  ▀█ ██▒░██   █▌   ▒ ▓██░ ▒░▒██▀▀██░▒███   ",
"	░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█▄   ▌   ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄ ",
"	 ▓█   ▓██▒▒██░   ▓██░░▒████▓      ▒██▒ ░ ░▓█▒░██▓░▒████▒",
"	 ▒▒   ▓▒█░░ ▒░   ▒ ▒  ▒▒▓  ▒      ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░",
"	  ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ▒  ▒        ░     ▒ ░▒░ ░ ░ ░░  ",
"						  ░                                 ",
"	▓█████▄  ██▀███   ▄▄▄        ▄████  ▒█████   ███▄    █  ",
"	▒██▀ ██▌▓██ ▒ ██▒▒████▄     ██▒ ▀█▒▒██▒  ██▒ ██ ▀█   █  ",
"	░██   █▌▓██ ░▄█ ▒▒██  ▀█▄  ▒██░▄▄▄░▒██░  ██▒▓██  ▀█ ██▒ ",
"	░▓█▄   ▌▒██▀▀█▄  ░██▄▄▄▄██ ░▓█  ██▓▒██   ██░▓██▒  ▐▌██▒ ",
"	░▒████▓ ░██▓ ▒██▒ ▓█   ▓██▒░▒▓███▀▒░ ████▓▒░▒██░   ▓██░ ",
"	 ▒▒▓  ▒ ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░ ░▒   ▒ ░ ▒░▒░▒░ ░ ▒░   ▒ ▒  ",
"	 ░ ▒  ▒   ░▒ ░ ▒░  ▒   ▒▒ ░  ░   ░   ░ ▒ ▒░ ░ ░░   ░ ▒░ "
	
}

function disp_title_gfx(gtable, xscale, yscale, txt_color, bg_color, jiggle)
    local time = t()  
    local config = {
        -- Movement parameters
        horz_speed = 1.5,
        vert_speed = 1,
        horz_amp = 1.5,
        vert_amp = 0.9,
        
        -- New scaling parameters
		bg_scale = 1,
        scale_speed = 1.4,
        scale_amp = 0.5,  -- 40% size variation
        base_scale = 2.3,
        row_phase = 0.2  -- Vertical stagger amount
    }

    for i=0, #gtable do
        local row_phase = i * config.row_phase
        for j=0, #gtable[1] do
            -- Base position calculation
            local base_x = j * xscale
            local base_y = i * yscale
            
            -- Animation effects
            local x_offset, y_offset, scale = 0, 0, 1
            if jiggle then
                -- Horizontal movement
                x_offset = sin(time * config.horz_speed + row_phase) * config.horz_amp
                
                -- Vertical movement
                y_offset = cos(time * config.vert_speed + row_phase) * config.vert_amp
                
                -- Scale animation with vertical stagger
                scale = config.base_scale + sin(time * config.scale_speed + row_phase) * config.scale_amp
            end

            local char = sub(gtable[i],j,j)
            local x = base_x + x_offset
            local y = base_y + y_offset
            
            -- Apply scaled drawing
            if char == "*" then
                circfill(x, y, bg_scale, bg_color)  -- Animated radius
            elseif char == "#" then
                -- Scale rectangle from center
                local hs = scale/2  -- Half-scale
				circfill(x, y, scale, txt_color)
                --rectfill(x-hs, y-hs, x+hs, (y+hs)*1.05, txt_color)
            end
        end
    end
end


function title_draw()
	cls()
	
	if title_t % title_fr == 0 then
		title_col_idx = (title_col_idx % #title_cols) + 1
		title_col = title_cols[title_col_idx]
	end

	bg_color = title_col - 4
	
	if title_t % prompt_fr == 0 then
		prompt_idx = (prompt_idx % #fade_cols) + 1
		prompt_col = fade_cols[prompt_idx]
	end
	
	disp_title_gfx(title_graphic, 3.2, 6, title_col, bg_color, true)
	--print("welcome to the jungle", 24, 100, 7)
	print("press ❎ to start", 32, 115, prompt_col)

	title_t += 1
	title_t = title_t % 60  -- Prevent overflow
end
