-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local list = {}

function list:new(table)
  local b = table or {}
  setmetatable(b, self)
  self.__index = self
  return b
end

function list:add(item)
  self[#self + 1] = item
end

function list:remove(item)
  local i = self:index_of(item)
  if i then
    table.remove(self, i)
  end
end

function list:index_of(item)
  for i,v in ipairs(self) do
    if item == v then return i end
  end
  return nil
end

function list:first(search)
  if search == nil then
    return self[1]
  end

  for _, v in ipairs(self) do
    if search(v) then
      return v
    end
  end
  return nil
end

function list:last(search)
  if search == nil then
    return self[#self]
  end

  for i = #self, 1, -1 do
    if search(self[i]) then
      return self[i]
    end
  end
  return nil
end

function list:contains(item)
  return self:index_of(item) ~= nil
end

function list:where(filter)
  local result = list:new()
  for _, v in ipairs(self) do
    if filter(v) then
      result:add(v)
    end
  end
  return result
end

return list
