-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT


-- Uses a queue to implement the random operation.
local RandomizedQueue = require "src.randomized_queue"

return function(t)
  local queue = RandomizedQueue:new(t)
  return function()
    if queue:isempty() then
      return nil
    end
    return queue:dequeue()
  end
end
