# namesizer
Random name synthesis library for norns

Test with "test_namesizer.lua"

K2 generates a new nonsense word

K3 generates a two part name by combining a descriptor word and a thing word

Add words line by line to "lib\descriptors.txt" and "lib\things.txt"

To use 

```
local NameSizer = include("namesizer/lib/namesizer")
```

NameSizer.rnd() to generate a 2 part name by combining a descriptor word and a thing word

NameSizer.new_word(length) to generate a new nonsense word. Length determines the length of the word. Length is random if left empty. 







