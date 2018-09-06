-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local path = (...):match("(.-)[^%.]+$")

return {
  Deque             = require(path .. "src.deque"),
  Queue             = require(path .. "src.queue"),
  RandomizedQueue   = require(path .. "src.randomized_queue"),
  RandomIterator    = require(path .. "src.random_iterator"),
  Stack             = require(path .. "src.stack"),
  UnionFind         = require(path .. "src.unionfind"),
}
