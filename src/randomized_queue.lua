-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local RandomizedQueue = {}

function RandomizedQueue:new()
  local rq = {}
  self.__index = self
  setmetatable(rq, self)
  return rq
end

function RandomizedQueue:isempty()
  return #self == 0
end

function RandomizedQueue:enqueue(o)
  self[#self + 1] = o
end

function RandomizedQueue:dequeue()
  local i = math.random(#self)
  return table.remove(self, i)
end

function RandomizedQueue:sample()
  return self[math.random(#self)]
end

return RandomizedQueue
