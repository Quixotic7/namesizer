local NameSizer = {}
NameSizer.__index = NameSizer

NameSizer.descriptor_path = _path.code.."namesizer/lib/descriptors.txt"
NameSizer.things_path = _path.code.."namesizer/lib/things.txt"

NameSizer.CONSONANTS = {"b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "r", "s", "t", "v", "w", "x", "y", "z"};
NameSizer.VOWELS = {"a", "e", "i", "o", "u"}
NameSizer.KEEP_IT_FUNKY = {"ca", "lll", "moo", "fu", "cha", "cream", "choc", "silk", "ice", "eee", "goo", "_a_", "two", "zzz", 
"boo", "cats", "boom", "ch", "ck", "digi", "ome", "sh", "ish", "ed", "milk", "cyber", "punk", "delta", "epsi", "beta", "fire", "uzz" }

local function getRandNameFromFile(path)
    local f = io.open(path, "r")

    if f == nil then
        print("404, file not found: "..path)
        return "bad wolf"
    end
        
    f:close()

    local all_lines = {}

    for line in io.lines(path) do
        table.insert(all_lines, line)
    end

    if #all_lines == 0 then return "bad bear" end

    local s = all_lines[math.random(1, #all_lines)]

    return s:gsub('[%p%c%s]', '')
end

-- Returns a random name by combining a random descriptor and thing
-- @tparam string separator : placed in between the words, space by default
function NameSizer.rnd(separator)
    separator = separator or " "
    local d = getRandNameFromFile(NameSizer.descriptor_path)
    local t = getRandNameFromFile(NameSizer.things_path);

    return d..separator..t
end

-- Synthesizes a new word from the Cosmos
-- @tparam int length : length of word, default = random, min = 2
function NameSizer.new_word(length)
    length = length or math.random(4,8)

    length = math.max(length, 2)

    local word = ""
    local b = true
    local hyphen = math.random() > 0.5 and length > 3
    local hypheni = util.round(length / 2)

    for i = 1, length do
        if hyphen and i == hypheni then
            word = word.."-"
        elseif math.random() < 0.2 then
            word = word..NameSizer.KEEP_IT_FUNKY[math.random(1, #NameSizer.KEEP_IT_FUNKY)]
        else
            l = b and NameSizer.CONSONANTS[math.random(1, #NameSizer.CONSONANTS)] or NameSizer.VOWELS[math.random(1, #NameSizer.VOWELS)]
            word = word..l
        end
        b = math.random() > 0.5
    end

    return word
end

return NameSizer