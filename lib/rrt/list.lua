--- Functions removed from stdlib's `list` module.

--- Make an index of a list of tables on a given field.
-- Requires that each field's value be distinct.
-- @param f field
-- @tparam list l list of tables `{t1, ..., tn}`
-- @treturn list index `{t1[f]=1, ..., tn[f]=n}`
function index_key (f, l)
  local r = {}
  for i, v in ipairs (l) do
    local k = v[f]
    if k then
      r[k] = i
    end
  end
  return r
end


--- Copy a list of tables, indexed on a given field.
-- Requires that each field's value be distinct.
-- @param f field whose value should be used as index
-- @tparam list l list of tables `{i1=t1, ..., in=tn}`
-- @treturn list index `{t1[f]=t1, ..., tn[f]=tn}`
function index_value (f, l)
  local r = {}
  for i, v in ipairs (l) do
    local k = v[f]
    if k then
      r[k] = v
    end
  end
  return r
end

-- Public interface
local M = {
  index_key   = index_key,
  index_value = index_value,
}

return M
