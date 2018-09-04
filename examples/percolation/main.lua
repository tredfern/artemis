--[[
-- This provides an implementation to the percolation problem outlined by
-- http://coursera.cs.princeton.edu/algs4/assignments/percolation.html
--
-- It uses a Weighted Union Find structure to implement the solution.
-- Test files that match the format specified by the course can be place in examples/percolation/test_files
--
-- otherwise a random solution will be generated
--]]

local Percolation = require "percolation"

local percolation = nil
local files = love.filesystem.getDirectoryItems("test_files")
local current_file = 0

local function randomSolution()
  files[current_file] = "Random Solution"
  local size = math.random(400)
  percolation = Percolation:new(size)
  while(percolation:percolates() == false) do
    local r, c = math.random(size), math.random(size)
    percolation:open(r, c)
  end
end

local function loadNextFile()
  current_file = current_file + 1
  if(files[current_file] == nil) then
    randomSolution()
  else
    local lines = love.filesystem.lines("test_files/" .. files[current_file])
    percolation = nil
    for l in lines do
      print( l )
      if percolation == nil then
        percolation = Percolation:new(tonumber(l))
      else
        local r, c = string.match(l, "(%d+)%s+(%d+)")
        if(r ~= nil and c ~= nil) then
          percolation:open(tonumber(r), tonumber(c))
        end
      end
    end
  end
end

function love.load()
  loadNextFile()
end

function love.draw()
  local rectangleSize = math.min(
    love.graphics.getWidth() / percolation.size,
    love.graphics.getHeight() / percolation.size
  )

  -- Stats
  local stat_x = percolation.size * rectangleSize + 10
  love.graphics.setColor(1,1,1)
  love.graphics.print(files[current_file], stat_x, 100)
  love.graphics.print(string.format("open sites: %d", percolation.numberOfOpenSites), stat_x, 130)
  love.graphics.print(string.format("percolates?: %s", tostring(percolation:percolates())), stat_x, 160)
  love.graphics.print("Press space for next", stat_x, 220)

  -- Draw system
  for i=1,percolation.size do
    for j=1,percolation.size do
      if percolation:isOpen(i, j) then
        if percolation:isFull(i, j) then
          love.graphics.setColor(0, 0.5, 0.8)
        else
          love.graphics.setColor(0.7, 0.7, 0.7)
        end
        love.graphics.rectangle("fill", (j - 1) * rectangleSize, (i - 1) * rectangleSize,
          rectangleSize, rectangleSize)


        --Draw border if big enough
        if(rectangleSize > 4) then
          love.graphics.setColor(0.2, 0.2, 0.2)
          love.graphics.rectangle("line", (j - 1) * rectangleSize, (i - 1) * rectangleSize,
            rectangleSize, rectangleSize)
        end
      end
    end
  end
end

function love.keypressed(key)
  if key == "space" then
    loadNextFile()
  end
end
