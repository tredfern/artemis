-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

describe("Bag", function()
  local bag = require "bag"

  it("should operate like a normal lua set", function()
    local b = bag:new()
    b:add(1)
    b:add(2)
    assert.equals(2, #b)
    assert.equals(1, b[1])
    assert.equals(2, b[2])
  end)

  it("can add and remove items", function()
    local b = bag:new()
    b:add("foo")
    b:add("bar")
    b:remove("bar")
    assert.array_matches({"foo"}, b)
  end)

  it("can find items in the list", function()
    local b = bag:new()
    b:add("foo")
    b:add("goo")
    b:add("soo")
    assert.is_true(b:contains("goo"))
    assert.is_false(b:contains("hoo"))
  end)

  it("can find the index of the first item that matches", function()
    local b = bag:new()
    b:add("bar")
    b:add("car")
    b:add("dar")
    b:add("ear")
    assert.equals(3, b:index_of("dar"))
  end)

  it("can be initialized with a list of items", function()
    local b = bag:new({"one", "two", "three"})
    assert.is_true(b:contains("one"))
    assert.equals(3, #b)
  end)

  it("can get the first item from the bag", function()
    local b = bag:new({"one", "two", "three"})
    assert.equals("one", b:first())
  end)

  it("can get the last item from the bag", function()
    local b = bag:new({"one", "two", "three"})
    assert.equals("three", b:last())
  end)

  it("can have a filter for first item that returns the first item that matches the filter", function()
    local b = bag:new({2, 4, 6, 8 })
    local found = b:first(function(c) return c % 2 == 0 end)
    assert.equals(2, found)
  end)

  it("it returns nil on a search if it cannot find any item", function()
    local b = bag:new({"one", "two", "three"})
    local none = b:first(function(c) return c == "four" end)
    assert.equals(nil, none)
  end)

  it("can have a filter for last item that returns the last item that matches the filter", function()
    local b = bag:new({2, 4, 6, 8})
    local found = b:last(function(c) return c % 2 == 0 end)
    assert.equals(8, found)
  end)

  it("it returns nil on a search if it cannot find any item", function()
    local b = bag:new({"one", "two", "three"})
    local none = b:last(function(c) return c == "four" end)
    assert.equals(nil, none)
  end)

  it("can get a filtered bag matching a function", function()
    local b = bag:new({1,2,3,4,5,6,7,8})
    local even = function(c) return c % 2 == 0 end
    local filtered = b:where(even)
    assert.array_matches({2,4,6,8}, filtered)
  end)
end)
