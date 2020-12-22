local NameSizer = {}
NameSizer.__index = NameSizer

NameSizer.descriptor_path = _path.code.."namesizer/lib/descriptors.txt"
NameSizer.things_path = _path.code.."namesizer/lib/things.txt"

NameSizer.CONSONANTS = {"b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "r", "s", "t", "v", "w", "x", "y", "z"};
NameSizer.VOWELS = {"a", "e", "i", "o", "u"}

function NameSizer.getRandNameFromFile(path)
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


function NameSizer.rnd(separator)
    separator = separator or " "
    local d = NameSizer.getRandNameFromFile(NameSizer.descriptor_path)
    local t = NameSizer.getRandNameFromFile(NameSizer.things_path);

    return d..separator..t
end

function NameSizer.new_word(length)
    length = length or math.random(4,10)

    length = math.max(length, 2)

    local word = ""
    local b = true
    local hyphen = math.random() > 0.5 and length > 3
    local hypheni = util.round(length / 2)

    for i = 1, length do
        if hyphen and i == hypheni then
            word = word.."-"
        else
            l = b and NameSizer.CONSONANTS[math.random(1, #NameSizer.CONSONANTS)] or NameSizer.VOWELS[math.random(1, #NameSizer.VOWELS)]
            word = word..l
            b = math.random() > 0.5
        end
    end

    return word
end

return NameSizer