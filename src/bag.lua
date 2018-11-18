-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local bag = {}

function bag:new(table)
  local b = table or {}
  setmetatable(b, self)
  self.__index = self
  return b
end

function bag:add(item)
  self[#self + 1] = item
end

function bag:remove(item)
  local i = self:index_of(item)
  table.remove(self, i)
end

function bag:index_of(item)
  for i,v in ipairs(self) do
    if item == v then return i end
  end
  return nil
end

function bag:contains(item)
  return self:index_of(item) ~= nil
end

return bag
