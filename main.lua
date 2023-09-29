

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local ON = Instance.new("TextButton")
local watermark = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.2844657, 0, 0.163043484, 0)
Frame.Size = UDim2.new(0, 184, 0, 131)

UICorner.Parent = Frame

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(136, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 8, 35))}
UIGradient.Parent = Frame

ON.Name = "ON"
ON.Parent = Frame
ON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ON.BackgroundTransparency = 1.000
ON.BorderColor3 = Color3.fromRGB(0, 0, 0)
ON.BorderSizePixel = 0
ON.Position = UDim2.new(0.0318863913, 0, 0.394735217, 0)
ON.Size = UDim2.new(0, 172, 0, 26)
ON.Font = Enum.Font.SourceSans
ON.Text = "TURN ON AUTOPARRY"
ON.TextColor3 = Color3.fromRGB(255, 255, 255)
ON.TextScaled = true
ON.TextSize = 45.000
ON.TextWrapped = true

watermark.Name = "watermark"
watermark.Parent = Frame
watermark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
watermark.BackgroundTransparency = 1.000
watermark.BorderColor3 = Color3.fromRGB(0, 0, 0)
watermark.BorderSizePixel = 0
watermark.Position = UDim2.new(-0.288043469, 0, 0.4427481, 0)
watermark.Rotation = 26.000
watermark.Size = UDim2.new(0, 273, 0, 33)
watermark.Font = Enum.Font.SourceSans
watermark.Text = "Created by Polymorqhism"
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.TextScaled = true
watermark.TextSize = 14.000
watermark.TextTransparency = 0.810
watermark.TextWrapped = true

-- Scripts:

local function TSPXIS_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.ON.MouseButton1Up:Connect(function()
		while wait(0) do
			local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	
			for _, ball in ipairs(workspace.Balls:GetChildren()) do
				if game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then
	
					local ballPosition = ball.Position
					local distance = (playerPosition - ballPosition).Magnitude
					local ballVelocity = ball.Velocity.Magnitude
	
					local distanceThreshold = 23 + ballVelocity * 0.38
	
					if distance < distanceThreshold then
						local args = {
							[1] = 2,
							[2] = CFrame.new(-1.72698974609375, 1.310712814331055, -95.4274673461914) * CFrame.Angles(-2.015174150466919, 1.0452251434326172, 2.0739669799804688),
							[3] = {
								["3898808836"] = Vector3.new(264.966064453125, 127.03953552246094, 96.23750305175781),
								["1815095278"] = Vector3.new(1167.2950439453125, 144.63218688964844, 92.02969360351562),
								["3265959807"] = Vector3.new(2711.50927734375, -525.942138671875, 28.334823608398438),
								["4661274002"] = Vector3.new(162.65008544921875, -353.087646484375, 171.986328125),
								["2955012879"] = Vector3.new(1268.83154296875, 113.34469604492188, 162.779052734375),
								["670911683"] = Vector3.new(736.6831665039062, 399.1762390136719, 20.294540405273438),
								["2937615617"] = Vector3.new(-108.7611083984375, -400.696533203125, 131.32107543945312),
								["1754087292"] = Vector3.new(684.0202026367188, 141.05955505371094, 96.83554077148438),
								["5066508409"] = Vector3.new(-156.10675048828125, -372.74298095703125, 139.56304931640625),
								["3243744588"] = Vector3.new(-100.537109375, -374.9925537109375, 138.86170959472656),
								["4607926792"] = Vector3.new(10.4429931640625, 174.32882690429688, 65.15220642089844),
								["3388593923"] = Vector3.new(759.4581909179688, 105.37461853027344, 202.41915893554688)
							},
							[4] = {
								[1] = 768,
								[2] = 360
							}
						}
	
						game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(args))
					end
				end
			end
		end
	
	end)
	
end
coroutine.wrap(TSPXIS_fake_script)()
local function TJBKR_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	-- Reference to the GUI Frame
	local frame = script.Parent
	
	-- Variables for tracking mouse input
	local isDragging = false
	local offset = Vector2.new(0, 0)
	
	-- Function to start dragging the GUI
	local function startDrag(input)
		isDragging = true
		offset = input.Position - frame.Position
	end
	
	-- Function to stop dragging the GUI
	local function stopDrag()
		isDragging = false
	end
	
	-- Function to update the GUI's position while dragging
	local function updateDrag(input)
		if isDragging then
			local newPosition = UDim2.new(0, input.Position.X - offset.X, 0, input.Position.Y - offset.Y)
			frame.Position = newPosition
		end
	end
	
	-- Mouse input events
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			startDrag(input)
		end
	end)
	
	frame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			stopDrag()
		end
	end)
	
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			updateDrag(input)
		end
	end)
	
end
coroutine.wrap(TJBKR_fake_script)()
