-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local UnionFind = require "src.unionfind"
local Percolation = {}

function Percolation:new(size)
    local pf = {}
    pf.size = size
    pf.uf = UnionFind:new()
    pf.numberOfOpenSites = 0
    pf.top = {}
    pf.bottom = {}
    pf.uf:add(pf.top)
    pf.uf:add(pf.bottom)

    -- Add another UF that tracks only to the top
    pf.uf_nobottom = UnionFind:new()
    pf.uf_nobottom:add(pf.top)

    setmetatable(pf, self)
    self.__index = self
    return pf
end

function Percolation:open(row, col)
  if(self:isOpen(row, col)) then
    return
  end
  local id = self:getId(row, col)
  self.numberOfOpenSites = self.numberOfOpenSites + 1
  self.uf:add(id)
  self.uf_nobottom:add(id)

  local neighbors = {
    { row -1, col },
    { row + 1, col },
    { row, col + 1 },
    { row, col - 1 }
  }
  for _, v in ipairs(neighbors) do
    if self:isOpen(unpack(v)) then
      local i = self:getId(unpack(v))
      self.uf:union(id, i)
      if i ~= self.bottom then
        self.uf_nobottom:union(id, i)
      end
    end
  end
end

function Percolation:isOpen(row, col)
  return self.uf[self:getId(row, col)] ~= nil
end

function Percolation:isFull(row, col)
  return self.uf:connected(self:getId(row, col), self.top) and
    self.uf_nobottom:connected(self:getId(row, col), self.top)
end

function Percolation:percolates()
  return self.uf:connected(self.top, self.bottom)
end

function Percolation:getId(row, col)
  if row <= 0 then
    return self.top
  elseif row > self.size then
    return self.bottom
  end

  return string.format("%d, %d", row, col)
end

return Percolation
