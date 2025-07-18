local OFFSET = vector.create(0, 10, 0)
local ITERS = 20
local COLOR3_MULTIPLIER = 255 / ITERS
local WAIT = 0.01
local ITER_INDEX_WAIT = 500
local CUBE_SCALE = 1
local SPACING = 5
local MODEL_NAME = "RGB Cube"
local MODEL = Instance.new("Model", workspace)
MODEL.Name = MODEL_NAME

local function GetColor3(r, g, b)
	return Color3.fromRGB(r, g, b)
end

local iterIndex = 0

for i = 0, ITERS do
	for ii = 0, ITERS do
		for iii = 0, ITERS do
			local color = GetColor3(i * COLOR3_MULTIPLIER, ii * COLOR3_MULTIPLIER, iii * COLOR3_MULTIPLIER)
			local brick = Instance.new("Part")
			brick.Size = vector.one * CUBE_SCALE
			brick.Color = color
			brick.Material = Enum.Material.SmoothPlastic
			brick.Anchored = true
			brick.Position = (vector.create(i, ii, iii) * SPACING + OFFSET) * CUBE_SCALE
			brick.Parent = MODEL
			brick.Name = `{i}, {ii}, {iii}`
			iterIndex += 1
			if ITER_INDEX_WAIT == iterIndex then
				iterIndex = 0
				task.wait(WAIT)
			end
		end
	end
end
