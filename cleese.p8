pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include cleese.lua
#include title.lua
#include credits.lua
#include objects.lua
#include utils.lua
#include player.lua
#include pike.lua
#include bullets.lua
#include shotgun.lua
#include map.lua
#include enemies.lua
#include particles.lua
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000045cccccccccccccccccccccbbbbbb3b0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045cccccccccccccccccccccbbbbb3b30000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045cccccccccccccccccccccbbbbbbbb0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045cccccccccccccccccccccbb3bbbbb0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045cccccccccccccccccccccb3b3bbbb0000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000004c5555555555555ccccccccbbbbbb3b0000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000444444444444444ccccccccbbbbb3b30000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ccccccccbbbbbbbb0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045ccccccccccccc00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045ccccccccccccc00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045ccccccccccccc00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045ccccccccccccc00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000045ccccccccccccc00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000004c555555555555500000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000044444444444444400000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000005555555555000000888888888800000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000555500000000000088880000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000555000000000000088800000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000550000000000000088000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbb444bb6566bbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbb44944bb65bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbb4499944b56bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbb44999994465bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbb449999999446bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbb4499999999944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb449999999999944bbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbb44999999999999944bbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbb44444444444444444bbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44999999999944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44999999cc9944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44999999cc9944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44999999cc9944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44994449999944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44994449999944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44994469999944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44994449999944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44994449999944bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbb44444444444444bbbbb00000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbb00000000
00000080008000000000000000000000000000000000000000000088880000000000000000000000000000000000000000000000000000000000000000000000
00000888888000000000000000000000000000888800000000000889998000000000000000000000000000000000000000000000000000000000000000000000
00000999999000000000088888800000000008899980000000000899999000000000000000000000000000000000000000000000000000000000000000000000
00009779977900000000099999900000000008999990000000000999779000000000000000000000000000000000000000000000000000000000000000000000
00009279927900000000977997790000000009997790000000009999719000000000000000000000000000000000000000000000000000000000000000000000
00008888888800000000927992790000000099997190000000009888888000000000000000000000000000000000000000000000000000000000000000000000
00008888888800000000888888880000000098888880000000000888888800000000000000000000000000000000000000000000000000000000000000000000
00098889988890000000888888880000000008888888000000000888889900000000000000000000000000000000000000000000000000000000000000000000
00999888888aa9000009888998889000000008888899000000000888880000000000000000000000000000000000000000000000000000000000000000000000
00999122221aa90000999888888aa900000008888800000000000111111000000000000000000000000000000000000000000000000000000000000000000000
004491222219440009449122221a4490000001111110000000000111441100000000000000000000000000000000000000000000000000000000000000000000
00440122221044000044012222104400000001144111000000000011441100000000000000000000000000000000000000000000000000000000000000000000
00009a11119900000000912222190000000000144111000000000011111100000000000000000000000000000000000000000000000000000000000000000000
0009aa900999900000099a1111999000000000111111000000000009aa0000000000000000000000000000000000000000000000000000000000000000000000
00449900009944000044990000994400000004400440000000000004440000000000000000000000000000000000000000000000000000000000000000000000
00444000000444000044400000044400000004440444000000000004444000000000000000000000000000000000000000000000000000000000000000000000
00000080008000000000000000000000000000000000000000000088880000000000000000000000000000000000000000000000000000000000000000000000
00000888888000000000080000000000000000888800000000000889998000000000000000000000000000000000000000000000000000000000000000000000
00000999999000000000088888800000000008899980000000000899999000000000000000000000000000000000000000000000000000000000000000000000
00009779977900000000099999900000000008999990000000000999779000000000000000000000000000000000000000000000000000000000000000000000
00009279927900000000977997790000000009997790000000009999719000000000000000000000000000000000000000000000000000000000000000000000
00008888888800000000927992790000000099997190000000009888888000000000000000000000000000000000000000000000000000000000000000000000
00008888888800000000888888880000000098888880000000000888888800000000000000000000000000000000000000000000000000000000000000000000
00098889988890000000888888880000000008888888000000000888889900000000000000000000000000000000000000000000000000000000000000000000
00999888888aa9000009888998889000000008888899000000000888880000000000000000000000000000000000000000000000000000000000000000000000
00999122221aa90000999888888aa900000008888800000000000111111000000000000000000000000000000000000000000000000000000000000000000000
554455555555440000999122221aaa90000001111110000000000155445555500000000000000000000000000000000000000000000000000000000000000000
55445122221044005544555555554400000005544555555000005555441100000000000000000000000000000000000000000000000000000000000000000000
55559a11119900005544912222194400000555544111000000005551111100000000000000000000000000000000000000000000000000000000000000000000
0009aa900999900055509a1111999000000555111111000000005509aa0000000000000000000000000000000000000000000000000000000000000000000000
00449900009944000044990000994400000554400440000000000004440000000000000000000000000000000000000000000000000000000000000000000000
00444000000444000044400000044400000004440444000000000004444000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000220022000000000002202200022022000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000033330002200220003333000033330000000000000000000000000000000000
00000000000500000000000000000000000000000005000000000000000500000031310000333300003313000033130000000000000000000000000000000000
00000000000555000000000000050000000000000005550000000000000555000233332000313100002333000023332000000000000000000000000000000000
00000000005565550000000000055500000000000055655500000000005565550232232002333320002322000023220000000000000000000000000000000000
00000000005555550000000000556555000000000055555500000000005555550233332002322320002333000233330000000000000000000000000000000000
00000000055550550000000000555555000000000555505500000000055550550023320002333320000233000002330000000000000000000000000000000000
00555555555550000000000005555055005555555555500000555555555550000020020000233200000202000000200000000000000000000000000000000000
05555555555550000055555555555000055555555555500005555555555550000000000000000000000000000000000000000000000000000000000000000000
05555555555555000555555555555000055555555555000005555555555500000000000000000000000000000000000000000000000000000000000000000000
05555505555555000555555555555000055555005555000005555500555500000000000000000000000000000000000000000000000000000000000000000000
05505500555555000555550555555500005550000555000000505000055550000000000000000000000000000000000000000000000000000000000000000000
05505500055005000550550055555500005550000055000000505500005050000000000000000000000000000000000000000000000000000000000000000000
05505000050005000550550005500500000550000055500005500500055050000000000000000000000000000000000000000000000000000000000000000000
05005000050005000550500005500500000555000550550005000500050050000000000000000000000000000000000000000000000000000000000000000000
05000000050000000500500005000500005505000500000005000500050050000000000000000000000000000000000000000000000000000000000000000000
__map__
000102030405060708000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001112131415161718000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
002122232425262728000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003132333435363738000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
004142434445464748000d0d5c5d5e0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
005152535455565758000d0d6c6d6e0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
006162636465666768000d0d7c7d7e0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0dc80d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007172737475767778000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0dc80d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0dc80d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0dc80d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0dc80d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0dc80d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
