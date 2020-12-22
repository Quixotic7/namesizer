-- namesizer
-- a name synthesizer
-- K2 to create nonsense name
-- K3 to synthesize a name

local NameSizer = include("lib/namesizer")

local name = ""

local shiftDown = false

function init()
    name = NameSizer.rnd()

    redraw()
end

function key(n, z)
    if n == 1 then
        shiftDown = z == 1
    elseif shiftDown and n == 2 and z == 1 then
        name = NameSizer.phonic_nonsense()
        redraw()
    elseif shiftDown and n == 3 and z == 1 then
        name = NameSizer.phonic_nonsense().." "..NameSizer.phonic_nonsense()
        redraw()
    elseif not shiftDown and n == 2 and z == 1 then
        name = NameSizer.new_word()
        redraw()
    elseif not shiftDown and n == 3 and z == 1 then
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