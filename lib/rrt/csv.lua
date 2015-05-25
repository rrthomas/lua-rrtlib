--- CSV utilities.

local std = require "std"
local list = require "std.list"

--- Convert to/from CSV.
-- To include the separator in a string, enclose it in double quotes.
-- To escape a double-quote character, repeat it.
local function CSVToTable (l, sep)
  local t = {}
  local i = 1
  sep = sep or ','
  while i <= #l do
    local c = l[i]
    if c == '"' then -- quoted value
      local s = ""
      repeat
        local from, to = l:find ('^%b""', i)
        s = s .. l:sub (from + 1, to - 1)
        i = to + 1
        c = l[i]
        if c == '"' then s = s .. '"' end
        -- If the next character after the closing quote is another
        -- quote, we have an escaped quote.
      until c ~= '"'
      table.insert (t, s)
      assert (c == sep or c == "")
      i = i + 1
    else -- no quote, so look for the first separator
      local from, to = l:find (sep, i)
      if from then
        table.insert (t, l:sub (i, from - 1))
        i = to + 1
      else -- no separator: use rest of string
        table.insert (t, l:sub (i))
        i = #l + 1
      end
    end
  end
  return t
end

-- FIXME: Don't insert redundant quotes (so we get closer to idempotent round-trip)
local function tableToCSV (t, sep)
  return table.concat (functional.map (function (s)
                                         return '"' .. s:gsub ('"', '""') .. '"'
                                       end,
                                       std.ielems,
                                       t),
                       sep or ',')
end

-- Public interface
local M = {
  CSVToTable = CSVToTable,
  tableToCSV = tableToCSV,
}

return M
