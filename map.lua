--map setup

function setup_map()
    for i=0, 127 do
        for j=0, 31 do
            sprite=mget(i,j)
            if sprite==200 then
                mset(i,j,13)
                make_enemy(i*8,j*8)
            end
        end
    end
end