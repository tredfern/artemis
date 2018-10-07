-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local path = (...):match("(.-)[^%.]+$")

return {
  deque             = require(path .. "src.deque"),
  queue             = require(path .. "src.queue"),
  randomizedqueue   = require(path .. "src.randomized_queue"),
  randomiterator    = require(path .. "src.random_iterator"),
  stack             = require(path .. "src.stack"),
  unionfind         = require(path .. "src.unionfind"),
  sorts = {
    shell = require(path .. "src.shellsort"),
    merge = require(path .. "src.mergesort"),
  }
}
