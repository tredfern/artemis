-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

describe("Artemis", function()
  local artemis = require "init"
  it("loads the union find algorithm", function()
    assert.is_not.equals(nil, artemis.UnionFind)
  end)

  it("loads the queue data structure", function()
    assert.is_not.equals(nil, artemis.Queue)
  end)

  it("loads the deque data structure", function()
    assert.is_not.equals(nil, artemis.Deque)
  end)

  it("loads the randomized queue data structure", function()
    assert.is_not.equals(nil, artemis.RandomizedQueue)
  end)

  it("loads the randomized iterator", function()
    assert.is_not.equals(nil, artemis.RandomIterator)
  end)

  it("loads the stack structure", function()
    assert.is_not.equals(nil, artemis.Stack)
  end)
end)
