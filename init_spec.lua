-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

describe("Artemis", function()
  local artemis = require "init"
  it("loads the union find algorithm", function()
    assert.is_not.equals(nil, artemis.unionfind)
  end)

  it("loads the queue data structure", function()
    assert.is_not.equals(nil, artemis.queue)
  end)

  it("loads the deque data structure", function()
    assert.is_not.equals(nil, artemis.deque)
  end)

  it("loads the randomized queue data structure", function()
    assert.is_not.equals(nil, artemis.randomizedqueue)
  end)

  it("loads the randomized iterator", function()
    assert.is_not.equals(nil, artemis.randomiterator)
  end)

  it("loads the stack structure", function()
    assert.is_not.equals(nil, artemis.stack)
  end)

  it("loads sorts", function()
    assert.is_not.equal(nil, artemis.sorts)
  end)

  it("has shell short", function()
    assert.is_not.equal(nil, artemis.sorts.shell)
  end)
end)
