-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local assert = require("luassert")
local say = require("say")

local function array_matches(state, arguments)
  local expected = arguments[1]
  local tested = arguments[2]
  local matched = true

  if not type(expected) == "table" and not type(tested) == "table" then
    return false
  end

  for i, v in ipairs(expected) do
    matched = matched and v == tested[i]  
  end

  return matched
end

say:set("assertion.array_matches.positive", "Expected %s to match: %s")
say:set("assertion.array_matches.negative", "Expected %s to not match: %s")
assert:register("assertion", "array_matches", array_matches, "assertion.array_matches.positive", "assertion.array_matches.negative")
