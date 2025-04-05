--credits

open_credits = {
    "arthur cleese is in a", 
	"swanky apartment party,", 
	"a going away party...",
    "▒",
	"cleese is what they call",
	"him: friends and coworkers,",
	"even his girlfriend doris.",
	"▒",
	"cleese wanders around the ",
	"party saying goodbye, cleese",
	"is leaving the job he hates,",
	"▒"
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
	map(0,0,0,0,15,13)
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
	draw_op_bg()
	spr(136,40,50,1,2)
	spr(136,50,36,1,2)
	rectfill(1,78,120,127,3)

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