-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

describe("array_assertions", function()
  it("can check if an array includes an item", function()
    local t = {1,2,3,4,5,6,7}
    assert.array_includes(1, t)
    assert.is_not.array_includes(10, t)
  end)
end)
