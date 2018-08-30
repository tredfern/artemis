-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

describe("Queues", function()
  local Queue = require "queue"
  it("can enqueue an item on to the queue", function()
    local q = Queue:new()
    q:enqueue("item")
    assert.equals("item", q:front())
  end)

  it("can dequeue an item from the queue", function()
    local q = Queue:new()
    q:enqueue("item")
    assert.equals("item", q:dequeue())
  end)

  it("removes the first item in to the queue", function()
    local q = Queue:new()
    q:enqueue("item 1")
    q:enqueue("item 2")
    q:enqueue("item 3")
    assert.equals("item 1", q:dequeue())
  end)

  it("Knows if it is empty", function()
    local q = Queue:new()
    assert.is_true(q:isempty())
    q:enqueue("item 1")
    assert.is_false(q:isempty())
    q:dequeue()
    assert.is_true(q:isempty())
  end)

  it("can clear out all queued items", function()
    local q = Queue:new()
    q:enqueue("item 1")
    q:enqueue("item 2")
    q:enqueue("item 3")
    q:clear()
    assert.is_true(q:isempty())
  end)
end)
