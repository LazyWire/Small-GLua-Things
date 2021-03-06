-- incredible-gmod.ru
-- https://github.com/Be1zebub/Small-GLua-Things/blob/master/sh_utf8.lua
-- its also supports ascii chars

local upper2lower = {["A"]="a",["B"]="b",["C"]="c",["D"]="d",["E"]="e",["F"]="f",["G"]="g",["H"]="h",["I"]="i",["J"]="j",["K"]="k",["L"]="l",["M"]="m",["N"]="n",["O"]="o",["P"]="p",["Q"]="q",["R"]="r",["S"]="s",["T"]="t",["U"]="u",["V"]="v",["W"]="w",["X"]="x",["Y"]="y",["Z"]="z",["А"]="а",["Б"]="б",["В"]="в",["Г"]="г",["Д"]="д",["Е"]="е",["Ё"]="ё",["Ж"]="ж",["З"]="з",["И"]="и",["Й"]="й",["К"]="к",["Л"]="л",["М"]="м",["Н"]="н",["О"]="о",["П"]="п",["Р"]="р",["С"]="с",["Т"]="т",["У"]="у",["Ф"]="ф",["Х"]="х",["Ц"]="ц",["Ч"]="ч",["Ш"]="ш",["Щ"]="щ",["Ъ"]="ъ",["Ы"]="ы",["Ь"]="ь",["Э"]="э",["Ю"]="ю",["Я"]="я"}
local lower2upper = {}
for upper, lower in pairs(upper2lower) do lower2upper[lower] = upper end
local pattern = "[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*"
local gsub = string.gsub

function utf8.lower(s)
    return (gsub(s, pattern, upper2lower))
end

function utf8.upper(s)
    return (gsub(s, pattern, lower2upper))
end

--print(utf8.lower("Привет World #123!"), utf8.upper("Hello Мир #321!"))
