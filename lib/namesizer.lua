local NameSizer = {}
NameSizer.__index = NameSizer

NameSizer.descriptor_path = _path.code.."namesizer/lib/descriptors.txt"
NameSizer.things_path = _path.code.."namesizer/lib/things.txt"

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

return NameSizer