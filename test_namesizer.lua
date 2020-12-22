-- namesizer
-- a name synthesizer
-- K2 to create nonsense name
-- K3 to synthesize a name

local NameSizer = include("lib/namesizer")

local name = ""

function init()
    name = NameSizer.rnd()

    redraw()
end

function key(n, z)
    if n == 2 and z == 1 then
        name = NameSizer.new_word()
        redraw()
    elseif n == 3 and z == 1 then
        name = NameSizer.rnd()
        redraw()
    end
end

function redraw()
    screen.clear();

    screen.move(64, 32 + 5)
    screen.text_center(name)

    screen.update();
end