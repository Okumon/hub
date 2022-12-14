	if game.CoreGui:FindFirstChild("FluxLib") then
		game.CoreGui:FindFirstChild("FluxLib"):Destroy()
	end
	if game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 5931540094 then

		local function Settings()
			local func = {}
			local Name = "RenhubSetting.json"

			local function start(table)
				if not isfile(Name) then 
					writefile(Name, game:service'HttpService':JSONEncode(table)) 
					return table
				else 
					return game:service'HttpService':JSONDecode(readfile(Name))
				end
			end

			function func:save(table)
				writefile(Name,game:service'HttpService':JSONEncode(table))
			end

			function func:Load(table)
				local saved = start(table)

				if saved == table then
					return table 
				else 
					for i,v in pairs(table) do
						if saved[i] == nil then
							saved[i] = v
						end
					end
					func:save(saved)
					return saved
				end
			end
			return func
		end
		local Setting = Settings()
		local setting = Setting:Load({
			autofarm = false;
			Haki = false;
			KenHaki = false;
			z = false;
			x = false;
			c = false;
			v = false;
			Enmahop = false;
			Kaido = false;
			Saber = false;
			Saberhop = false;
			BigMom = false;
			Law = false;
			Defense = false;
			Melle = false;
			Sword = false;
			PowerFruit = false;
			Dungeon = false;
			SeaKing = false;
			SeaKinghop = false;
			SelectWeapon = ""
		})

		wait(3)

		local Flux = {RainbowColorValue = 0, HueSelectionPosition = 0}
		local PresetColor = Color3.fromRGB(66, 134, 255)
		local UserInputService = game:GetService("UserInputService")
		local TweenService = game:GetService("TweenService")
		local RunService = game:GetService("RunService")
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local Mouse = LocalPlayer:GetMouse()
		local CloseBind = Enum.KeyCode.RightControl

		local FluxLib = Instance.new("ScreenGui")
		FluxLib.Name = "FluxLib"
		FluxLib.Parent = game.CoreGui
		FluxLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		coroutine.wrap(
			function()
				while wait() do
					Flux.RainbowColorValue = Flux.RainbowColorValue + 1 / 255
					Flux.HueSelectionPosition = Flux.HueSelectionPosition + 1

					if Flux.RainbowColorValue >= 1 then
						Flux.RainbowColorValue = 0
					end

					if Flux.HueSelectionPosition == 80 then
						Flux.HueSelectionPosition = 0
					end
				end
			end
		)()

		local function MakeDraggable(topbarobject, object)
			local Dragging = nil
			local DragInput = nil
			local DragStart = nil
			local StartPosition = nil

			local function Update(input)
				local Delta = input.Position - DragStart
				local pos =
					UDim2.new(
						StartPosition.X.Scale,
						StartPosition.X.Offset + Delta.X,
						StartPosition.Y.Scale,
						StartPosition.Y.Offset + Delta.Y
					)
				object.Position = pos
			end

			topbarobject.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						Dragging = true
						DragStart = input.Position
						StartPosition = object.Position

						input.Changed:Connect(
							function()
								if input.UserInputState == Enum.UserInputState.End then
									Dragging = false
								end
							end
						)
					end
				end
			)

			topbarobject.InputChanged:Connect(
				function(input)
					if
						input.UserInputType == Enum.UserInputType.MouseMovement or
						input.UserInputType == Enum.UserInputType.Touch
					then
						DragInput = input
					end
				end
			)

			UserInputService.InputChanged:Connect(
				function(input)
					if input == DragInput and Dragging then
						Update(input)
					end
				end
			)
		end



		function Flux:Window(text, bottom,mainclr,toclose)
			CloseBind = toclose or Enum.KeyCode.RightControl
			PresetColor = mainclr or Color3.fromRGB(66, 134, 255)
			local fs = false
			local MainFrame = Instance.new("Frame")
			local MainCorner = Instance.new("UICorner")
			local LeftFrame = Instance.new("Frame")
			local LeftCorner = Instance.new("UICorner")
			local GlowTabHolder = Instance.new("ImageLabel")
			local Title = Instance.new("TextLabel")
			local BottomText = Instance.new("TextLabel")
			local TabHold = Instance.new("Frame")
			local TabLayout = Instance.new("UIListLayout")
			local Drag = Instance.new("Frame")
			local ContainerFolder = Instance.new("Folder")
			local UIGradient = Instance.new("UIGradient")

			MainFrame.Name = "MainFrame"
			MainFrame.Parent = FluxLib
			MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			MainFrame.BackgroundColor3 = Color3.fromRGB(50, 53, 59)
			MainFrame.ClipsDescendants = true
			MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			MainFrame.Size = UDim2.new(0, 0, 0, 0)

			MainCorner.CornerRadius = UDim.new(0, 5)
			MainCorner.Name = "MainCorner"
			MainCorner.Parent = MainFrame

			LeftFrame.Name = "LeftFrame"
			LeftFrame.Parent = MainFrame
			LeftFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
			LeftFrame.Size = UDim2.new(0, 205, 0, 484)

			LeftCorner.CornerRadius = UDim.new(0, 5)
			LeftCorner.Name = "LeftCorner"
			LeftCorner.Parent = LeftFrame

			GlowTabHolder.Name = "GlowTabHolder"
			GlowTabHolder.Parent = LeftFrame
			GlowTabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			GlowTabHolder.BackgroundTransparency = 1.000
			GlowTabHolder.BorderSizePixel = 0
			GlowTabHolder.Position = UDim2.new(0, -15, 0, -15)
			GlowTabHolder.Size = UDim2.new(1, 30, 1, 30)
			GlowTabHolder.ZIndex = 0
			GlowTabHolder.Image = "rbxassetid://4996891970"
			GlowTabHolder.ImageColor3 = Color3.fromRGB(15, 15, 15)
			GlowTabHolder.ScaleType = Enum.ScaleType.Slice
			GlowTabHolder.SliceCenter = Rect.new(20, 20, 280, 280)

			Title.Name = "Title"
			Title.Parent = LeftFrame
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0.097560972, 0, 0.0475206636, 0)
			Title.Size = UDim2.new(0, 111, 0, 34)
			Title.Font = Enum.Font.GothamBold
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 25.000
			Title.TextXAlignment = Enum.TextXAlignment.Left
			UIGradient.Parent = Title

			local function RanbowTitle() -- RainbowButton.Rainbow 
				local script = Instance.new('LocalScript', Title)

				local button = Title
				local gradient = button.UIGradient
				local ts = game:GetService("TweenService")
				local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
				local offset = {Offset = Vector2.new(1, 0)}
				local create = ts:Create(gradient, ti, offset)
				local startingPos = Vector2.new(-1, 0)
				local list = {}
				local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
				local counter = 0
				local status = "down"

				gradient.Offset = startingPos

				local function rainbowColors()

					local sat, val = 255, 255

					for i = 1, 15 do

						local hue = i * 17
						table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

					end

				end

				rainbowColors()

				gradient.Color = s({

					kpt(0, list[#list]),
					kpt(0.5, list[#list - 1]),
					kpt(1, list[#list - 2])

				})

				counter = #list

				local function animate()

					create:Play()
					create.Completed:Wait()
					gradient.Offset = startingPos
					gradient.Rotation = 180

					if counter == #list - 1 and status == "down" then

						gradient.Color = s({

							kpt(0, gradient.Color.Keypoints[1].Value),
							kpt(0.5, list[#list]),
							kpt(1, list[1])

						})

						counter = 1
						status = "up"

					elseif counter == #list and status == "down" then

						gradient.Color = s({

							kpt(0, gradient.Color.Keypoints[1].Value),
							kpt(0.5, list[1]),
							kpt(1, list[2])

						})

						counter = 2
						status = "up"

					elseif counter <= #list - 2 and status == "down" then 

						gradient.Color = s({

							kpt(0, gradient.Color.Keypoints[1].Value),
							kpt(0.5, list[counter + 1]),
							kpt(1, list[counter + 2])

						})

						counter = counter + 2
						status = "up"

					end

					create:Play()
					create.Completed:Wait()
					gradient.Offset = startingPos
					gradient.Rotation = 0

					if counter == #list - 1 and status == "up" then

						gradient.Color = s({

							kpt(0, list[1]),
							kpt(0.5, list[#list]),
							kpt(1, gradient.Color.Keypoints[3].Value)

						})

						counter = 1
						status = "down"

					elseif counter == #list and status == "up" then

						gradient.Color = s({

							kpt(0, list[2]),
							kpt(0.5, list[1]),
							kpt(1, gradient.Color.Keypoints[3].Value)

						})

						counter = 2
						status = "down"

					elseif counter <= #list - 2 and status == "up" then

						gradient.Color = s({

							kpt(0, list[counter + 2]),
							kpt(0.5, list[counter + 1]),
							kpt(1, gradient.Color.Keypoints[3].Value)

						})

						counter = counter + 2
						status = "down"

					end

					animate()

				end

				animate()
			end
			coroutine.wrap(RanbowTitle)()

			BottomText.Name = "BottomText"
			BottomText.Parent = LeftFrame
			BottomText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BottomText.BackgroundTransparency = 1.000
			BottomText.Position = UDim2.new(0.097560972, 0, 0.0889999792, 0)
			BottomText.Size = UDim2.new(0, 113, 0, 28)
			BottomText.Font = Enum.Font.Gotham
			BottomText.Text = bottom
			BottomText.TextColor3 = Color3.fromRGB(255, 255, 255)
			BottomText.TextSize = 14.000
			BottomText.TextTransparency = 0.300
			BottomText.TextXAlignment = Enum.TextXAlignment.Left

			TabHold.Name = "TabHold"
			TabHold.Parent = LeftFrame
			TabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabHold.BackgroundTransparency = 1.000
			TabHold.Position = UDim2.new(0, 0, 0.167355374, 0)
			TabHold.Size = UDim2.new(0, 205, 0, 403)

			TabLayout.Name = "TabLayout"
			TabLayout.Parent = TabHold
			TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
			TabLayout.Padding = UDim.new(0, 3)

			Drag.Name = "Drag"
			Drag.Parent = MainFrame
			Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Drag.BackgroundTransparency = 1.000
			Drag.Position = UDim2.new(0.290368259, 0, 0, 0)
			Drag.Size = UDim2.new(0, 501, 0, 23)

			ContainerFolder.Name = "ContainerFolder"
			ContainerFolder.Parent = MainFrame

			MakeDraggable(Drag,MainFrame)
			MakeDraggable(LeftFrame,MainFrame)
			MainFrame:TweenSize(UDim2.new(0, 706, 0, 484), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

			local uitoggled = false
			UserInputService.InputBegan:Connect(
				function(io, p)
					if io.KeyCode == CloseBind then
						if uitoggled == false then
							MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							uitoggled = true
							wait(.5)
							FluxLib.Enabled = false
						else
							MainFrame:TweenSize(UDim2.new(0, 706, 0, 484), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							FluxLib.Enabled = true
							uitoggled = false
						end
					end
				end
			)

			function Flux:Notification(desc,buttontitle)
				for i, v in next, MainFrame:GetChildren() do
					if v.Name == "NotificationBase" then
						v:Destroy()
					end
				end
				local NotificationBase = Instance.new("TextButton")
				local NotificationBaseCorner = Instance.new("UICorner")
				local NotificationFrame = Instance.new("Frame")
				local NotificationFrameCorner = Instance.new("UICorner")
				local NotificationFrameGlow = Instance.new("ImageLabel")
				local NotificationTitle = Instance.new("TextLabel")
				local CloseBtn = Instance.new("TextButton")
				local CloseBtnCorner = Instance.new("UICorner")
				local NotificationDesc = Instance.new("TextLabel")

				NotificationBase.Name = "NotificationBase"
				NotificationBase.Parent = MainFrame
				NotificationBase.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				NotificationBase.BackgroundTransparency = 1
				NotificationBase.Size = UDim2.new(0, 706, 0, 484)
				NotificationBase.AutoButtonColor = false
				NotificationBase.Font = Enum.Font.SourceSans
				NotificationBase.Text = ""
				NotificationBase.TextColor3 = Color3.fromRGB(0, 0, 0)
				NotificationBase.TextSize = 14.000
				NotificationBase.Visible = true

				NotificationBaseCorner.CornerRadius = UDim.new(0, 5)
				NotificationBaseCorner.Name = "NotificationBaseCorner"
				NotificationBaseCorner.Parent = NotificationBase

				NotificationFrame.Name = "NotificationFrame"
				NotificationFrame.Parent = NotificationBase
				NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				NotificationFrame.BackgroundColor3 = Color3.fromRGB(50, 53, 59)
				NotificationFrame.ClipsDescendants = true
				NotificationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				NotificationFrame.Size = UDim2.new(0, 0, 0, 0)

				NotificationFrameCorner.CornerRadius = UDim.new(0, 5)
				NotificationFrameCorner.Name = "NotificationFrameCorner"
				NotificationFrameCorner.Parent = NotificationFrame

				NotificationFrameGlow.Name = "NotificationFrameGlow"
				NotificationFrameGlow.Parent = NotificationFrame
				NotificationFrameGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationFrameGlow.BackgroundTransparency = 1.000
				NotificationFrameGlow.BorderSizePixel = 0
				NotificationFrameGlow.Position = UDim2.new(0, -15, 0, -15)
				NotificationFrameGlow.Size = UDim2.new(1, 30, 1, 30)
				NotificationFrameGlow.ZIndex = 0
				NotificationFrameGlow.Image = "rbxassetid://4996891970"
				NotificationFrameGlow.ImageColor3 = Color3.fromRGB(15, 15, 15)
				NotificationFrameGlow.ScaleType = Enum.ScaleType.Slice
				NotificationFrameGlow.SliceCenter = Rect.new(20, 20, 280, 280)

				NotificationTitle.Name = "NotificationTitle"
				NotificationTitle.Parent = NotificationFrame
				NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationTitle.BackgroundTransparency = 1.000
				NotificationTitle.Position = UDim2.new(0.0400609747, 0, 0.0761325806, 0)
				NotificationTitle.Size = UDim2.new(0, 111, 0, 34)
				NotificationTitle.Font = Enum.Font.GothamBold
				NotificationTitle.Text = Title.Text .. " | NOTIFICATION"
				NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				NotificationTitle.TextSize = 24.000
				NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
				NotificationTitle.TextTransparency = 1

				CloseBtn.Name = "CloseBtn"
				CloseBtn.Parent = NotificationFrame
				CloseBtn.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
				CloseBtn.ClipsDescendants = true
				CloseBtn.Position = UDim2.new(0.0403124988, 0, 0.720855951, 0)
				CloseBtn.Size = UDim2.new(0, 366, 0, 43)
				CloseBtn.AutoButtonColor = false
				CloseBtn.Font = Enum.Font.Gotham
				CloseBtn.Text = buttontitle
				CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
				CloseBtn.TextSize = 15.000
				CloseBtn.TextTransparency = 1
				CloseBtn.BackgroundTransparency = 1

				CloseBtnCorner.CornerRadius = UDim.new(0, 4)
				CloseBtnCorner.Name = "CloseBtnCorner"
				CloseBtnCorner.Parent = CloseBtn

				NotificationDesc.Name = "NotificationDesc"
				NotificationDesc.Parent = NotificationFrame
				NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationDesc.BackgroundTransparency = 1.000
				NotificationDesc.Position = UDim2.new(0.112499997, 0, 0.266355127, 0)
				NotificationDesc.Size = UDim2.new(0, 309, 0, 82)
				NotificationDesc.Font = Enum.Font.Gotham
				NotificationDesc.Text = desc
				NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
				NotificationDesc.TextSize = 15.000
				NotificationDesc.TextWrapped = true
				NotificationDesc.TextTransparency = 1

				CloseBtn.MouseEnter:Connect(function()
					TweenService:Create(
						CloseBtn,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				CloseBtn.MouseLeave:Connect(function()
					TweenService:Create(
						CloseBtn,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0.3}
					):Play()
				end)

				CloseBtn.MouseButton1Click:Connect(function()

					TweenService:Create(
						NotificationDesc,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 1}
					):Play()
					TweenService:Create(
						CloseBtn,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 1}
					):Play()
					TweenService:Create(
						NotificationTitle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 1}
					):Play()
					TweenService:Create(
						CloseBtn,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()

					wait(.4)
					CloseBtn.Visible = false
					NotificationFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

					wait(.2)

					TweenService:Create(
						NotificationBase,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()

					wait(.2)

					NotificationBase.Visible = false
				end)


				TweenService:Create(
					NotificationBase,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundTransparency = 0.550}
				):Play()

				wait(.1)

				NotificationFrame:TweenSize(UDim2.new(0, 400, 0, 214), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

				wait(.4)
				TweenService:Create(
					NotificationDesc,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = .3}
				):Play()
				TweenService:Create(
					CloseBtn,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = .3}
				):Play()
				TweenService:Create(
					NotificationTitle,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0}
				):Play()
				TweenService:Create(
					CloseBtn,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundTransparency = 0}
				):Play()
			end
			local Tabs = {}
			function Tabs:Tab(text,ico)
				local Tab = Instance.new("TextButton")
				local TabIcon = Instance.new("ImageLabel")
				local TabTitle = Instance.new("TextLabel")
				local UIGradient2 = Instance.new("UIGradient")
				Tab.Name = "Tab"
				Tab.Parent = TabHold
				Tab.BackgroundColor3 = PresetColor
				Tab.BorderSizePixel = 0
				Tab.Size = UDim2.new(0, 205, 0, 40)
				Tab.AutoButtonColor = false
				Tab.Font = Enum.Font.SourceSans
				Tab.Text = ""
				Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
				Tab.TextSize = 14.000
				Tab.BackgroundTransparency = 1

				TabIcon.Name = "TabIcon"
				TabIcon.Parent = Tab
				TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TabIcon.BackgroundTransparency = 1.000
				TabIcon.Position = UDim2.new(0.0634146333, 0, 0.25, 0)
				TabIcon.Size = UDim2.new(0, 20, 0, 20)
				TabIcon.Image = ico
				TabIcon.ImageTransparency = .3

				TabTitle.Name = "TabTitle"
				TabTitle.Parent = Tab
				TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TabTitle.BackgroundTransparency = 1.000
				TabTitle.Position = UDim2.new(0.1902439, 0, 0.25, 0)
				TabTitle.Size = UDim2.new(0, 113, 0, 19)
				TabTitle.Font = Enum.Font.Gotham
				TabTitle.Text = text
				TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				TabTitle.TextSize = 15.000
				TabTitle.TextXAlignment = Enum.TextXAlignment.Left
				TabTitle.TextTransparency = .3
				UIGradient2.Parent = TabTitle
				local function TabRanbow() -- RainbowButton.Rainbow 
					local script = Instance.new('LocalScript', TabTitle)

					local button = script.Parent
					local gradient = button.UIGradient
					local ts = game:GetService("TweenService")
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
					local offset = {Offset = Vector2.new(1, 0)}
					local create = ts:Create(gradient, ti, offset)
					local startingPos = Vector2.new(-1, 0)
					local list = {}
					local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
					local counter = 0
					local status = "down"

					gradient.Offset = startingPos

					local function rainbowColors()

						local sat, val = 255, 255

						for i = 1, 15 do

							local hue = i * 17
							table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

						end

					end

					rainbowColors()

					gradient.Color = s({

						kpt(0, list[#list]),
						kpt(0.5, list[#list - 1]),
						kpt(1, list[#list - 2])

					})

					counter = #list

					local function animate()

						create:Play()
						create.Completed:Wait()
						gradient.Offset = startingPos
						gradient.Rotation = 180

						if counter == #list - 1 and status == "down" then

							gradient.Color = s({

								kpt(0, gradient.Color.Keypoints[1].Value),
								kpt(0.5, list[#list]),
								kpt(1, list[1])

							})

							counter = 1
							status = "up"

						elseif counter == #list and status == "down" then

							gradient.Color = s({

								kpt(0, gradient.Color.Keypoints[1].Value),
								kpt(0.5, list[1]),
								kpt(1, list[2])

							})

							counter = 2
							status = "up"

						elseif counter <= #list - 2 and status == "down" then 

							gradient.Color = s({

								kpt(0, gradient.Color.Keypoints[1].Value),
								kpt(0.5, list[counter + 1]),
								kpt(1, list[counter + 2])

							})

							counter = counter + 2
							status = "up"

						end

						create:Play()
						create.Completed:Wait()
						gradient.Offset = startingPos
						gradient.Rotation = 0

						if counter == #list - 1 and status == "up" then

							gradient.Color = s({

								kpt(0, list[1]),
								kpt(0.5, list[#list]),
								kpt(1, gradient.Color.Keypoints[3].Value)

							})

							counter = 1
							status = "down"

						elseif counter == #list and status == "up" then

							gradient.Color = s({

								kpt(0, list[2]),
								kpt(0.5, list[1]),
								kpt(1, gradient.Color.Keypoints[3].Value)

							})

							counter = 2
							status = "down"

						elseif counter <= #list - 2 and status == "up" then

							gradient.Color = s({

								kpt(0, list[counter + 2]),
								kpt(0.5, list[counter + 1]),
								kpt(1, gradient.Color.Keypoints[3].Value)

							})

							counter = counter + 2
							status = "down"

						end

						animate()

					end

					animate()
				end
				coroutine.wrap(TabRanbow)()
				local Container = Instance.new("ScrollingFrame")
				local ContainerLayout = Instance.new("UIListLayout")


				Container.Name = "Container"
				Container.Parent = ContainerFolder
				Container.Active = true
				Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Container.BackgroundTransparency = 1.000
				Container.BorderSizePixel = 0
				Container.Position = UDim2.new(0.321529746, 0, 0.0475206599, 0)
				Container.Size = UDim2.new(0, 470, 0, 438)
				Container.CanvasSize = UDim2.new(0, 0, 0, 0)
				Container.ScrollBarThickness = 5
				Container.Visible = false
				Container.ScrollBarImageColor3 = Color3.fromRGB(71, 76, 84)

				ContainerLayout.Name = "ContainerLayout"
				ContainerLayout.Parent = Container
				ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
				ContainerLayout.Padding = UDim.new(0, 15)

				if fs == false then
					fs = true
					TabTitle.TextTransparency = 0
					TabIcon.ImageTransparency = 0
					Tab.BackgroundTransparency = 0
					Container.Visible = true
				end

				Tab.MouseButton1Click:Connect(function()
					for i, v in next, ContainerFolder:GetChildren() do
						if v.Name == "Container" then
							v.Visible = false
						end
						Container.Visible = true
					end
					for i, v in next, TabHold:GetChildren() do
						if v.Name == "Tab" then
							TweenService:Create(
								v,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								v.TabIcon,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								v.TabTitle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = .3}
							):Play()
							TweenService:Create(
								Tab,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								TabIcon,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = 0}
							):Play()
							TweenService:Create(
								TabTitle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
						end
					end
				end)
				local ContainerContent = {}
				function ContainerContent:Button(text, desc, callback)
					if desc == "" then
						desc = "There is no description for this button."
					end
					local BtnDescToggled = false
					local Button = Instance.new("TextButton")
					local ButtonCorner = Instance.new("UICorner")
					local Title = Instance.new("TextLabel")
					local Circle = Instance.new("Frame")
					local CircleCorner = Instance.new("UICorner")
					local CircleSmall = Instance.new("Frame")
					local CircleSmallCorner = Instance.new("UICorner")
					local Description = Instance.new("TextLabel")
					local ArrowBtn = Instance.new("ImageButton")
					local ArrowIco = Instance.new("ImageLabel")
					local ButtonUIGradient = Instance.new("UIGradient")
					Button.Name = "Button"
					Button.Parent = Container
					Button.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Button.ClipsDescendants = true
					Button.Position = UDim2.new(0.370312512, 0, 0.552631557, 0)
					Button.Size = UDim2.new(0, 457, 0, 43)
					Button.AutoButtonColor = false
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = Color3.fromRGB(0, 0, 0)
					Button.TextSize = 14.000

					ButtonCorner.CornerRadius = UDim.new(0, 4)
					ButtonCorner.Name = "ButtonCorner"
					ButtonCorner.Parent = Button

					Title.Name = "Title"
					Title.Parent = Button
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1.000
					Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
					Title.Size = UDim2.new(0, 113, 0, 42)
					Title.Font = Enum.Font.Gotham
					Title.Text = text
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.TextSize = 15.000
					Title.TextTransparency = 0.300
					Title.TextXAlignment = Enum.TextXAlignment.Left
					ButtonUIGradient.Parent = Title
					local function RanbowButton() -- RainbowButton.Rainbow 
						local script = Instance.new('LocalScript', Title)

						local button = script.Parent
						local gradient = button.UIGradient
						local ts = game:GetService("TweenService")
						local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
						local offset = {Offset = Vector2.new(1, 0)}
						local create = ts:Create(gradient, ti, offset)
						local startingPos = Vector2.new(-1, 0)
						local list = {}
						local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
						local counter = 0
						local status = "down"

						gradient.Offset = startingPos

						local function rainbowColors()

							local sat, val = 255, 255

							for i = 1, 15 do

								local hue = i * 17
								table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

							end

						end

						rainbowColors()

						gradient.Color = s({

							kpt(0, list[#list]),
							kpt(0.5, list[#list - 1]),
							kpt(1, list[#list - 2])

						})

						counter = #list

						local function animate()

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 180

							if counter == #list - 1 and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[#list]),
									kpt(1, list[1])

								})

								counter = 1
								status = "up"

							elseif counter == #list and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[1]),
									kpt(1, list[2])

								})

								counter = 2
								status = "up"

							elseif counter <= #list - 2 and status == "down" then 

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[counter + 1]),
									kpt(1, list[counter + 2])

								})

								counter = counter + 2
								status = "up"

							end

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 0

							if counter == #list - 1 and status == "up" then

								gradient.Color = s({

									kpt(0, list[1]),
									kpt(0.5, list[#list]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 1
								status = "down"

							elseif counter == #list and status == "up" then

								gradient.Color = s({

									kpt(0, list[2]),
									kpt(0.5, list[1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 2
								status = "down"

							elseif counter <= #list - 2 and status == "up" then

								gradient.Color = s({

									kpt(0, list[counter + 2]),
									kpt(0.5, list[counter + 1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = counter + 2
								status = "down"

							end

							animate()

						end

						animate()
					end
					coroutine.wrap(RanbowButton)()

					Circle.Name = "Circle"
					Circle.Parent = Title
					Circle.Active = true
					Circle.AnchorPoint = Vector2.new(0.5, 0.5)
					Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
					Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
					Circle.Size = UDim2.new(0, 11, 0, 11)

					CircleCorner.CornerRadius = UDim.new(2, 6)
					CircleCorner.Name = "CircleCorner"
					CircleCorner.Parent = Circle

					CircleSmall.Name = "CircleSmall"
					CircleSmall.Parent = Circle
					CircleSmall.Active = true
					CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
					CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					CircleSmall.BackgroundTransparency = 1.000
					CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
					CircleSmall.Size = UDim2.new(0, 9, 0, 9)

					CircleSmallCorner.CornerRadius = UDim.new(2, 6)
					CircleSmallCorner.Name = "CircleSmallCorner"
					CircleSmallCorner.Parent = CircleSmall

					Description.Name = "Description"
					Description.Parent = Title
					Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Description.BackgroundTransparency = 1.000
					Description.Position = UDim2.new(-0.200942323, 0, 0.785714269, 0)
					Description.Size = UDim2.new(0, 432, 0, 31)
					Description.Font = Enum.Font.Gotham
					Description.Text = desc
					Description.TextColor3 = Color3.fromRGB(255, 255, 255)
					Description.TextSize = 15.000
					Description.TextTransparency = 1
					Description.TextWrapped = true
					Description.TextXAlignment = Enum.TextXAlignment.Left

					ArrowBtn.Name = "ArrowBtn"
					ArrowBtn.Parent = Button
					ArrowBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
					ArrowBtn.BackgroundTransparency = 1.000
					ArrowBtn.Position = UDim2.new(0.903719902, 0, 0, 0)
					ArrowBtn.Size = UDim2.new(0, 33, 0, 37)
					ArrowBtn.SliceCenter = Rect.new(30, 30, 30, 30)
					ArrowBtn.SliceScale = 7.000

					ArrowIco.Name = "ArrowIco"
					ArrowIco.Parent = ArrowBtn
					ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
					ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ArrowIco.BackgroundTransparency = 1.000
					ArrowIco.Position = UDim2.new(0.495753437, 0, 0.554054081, 0)
					ArrowIco.Selectable = true
					ArrowIco.Size = UDim2.new(0, 28, 0, 24)
					ArrowIco.Image = "http://www.roblox.com/asset/?id=6034818372"
					ArrowIco.ImageTransparency = .3

					Button.MouseEnter:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
					end)

					Button.MouseLeave:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.3}
						):Play()
					end)

					Button.MouseButton1Click:Connect(function()
						pcall(callback)
					end)

					ArrowBtn.MouseButton1Click:Connect(function()
						if BtnDescToggled == false then
							Button:TweenSize(UDim2.new(0, 457, 0, 74), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = 0}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 180}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = PresetColor}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							TweenService:Create(
								Description,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						else
							Button:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							TweenService:Create(
								Description,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
						BtnDescToggled = not BtnDescToggled
					end)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				function ContainerContent:Toggle(text, desc,default, callback)
					local ToggleDescToggled = false
					local Toggled = false
					if desc == "" then
						desc = "There is no description for this toggle."
					end
					local Toggle = Instance.new("TextButton")
					local ToggleCorner = Instance.new("UICorner")
					local Title = Instance.new("TextLabel")
					local Circle = Instance.new("Frame")
					local CircleCorner = Instance.new("UICorner")
					local CircleSmall = Instance.new("Frame")
					local CircleSmallCorner = Instance.new("UICorner")
					local ToggleFrame = Instance.new("Frame")
					local ToggleFrameCorner = Instance.new("UICorner")
					local ToggleCircle = Instance.new("Frame")
					local ToggleCircleCorner = Instance.new("UICorner")
					local Description = Instance.new("TextLabel")
					local ArrowBtn = Instance.new("ImageButton")
					local ArrowIco = Instance.new("ImageLabel")
					local toggleGradient = Instance.new("UIGradient")
					Toggle.Name = "Toggle"
					Toggle.Parent = Container
					Toggle.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Toggle.ClipsDescendants = true
					Toggle.Position = UDim2.new(0.110937506, 0, 0.67653507, 0)
					Toggle.Size = UDim2.new(0, 457, 0, 43)
					Toggle.AutoButtonColor = false
					Toggle.Font = Enum.Font.SourceSans
					Toggle.Text = ""
					Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
					Toggle.TextSize = 14.000

					ToggleCorner.CornerRadius = UDim.new(0, 4)
					ToggleCorner.Name = "ToggleCorner"
					ToggleCorner.Parent = Toggle

					Title.Name = "Title"
					Title.Parent = Toggle
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1.000
					Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
					Title.Size = UDim2.new(0, 113, 0, 42)
					Title.Font = Enum.Font.Gotham
					Title.Text = text
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.TextSize = 15.000
					Title.TextTransparency = 0.300
					Title.TextXAlignment = Enum.TextXAlignment.Left
					toggleGradient.Parent = Title


					local function ToogleRanbow() -- RainbowButton.Rainbow 
						local script = Instance.new('LocalScript', Title)

						local button = script.Parent
						local gradient = button.UIGradient
						local ts = game:GetService("TweenService")
						local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
						local offset = {Offset = Vector2.new(1, 0)}
						local create = ts:Create(gradient, ti, offset)
						local startingPos = Vector2.new(-1, 0)
						local list = {}
						local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
						local counter = 0
						local status = "down"

						gradient.Offset = startingPos

						local function rainbowColors()

							local sat, val = 255, 255

							for i = 1, 15 do

								local hue = i * 17
								table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

							end

						end

						rainbowColors()

						gradient.Color = s({

							kpt(0, list[#list]),
							kpt(0.5, list[#list - 1]),
							kpt(1, list[#list - 2])

						})

						counter = #list

						local function animate()

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 180

							if counter == #list - 1 and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[#list]),
									kpt(1, list[1])

								})

								counter = 1
								status = "up"

							elseif counter == #list and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[1]),
									kpt(1, list[2])

								})

								counter = 2
								status = "up"

							elseif counter <= #list - 2 and status == "down" then 

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[counter + 1]),
									kpt(1, list[counter + 2])

								})

								counter = counter + 2
								status = "up"

							end

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 0

							if counter == #list - 1 and status == "up" then

								gradient.Color = s({

									kpt(0, list[1]),
									kpt(0.5, list[#list]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 1
								status = "down"

							elseif counter == #list and status == "up" then

								gradient.Color = s({

									kpt(0, list[2]),
									kpt(0.5, list[1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 2
								status = "down"

							elseif counter <= #list - 2 and status == "up" then

								gradient.Color = s({

									kpt(0, list[counter + 2]),
									kpt(0.5, list[counter + 1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = counter + 2
								status = "down"

							end

							animate()

						end

						animate()
					end
					coroutine.wrap(ToogleRanbow)()


					Circle.Name = "Circle"
					Circle.Parent = Title
					Circle.Active = true
					Circle.AnchorPoint = Vector2.new(0.5, 0.5)
					Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
					Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
					Circle.Size = UDim2.new(0, 11, 0, 11)

					CircleCorner.CornerRadius = UDim.new(2, 6)
					CircleCorner.Name = "CircleCorner"
					CircleCorner.Parent = Circle

					CircleSmall.Name = "CircleSmall"
					CircleSmall.Parent = Circle
					CircleSmall.Active = true
					CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
					CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					CircleSmall.BackgroundTransparency = 1.000
					CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
					CircleSmall.Size = UDim2.new(0, 9, 0, 9)

					CircleSmallCorner.CornerRadius = UDim.new(2, 6)
					CircleSmallCorner.Name = "CircleSmallCorner"
					CircleSmallCorner.Parent = CircleSmall

					ToggleFrame.Name = "ToggleFrame"
					ToggleFrame.Parent = Circle
					ToggleFrame.BackgroundColor3 = Color3.fromRGB(226, 227, 227)
					ToggleFrame.Position = UDim2.new(33.0856934, 0, 0, 0)
					ToggleFrame.Size = UDim2.new(0, 27, 0, 11)

					ToggleFrameCorner.Name = "ToggleFrameCorner"
					ToggleFrameCorner.Parent = ToggleFrame

					ToggleCircle.Name = "ToggleCircle"
					ToggleCircle.Parent = ToggleFrame
					ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ToggleCircle.Position = UDim2.new(0, 0, -0.272727281, 0)
					ToggleCircle.Selectable = true
					ToggleCircle.Size = UDim2.new(0, 17, 0, 17)

					ToggleCircleCorner.CornerRadius = UDim.new(2, 8)
					ToggleCircleCorner.Name = "ToggleCircleCorner"
					ToggleCircleCorner.Parent = ToggleCircle

					Description.Name = "Description"
					Description.Parent = Title
					Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Description.BackgroundTransparency = 1.000
					Description.Position = UDim2.new(-0.200942323, 0, 0.785714269, 0)
					Description.Size = UDim2.new(0, 432, 0, 31)
					Description.Font = Enum.Font.Gotham
					Description.Text = desc
					Description.TextColor3 = Color3.fromRGB(255, 255, 255)
					Description.TextSize = 15.000
					Description.TextTransparency = 1
					Description.TextWrapped = true
					Description.TextXAlignment = Enum.TextXAlignment.Left

					ArrowBtn.Name = "ArrowBtn"
					ArrowBtn.Parent = Toggle
					ArrowBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
					ArrowBtn.BackgroundTransparency = 1.000
					ArrowBtn.Position = UDim2.new(0.903719902, 0, 0, 0)
					ArrowBtn.Size = UDim2.new(0, 33, 0, 37)
					ArrowBtn.SliceCenter = Rect.new(30, 30, 30, 30)
					ArrowBtn.SliceScale = 7.000

					ArrowIco.Name = "ArrowIco"
					ArrowIco.Parent = ArrowBtn
					ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
					ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ArrowIco.BackgroundTransparency = 1.000
					ArrowIco.Position = UDim2.new(0.495753437, 0, 0.554054081, 0)
					ArrowIco.Selectable = true
					ArrowIco.Size = UDim2.new(0, 28, 0, 24)
					ArrowIco.Image = "http://www.roblox.com/asset/?id=6034818372"
					ArrowIco.ImageTransparency = .3

					Toggle.MouseEnter:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
					end)

					Toggle.MouseLeave:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.3}
						):Play()
					end)

					Toggle.MouseButton1Click:Connect(function()
						if Toggled == false then
							ToggleCircle:TweenPosition(UDim2.new(0.37, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
							TweenService:Create(
								ToggleCircle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 =PresetColor}
							):Play()
						else
							ToggleCircle:TweenPosition(UDim2.new(0, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
							TweenService:Create(
								ToggleCircle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(255,255,255)}
							):Play()
						end
						Toggled = not Toggled
						pcall(callback, Toggled)
					end)

					ArrowBtn.MouseButton1Click:Connect(function()
						if ToggleDescToggled == false then
							Toggle:TweenSize(UDim2.new(0, 457, 0, 74), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = 0}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 180}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = PresetColor}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							TweenService:Create(
								Description,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						else
							Toggle:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							TweenService:Create(
								Description,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
						ToggleDescToggled = not ToggleDescToggled
					end)
					if default == true then
						ToggleCircle:TweenPosition(UDim2.new(0.37, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
						TweenService:Create(
							ToggleCircle,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 =PresetColor}
						):Play()
						Toggled = not Toggled
						pcall(callback, Toggled)
					end
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end

				function ContainerContent:Slider(text,desc,min,max,start,callback)
					local SliderFunc = {}
					local SliderDescToggled = false
					local dragging = false
					if desc == "" then
						desc = "There is no description for this slider."
					end
					local Slider = Instance.new("TextButton")
					local SliderCorner = Instance.new("UICorner")
					local Title = Instance.new("TextLabel")
					local Circle = Instance.new("Frame")
					local CircleCorner = Instance.new("UICorner")
					local CircleSmall = Instance.new("Frame")
					local CircleSmallCorner = Instance.new("UICorner")
					local Description = Instance.new("TextLabel")
					local SlideFrame = Instance.new("Frame")
					local CurrentValueFrame = Instance.new("Frame")
					local SlideCircle = Instance.new("ImageButton")
					local ArrowBtn = Instance.new("ImageButton")
					local ArrowIco = Instance.new("ImageLabel")
					local Value = Instance.new("TextLabel")
					local sliderUIGradient = Instance.new("UIGradient")
					Slider.Name = "Slider"
					Slider.Parent = Container
					Slider.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Slider.ClipsDescendants = true
					Slider.Position = UDim2.new(0.189062506, 0, 0.648612201, 0)
					Slider.Size = UDim2.new(0, 457, 0, 60)
					Slider.AutoButtonColor = false
					Slider.Font = Enum.Font.SourceSans
					Slider.Text = ""
					Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
					Slider.TextSize = 14.000

					SliderCorner.CornerRadius = UDim.new(0, 4)
					SliderCorner.Name = "SliderCorner"
					SliderCorner.Parent = Slider

					Title.Name = "Title"
					Title.Parent = Slider
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1.000
					Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
					Title.Size = UDim2.new(0, 113, 0, 42)
					Title.Font = Enum.Font.Gotham
					Title.Text = text
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.TextSize = 15.000
					Title.TextTransparency = 0.300
					Title.TextXAlignment = Enum.TextXAlignment.Left
					sliderUIGradient.Parent = Title


					local function SliderRanbow() -- RainbowButton.Rainbow 
						local script = Instance.new('LocalScript', Title)

						local button = script.Parent
						local gradient = button.UIGradient
						local ts = game:GetService("TweenService")
						local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
						local offset = {Offset = Vector2.new(1, 0)}
						local create = ts:Create(gradient, ti, offset)
						local startingPos = Vector2.new(-1, 0)
						local list = {}
						local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
						local counter = 0
						local status = "down"

						gradient.Offset = startingPos

						local function rainbowColors()

							local sat, val = 255, 255

							for i = 1, 15 do

								local hue = i * 17
								table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

							end

						end

						rainbowColors()

						gradient.Color = s({

							kpt(0, list[#list]),
							kpt(0.5, list[#list - 1]),
							kpt(1, list[#list - 2])

						})

						counter = #list

						local function animate()

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 180

							if counter == #list - 1 and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[#list]),
									kpt(1, list[1])

								})

								counter = 1
								status = "up"

							elseif counter == #list and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[1]),
									kpt(1, list[2])

								})

								counter = 2
								status = "up"

							elseif counter <= #list - 2 and status == "down" then 

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[counter + 1]),
									kpt(1, list[counter + 2])

								})

								counter = counter + 2
								status = "up"

							end

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 0

							if counter == #list - 1 and status == "up" then

								gradient.Color = s({

									kpt(0, list[1]),
									kpt(0.5, list[#list]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 1
								status = "down"

							elseif counter == #list and status == "up" then

								gradient.Color = s({

									kpt(0, list[2]),
									kpt(0.5, list[1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 2
								status = "down"

							elseif counter <= #list - 2 and status == "up" then

								gradient.Color = s({

									kpt(0, list[counter + 2]),
									kpt(0.5, list[counter + 1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = counter + 2
								status = "down"

							end

							animate()

						end

						animate()
					end
					coroutine.wrap(SliderRanbow)()


					Circle.Name = "Circle"
					Circle.Parent = Title
					Circle.Active = true
					Circle.AnchorPoint = Vector2.new(0.5, 0.5)
					Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
					Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
					Circle.Size = UDim2.new(0, 11, 0, 11)


					CircleCorner.CornerRadius = UDim.new(2, 6)
					CircleCorner.Name = "CircleCorner"
					CircleCorner.Parent = Circle

					CircleSmall.Name = "CircleSmall"
					CircleSmall.Parent = Circle
					CircleSmall.Active = true
					CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
					CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					CircleSmall.BackgroundTransparency = 1.000
					CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
					CircleSmall.Size = UDim2.new(0, 9, 0, 9)

					CircleSmallCorner.CornerRadius = UDim.new(2, 6)
					CircleSmallCorner.Name = "CircleSmallCorner"
					CircleSmallCorner.Parent = CircleSmall

					Description.Name = "Description"
					Description.Parent = Title
					Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Description.BackgroundTransparency = 1.000
					Description.Position = UDim2.new(-0.201000005, 0, 1.38600004, 0)
					Description.Size = UDim2.new(0, 432, 0, 31)
					Description.Font = Enum.Font.Gotham
					Description.Text = desc
					Description.TextColor3 = Color3.fromRGB(255, 255, 255)
					Description.TextSize = 15.000
					Description.TextTransparency = 0.300
					Description.TextWrapped = true
					Description.TextXAlignment = Enum.TextXAlignment.Left

					SlideFrame.Name = "SlideFrame"
					SlideFrame.Parent = Title
					SlideFrame.BackgroundColor3 = Color3.fromRGB(235, 234, 235)
					SlideFrame.BorderSizePixel = 0
					SlideFrame.Position = UDim2.new(-0.197140202, 0, 0.986091495, 0)
					SlideFrame.Size = UDim2.new(0, 426, 0, 3)

					CurrentValueFrame.Name = "CurrentValueFrame"
					CurrentValueFrame.Parent = SlideFrame
					CurrentValueFrame.BackgroundColor3 = PresetColor
					CurrentValueFrame.BorderSizePixel = 0
					CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 3)

					SlideCircle.Name = "SlideCircle"
					SlideCircle.Parent = SlideFrame
					SlideCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					SlideCircle.BackgroundTransparency = 1.000
					SlideCircle.Position = UDim2.new((start or 0)/max, -6,-1.30499995, 0)
					SlideCircle.Size = UDim2.new(0, 11, 0, 11)
					SlideCircle.Image = "rbxassetid://3570695787"
					SlideCircle.ImageColor3 = PresetColor

					ArrowBtn.Name = "ArrowBtn"
					ArrowBtn.Parent = Slider
					ArrowBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
					ArrowBtn.BackgroundTransparency = 1.000
					ArrowBtn.Position = UDim2.new(0.903719902, 0, 0, 0)
					ArrowBtn.Size = UDim2.new(0, 33, 0, 37)
					ArrowBtn.SliceCenter = Rect.new(30, 30, 30, 30)
					ArrowBtn.SliceScale = 7.000

					ArrowIco.Name = "ArrowIco"
					ArrowIco.Parent = ArrowBtn
					ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
					ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ArrowIco.BackgroundTransparency = 1.000
					ArrowIco.Position = UDim2.new(0.495753437, 0, 0.554054081, 0)
					ArrowIco.Selectable = true
					ArrowIco.Size = UDim2.new(0, 28, 0, 24)
					ArrowIco.Image = "http://www.roblox.com/asset/?id=6034818372"
					ArrowIco.ImageTransparency = .3

					Value.Name = "Value"
					Value.Parent = Title
					Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Value.BackgroundTransparency = 1.000
					Value.Position = UDim2.new(2.27693367, 0, 0, 0)
					Value.Size = UDim2.new(0, 113, 0, 41)
					Value.Font = Enum.Font.Gotham
					Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
					Value.TextColor3 = Color3.fromRGB(255, 255, 255)
					Value.TextSize = 15.000
					Value.TextTransparency = 0.300
					Value.TextXAlignment = Enum.TextXAlignment.Right

					ArrowBtn.MouseButton1Click:Connect(function()
						if SliderDescToggled == false then
							Slider:TweenSize(UDim2.new(0, 457, 0, 101), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								Value,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = 0}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 180}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 =PresetColor}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							TweenService:Create(
								Description,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						else
							Slider:TweenSize(UDim2.new(0, 457, 0, 60), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								Value,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							TweenService:Create(
								Description,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
						SliderDescToggled = not SliderDescToggled
					end)

					local function move(input)
						local pos =
							UDim2.new(
								math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
								-6,
								-1.30499995,
								0
							)
						local pos1 =
							UDim2.new(
								math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
								0,
								0,
								3
							)
						CurrentValueFrame:TweenSize(pos1, "Out", "Sine", 0.1, true)
						SlideCircle:TweenPosition(pos, "Out", "Sine", 0.1, true)
						local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
						Value.Text = tostring(value)
						pcall(callback, value)
					end
					SlideCircle.InputBegan:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = true
							end
						end
					)
					SlideCircle.InputEnded:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = false
							end
						end
					)
					game:GetService("UserInputService").InputChanged:Connect(
					function(input)
						if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
							move(input)
						end
					end
					)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
					function SliderFunc:Change(tochange)
						CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 3)
						SlideCircle.Position = UDim2.new((tochange or 0)/max, -6,-1.30499995, 0)
						Value.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
						pcall(callback,tochange)
					end
					return SliderFunc
				end
				function ContainerContent:Dropdown(text,list,callback)
					local DropFunc = {}
					local Selected = text
					local FrameSize = 43
					local ItemCount = 0
					local DropToggled = false
					local Dropdown = Instance.new("TextButton")
					local DropdownCorner = Instance.new("UICorner")
					local Title = Instance.new("TextLabel")
					local Circle = Instance.new("Frame")
					local CircleCorner = Instance.new("UICorner")
					local CircleSmall = Instance.new("Frame")
					local CircleSmallCorner = Instance.new("UICorner")
					local ArrowIco = Instance.new("ImageLabel")
					local DropItemHolder = Instance.new("ScrollingFrame")
					local DropLayout = Instance.new("UIListLayout")
					local DropdownUIGradient = Instance.new("UIGradient")
					local DropdownUIGradient2 = Instance.new("UIGradient")
					Dropdown.Name = "Dropdown"
					Dropdown.Parent = Container
					Dropdown.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Dropdown.ClipsDescendants = true
					Dropdown.Position = UDim2.new(0.110937499, 0, 0.67653507, 0)
					Dropdown.Size = UDim2.new(0, 457, 0, 43)
					Dropdown.AutoButtonColor = false
					Dropdown.Font = Enum.Font.SourceSans
					Dropdown.Text = ""
					Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
					Dropdown.TextSize = 14.000

					DropdownCorner.CornerRadius = UDim.new(0, 4)
					DropdownCorner.Name = "DropdownCorner"
					DropdownCorner.Parent = Dropdown

					Title.Name = "Title"
					Title.Parent = Dropdown
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1.000
					Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
					Title.Size = UDim2.new(0, 113, 0, 42)
					Title.Font = Enum.Font.Gotham
					Title.Text = text
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.TextSize = 15.000
					Title.TextTransparency = 0.300
					Title.TextXAlignment = Enum.TextXAlignment.Left
					DropdownUIGradient.Parent = Title


					local function DropdownRanbow() -- RainbowButton.Rainbow 
						local script = Instance.new('LocalScript', Title)

						local button = script.Parent
						local gradient = button.UIGradient
						local ts = game:GetService("TweenService")
						local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
						local offset = {Offset = Vector2.new(1, 0)}
						local create = ts:Create(gradient, ti, offset)
						local startingPos = Vector2.new(-1, 0)
						local list = {}
						local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
						local counter = 0
						local status = "down"

						gradient.Offset = startingPos

						local function rainbowColors()

							local sat, val = 255, 255

							for i = 1, 15 do

								local hue = i * 17
								table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

							end

						end

						rainbowColors()

						gradient.Color = s({

							kpt(0, list[#list]),
							kpt(0.5, list[#list - 1]),
							kpt(1, list[#list - 2])

						})

						counter = #list

						local function animate()

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 180

							if counter == #list - 1 and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[#list]),
									kpt(1, list[1])

								})

								counter = 1
								status = "up"

							elseif counter == #list and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[1]),
									kpt(1, list[2])

								})

								counter = 2
								status = "up"

							elseif counter <= #list - 2 and status == "down" then 

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[counter + 1]),
									kpt(1, list[counter + 2])

								})

								counter = counter + 2
								status = "up"

							end

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 0

							if counter == #list - 1 and status == "up" then

								gradient.Color = s({

									kpt(0, list[1]),
									kpt(0.5, list[#list]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 1
								status = "down"

							elseif counter == #list and status == "up" then

								gradient.Color = s({

									kpt(0, list[2]),
									kpt(0.5, list[1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 2
								status = "down"

							elseif counter <= #list - 2 and status == "up" then

								gradient.Color = s({

									kpt(0, list[counter + 2]),
									kpt(0.5, list[counter + 1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = counter + 2
								status = "down"

							end

							animate()

						end

						animate()
					end
					coroutine.wrap(DropdownRanbow)()


					Circle.Name = "Circle"
					Circle.Parent = Title
					Circle.Active = true
					Circle.AnchorPoint = Vector2.new(0.5, 0.5)
					Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
					Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
					Circle.Size = UDim2.new(0, 11, 0, 11)

					CircleCorner.CornerRadius = UDim.new(2, 6)
					CircleCorner.Name = "CircleCorner"
					CircleCorner.Parent = Circle

					CircleSmall.Name = "CircleSmall"
					CircleSmall.Parent = Circle
					CircleSmall.Active = true
					CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
					CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					CircleSmall.BackgroundTransparency = 1.000
					CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
					CircleSmall.Size = UDim2.new(0, 9, 0, 9)

					CircleSmallCorner.CornerRadius = UDim.new(2, 6)
					CircleSmallCorner.Name = "CircleSmallCorner"
					CircleSmallCorner.Parent = CircleSmall

					ArrowIco.Name = "ArrowIco"
					ArrowIco.Parent = Title
					ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
					ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ArrowIco.BackgroundTransparency = 1.000
					ArrowIco.Position = UDim2.new(3.45979357, 0, 0.508096159, 0)
					ArrowIco.Selectable = true
					ArrowIco.Size = UDim2.new(0, 28, 0, 24)
					ArrowIco.Image = "http://www.roblox.com/asset/?id=6035047377"
					ArrowIco.ImageTransparency = .3

					DropItemHolder.Name = "DropItemHolder"
					DropItemHolder.Parent = Title
					DropItemHolder.Active = true
					DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					DropItemHolder.BackgroundTransparency = 1.000
					DropItemHolder.BorderSizePixel = 0
					DropItemHolder.Position = UDim2.new(-0.203539819, 0, 1.02380955, 0)
					DropItemHolder.Size = UDim2.new(0, 436, 0, 82)
					DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
					DropItemHolder.ScrollBarThickness = 5
					DropItemHolder.ScrollBarImageColor3 = Color3.fromRGB(41, 42, 48)

					DropLayout.Name = "DropLayout"
					DropLayout.Parent = DropItemHolder
					DropLayout.SortOrder = Enum.SortOrder.LayoutOrder
					DropLayout.Padding = UDim.new(0, 2)

					Dropdown.MouseEnter:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
					end)

					Dropdown.MouseLeave:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.3}
						):Play()
					end)


					Dropdown.MouseButton1Click:Connect(function()
						if DropToggled == false then
							Title.Text = Selected
							Dropdown:TweenSize(UDim2.new(0, 457, 0, FrameSize), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = 0}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 180}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = PresetColor}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						else
							Title.Text = Selected
							Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
						DropToggled = not DropToggled
					end)

					for i,v in next, list do
						ItemCount = ItemCount + 1

						if ItemCount == 1 then
							FrameSize = 78
						elseif ItemCount == 2 then
							FrameSize = 107
						elseif ItemCount >= 3 then
							FrameSize = 133
						end
						local Item = Instance.new("TextButton")
						local ItemCorner = Instance.new("UICorner")

						Item.Name = "Item"
						Item.Parent = DropItemHolder
						Item.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
						Item.ClipsDescendants = true
						Item.Size = UDim2.new(0, 427, 0, 25)
						Item.AutoButtonColor = false
						Item.Font = Enum.Font.Gotham
						Item.Text = v
						Item.TextColor3 = Color3.fromRGB(255, 255, 255)
						Item.TextSize = 15.000
						Item.TextTransparency = 0.300

						ItemCorner.CornerRadius = UDim.new(0, 4)
						ItemCorner.Name = "ItemCorner"
						ItemCorner.Parent = Item
						DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)

						Item.MouseEnter:Connect(function()
							TweenService:Create(
								Item,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
						end)

						Item.MouseLeave:Connect(function()
							TweenService:Create(
								Item,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
						end)

						Item.MouseButton1Click:Connect(function()
							pcall(callback, v)
							Title.Text = text
							Selected = v
							DropToggled = not DropToggled
							Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)

						end)
					end
					function DropFunc:Add(addtext)
						ItemCount = ItemCount + 1

						if ItemCount == 1 then
							FrameSize = 78
						elseif ItemCount == 2 then
							FrameSize = 107
						elseif ItemCount >= 3 then
							FrameSize = 133
						end
						local Item = Instance.new("TextButton")
						local ItemCorner = Instance.new("UICorner")

						Item.Name = "Item"
						Item.Parent = DropItemHolder
						Item.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
						Item.ClipsDescendants = true
						Item.Size = UDim2.new(0, 427, 0, 25)
						Item.AutoButtonColor = false
						Item.Font = Enum.Font.Gotham
						Item.Text = addtext
						Item.TextColor3 = Color3.fromRGB(255, 255, 255)
						Item.TextSize = 15.000
						Item.TextTransparency = 0.300

						ItemCorner.CornerRadius = UDim.new(0, 4)
						ItemCorner.Name = "ItemCorner"
						ItemCorner.Parent = Item
						DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)

						Item.MouseEnter:Connect(function()
							TweenService:Create(
								Item,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
						end)

						Item.MouseLeave:Connect(function()
							TweenService:Create(
								Item,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
						end)

						Item.MouseButton1Click:Connect(function()
							pcall(callback, addtext)
							Title.Text = text
							Selected = addtext
							DropToggled = not DropToggled
							Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end)
						if DropToggled == true then
							Title.Text = Selected
							Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
					end
					function DropFunc:Clear()
						Title.Text = text
						FrameSize = 0
						ItemCount = 0
						for i, v in next, DropItemHolder:GetChildren() do
							if v.Name == "Item" then
								v:Destroy()
							end
						end
						if DropToggled == true then
							Title.Text = Selected
							Dropdown:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
					end
					return DropFunc
				end
				function ContainerContent:Colorpicker(text,preset,callback)
					local ColorPickerToggled = false
					local OldToggleColor = Color3.fromRGB(0, 0, 0)
					local OldColor = Color3.fromRGB(0, 0, 0)
					local OldColorSelectionPosition = nil
					local OldHueSelectionPosition = nil
					local ColorH, ColorS, ColorV = 1, 1, 1
					local RainbowColorPicker = false
					local ColorPickerInput = nil
					local ColorInput = nil
					local HueInput = nil

					local Colorpicker = Instance.new("Frame")
					local ColorpickerCorner = Instance.new("UICorner")
					local Title = Instance.new("TextLabel")
					local Circle = Instance.new("Frame")
					local CircleCorner = Instance.new("UICorner")
					local CircleSmall = Instance.new("Frame")
					local CircleSmallCorner = Instance.new("UICorner")
					local Hue = Instance.new("ImageLabel")
					local HueCorner = Instance.new("UICorner")
					local HueGradient = Instance.new("UIGradient")
					local HueSelection = Instance.new("ImageLabel")
					local Color = Instance.new("ImageLabel")
					local ColorCorner = Instance.new("UICorner")
					local ColorSelection = Instance.new("ImageLabel")
					local Toggle = Instance.new("TextLabel")
					local ToggleFrame = Instance.new("Frame")
					local ToggleFrameCorner = Instance.new("UICorner")
					local ToggleCircle = Instance.new("Frame")
					local ToggleCircleCorner = Instance.new("UICorner")
					local Confirm = Instance.new("TextButton")
					local ConfirmCorner = Instance.new("UICorner")
					local ConfirmTitle = Instance.new("TextLabel")
					local BoxColor = Instance.new("Frame")
					local BoxColorCorner = Instance.new("UICorner")
					local ColorpickerBtn = Instance.new("TextButton")
					local ToggleBtn = Instance.new("TextButton")
					local colorUIGradient = Instance.new("UIGradient")

					Colorpicker.Name = "Colorpicker"
					Colorpicker.Parent = Container
					Colorpicker.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Colorpicker.ClipsDescendants = true
					Colorpicker.Position = UDim2.new(0.110937499, 0, 0.67653507, 0)
					Colorpicker.Size = UDim2.new(0, 457, 0, 43)

					ColorpickerCorner.CornerRadius = UDim.new(0, 4)
					ColorpickerCorner.Name = "ColorpickerCorner"
					ColorpickerCorner.Parent = Colorpicker

					Title.Name = "Title"
					Title.Parent = Colorpicker
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1.000
					Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
					Title.Size = UDim2.new(0, 113, 0, 42)
					Title.Font = Enum.Font.Gotham
					Title.Text = "Colorpicker"
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.TextSize = 15.000
					Title.TextTransparency = 0.300
					Title.TextXAlignment = Enum.TextXAlignment.Left
					colorUIGradient.Parent = Title


					local function ColorpRanbow() -- RainbowButton.Rainbow 
						local script = Instance.new('LocalScript', Title)

						local button = script.Parent
						local gradient = button.UIGradient
						local ts = game:GetService("TweenService")
						local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
						local offset = {Offset = Vector2.new(1, 0)}
						local create = ts:Create(gradient, ti, offset)
						local startingPos = Vector2.new(-1, 0)
						local list = {}
						local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
						local counter = 0
						local status = "down"

						gradient.Offset = startingPos

						local function rainbowColors()

							local sat, val = 255, 255

							for i = 1, 15 do

								local hue = i * 17
								table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

							end

						end

						rainbowColors()

						gradient.Color = s({

							kpt(0, list[#list]),
							kpt(0.5, list[#list - 1]),
							kpt(1, list[#list - 2])

						})

						counter = #list

						local function animate()

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 180

							if counter == #list - 1 and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[#list]),
									kpt(1, list[1])

								})

								counter = 1
								status = "up"

							elseif counter == #list and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[1]),
									kpt(1, list[2])

								})

								counter = 2
								status = "up"

							elseif counter <= #list - 2 and status == "down" then 

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[counter + 1]),
									kpt(1, list[counter + 2])

								})

								counter = counter + 2
								status = "up"

							end

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 0

							if counter == #list - 1 and status == "up" then

								gradient.Color = s({

									kpt(0, list[1]),
									kpt(0.5, list[#list]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 1
								status = "down"

							elseif counter == #list and status == "up" then

								gradient.Color = s({

									kpt(0, list[2]),
									kpt(0.5, list[1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 2
								status = "down"

							elseif counter <= #list - 2 and status == "up" then

								gradient.Color = s({

									kpt(0, list[counter + 2]),
									kpt(0.5, list[counter + 1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = counter + 2
								status = "down"

							end

							animate()

						end

						animate()
					end
					coroutine.wrap(ColorpRanbow)()


					ColorpickerBtn.Name = "ColorpickerBtn"
					ColorpickerBtn.Parent = Title
					ColorpickerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ColorpickerBtn.BackgroundTransparency = 1.000
					ColorpickerBtn.Position = UDim2.new(-0.336283177, 0, 0, 0)
					ColorpickerBtn.Size = UDim2.new(0, 457, 0, 42)
					ColorpickerBtn.Font = Enum.Font.SourceSans
					ColorpickerBtn.Text = ""
					ColorpickerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
					ColorpickerBtn.TextSize = 14.000

					Circle.Name = "Circle"
					Circle.Parent = Title
					Circle.Active = true
					Circle.AnchorPoint = Vector2.new(0.5, 0.5)
					Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
					Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
					Circle.Size = UDim2.new(0, 11, 0, 11)

					CircleCorner.CornerRadius = UDim.new(2, 6)
					CircleCorner.Name = "CircleCorner"
					CircleCorner.Parent = Circle

					CircleSmall.Name = "CircleSmall"
					CircleSmall.Parent = Circle
					CircleSmall.Active = true
					CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
					CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					CircleSmall.BackgroundTransparency = 1.000
					CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
					CircleSmall.Size = UDim2.new(0, 9, 0, 9)

					CircleSmallCorner.CornerRadius = UDim.new(2, 6)
					CircleSmallCorner.Name = "CircleSmallCorner"
					CircleSmallCorner.Parent = CircleSmall

					Hue.Name = "Hue"
					Hue.Parent = Title
					Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Hue.Position = UDim2.new(0, 229, 0, 46)
					Hue.Size = UDim2.new(0, 25, 0, 80)

					HueCorner.CornerRadius = UDim.new(0, 3)
					HueCorner.Name = "HueCorner"
					HueCorner.Parent = Hue

					HueGradient.Color = ColorSequence.new {
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
						ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
						ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
						ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
						ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
					}			
					HueGradient.Rotation = 270
					HueGradient.Name = "HueGradient"
					HueGradient.Parent = Hue

					HueSelection.Name = "HueSelection"
					HueSelection.Parent = Hue
					HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
					HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					HueSelection.BackgroundTransparency = 1.000
					HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
					HueSelection.Size = UDim2.new(0, 18, 0, 18)
					HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
					HueSelection.Visible = false

					Color.Name = "Color"
					Color.Parent = Title
					Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
					Color.Position = UDim2.new(0, -23, 0, 46)
					Color.Size = UDim2.new(0, 246, 0, 80)
					Color.ZIndex = 10
					Color.Image = "rbxassetid://4155801252"

					ColorCorner.CornerRadius = UDim.new(0, 3)
					ColorCorner.Name = "ColorCorner"
					ColorCorner.Parent = Color

					ColorSelection.Name = "ColorSelection"
					ColorSelection.Parent = Color
					ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
					ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ColorSelection.BackgroundTransparency = 1.000
					ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
					ColorSelection.Size = UDim2.new(0, 18, 0, 18)
					ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
					ColorSelection.ScaleType = Enum.ScaleType.Fit
					ColorSelection.Visible = false

					Toggle.Name = "Toggle"
					Toggle.Parent = Title
					Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000
					Toggle.Position = UDim2.new(2.37430048, 0, 1.07157099, 0)
					Toggle.Size = UDim2.new(0, 137, 0, 38)
					Toggle.Font = Enum.Font.Gotham
					Toggle.Text = "Rainbow"
					Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
					Toggle.TextSize = 15.000
					Toggle.TextTransparency = 0.300
					Toggle.TextXAlignment = Enum.TextXAlignment.Left

					ToggleFrame.Name = "ToggleFrame"
					ToggleFrame.Parent = Toggle
					ToggleFrame.BackgroundColor3 = Color3.fromRGB(226, 227, 227)
					ToggleFrame.Position = UDim2.new(0.778387249, 0, 0.357142866, 0)
					ToggleFrame.Size = UDim2.new(0, 27, 0, 11)

					ToggleFrameCorner.Name = "ToggleFrameCorner"
					ToggleFrameCorner.Parent = ToggleFrame

					ToggleCircle.Name = "ToggleCircle"
					ToggleCircle.Parent = ToggleFrame
					ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ToggleCircle.Position = UDim2.new(0, 0, -0.273000002, 0)
					ToggleCircle.Selectable = true
					ToggleCircle.Size = UDim2.new(0, 17, 0, 17)

					ToggleCircleCorner.CornerRadius = UDim.new(2, 8)
					ToggleCircleCorner.Name = "ToggleCircleCorner"
					ToggleCircleCorner.Parent = ToggleCircle

					Confirm.Name = "Confirm"
					Confirm.Parent = Title
					Confirm.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Confirm.ClipsDescendants = true
					Confirm.Position = UDim2.new(2.3791616, 0, 1.97633278, 0)
					Confirm.Size = UDim2.new(0, 144, 0, 42)
					Confirm.AutoButtonColor = false
					Confirm.Font = Enum.Font.SourceSans
					Confirm.Text = ""
					Confirm.TextColor3 = Color3.fromRGB(0, 0, 0)
					Confirm.TextSize = 14.000

					ConfirmCorner.CornerRadius = UDim.new(0, 4)
					ConfirmCorner.Name = "ConfirmCorner"
					ConfirmCorner.Parent = Confirm

					ConfirmTitle.Name = "ConfirmTitle"
					ConfirmTitle.Parent = Confirm
					ConfirmTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ConfirmTitle.BackgroundTransparency = 1.000
					ConfirmTitle.Size = UDim2.new(0, 116, 0, 40)
					ConfirmTitle.Font = Enum.Font.Gotham
					ConfirmTitle.Text = "Confirm"
					ConfirmTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
					ConfirmTitle.TextSize = 15.000
					ConfirmTitle.TextTransparency = 0.300
					ConfirmTitle.TextXAlignment = Enum.TextXAlignment.Left

					BoxColor.Name = "BoxColor"
					BoxColor.Parent = Title
					BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BoxColor.Position = UDim2.new(3.26915574, 0, 0.261904776, 0)
					BoxColor.Size = UDim2.new(0, 35, 0, 19)

					BoxColorCorner.CornerRadius = UDim.new(0, 4)
					BoxColorCorner.Name = "BoxColorCorner"
					BoxColorCorner.Parent = BoxColor

					ToggleBtn.Name = "ToggleBtn"
					ToggleBtn.Parent = Toggle
					ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ToggleBtn.BackgroundTransparency = 1.000
					ToggleBtn.Size = UDim2.new(0, 137, 0, 38)
					ToggleBtn.Font = Enum.Font.SourceSans
					ToggleBtn.Text = ""
					ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
					ToggleBtn.TextSize = 14.000

					ColorpickerBtn.MouseEnter:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
					end)

					ColorpickerBtn.MouseLeave:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.3}
						):Play()
					end)

					ColorpickerBtn.MouseButton1Click:Connect(function()
						if ColorPickerToggled == false then
							ColorSelection.Visible = true
							HueSelection.Visible = true
							Colorpicker:TweenSize(UDim2.new(0, 457, 0, 138), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = PresetColor}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						else
							ColorSelection.Visible = false
							HueSelection.Visible = false
							Colorpicker:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
						ColorPickerToggled = not ColorPickerToggled
					end)


					local function UpdateColorPicker(nope)
						BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
						Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

						pcall(callback, BoxColor.BackgroundColor3)
					end

					ColorH =
						1 -
						(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
							Hue.AbsoluteSize.Y)
					ColorS =
						(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
							Color.AbsoluteSize.X)
					ColorV =
						1 -
						(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
							Color.AbsoluteSize.Y)

					BoxColor.BackgroundColor3 = preset
					Color.BackgroundColor3 = preset
					pcall(callback, BoxColor.BackgroundColor3)

					Color.InputBegan:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								if RainbowColorPicker then
									return
								end

								if ColorInput then
									ColorInput:Disconnect()
								end

								ColorInput =
									RunService.RenderStepped:Connect(
										function()
										local ColorX =
											(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
												Color.AbsoluteSize.X)
										local ColorY =
											(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
												Color.AbsoluteSize.Y)

										ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
										ColorS = ColorX
										ColorV = 1 - ColorY

										UpdateColorPicker(true)
									end
									)
							end
						end
					)

					Color.InputEnded:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								if ColorInput then
									ColorInput:Disconnect()
								end
							end
						end
					)

					Hue.InputBegan:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								if RainbowColorPicker then
									return
								end

								if HueInput then
									HueInput:Disconnect()
								end

								HueInput =
									RunService.RenderStepped:Connect(
										function()
										local HueY =
											(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
												Hue.AbsoluteSize.Y)

										HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
										ColorH = 1 - HueY

										UpdateColorPicker(true)
									end
									)
							end
						end
					)

					Hue.InputEnded:Connect(
						function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								if HueInput then
									HueInput:Disconnect()
								end
							end
						end
					)

					ToggleBtn.MouseButton1Down:Connect(
						function()
							RainbowColorPicker = not RainbowColorPicker

							if ColorInput then
								ColorInput:Disconnect()
							end

							if HueInput then
								HueInput:Disconnect()
							end

							if RainbowColorPicker then
								ToggleCircle:TweenPosition(UDim2.new(0.37, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
								TweenService:Create(
									ToggleCircle,
									TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
									{BackgroundColor3 =PresetColor}
								):Play()

								OldToggleColor = BoxColor.BackgroundColor3
								OldColor = Color.BackgroundColor3
								OldColorSelectionPosition = ColorSelection.Position
								OldHueSelectionPosition = HueSelection.Position

								while RainbowColorPicker do
									BoxColor.BackgroundColor3 = Color3.fromHSV(Flux.RainbowColorValue, 1, 1)
									Color.BackgroundColor3 = Color3.fromHSV(Flux.RainbowColorValue, 1, 1)

									ColorSelection.Position = UDim2.new(1, 0, 0, 0)
									HueSelection.Position = UDim2.new(0.48, 0, 0, Flux.HueSelectionPosition)

									pcall(callback, BoxColor.BackgroundColor3)
									wait()
								end
							elseif not RainbowColorPicker then
								ToggleCircle:TweenPosition(UDim2.new(0, 0,-0.273, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
								TweenService:Create(
									ToggleCircle,
									TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
									{BackgroundColor3 = Color3.fromRGB(255,255,255)}
								):Play()

								BoxColor.BackgroundColor3 = OldToggleColor
								Color.BackgroundColor3 = OldColor

								ColorSelection.Position = OldColorSelectionPosition
								HueSelection.Position = OldHueSelectionPosition

								pcall(callback, BoxColor.BackgroundColor3)
							end
						end
					)

					Confirm.MouseButton1Click:Connect(
						function()
							ColorPickerToggled = not ColorPickerToggled
							Colorpicker:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
					)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				function ContainerContent:Line()
					local Line = Instance.new("TextButton")
					local LineCorner = Instance.new("UICorner")

					Line.Name = "Line"
					Line.Parent = Container
					Line.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Line.ClipsDescendants = true
					Line.Position = UDim2.new(0, 0, 0.70091325, 0)
					Line.Size = UDim2.new(0, 457, 0, 4)
					Line.AutoButtonColor = false
					Line.Font = Enum.Font.SourceSans
					Line.Text = ""
					Line.TextColor3 = Color3.fromRGB(0, 0, 0)
					Line.TextSize = 14.000

					LineCorner.CornerRadius = UDim.new(0, 4)
					LineCorner.Name = "LineCorner"
					LineCorner.Parent = Line

					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				function ContainerContent:Label(text)
					local Label = Instance.new("TextButton")
					local LabelCorner = Instance.new("UICorner")
					local Title = Instance.new("TextLabel")
					local LabelUIGradient = Instance.new("UIGradient")
					Label.Name = "Label"
					Label.Parent = Container
					Label.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Label.ClipsDescendants = true
					Label.Position = UDim2.new(0.370312512, 0, 0.552631557, 0)
					Label.Size = UDim2.new(0, 457, 0, 43)
					Label.AutoButtonColor = false
					Label.Font = Enum.Font.SourceSans
					Label.Text = ""
					Label.TextColor3 = Color3.fromRGB(0, 0, 0)
					Label.TextSize = 14.000

					LabelCorner.CornerRadius = UDim.new(0, 4)
					LabelCorner.Name = "LabelCorner"
					LabelCorner.Parent = Label

					Title.Name = "Title"
					Title.Parent = Label
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1.000
					Title.Position = UDim2.new(0.038480062, 0, 0, 0)
					Title.Size = UDim2.new(0, 113, 0, 42)
					Title.Font = Enum.Font.Gotham
					Title.Text = text
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.TextSize = 15.000
					Title.TextTransparency = 0.300
					Title.TextXAlignment = Enum.TextXAlignment.Left
					LabelUIGradient.Parent = Title


					local function LabelRanbow() -- RainbowButton.Rainbow 
						local script = Instance.new('LocalScript', Title)

						local button = script.Parent
						local gradient = button.UIGradient
						local ts = game:GetService("TweenService")
						local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
						local offset = {Offset = Vector2.new(1, 0)}
						local create = ts:Create(gradient, ti, offset)
						local startingPos = Vector2.new(-1, 0)
						local list = {}
						local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
						local counter = 0
						local status = "down"

						gradient.Offset = startingPos

						local function rainbowColors()

							local sat, val = 255, 255

							for i = 1, 15 do

								local hue = i * 17
								table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

							end

						end

						rainbowColors()

						gradient.Color = s({

							kpt(0, list[#list]),
							kpt(0.5, list[#list - 1]),
							kpt(1, list[#list - 2])

						})

						counter = #list

						local function animate()

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 180

							if counter == #list - 1 and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[#list]),
									kpt(1, list[1])

								})

								counter = 1
								status = "up"

							elseif counter == #list and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[1]),
									kpt(1, list[2])

								})

								counter = 2
								status = "up"

							elseif counter <= #list - 2 and status == "down" then 

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[counter + 1]),
									kpt(1, list[counter + 2])

								})

								counter = counter + 2
								status = "up"

							end

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 0

							if counter == #list - 1 and status == "up" then

								gradient.Color = s({

									kpt(0, list[1]),
									kpt(0.5, list[#list]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 1
								status = "down"

							elseif counter == #list and status == "up" then

								gradient.Color = s({

									kpt(0, list[2]),
									kpt(0.5, list[1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 2
								status = "down"

							elseif counter <= #list - 2 and status == "up" then

								gradient.Color = s({

									kpt(0, list[counter + 2]),
									kpt(0.5, list[counter + 1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = counter + 2
								status = "down"

							end

							animate()

						end

						animate()
					end
					coroutine.wrap(LabelRanbow)()


					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				function ContainerContent:Textbox(text,desc,disapper,callback)
					if desc == "" then
						desc = "There is no description for this textbox."
					end
					local TextboxDescToggled = false
					local Textbox = Instance.new("TextButton")
					local TextboxCorner = Instance.new("UICorner")
					local Title = Instance.new("TextLabel")
					local Circle = Instance.new("Frame")
					local CircleCorner = Instance.new("UICorner")
					local CircleSmall = Instance.new("Frame")
					local CircleSmallCorner = Instance.new("UICorner")
					local Description = Instance.new("TextLabel")
					local TextboxFrame = Instance.new("Frame")
					local TextboxFrameCorner = Instance.new("UICorner")
					local TextBox = Instance.new("TextBox")
					local ArrowBtn = Instance.new("ImageButton")
					local ArrowIco = Instance.new("ImageLabel")
					local TextboxUIGradient = Instance.new("UIGradient")
					Textbox.Name = "Textbox"
					Textbox.Parent = Container
					Textbox.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Textbox.ClipsDescendants = true
					Textbox.Position = UDim2.new(0.0459499061, 0, 0.734449744, 0)
					Textbox.Size = UDim2.new(0, 457, 0, 43)
					Textbox.AutoButtonColor = false
					Textbox.Font = Enum.Font.SourceSans
					Textbox.Text = ""
					Textbox.TextColor3 = Color3.fromRGB(0, 0, 0)
					Textbox.TextSize = 14.000

					TextboxCorner.CornerRadius = UDim.new(0, 4)
					TextboxCorner.Name = "TextboxCorner"
					TextboxCorner.Parent = Textbox

					Title.Name = "Title"
					Title.Parent = Textbox
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1.000
					Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
					Title.Size = UDim2.new(0, 113, 0, 42)
					Title.Font = Enum.Font.Gotham
					Title.Text = text
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.TextSize = 15.000
					Title.TextTransparency = 0.300
					Title.TextXAlignment = Enum.TextXAlignment.Left
					TextboxUIGradient.Parent = Title


					local function TextRanbow() -- RainbowButton.Rainbow 
						local script = Instance.new('LocalScript', Title)

						local button = script.Parent
						local gradient = button.UIGradient
						local ts = game:GetService("TweenService")
						local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
						local offset = {Offset = Vector2.new(1, 0)}
						local create = ts:Create(gradient, ti, offset)
						local startingPos = Vector2.new(-1, 0)
						local list = {}
						local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
						local counter = 0
						local status = "down"

						gradient.Offset = startingPos

						local function rainbowColors()

							local sat, val = 255, 255

							for i = 1, 15 do

								local hue = i * 17
								table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))

							end

						end

						rainbowColors()

						gradient.Color = s({

							kpt(0, list[#list]),
							kpt(0.5, list[#list - 1]),
							kpt(1, list[#list - 2])

						})

						counter = #list

						local function animate()

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 180

							if counter == #list - 1 and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[#list]),
									kpt(1, list[1])

								})

								counter = 1
								status = "up"

							elseif counter == #list and status == "down" then

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[1]),
									kpt(1, list[2])

								})

								counter = 2
								status = "up"

							elseif counter <= #list - 2 and status == "down" then 

								gradient.Color = s({

									kpt(0, gradient.Color.Keypoints[1].Value),
									kpt(0.5, list[counter + 1]),
									kpt(1, list[counter + 2])

								})

								counter = counter + 2
								status = "up"

							end

							create:Play()
							create.Completed:Wait()
							gradient.Offset = startingPos
							gradient.Rotation = 0

							if counter == #list - 1 and status == "up" then

								gradient.Color = s({

									kpt(0, list[1]),
									kpt(0.5, list[#list]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 1
								status = "down"

							elseif counter == #list and status == "up" then

								gradient.Color = s({

									kpt(0, list[2]),
									kpt(0.5, list[1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = 2
								status = "down"

							elseif counter <= #list - 2 and status == "up" then

								gradient.Color = s({

									kpt(0, list[counter + 2]),
									kpt(0.5, list[counter + 1]),
									kpt(1, gradient.Color.Keypoints[3].Value)

								})

								counter = counter + 2
								status = "down"

							end

							animate()

						end

						animate()
					end
					coroutine.wrap(TextRanbow)()


					Circle.Name = "Circle"
					Circle.Parent = Title
					Circle.Active = true
					Circle.AnchorPoint = Vector2.new(0.5, 0.5)
					Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
					Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
					Circle.Size = UDim2.new(0, 11, 0, 11)

					CircleCorner.CornerRadius = UDim.new(2, 6)
					CircleCorner.Name = "CircleCorner"
					CircleCorner.Parent = Circle

					CircleSmall.Name = "CircleSmall"
					CircleSmall.Parent = Circle
					CircleSmall.Active = true
					CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
					CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					CircleSmall.BackgroundTransparency = 1.000
					CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
					CircleSmall.Size = UDim2.new(0, 9, 0, 9)

					CircleSmallCorner.CornerRadius = UDim.new(2, 6)
					CircleSmallCorner.Name = "CircleSmallCorner"
					CircleSmallCorner.Parent = CircleSmall

					Description.Name = "Description"
					Description.Parent = Title
					Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Description.BackgroundTransparency = 1.000
					Description.Position = UDim2.new(-0.200942323, 0, 0.985714269, 0)
					Description.Size = UDim2.new(0, 432, 0, 31)
					Description.Font = Enum.Font.Gotham
					Description.Text = desc
					Description.TextColor3 = Color3.fromRGB(255, 255, 255)
					Description.TextSize = 15.000
					Description.TextTransparency = 1
					Description.TextWrapped = true
					Description.TextXAlignment = Enum.TextXAlignment.Left

					TextboxFrame.Name = "TextboxFrame"
					TextboxFrame.Parent = Title
					TextboxFrame.BackgroundColor3 = Color3.fromRGB(50, 53, 59)
					TextboxFrame.Position = UDim2.new(1.82300889, 0, 0.202380955, 0)
					TextboxFrame.Size = UDim2.new(0, 161, 0, 26)

					TextboxFrameCorner.CornerRadius = UDim.new(0, 4)
					TextboxFrameCorner.Name = "TextboxFrameCorner"
					TextboxFrameCorner.Parent = TextboxFrame

					TextBox.Parent = TextboxFrame
					TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextBox.BackgroundTransparency = 1.000
					TextBox.Size = UDim2.new(0, 161, 0, 26)
					TextBox.Font = Enum.Font.Gotham
					TextBox.Text = ""
					TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextBox.TextSize = 15.000
					TextBox.TextTransparency = 0.300

					ArrowBtn.Name = "ArrowBtn"
					ArrowBtn.Parent = Textbox
					ArrowBtn.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
					ArrowBtn.BackgroundTransparency = 1.000
					ArrowBtn.Position = UDim2.new(0.903719902, 0, 0, 0)
					ArrowBtn.Size = UDim2.new(0, 33, 0, 37)
					ArrowBtn.SliceCenter = Rect.new(30, 30, 30, 30)
					ArrowBtn.SliceScale = 7.000

					ArrowIco.Name = "ArrowIco"
					ArrowIco.Parent = ArrowBtn
					ArrowIco.AnchorPoint = Vector2.new(0.5, 0.5)
					ArrowIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ArrowIco.BackgroundTransparency = 1.000
					ArrowIco.Position = UDim2.new(0.495753437, 0, 0.554054081, 0)
					ArrowIco.Selectable = true
					ArrowIco.Size = UDim2.new(0, 28, 0, 24)
					ArrowIco.Image = "http://www.roblox.com/asset/?id=6034818372"

					TextBox.FocusLost:Connect(
						function(ep)
							if ep then
								if #TextBox.Text > 0 then
									pcall(callback, TextBox.Text)
									if disapper then
										TextBox.Text = ""
									end
								end
							end
						end
					)

					ArrowBtn.MouseButton1Click:Connect(function()
						if TextboxDescToggled == false then
							Textbox:TweenSize(UDim2.new(0, 457, 0, 81), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = PresetColor}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = 0}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 180}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = PresetColor}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							TweenService:Create(
								Description,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						else
							Textbox:TweenSize(UDim2.new(0, 457, 0, 43), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{ImageTransparency = .3}
							):Play()
							TweenService:Create(
								ArrowIco,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							TweenService:Create(
								Description,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1}
							):Play()
							wait(.4)
							Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
						end
						TextboxDescToggled = not TextboxDescToggled
					end)
					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				function ContainerContent:Bind(text,presetbind,callback)
					local Key = presetbind.Name
					local Bind = Instance.new("TextButton")
					local BindCorner = Instance.new("UICorner")
					local Title = Instance.new("TextLabel")
					local Circle = Instance.new("Frame")
					local CircleCorner = Instance.new("UICorner")
					local CircleSmall = Instance.new("Frame")
					local CircleSmallCorner = Instance.new("UICorner")
					local BindLabel = Instance.new("TextLabel")

					Bind.Name = "Bind"
					Bind.Parent = Container
					Bind.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					Bind.ClipsDescendants = true
					Bind.Position = UDim2.new(0.40625, 0, 0.828947306, 0)
					Bind.Size = UDim2.new(0, 457, 0, 43)
					Bind.AutoButtonColor = false
					Bind.Font = Enum.Font.SourceSans
					Bind.Text = ""
					Bind.TextColor3 = Color3.fromRGB(0, 0, 0)
					Bind.TextSize = 14.000

					BindCorner.CornerRadius = UDim.new(0, 4)
					BindCorner.Name = "BindCorner"
					BindCorner.Parent = Bind

					Title.Name = "Title"
					Title.Parent = Bind
					Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Title.BackgroundTransparency = 1.000
					Title.Position = UDim2.new(0.0822437406, 0, 0, 0)
					Title.Size = UDim2.new(0, 113, 0, 42)
					Title.Font = Enum.Font.Gotham
					Title.Text = text
					Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					Title.TextSize = 15.000
					Title.TextTransparency = 0.300
					Title.TextXAlignment = Enum.TextXAlignment.Left

					Circle.Name = "Circle"
					Circle.Parent = Title
					Circle.Active = true
					Circle.AnchorPoint = Vector2.new(0.5, 0.5)
					Circle.BackgroundColor3 = Color3.fromRGB(211, 211, 211)
					Circle.Position = UDim2.new(-0.150690272, 0, 0.503000021, 0)
					Circle.Size = UDim2.new(0, 11, 0, 11)

					CircleCorner.CornerRadius = UDim.new(2, 6)
					CircleCorner.Name = "CircleCorner"
					CircleCorner.Parent = Circle

					CircleSmall.Name = "CircleSmall"
					CircleSmall.Parent = Circle
					CircleSmall.Active = true
					CircleSmall.AnchorPoint = Vector2.new(0.5, 0.5)
					CircleSmall.BackgroundColor3 = Color3.fromRGB(64, 68, 75)
					CircleSmall.BackgroundTransparency = 1.000
					CircleSmall.Position = UDim2.new(0.485673368, 0, 0.503000021, 0)
					CircleSmall.Size = UDim2.new(0, 9, 0, 9)

					CircleSmallCorner.CornerRadius = UDim.new(2, 6)
					CircleSmallCorner.Name = "CircleSmallCorner"
					CircleSmallCorner.Parent = CircleSmall

					BindLabel.Name = "BindLabel"
					BindLabel.Parent = Title
					BindLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					BindLabel.BackgroundTransparency = 1.000
					BindLabel.Position = UDim2.new(2.56011987, 0, 0, 0)
					BindLabel.Size = UDim2.new(0, 113, 0, 42)
					BindLabel.Font = Enum.Font.Gotham
					BindLabel.Text = Key
					BindLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					BindLabel.TextSize = 15.000
					BindLabel.TextTransparency = 0.300
					BindLabel.TextXAlignment = Enum.TextXAlignment.Right

					Bind.MouseEnter:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0}
						):Play()
					end)

					Bind.MouseLeave:Connect(function()
						TweenService:Create(
							Title,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.3}
						):Play()
					end)

					Bind.MouseButton1Click:connect(
						function()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								BindLabel,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = PresetColor}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = PresetColor}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							TweenService:Create(
								BindLabel,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0}
							):Play()
							BindLabel.Text = "..."
							local inputwait = game:GetService("UserInputService").InputBegan:wait()
							if inputwait.KeyCode.Name ~= "Unknown" then
								BindLabel.Text = inputwait .KeyCode.Name
								Key = inputwait .KeyCode.Name
							end
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								BindLabel,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255,255,255)}
							):Play()
							TweenService:Create(
								Circle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(211, 211, 211)}
							):Play()
							TweenService:Create(
								CircleSmall,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								Title,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
							TweenService:Create(
								BindLabel,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.3}
							):Play()
						end
					)

					game:GetService("UserInputService").InputBegan:connect(
					function(current, pressed)
						if not pressed then
							if current.KeyCode.Name == Key then
								pcall(callback)
							end
						end
					end
					)

					Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
				end
				return ContainerContent
			end
			return Tabs
		end

		local win = Flux:Window("Ren Hub", "King Legacy", _G.ToggleKey, Enum.KeyCode.RightControl)


		local tgls = win:Tab("Auto Farm", "")
		local stat = win:Tab("Auto Stats", "")
		local TP = win:Tab("Teleport", "")
		local Raids = win:Tab("Dungeon", "")
		local PY = win:Tab("Player", "")
		local Mis = win:Tab("Misc", "")
		local king = win:Tab("SeaKing", "")
		local Df = win:Tab("Devil Fruit", "")
		local sv = win:Tab("Setting", "")


		if _G.useid == nil then
			game.Players.LocalPlayer.UserId = 991117111
			game:GetService("CoreGui").PlayerList.Enabled = false
			_G.useid = false
		end

		local placeId = game.PlaceId
		if placeId == 4520749081 then
			OldWorld = true
		elseif placeId == 6381829480 then
			newworld = true
		end
		function CheckQuest()
			local MyLevel = game.Players.LocalPlayer.PlayerStats.lvl.Value
			if OldWorld then
				if MyLevel == 1 or MyLevel <= 9 then
					CFrameQuest = CFrame.new(2277.1884765625, 48.143299102783, -1648.5339355469)
					CFrameMon = CFrame.new(2388.6013183594, 350.19408416748, -1578.6862792969)
					NameMon = "Soldier"
					Ms = "Soldier [Lv. 1]"
					levelquest = 1
				elseif MyLevel == 10 or MyLevel <= 19 then
					CFrameQuest = CFrame.new(2496.5114746094, 48.135684967041, -1771.6900634766)
					CFrameMon = CFrame.new(2388.6013183594, 350.19408416748, -1578.6862792969)
					NameMon = "Clown Pirate"
					Ms = "Clown Pirate [Lv. 10]"
					levelquest = 10
				elseif MyLevel == 20 or MyLevel <= 29 then
					CFrameQuest = CFrame.new(2231.0498046875, 48.153293609619, -1779.0476074219)
					CFrameMon = CFrame.new(2293.3962402344, 350.193294525146, -1802.6019287109)
					NameMon = "Smoky"
					Ms = "Smoky [Lv. 20]"
					levelquest = 20
				elseif MyLevel == 30 or MyLevel <= 49 then
					CFrameQuest = CFrame.new(2011.1265869141, 48.143299102783, -1810.4008789063)
					CFrameMon = CFrame.new(2091.3608398438, 350.193294525146, -1928.6489257813)
					NameMon = "Tashi"
					Ms = "Tashi [Lv. 30]"
					levelquest = 30
				elseif MyLevel == 50 or MyLevel <= 74 then
					CFrameQuest = CFrame.new(4021.25781, 37.8887329, 268.103943, 0.529884458, -0, -0.848069847, 0, 1, -0, 0.848069847, 0, 0.529884458)
					CFrameMon = CFrame.new(3965.912109375, 395.80511474609, 119.3405380249)
					NameMon = "Clown Pirate"
					Ms = "Clown Pirate [Lv. 50]"
					levelquest = 50
				elseif MyLevel == 75 or MyLevel <= 144 then
					CFrameQuest = CFrame.new(4260.06592, 69.0870895, 249.896057, 0.529884458, -0, -0.848069847, 0, 1, -0, 0.848069847, 0, 0.529884458)
					CFrameMon = CFrame.new(4279.83838, 350.8366318, 53.9889946)
					NameMon = "The Clown"
					Ms = "The Clown [Lv. 75]"
					levelquest = 75
				elseif MyLevel == 145 or MyLevel <= 179 then
					CFrameQuest = CFrame.new(1607.07849, 68.6067047, 1359.05444)
					CFrameMon = CFrame.new(1708.06006, 350.6267929, 1412.47498)
					NameMon = "Axe-Hand"
					Ms = "Axe-Hand [Lv. 145]"
					levelquest = 145
				elseif MyLevel == 180 or MyLevel <= 229 then
					CFrameQuest = CFrame.new(3873.9126, 10.4919758, 3251.1311)
					CFrameMon = CFrame.new(4094.49268, 350.541934, 3257.55811)
					NameMon = "Fishman"
					Ms = "Fishman [Lv. 180]"
					levelquest = 180
				elseif MyLevel == 230 or MyLevel <= 249 then
					CFrameQuest = CFrame.new(4291.13379, 10.4919758, 3250.18872)
					CFrameMon = CFrame.new(4393.53223, 350.4659395, 3235.98608)
					NameMon = "SharkMan"
					Ms = "SharkMan [Lv. 230]"
					levelquest = 230
				elseif MyLevel == 250 or MyLevel <= 299 then
					CFrameQuest = CFrame.new(-51.7463303, 49.7374306, -87.7024078)
					CFrameMon = CFrame.new(-51.7463303, 350.7374306, -87.7024078)
					NameMon = "Trainer Chef"
					Ms = "Trainer Chef [Lv. 250]"
					levelquest = 250
				elseif MyLevel == 300 or MyLevel <= 349 then
					CFrameQuest = CFrame.new(39.4004707, 99.5126801, -47.8512077)
					CFrameMon = CFrame.new(96.1493149, 350.94034, -143.488434)
					NameMon = "Dark Leg"
					Ms = "Dark Leg [Lv. 300]"
					levelquest = 300
				elseif MyLevel == 350 or MyLevel <= 399 then
					CFrameQuest = CFrame.new(-44.2784309, 49.7609177, 115.918266)
					CFrameMon = CFrame.new(-103.605598, 350.94034, 233.536148)
					NameMon = "Weapon Man"
					Ms = "Weapon Man [Lv. 350]"
					levelquest = 350
				elseif MyLevel == 400 or MyLevel <= 449 then
					CFrameQuest = CFrame.new(-2851.466796875, 18.111785888672, 1420.4886474609)
					CFrameMon = CFrame.new(-2818.3337402344, 350.12328338623, 1470.3162841797)
					NameMon = "Snow Soldier"
					Ms = "Snow Soldier [Lv. 400]"
					levelquest = 400
				elseif MyLevel == 450 or MyLevel <= 524 then
					CFrameQuest = CFrame.new(-2838.9370117188, 18.091789245605, 1319.8012695313)
					CFrameMon = CFrame.new(-2860.3764648438, 350.121784210205, 1293.3358154297)
					NameMon = "King Snow"
					Ms = "King Snow [Lv. 450]"
					levelquest = 450
				elseif MyLevel == 525 or MyLevel <= 624 then
					CFrameQuest = CFrame.new(1731.5385742188, 12.902250289917, 3644.4453125)
					CFrameMon = CFrame.new(1761.9046630859, 350.971120834351, 3610.41015625)
					NameMon = "Candle Man"
					Ms = "Candle Man [Lv. 525]"
					levelquest = 525
				elseif MyLevel == 625 or MyLevel <= 724 then
					CFrameQuest = CFrame.new(1520.1804199219, 12.902250289917, 3431.5466308594)
					CFrameMon = CFrame.new(1538.6333007813, 350.902250289917, 3397.02734375)
					NameMon = "Bomb Man"
					Ms = "Bomb Man [Lv. 625]"
					levelquest = 625
				elseif MyLevel == 725 or MyLevel <= 799 then
					CFrameQuest = CFrame.new(1511.4117431641, 43.04167175293, 3541.400390625)
					CFrameMon = CFrame.new(1478.7867431641, 350.56248474121, 3638.8305664063)
					NameMon = "King of Sand"
					Ms = "King of Sand [Lv. 725]"
					levelquest = 725
				elseif MyLevel == 800 or MyLevel <= 849 then
					CFrameQuest = CFrame.new(-1251.8015136719, 200.67266845703, 4581.4990234375)
					CFrameMon = CFrame.new(-1294.9228515625, 500.30653381348, 4678.55859375)
					NameMon = "Sky Soldier"
					Ms = "Sky Soldier [Lv. 800]"
					levelquest = 800
				elseif MyLevel == 850 or MyLevel <= 899 then
					CFrameQuest = CFrame.new(-818.76123046875, 386.42059326172, 4745.69921875)
					CFrameMon = CFrame.new(-790.27984619141, 500.47073364258, 4807.623046875)
					NameMon = "Ball Man"
					Ms = "Ball Man [Lv. 850]"
					levelquest = 850
				elseif MyLevel == 900 or MyLevel <= 999 then
					CFrameQuest = CFrame.new(-861.33489990234, 386.42074584961, 4879.1186523438)
					CFrameMon = CFrame.new(-895.37359619141, 500.42074584961, 4946.294921875)
					NameMon = "Rumble Man"
					Ms = "Rumble Man [Lv. 900]"
					levelquest = 900
				elseif MyLevel == 1000 or MyLevel <= 1099 then
					CFrameQuest = CFrame.new(8271.4833984375, 11.896879196167, 5437.4653320313)
					CFrameMon = CFrame.new(8333.201171875, 350.846879959106, 5465.994140625)
					NameMon = "Soldier"
					Ms = "Soldier [Lv. 1000]"
					levelquest = 1000
				elseif MyLevel == 1100 or MyLevel <= 1149 then
					CFrameQuest = CFrame.new(8176.1176757813, 11.846877098083, 5287.4770507813)
					CFrameMon = CFrame.new(8274.4404296875, 500.251501083374, 5267.7802734375)
					NameMon = "Leader"
					Ms = "Leader [Lv. 1100]"
					levelquest = 1100
				elseif MyLevel == 1150 or MyLevel <= 1249 then
					CFrameQuest = CFrame.new(7993.27393, 11.8711519, 5765.53076, -0.278351784, 5.68772371e-08, -0.960479379, 9.40473655e-08, 1, 3.19621591e-08, 0.960479379, -8.14338179e-08, -0.278351784)
					CFrameMon = CFrame.new(8274.4404296875, 500.251501083374, 5267.7802734375)
					NameMon = "Pasta"
					Ms = "Pasta [Lv. 1150]"
					levelquest = 1150
				elseif MyLevel == 1250 or MyLevel <= 1324 then
					CFrameQuest = CFrame.new(4210.1782226563, 13.030811309814, 6768.8955078125)
					CFrameMon = CFrame.new(4166.5815429688, 500.090654373169, 6898.6127929688)
					NameMon = "Wolf"
					Ms = "Wolf [Lv. 1250]"
					levelquest = 1250
				elseif MyLevel == 1325 or MyLevel <= 1399 then
					CFrameQuest = CFrame.new(4311.3798828125, 13.042789459229, 6978.6538085938)
					CFrameMon = CFrame.new(4379.4565429688, 500.090654373169, 6949.353515625)
					NameMon = "Giraffe"
					Ms = "Giraffe [Lv. 1325]"
					levelquest = 1325
				elseif MyLevel == 1400 or MyLevel <= 1499 then
					CFrameQuest = CFrame.new(4312.81640625, 13.059648513794, 7417.8813476563)
					CFrameMon = CFrame.new(4391.2377929688, 500.961982727051, 7569.0166015625)
					NameMon = "Leo"
					Ms = "Leo [Lv. 1400]"
					levelquest = 1400
				elseif MyLevel == 1500 or MyLevel <= 1599 then
					CFrameQuest = CFrame.new(-776.28472900391, 47.856597900391, 8478.431640625)
					CFrameMon = CFrame.new(-778.30328369141, 500.856491088867, 8537.9267578125)
					NameMon = "Zombie"
					Ms = "Zombie [Lv. 1500]"
					levelquest = 1500
				elseif MyLevel == 1600 or MyLevel <= 1749 then
					CFrameQuest = CFrame.new(-793.65240478516, 47.857288360596, 8329.0654296875)
					CFrameMon = CFrame.new(-793.65240478516, 500.857288360596, 8329.0654296875)
					NameMon = "Shadow Master"
					Ms = "Shadow Master [Lv. 1600]"
					levelquest = 1600
				elseif MyLevel == 1750 or MyLevel <= 1799 then
					CFrameQuest = CFrame.new(8601.7705078125, 49.582111358643, 1731.2292480469)
					CFrameMon = CFrame.new(8601.7705078125, 500.582111358643, 1731.2292480469)
					NameMon = "New World Pirate"
					Ms = "New World Pirate [Lv. 1750]"
					levelquest = 1750
				elseif MyLevel == 1800 or MyLevel <= 1924 then
					CFrameQuest = CFrame.new(8580.9599609375, 49.578090667725, 1347.4166259766)
					CFrameMon = CFrame.new(8580.9599609375, 500.578090667725, 1347.4166259766)
					NameMon = "Rear Admiral"
					Ms = "Rear Admiral [Lv. 1800]"
					levelquest = 1800
				elseif MyLevel == 1925 or MyLevel <= 1849 then
					CFrameQuest = CFrame.new(8242.3994140625, 49.60005569458, 1392.0007324219)
					CFrameMon = CFrame.new(8242.3994140625, 500.60005569458, 1392.0007324219)
					NameMon = "Quake Woman"
					Ms = "Quake Woman [Lv. 1925]"
					levelquest = 1925
				elseif MyLevel == 1850 or MyLevel <= 1999 then
					CFrameQuest = CFrame.new(8555.9892578125, 49.57417678833, 1460.2507324219)
					CFrameMon = CFrame.new(8555.9892578125, 500.57417678833, 1460.2507324219)
					NameMon = "True Karate Fishman"
					Ms = "True Karate Fishman [Lv. 1850]"
					levelquest = 1850
				elseif MyLevel == 2000 or MyLevel <= 2049 then
					CFrameQuest = CFrame.new(2970.7785644531, 40.2607421875, 13349.877929688)
					CFrameMon = CFrame.new(2970.7785644531, 500.2607421875, 13349.877929688)
					NameMon = "Fishman"
					Ms = "Fishman [Lv. 2000]"
					levelquest = 2000
				elseif MyLevel == 2050 or MyLevel <= 2099 then
					CFrameQuest = CFrame.new(2783.875, 40.24825668335, 13617.719726563)
					CFrameMon = CFrame.new(2783.875, 500.24825668335, 13617.719726563)
					NameMon = "Combat Fishman"
					Ms = "Combat Fishman [Lv. 2050]"
					levelquest = 2050
				elseif MyLevel == 2100 or MyLevel <= 2149 then
					CFrameQuest = CFrame.new(3297.2663574219, 40.275020599365, 13793.421875)
					CFrameMon = CFrame.new(3297.2663574219, 500.275020599365, 13793.421875)
					NameMon = "Sword Fishman"
					Ms = "Sword Fishman [Lv. 2100]"
					levelquest = 2100
				elseif MyLevel == 2150 or MyLevel <= 2199 then
					CFrameQuest = CFrame.new(3019.2189941406, 40.270706176758, 13883.921875)
					CFrameMon = CFrame.new(3019.2189941406, 350.270706176758, 13883.921875)
					NameMon = "Fishman Soldier"
					Ms = "Fishman Soldier [Lv. 2150]"
					levelquest = 2150
				elseif MyLevel >= 2200 then
					CFrameQuest = CFrame.new(2785.8464355469, 40.275859832764, 13820.041992188)
					CFrameMon = CFrame.new(2785.8464355469, 350.275859832764, 13820.041992188)
					NameMon = "Seasoned Fishman"
					Ms = "Seasoned Fishman [Lv. 2200]"
					levelquest = 2200
				end
			end
			if newworld then
				if MyLevel >= 2250 and MyLevel <= 2299 then
					Ms = "Beast Pirate [Lv. 2250]"
					CFrameQuest = CFrame.new(558.123962, 75.4188766, -2156.09204, -1, 0, 0, 0, 1, 0, 0, 0, -1)
					NameMon = "Beast Pirate"
					CFrameMon = CFrame.new(3302.8967285156, 367.02523803711, 91.186454772949)
					levelquest = 2250
				elseif MyLevel >= 2300 and MyLevel <= 2349 then
					Ms = "Beast Pirate [Lv. 2300]"
					CFrameQuest = CFrame.new(416.176941, 75.386673, -5425.97754, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
					NameMon = "Beast Pirate"
					CFrameMon = CFrame.new(3341.6398925781, 363.15054321289, -270.224609375)
					levelquest = 2300
				elseif MyLevel >= 2350 and MyLevel <= 2399 then
					Ms = "Snake Man [Lv. 2350]"
					CFrameQuest = CFrame.new(88.140152, 75.3936996, -5321.16357, -0.023422122, 0, -0.99972564, 0, 1, 0, 0.99972564, 0, -0.023422122)
					NameMon = "Snake Man"
					CFrameMon = CFrame.new(2821.0869140625, 228.20420837402, 397.10614013672)
					levelquest = 2350
				elseif MyLevel >= 2400 and MyLevel <= 2449 then
					Ms = "Bandit Beast Pirate [Lv. 2400]"
					CFrameQuest = CFrame.new(-2120.31909, 74.9218903, -4906.35107, -1, 0, 0, 0, 1, 0, 0, 0, -1)
					NameMon = "Bandit Beast Pirate"
					CFrameMon = CFrame.new(2700.8044433594, 262.39566040039, -1133.3333740234)
					levelquest = 2400
				elseif MyLevel >= 2450 and MyLevel <= 2499 then
					Ms = "Powerful Beast Pirate [Lv. 2450]"
					CFrameQuest = CFrame.new(-2754.46362, 75.4548111, -5289.625, 0.57264179, 0, 0.819805682, 0, 1, 0, -0.819805682, 0, 0.57264179)
					NameMon = "Powerful Beast Pirate"
					CFrameMon = CFrame.new(2446.5532226563, 497.23837280273, -650.99859619141)
					levelquest = 2450
				elseif MyLevel >= 2500 and MyLevel <= 2549 then
					Ms = "Violet Samurai [Lv. 2500]"
					CFrameQuest = CFrame.new(-3022.99292, 75.7534866, -4925.86426, 0.901796937, 0, 0.43216005, 0, 1, 0, -0.43216005, 0, 0.901796937)
					NameMon = "Violet Samurai"
					CFrameMon = CFrame.new(2125.0998535156, 193.43463134766, -1028.8310546875)
					levelquest = 2500
				elseif MyLevel >= 2550 and MyLevel <= 2599 then
					Ms = "Rabbit Man [Lv. 2550]"
					CFrameQuest = CFrame.new(-1037.83777, 75.6733093, -1947.10742, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					NameMon = "Rabbit Man"
					CFrameMon = CFrame.new(1638.6165771484, 238.3356628418, -140.75988769531)
					levelquest = 2550
				elseif MyLevel >= 2600 and MyLevel <= 2649 then
					Ms = "Bat Man [Lv. 2600]"
					CFrameQuest = CFrame.new(-2710.16284, 75.4078979, -1561.74146, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					NameMon = "Bat Man"
					CFrameMon = CFrame.new(2427.9096679688, 214.50489807129, -285.6096496582)
					levelquest = 2600
				elseif MyLevel >= 2650 and MyLevel <= 2699 then
					Ms = "Kitsune Samurai [Lv. 2650]"
					CFrameQuest = CFrame.new(-2917.12598, 75.457901, -1452.71692, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					NameMon = "Kitsune Samurai"
					CFrameMon = CFrame.new(1694.7454833984, 279.47674560547, 132.89778137207)
					levelquest = 2650
				elseif MyLevel >= 2700 and MyLevel <= 2749 then
					Ms = "Elite Beast Pirate [Lv. 2700]"
					CFrameQuest = CFrame.new(-1042.13416, 75.4581985, 172.622971, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
					NameMon = "Elite Beast Pirate"
					CFrameMon = CFrame.new(2813.0407714844, 137.29498291016, 1433.4289550781)
					levelquest = 2700
				elseif MyLevel >= 2750 and MyLevel <= 2799 then
					Ms = "Elite Beast Pirate [Lv. 2750]"
					CFrameQuest = CFrame.new(-1051.44336, 75.4359818, -113.772148, -1.1920929e-07, -0, -1.00000012, 0, 1, -0, 1.00000012, 0, -1.1920929e-07)
					NameMon = "Elite Beast Pirate"
					CFrameMon = CFrame.new(2901.4145507813, 189.0565032959, 737.08685302734)
					levelquest = 2750
				elseif MyLevel >= 2800 and MyLevel <= 2849 then
					Ms = "Bear Man [Lv. 2800]"
					CFrameQuest = CFrame.new(-387.776123, 75.4327545, 280.899261, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					NameMon = "Bear Man"
					CFrameMon = CFrame.new(3222.7277832031, 137.29498291016, 1384.826171875)
					levelquest = 2800 
				elseif MyLevel >= 2850 and MyLevel <= 2899 then
					Ms = "Magician [Lv. 2850]"
					CFrameQuest = CFrame.new(-3519.60156, 75.506752, 1201.35449, 1, 0, 0, 0, 1, 0, 0, 0, 1)
					NameMon = "Magician"
					CFrameMon = CFrame.new(1887.2744140625, 145.23045349121, 1004.4313964844)
					levelquest = 2850
				elseif MyLevel >= 2900 and MyLevel <= 2949 then
					Ms = "Pachy Woman [Lv. 2900]"
					CFrameQuest = CFrame.new(-4334.17969, 75.456749, 1914.44507, 0.480083644, -0, -0.877222717, 0, 1, -0, 0.877222717, 0, 0.480083644)
					NameMon = "Pachy Woman"
					CFrameMon = CFrame.new(1615.6518554688, 185.53813171387, 1583.0139160156)
					levelquest = 2900
				elseif MyLevel >= 2950 and MyLevel <= 2999 then
					Ms = "Kappa [Lv. 2950]"
					CFrameQuest = CFrame.new(-1426.53455, 74.8297577, 4112.34961, 0.0880642533, -0, -0.996114731, 0, 1, -0, 0.996114731, 0, 0.0880642533)
					NameMon = "Kappa"
					CFrameMon = CFrame.new(2399.1376953125, 188.26124572754, 2357.2336425781)
					levelquest = 2950
				elseif MyLevel >= 3000 and MyLevel <= 3024 then
					Ms = "Mammoth Man [Lv. 3000]"
					CFrameQuest = CFrame.new(-4276.69336, 74.254776, 4561.5752, 0.996116102, 0, 0.0880491585, 0, 1, 0, -0.0880491585, 0, 0.996116102)
					NameMon = "Mammoth Man"
					CFrameMon = CFrame.new(1988.3930664063, 211.38674926758, 2425.3681640625)
					levelquest = 3000
				elseif MyLevel >= 3025 and MyLevel <= 3074 then
					Ms = "Skull Pirate [Lv. 3050]"
					CFrameQuest = CFrame.new(-3816.54614, 51.3296509, 9891.29688, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
					NameMon = "Skull Pirate"
					CFrameMon = CFrame.new(-1690.8850097656, 159.86395263672, 6873.90234375)
					levelquest = 3025
				elseif MyLevel >= 3075 and MyLevel <= 3099 then
					Ms = "Elite Skeleton [Lv. 3100]"
					CFrameQuest = CFrame.new(-3032.25317, 51.5443535, 9854.83691, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
					NameMon = "Elite Skeleton"
					CFrameMon = CFrame.new(-257.12750244141, 109.84118652344, 7219.068359375)
					levelquest = 3075
				elseif MyLevel >= 3100 and MyLevel <= 3124 then
					Ms = "Desert Thief [Lv.3125]"
					CFrameQuest = CFrame.new(8847.94238, 14.4670143, 1400.72119, -0.322491169, 0, 0.946572542, 0, 1, 0, -0.946572542, 0, -0.322491169)
					NameMon = "Desert Thief"
					CFrameMon = CFrame.new(8331.119140625, 266.55130004883, 1398.7974853516)
					levelquest = 3100
				elseif MyLevel >= 3125 and MyLevel <= 3149 then
					Ms = "Anubis [Lv.3150]"
					CFrameQuest = CFrame.new(9141.8457, 14.469614, 1055.01233, -0.894592047, 0, 0.446883589, 0, 1, 0, -0.446883589, 0, -0.894592047)
					NameMon = "Anubis"
					CFrameMon = CFrame.new(9568.6044921875, 86.315910339355, 1232.5357666016)
					levelquest = 3125
				elseif MyLevel >= 3150  and MyLevel <= 3174 then
					Ms = "Pharaoh [Lv.3175]"
					CFrameQuest = CFrame.new(9554.38672, 14.4762154, 1545.59363, 0.31220305, 0, 0.950015426, 0, 1, 0, -0.950015426, 0, 0.31220305)
					NameMon = "Pharaoh"
					CFrameMon = CFrame.new(9116.03125, 47.920093536377, 1914.4226074219)
					levelquest = 3150
				elseif MyLevel >= 3175 and MyLevel <= 3199 then
					Ms = "Flame User [Lv.3200]"
					CFrameQuest = CFrame.new(9857.44727, 14.7451639, 1684.2052, -0.0956259966, 0, 0.995417356, 0, 1, 0, -0.995417356, 0, -0.0956259966)
					NameMon = "Flame User"
					CFrameMon = CFrame.new(9780.2236328125, 316.51937866211, 1732.7475585938)
					levelquest = 3175
				elseif MyLevel >= 3200 and MyLevel <= 3224 then
					Ms = "Chess Soldier [Lv. 3200]"
					CFrameQuest = CFrame.new(6875, 28.9374027, 7951.53223, -0.992770553, 0, -0.12002904, 0, 1, 0, 0.12002904, 0, -0.992770553)
					NameMon = "Chess Soldier"
					CFrameMon = CFrame.new(6842.9458, 113.897461, 8166.92139, -0.978180647, 0, -0.207756639, 0, 1, 0, 0.207756639, 0, -0.978180647)
					levelquest = 3200
				elseif MyLevel >= 3225 and MyLevel <= 3249 then
					Ms = "Sunken Vessel [Lv.3225]"
					CFrameQuest = CFrame.new(6430.80225, 28.7034626, 7979.43799, -0.896995902, 0, -0.442038745, 0, 1, 0, 0.442038745, 0, -0.896995902)
					NameMon = "Sunken Vessel"
					CFrameMon = CFrame.new(6260.2124, 23.7355881, 8518.10645, -0.135348797, 0, -0.990798056, 0, 1, 0, 0.990798056, 0, -0.135348797)
					levelquest = 3225
				elseif MyLevel >= 3250 then
					Ms = "Biscuit Man [Lv.3250]"
					CFrameQuest = CFrame.new(5789.9624, 202.36792, 9032.56641, 0.256339848, -0, -0.966586709, 0, 1, -0, 0.966586709, 0, 0.256339848)
					NameMon = "Biscuit Man"
					CFrameMon = CFrame.new(6250.66699, 335.045502, 9107.34668, 0.196545959, -0, -0.980494618, 0, 1, -0, 0.980494618, 0, 0.196545959)
					levelquest = 3250
				end
			end
		end
		CheckQuest()


		TOOLS = {}
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				table.insert(TOOLS,v.Name)
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				table.insert(TOOLS,v.Name)
			end
		end


		function attack()
			game:GetService('VirtualUser'):CaptureController()
			game:GetService('VirtualUser'):Button1Down(Vector2.new(9999, 9999))
		end
		function equip()
			pcall(function()
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.Name == setting["SelectWeapon"] then
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
					end
				end
			end)
		end
		function autoskillheehee()
			if  _G.Z == true then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
				game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			end
			if  _G.X == true then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
				game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			end
			if  _G.c == true then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
				game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			end
			if  _G.v == true then
				game:GetService("VirtualInputManager"):SendKeyEvent(true,118,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
				game:GetService("VirtualInputManager"):SendKeyEvent(false,118,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			end
		end
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local VirtualUser = game:GetService('VirtualUser')


		Typeing = 3
		tgls:Slider("Type Farm","", 1,3,3, function(typess)
			Typeing = typess
		end)

		DistanceMob = 6
		tgls:Slider("Distance Mob","",1,30,6,function(dis)
			DistanceMob = dis
		end)
		tgls:Toggle("Auto Farm","",setting["autofarm"],function(vu)
			pcall(function()
				CheckQuest()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
				setting["autofarm"] = vu
				wait()
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
			end)
		end)
		tgls:Toggle("Haki","",true,function(t)
			setting["Haki"] = t
		end)
		tgls:Toggle("Ken-Haki","",true,function(t)
			setting["KenHaki"] = t
		end)
		tgls:Toggle("Auto Bisento","",false,function(value)
			Bisento = value
			CheckBisento()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon1
			game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			wait()
			game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
			wait()
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
		end)
		tgls:Toggle("Auto Anubis Axe","",false,function(value)
			Anubis = value
			game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			wait()
			game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
			wait()
			if Anubis == false then
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
			end
		end)
		tgls:Toggle("Auto Adventure Knife","",false,function(value)
			AdventureKnife = value
			game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			wait()
			game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
			wait()
			if AdventureKnife == false then
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
			end
		end)
		tgls:Toggle("Auto-Enma+Hop","",setting["Enmahop"],function(t)
			setting["Enmahop"] = t
		end)
		tgls:Toggle("Auto Kaido","",setting["Kaido"],function (t)
			setting["Kaido"] = t 
		end)
		tgls:Toggle("Auto-Saber","",setting["Saber"],function(t)
			setting["Saber"] = t
		end)
		tgls:Toggle("Auto-Saber+Hop","",setting["Saberhop"],function(t)
			setting["Saberhop"] = t
		end)
		tgls:Toggle("Auto BigMom","",setting["BigMom"],function (t)
			setting["BigMom"] = t 
		end)
		local rdropdwon = tgls:Dropdown("SelectWeapon",TOOLS,function(t)
			setting["SelectWeapon"] = t
		end)
		tgls:Button("Refresh Weapon","",function()
			rdropdwon:Clear()
			TOOLS = {}
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					rdropdwon:Add(v.Name)
				end
			end
		end)
		tgls:Line()
		tgls:Toggle("AutoSkill Z","",setting["AutoSkill z"],function(t)
			setting["AutoSkill z"] = t
		end)
		tgls:Toggle("AutoSkill x","",setting["AutoSkill x"],function(t)
			setting["AutoSkill x"] = t
		end)
		tgls:Toggle("AutoSkill C","",setting["AutoSkill c"],function(t)
			setting["AutoSkill c"] = t
		end)
		tgls:Toggle("AutoSkill v","",setting["AutoSkill v"],function(t)
			setting["AutoSkill v"] = t
		end)

		stat:Toggle("Defense Stats","",setting["Defense"],function(vu)
			setting["Defense"] = vu
		end)

		stat:Toggle("Melee Stats","",setting["Melle"],function(vu)
			setting["Melle"] = vu
		end)

		stat:Toggle("Sword Stats","",setting["Sword"],function(vu)
			setting["Sword"] = vu
		end)

		stat:Toggle("Power Fruit Stats","",setting["PowerFruit"],function(vu)
			setting["PowerFruit"] = vu
		end)

		PointStats = 1
		stat:Slider("Set Point","",0,20,1,function()
			PointStats = 1
		end)

		if game.PlaceId == 4520749081 then
			TP:Button("Teleport To New Word","",function()
				local ts = game:GetService("TeleportService")
				local p = game:GetService("Players").LocalPlayer
				ts:Teleport(6381829480, p)
			end)

			TP:Line()

			TP:Button("Stone Rain Sea","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6215.9287109375, 424.83047485352, -2068.7109375)
			end)
			TP:Button("Town","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2034.8345947266, 48.167205810547, -1700.8475341797)
			end)
			TP:Button("Shark Island","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3186.3107910156, 10.1405210495, 1423.6528320313)
			end)
			TP:Button("Snow Island","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1106.1993408203, 44.459392547607, 1718.8492431641)
			end)
			TP:Button("Skyland","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(238.40699768066, 402.76065063477, 4078.0029296875)
			end)
			TP:Button("Pirate Island","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3955.0932617188, 78.229362487793, -610.56951904297)
			end)
			TP:Button("Zombie Island","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(497.46853637695, 226.77265930176, 6345.2255859375)
			end)
			TP:Button("Bubbleland","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5637.09375, 11.105633735657, 3491.439453125)
			end)
			TP:Button("War Island","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6480.3989257813, 49.628967285156, 1107.9337158203)
			end)
			TP:Button("Stone Arena","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9529.345703125, 37.819095611572, -3857.7934570313)
			end)
			TP:Button("Desert Island","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1522.4660644531, 12.909970283508, 2000.4206542969)
			end)
			TP:Button("Fishland","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2868.650390625, 40.266338348389, 9136.1875)
			end)
			TP:Button("Soldier Town","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2033.8972167969, 39.360450744629, 206.95614624023)
			end)
			TP:Button("Lobby Island","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2914.1423339844, 13.044984817505, 4247.37890625)
			end)
			TP:Button("Chef Ship","",function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-100.2366027832, 49.805450439453, 86.103416442871)
			end)
		end
		if game.PlaceId == 6381829480 then

			TP:Button("Dock","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3707.8854980469, 56.696941375732, 219.93495178223)
			end)
			TP:Button("Viridans","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2243.5974121094, 58.433891296387, 2271.3725585938)
			end)
			TP:Button("Skull Island","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(122.43953704834, 261.84866333008, 7684.0473632813)
			end)
			TP:Button("Dead Tundra","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9244.3212890625, 106.59592437744, 1467.6929931641)
			end)
			TP:Button("Torrefacio","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1730.4539794922, 56.374805450439, 1269.7200927734)
			end)
			TP:Button("Skull Island","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1211.4458007813, 229.15634155273, 6133.8676757813)
			end)
			TP:Button("Hibernus Land","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2464.9543457031, 134.92204284668, -951.77880859375)
			end)
			TP:Button("Skull Island","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1211.4450683594, 50.551124572754, 7684.0463867188)
			end)
			TP:Button("Carcer","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3126.4921875, 213.45323181152, 1269.3514404297)
			end)
			TP:Button("Skull isLand","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3453.7497558594, 51.437110900879, 10329.479492188)
			end)
			TP:Button("Skull isLand","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(109.29490661621, 232.21307373047, 6164.7646484375)
			end)
			TP:Button("Loaf Island","",function()
				game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5510.9887695313, 266.36245727539, 8698.9052734375)
			end)		
		end 


		PY:Toggle("Kill Player","",false,function(bool)
			KillPlayer = bool
		end)
		spawn(function()
			while wait() do
				if 	KillPlayer then
					pcall(function()
						equip5()
						if KillPlayer == false then
							game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
						end
						while KillPlayer do wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.CFrame * CFrame.new(0,0,7)
							autoskillheehee()
							wait(2)
							attack5()
							game.Players:FindFirstChild(SelectedKillPlayer).Character.HumanoidRootPart.Size = Vector3.new(5,5,5)
							game:GetService'VirtualUser':CaptureController()
							game:GetService'VirtualUser':B1Down(Vector2.new(1280, 672))
						end
					end)
				end
			end
		end)


		function attack5()
			game:GetService('VirtualUser'):CaptureController()
			game:GetService('VirtualUser'):B1Down(Vector2.new(9999, 9999))
		end
		local TOOLS = {}
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				table.insert(TOOLS,v.Name)
			end
		end

		local rdropdwon = PY:Dropdown("SelectWeapon",TOOLS,function(t)
			_G.SelectWeapon5 = t
		end)

		PY:Button("Refresh Weapon","",function()
			rdropdwon:Clear()
			TOOLS = {}
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					rdropdwon:Add(v.Name)
				end
			end
		end)

		function equip5()
			pcall(function()
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.Name == _G.SelectWeapon5 then
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
					end
				end
			end)
		end

		game:GetService("RunService").Heartbeat:Connect(
		function()
			if KillPlayer then
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)

		function isnil(thing)
			return (thing == nil)
		end
		local function round(n)
			return math.floor(tonumber(n) + 0.5)
		end
		Number = math.random(1, 1000000)
		function UpdatePlayerChaMonster()
			for i,v in pairs(game:GetService'Players':GetChildren()) do
				pcall(function()
					if not isnil(v.Character) then
						if ESPPlayer then
							if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
								local bill = Instance.new('BillboardGui',v.Character.Head)
								bill.Name = 'NameEsp'..Number
								bill.ExtentsOffset = Vector3.new(0, 1, 0)
								bill.Size = UDim2.new(1,200,1,30)
								bill.Adornee = v.Character.Head
								bill.AlwaysOnTop = true
								local name = Instance.new('TextLabel',bill)
								name.Font = "GothamBold"
								name.FontSize = "Size14"
								name.TextWrapped = true
								name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
								name.Size = UDim2.new(1,0,1,0)
								name.TextYAlignment = 'Top'
								name.BackgroundTransparency = 1
								name.TextStrokeTransparency = 0.5
								if v.Team == game.Players.LocalPlayer.Team then
									name.TextColor3 = Color3.new(255,0,0)
								else
									name.TextColor3 = Color3.new(0,0,255)
								end
							else
								v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
							end
						else
							if v.Character.Head:FindFirstChild('NameEsp'..Number) then
								v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
							end
						end
					end
				end)
			end
		end
		function UpdateDevilChaMonster() 
			for i,v in pairs(game.Workspace:GetChildren()) do
				pcall(function()
					if DevilFruitESP then
						if string.find(v.Name, "Fruit") then   
							if not v.Handle:FindFirstChild('NameEsp'..Number) then
								local bill = Instance.new('BillboardGui',v.Handle)
								bill.Name = 'NameEsp'..Number
								bill.ExtentsOffset = Vector3.new(0, 1, 0)
								bill.Size = UDim2.new(1,200,1,30)
								bill.Adornee = v.Handle
								bill.AlwaysOnTop = true
								local name = Instance.new('TextLabel',bill)
								name.Font = "GothamBold"
								name.FontSize = "Size14"
								name.TextWrapped = true
								name.Size = UDim2.new(1,0,1,0)
								name.TextYAlignment = 'Top'
								name.BackgroundTransparency = 1
								name.TextStrokeTransparency = 0.5
								name.TextColor3 = Color3.fromRGB(255, 0, 0)
								name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
							else
								v.Handle['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
							end
						end
					else
						if v.Handle:FindFirstChild('NameEsp'..Number) then
							v.Handle:FindFirstChild('NameEsp'..Number):Destroy()
						end
					end
				end)
			end
		end

		PY:Toggle("ESP Player","",false,function(a)
			ESPPlayer = a
			while ESPPlayer do wait()
				UpdatePlayerChaMonster()
			end
		end)

		PlayerName = {}
		for i,v in pairs(game.Players:GetChildren()) do  
			table.insert(PlayerName ,v.Name)
		end



		SelectedKillPlayer = ""
		PY:Dropdown("Selected Player",PlayerName,function(plys) --true/false, replaces the current title "D" with the option that t
			SelectedKillPlayer = plys
			SelectedPly:Refresh("Selected Player : "..SelectedKillPlayer)
		end)

		PY:Toggle("Spectate Player","",false,function(bool)
			Sp = bool
			local plr1 = game.Players.LocalPlayer.Character.Humanoid
			local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
			repeat wait(.1)
				game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
			until Sp == false 
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		end)

		PY:Button("Refrsh Player","",function()
			PlayerName = {}
			PY:Clear()
			for i,v in pairs(game.Players:GetChildren()) do  
				PY:Add(v.Name)
			end
		end)
		game:GetService("RunService").Heartbeat:Connect(
		function()
			if KillPlayer then
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)

		PY:Button("Teleport Player","",function()
			local plr1 = game.Players.LocalPlayer.Character
			local plr2 = game.Players:FindFirstChild(SelectedKillPlayer)
			plr1.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame
		end)
		Mis:Toggle("Bring All Fruit","",false,function(t)
			TPF = t
			while wait() do
				if TPF then
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v:IsA ("Tool") then
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
						end
					end
				end
			end
		end)
		Mis:Toggle("Noclip","",false, function(t)
			_G.Noclip = t
			local RunService = game:GetService("RunService")

			while RunService.RenderStepped:wait() do
				if _G.Noclip then
					game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				end
			end
		end)
		Mis:Toggle("Inf Geppo","",false,function(value)

			if value == true then
				game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value = 1000000000000000000
			elseif value == false then
				game.Players.LocalPlayer.Backpack.GeppoNew.cds.Value = 6
			end

		end)
		Mis:Toggle("Ctrl + Click = TP","",false,function(vu)
			CTRL = vu
		end)
		local Plr = game:GetService("Players").LocalPlayer
		local Mouse = Plr:GetMouse()
		Mouse.Button1Down:connect(
			function()
				if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
					return
				end
				if not Mouse.Target then
					return
				end
				if CTRL then
					Plr.Character:MoveTo(Mouse.Hit.p)
				end
			end
		)

		Fly = false  
		function activatefly()
			local mouse=game.Players.LocalPlayer:GetMouse''
			localplayer=game.Players.LocalPlayer
			game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
			local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
			local speedSET=25
			local keys={a=false,d=false,w=false,s=false}
			local e1
			local e2
			local function start()
				local pos = Instance.new("BodyPosition",torso)
				local gyro = Instance.new("BodyGyro",torso)
				pos.Name="EPIXPOS"
				pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				pos.position = torso.Position
				gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				gyro.cframe = torso.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand=true
					local new=gyro.cframe - gyro.cframe.p + pos.position
					if not keys.w and not keys.s and not keys.a and not keys.d then
						speed=1
					end
					if keys.w then
						new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
						speed=speed+speedSET
					end
					if keys.s then
						new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
						speed=speed+speedSET
					end
					if keys.d then
						new = new * CFrame.new(speed,0,0)
						speed=speed+speedSET
					end
					if keys.a then
						new = new * CFrame.new(-speed,0,0)
						speed=speed+speedSET
					end
					if speed>speedSET then
						speed=speedSET
					end
					pos.position=new.p
					if keys.w then
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
					elseif keys.s then
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
					else
						gyro.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until not Fly
				if gyro then 
					gyro:Destroy() 
				end
				if pos then 
					pos:Destroy() 
				end
				flying=false
				localplayer.Character.Humanoid.PlatformStand=false
				speed=0
			end
			e1=mouse.KeyDown:connect(function(key)
				if not torso or not torso.Parent then 
					flying=false e1:disconnect() e2:disconnect() return 
				end
				if key=="w" then
					keys.w=true
				elseif key=="s" then
					keys.s=true
				elseif key=="a" then
					keys.a=true
				elseif key=="d" then
					keys.d=true
				end
			end)
			e2=mouse.KeyUp:connect(function(key)
				if key=="w" then
					keys.w=false
				elseif key=="s" then
					keys.s=false
				elseif key=="a" then
					keys.a=false
				elseif key=="d" then
					keys.d=false
				end
			end)
			start()
		end
		Mis:Toggle("Fly","",false,function(Value)
			Fly = Value
			activatefly()
		end)

		Mis:Slider("Walkspeed","",16,2000,0,function(value)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
		end)
		Mis:Slider("JumpPower","",50,2000,0,function(value)
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
		end) 
		Mis:Toggle("ESP Devil Fruit","",false,function(a)
			DevilFruitESP = a
			while DevilFruitESP do wait()
				UpdateDevilChaMonster() 
			end
		end)

		Mis:Toggle("Invisible","",false,function(t)
			_G.Invisible = t
		end)

		spawn(function()
			while wait(1) do
				if _G.Invisible then
					pcall(function()
						game.Players.LocalPlayer.Character.LowerTorso:Destroy()
					end)
				end
			end
		end)

		Mis:Toggle("Water No Damage","",false,function(l)
			_G.a = l
			while _G.a  do
				wait(2)
				local a = nil
				a = hookfunction(getrawmetatable(game).__namecall,newcclosure(function(self,...)
					local args = {...}
					if self.Name == "RemoteEvent" and args[1] == "in" then
						return nil
					end
					return a(self,...)
				end))
			end
		end)


		Mis:Line()

		Mis:Button("spawn Coffin Boat","",function(value)
			local args = {
				[1] = "CoffinBoat",
				[2] = "ShipA"
			}

			game:GetService("ReplicatedStorage").Remotes.Events.Ship:FireServer(unpack(args))
		end)

		Mis:Button("No Geppo Cooldown ","",function()

			local a;

			a = hookfunc(getrenv().wait, function(x)
				if tostring(getfenv(2).script) == "GeppoNew" then
					return game:GetService("RunService").RenderStepped:wait()
				end
				return a(x)
			end)

		end)

		Mis:Button("No Dodge Cooldown ","",function()

			local a;

			a = hookfunc(getrenv().wait, function(x)
				if tostring(getfenv(2).script) == "Dash" then
					return game:GetService("RunService").RenderStepped:wait()
				end
				return a(x)
			end)

		end)



		--------------FPS Boost--------------
		Mis:Button("FPS Boost","",function()
			local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
			local g = game
			local w = g.Workspace
			local l = g.Lighting
			local t = w.Terrain
			t.WaterWaveSize = 0
			t.WaterWaveSpeed = 0
			t.WaterReflectance = 0
			t.WaterTransparency = 0
			l.GlobalShadows = false
			l.FogEnd = 9e9
			l.Brightness = 0
			settings().Rendering.QualityLevel = "Level01"
			for i, v in pairs(g:GetDescendants()) do
				if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
					v.Material = "Plastic"
					v.Reflectance = 0
				elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
					v.Transparency = 1
				elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
					v.Lifetime = NumberRange.new(0)
				elseif v:IsA("Explosion") then
					v.BlastPressure = 1
					v.BlastRadius = 1
				elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
					v.Enabled = false
				elseif v:IsA("MeshPart") then
					v.Material = "Plastic"
					v.Reflectance = 0
					v.TextureID = 10385902758728957
				end
			end
			for i, e in pairs(l:GetChildren()) do
				if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
					e.Enabled = false
				end
			end
		end)
		Mis:Button("Redeem ALL Code","",function ()
			-- Script generated by TurtleSpy, made by Intrer#0421

			game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer("600KFAV")
			game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer("700KFAV")
			game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer("800KFAV")
			game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer("900KFAV")
			game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer("DinoxLive")
			game:GetService("ReplicatedStorage").Remotes.Functions.redeemcode:InvokeServer("Peodiz")
		end)


		spawn(function()
			while wait(.1) do
				if BuyFruitSinper then
					local args = {
						[1] = SelectDevil,
						[2] = true
					}

					game:GetService("ReplicatedStorage").Remotes.Functions.dfbeli:InvokeServer(unpack(args))
				end
			end
		end)

		king:Toggle("Auto-SeaKing","",setting["SeaKinghop"],function(t)
			setting["SeaKinghop"] = t
		end)
		king:Toggle("ServerHop-SeaKing","",setting["SeaKinghop"],function(t)
			setting["SeaKinghop"] = t
		end)

		SelectDevil = ""
		Df:Dropdown(
			"Devil Fruit Sniper",
			{
				"BuddhaBuddha",
				"DarkDark",
				"DoughDough",
				"DragonDragon",
				"FlameFlame",
				"GasGas",
				"GravityGravity",
				"IceIce",
				"GumGum",
				"LightLight",
				"MagmaMagma",
				"OpOp",
				"PawPaw",
				"Phoenix",
				"QuakeQuake",
				"RumbleRumble",
				"SandSand",
				"ShadowShadow",
				"StringString",
				"VenomVenom",
				"SnowSnow"
			},function(ply)
				SelectDevil = ply
			end)

		Df:Toggle("Devil Fruit Sinper","",false,function(Value)
			BuyFruitSinper = Value
		end)
		Wapon = {}
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				table.insert(Wapon ,v.Name)
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				table.insert(Wapon, v.Name)
			end
		end

		Raids:Toggle("Auto Raids","",false,function(b)
			_G.Auto_Raid = b
		end)
		Raids:Toggle("Auto SkillZ","",false,function(b)
			_G.KillZ = b
		end)
		Raids:Toggle("Auto SkillX","",false,function(b)
			_G.KillX = b
		end)
		Raids:Toggle("Auto SkillC","",false,function(b)
			_G.KillC = b
		end)
		Raids:Toggle("Auto SkillV","",false,function(b)
			_G.KillV = b
		end)
		local Hee = Raids:Dropdown("Select Weapon",Wapon,function(Value)
			Select_Wapon_Raid1 = Value
		end)
		local Hee1 = Raids:Dropdown("Select Weapon",Wapon,function(Value)
			Select_Wapon_Raid2 = Value
		end)
		local Hee2 = Raids:Dropdown("Select Weapon",Wapon,function(Value)
			Select_Wapon_Raid3 = Value
		end)
		Raids:Button("Refresh Weapon","", function()
			Hee:Clear()
			Hee1:Clear()
			Hee2:Clear()
			Wapon = {}
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					pcall(function()
						Hee:Add(v.Name)
						Hee1:Add(v.Name)
						Hee2:Add(v.Name)
					end)
				end
			end
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Tool") then
					pcall(function()
						Hee:Add(v.Name)
						Hee1:Add(v.Name)
						Hee2:Add(v.Name)
					end)
				end
			end
		end)

		function EquipWeapon(ToolSe)
			if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
				getgenv().tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
				wait()
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
			end
		end

		Raids:Toggle("Weapon Use","",false,function(t)
			_G.Equip_Wapon = t
		end)


		sv:Toggle("Save Setting","",setting["Save"],function(t)
			setting["Save"] = t
		end)
		spawn(function()
			while wait(1) do
				if setting["Save"] then
					Setting:save(setting)
				end
			end
		end)
		sv:Slider("lower server","",0,13,3,function(t)
			_G.ply = t
		end)
		sv:Button("Teleprot To Lower Server","",function()
			local PlaceID = game.PlaceId
			local AllIDs = {}
			local foundAnything = ""
			local actualHour = os.date("!*t").hour
			local Deleted = false
			local numberctr = 0
			function TPReturner()
				local Site;
				if foundAnything == "" then
					Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
				else
					Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
				end
				local ID = ""
				if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
					foundAnything = Site.nextPageCursor
				end
				local num = 0;
				for i,v in pairs(Site.data) do
					local Possible = true
					ID = tostring(v.id)
					numberctr = numberctr+1
					if tonumber(v.playing) == _G.ply or tonumber(v.playing) - tonumber(_G.ply) < 0 then
						rconsoleclear()
						for _,Existing in pairs(AllIDs) do
							if num ~= 0 then
								if ID == tostring(Existing) then
									Possible = false
								end
							else
								if tonumber(actualHour) ~= tonumber(Existing) then
									local delFile = pcall(function()
										AllIDs = {}
										table.insert(AllIDs, actualHour)
									end)
								end
							end
							num = num + 1
						end
						if Possible == true then
							table.insert(AllIDs, ID)
							wait()
							pcall(function()
								wait()
								game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
							end)
						end
					end
				end
			end
			function Teleport()
				while wait() do
					pcall(function()
						TPReturner()
						if foundAnything ~= "" then
							TPReturner()
						end
					end)
				end
			end
			Teleport()
		end) 
		sv:Button("Rejoin","",function()
			local ts = game:GetService("TeleportService")
			local p = game:GetService("Players").LocalPlayer
			ts:Teleport(game.PlaceId, p)
		end)


		sv:Button("Server Hop","",function()
			local PlaceID = game.PlaceId
			local AllIDs = {}
			local foundAnything = ""
			local actualHour = os.date("!*t").hour
			local Deleted = false
			function TPReturner()
				local Site;
				if foundAnything == "" then
					Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
				else
					Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
				end
				local ID = ""
				if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
					foundAnything = Site.nextPageCursor
				end
				local num = 0;
				for i,v in pairs(Site.data) do
					local Possible = true
					ID = tostring(v.id)
					if tonumber(v.maxPlayers) > tonumber(v.playing) then
						for _,Existing in pairs(AllIDs) do
							if num ~= 0 then
								if ID == tostring(Existing) then
									Possible = false
								end
							else
								if tonumber(actualHour) ~= tonumber(Existing) then
									local delFile = pcall(function()
										-- delfile("NotSameServers.json")
										AllIDs = {}
										table.insert(AllIDs, actualHour)
									end)
								end
							end
							num = num + 1
						end
						if Possible == true then
							table.insert(AllIDs, ID)
							wait()
							pcall(function()
								-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
								wait()
								game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
							end)
							wait(4)
						end
					end
				end
			end
			function Teleport() 
				while wait() do
					pcall(function()
						TPReturner()
						if foundAnything ~= "" then
							TPReturner()
						end
					end)
				end
			end
			Teleport()
		end)



		spawn(function()
			while true do
				UpdateTimePoint()
				game:GetService("RunService").RenderStepped:Wait()
			end
		end)

		spawn(function()
			game:GetService('RunService').Stepped:connect(function()
				if setting["autofarm"] == true or Bisento  == true or Anubis == true or AdventureKnife == true then
					pcall(function ()
						if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
							game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
						end
					end)
				end
			end)
		end)
		spawn(function()
			while wait() do
				if setting["autofarm"] == true then
					if game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false then
						pcall(function()
							CheckQuest()
							if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl"..levelquest) then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage").MAP["QuestLvl"..levelquest].HumanoidRootPart.CFrame
							else 
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AntiTPNPC["QuestLvl"..levelquest].HumanoidRootPart.CFrame
							end

							game:GetService'VirtualUser':Button1Down(Vector2.new(0.9,0.9))
							game:GetService'VirtualUser':Button1Up(Vector2.new(0.9,0.9))
							wait()
							for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
								if v.Name == "Dialogue" then
									v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
									v.Accept.Position = UDim2.new(-2, 0, -5, 0)
									v.Accept.ImageTransparency = 1
								end
							end
						end)
					elseif game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == true then
						CheckQuest()
						if game:GetService("Workspace").Monster:GetDescendants(Ms) then
							pcall(function()
								equip()
								for i, v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
									CheckQuest()
									if v.Name == Ms then
										repeat wait()
											if v.Humanoid.Health > 0 then
												VirtualUser:CaptureController()
												VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
												if Typeing == 2 then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0,DistanceMob,0)
												elseif Typeing == 3 then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0,0,DistanceMob)
												elseif Typeing == 1 then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,DistanceMob)
												end
												game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 1
											else
												CheckQuest()
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
											end
										until v.Humanoid.Health <= 0 or setting["autofarm"] == false
									end
								end
							end
							)
						else
						end
					end
				end
			end
		end)
		spawn(function()
			while wait(.1) do
				if setting["autofarm"] == true or Bisento  == true or Anubis == true or AdventureKnife == true then
					pcall(function()
						autoskillheehee()
						wait(.1)
						EquipWeapon(setting["SelectWeapon"])
					end)
				end
			end
		end)

		spawn(function()
			while wait(1) do
				if setting["Haki"] then
					pcall(function()
						if game.Players.LocalPlayer.Character.Haki.Value == 0 then
							game.Players.LocalPlayer.Character.Haki.Value = 1
							game:GetService("Players").LocalPlayer.Character.Services.Client.Armament:FireServer()
						end
					end)
				end
			end
		end)
		spawn(function()
			while wait(1) do
				if setting["KenHaki"] then
					pcall(function()
						if game.Players.LocalPlayer.Character.KenHaki.Value == 0 then
							local args = {
								[1] = true
							}
							game:GetService("Players").LocalPlayer.Character.Services.Client.KenEvent:InvokeServer(unpack(args))
						end
					end)
				end
			end
		end)

		spawn(function()
			while wait() do
				if Bisento then
					if Bisento then
						pcall(function()
							if game:GetService("Workspace").Monster.Mon:FindFirstChild("Quake Woman [Lv. 1925]") or game:GetService("Workspace").Monster.Boss:FindFirstChild("Quake Woman [Lv. 1925]") then
								pcall(function()
									for i, v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
										if v.Name == "Quake Woman [Lv. 1925]" then
											repeat wait()
												if v.Humanoid.Health > 0 then
													game:GetService("VirtualInputManager"):SendKeyEvent(true,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
													VirtualUser:CaptureController()
													VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
													if Typeing == 2 then
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0,DistanceMob,0)
													elseif Typeing == 3 then
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0,0,DistanceMob)
													elseif Typeing == 1 then
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,DistanceMob)
													end
													game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 1
												else
													game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
													CheckQuest()
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6385.01953125, 224.50552368164, 967.78912353516)
												end
											until v.Humanoid.Health <= 0 or Bisento == false
											game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
										end
									end
								end)
							else
								game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
								CheckQuest()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
							end
						end)
					end
				end
			end
		end)


		spawn(function()
			while wait() do
				if Anubis then
					if Anubis then
						pcall(function()
							if game:GetService("Workspace").Monster.Mon:FindFirstChild("Anubis [Lv.3150]") or game:GetService("Workspace").Monster.Boss:FindFirstChild("Anubis [Lv.3150]") then
								pcall(function()
									for i, v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
										if v.Name == "Anubis [Lv.3150]" then
											repeat wait()
												if v.Humanoid.Health > 0 then
													game:GetService("VirtualInputManager"):SendKeyEvent(true,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
													VirtualUser:CaptureController()
													VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
													if Typeing == 2 then
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0,DistanceMob,0)
													elseif Typeing == 3 then
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0,0,DistanceMob)
													elseif Typeing == 1 then
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,DistanceMob)
													end
													game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 1
												else
													game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
													CheckQuest()
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9598.8447265625, 192.14181518555, 1099.2034912109)
												end
											until v.Humanoid.Health <= 0 or Anubis == false
											game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
										end
									end
								end)
							else
								game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
								wait()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9598.8447265625, 192.14181518555, 1099.2034912109)
							end
						end)
					end
				end
			end
		end)


		spawn(function()
			while wait() do
				if AdventureKnife then
					pcall(function()
						CheckKnife()
						if game:GetService("Workspace").Monster.Mon:FindFirstChild("Flame User [Lv.3200]") or game:GetService("Workspace").Monster.Boss:FindFirstChild("Flame User [Lv.3200]") then
							pcall(function()
								for i, v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
									CheckKnife()
									if v.Name == "Flame User [Lv.3200]" then
										repeat wait()
											if v.Humanoid.Health > 0 then
												game:GetService("VirtualInputManager"):SendKeyEvent(true,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
												VirtualUser:CaptureController()
												VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
												if Typeing == 2 then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0,DistanceMob,0)
												elseif Typeing == 3 then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0,0,DistanceMob)
												elseif Typeing == 1 then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,DistanceMob)
												end
												game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 1
											else
												game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
												CheckQuest()
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9987.5673828125, 142.76252746582, 1872.84765625)
											end
										until v.Humanoid.Health <= 0 or AdventureKnife == false
										game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
									end
								end
							end)
						else
							game:GetService("VirtualInputManager"):SendKeyEvent(false,119,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							CheckQuest()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
						end
					end)
				end
			end
		end) 

		spawn(function()
			while wait() do 
				if setting["Enmahop"]  then 
					pcall(function()
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "King Samurai [Lv. 3500]" then
								if not v:FindFirstChild("Humanoid") or v.Humanoid.Health == 0 then
									local PlaceID = game.PlaceId
									local AllIDs = {}
									local foundAnything = ""
									local actualHour = os.date("!*t").hour
									local Deleted = false
									function TPReturner()
										local Site;
										if foundAnything == "" then
											Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
										else
											Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
										end
										local ID = ""
										if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
											foundAnything = Site.nextPageCursor
										end
										local num = 0;
										for i,v in pairs(Site.data) do
											local Possible = true
											ID = tostring(v.id)
											if tonumber(v.maxPlayers) > tonumber(v.playing) then
												for _,Existing in pairs(AllIDs) do
													if num ~= 0 then
														if ID == tostring(Existing) then
															Possible = false
														end
													else
														if tonumber(actualHour) ~= tonumber(Existing) then
															local delFile = pcall(function()
																-- delfile("NotSameServers.json")
																AllIDs = {}
																table.insert(AllIDs, actualHour)
															end)
														end
													end
													num = num + 1
												end
												if Possible == true then
													table.insert(AllIDs, ID)
													wait()
													pcall(function()
														-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
														wait()
														game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
													end)
													wait(4)
												end
											end
										end
									end
									function Teleport() 
										while wait() do
											pcall(function()
												TPReturner()
												if foundAnything ~= "" then
													TPReturner()
												end
											end)
										end
									end
									Teleport()
								end
							end
						end
					end)
				end
			end
		end)

		spawn(function()
			while wait() do 
				if setting["Enmahop"]  then 
					pcall(function()
						if game:GetService("Workspace").Monster.Boss:FindFirstChild("King Samurai [Lv. 3500]") then
							for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if v.Name == "King Samurai [Lv. 3500]" then
									if v.Humanoid.Health ~= 0 or v:FindFirstChild("Humanoid") then
										repeat wait()
											pcall(function()
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,dis,0) * CFrame.Angles(math.rad(-90), 0, 0)
												EquipWeapon(game:GetService("Players").LocalPlayer.PlayerStats.SwordName.Value)
												autoskillheehee()
												wait(.1)
												attack()
											end)
										until _G.Enmahop  == false or v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid")
									else
										game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1399.4310302734, 352.84494018555, 148.5901184082)
										wait(1)
										if not game:GetService("Workspace").Monster.Boss:FindFirstChild("King Samurai [Lv. 3500]") or not v:FindFirstChild("Humanoid") then
											local PlaceID = game.PlaceId
											local AllIDs = {}
											local foundAnything = ""
											local actualHour = os.date("!*t").hour
											local Deleted = false
											function TPReturner()
												local Site;
												if foundAnything == "" then
													Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
												else
													Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
												end
												local ID = ""
												if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
													foundAnything = Site.nextPageCursor
												end
												local num = 0;
												for i,v in pairs(Site.data) do
													local Possible = true
													ID = tostring(v.id)
													if tonumber(v.maxPlayers) > tonumber(v.playing) then
														for _,Existing in pairs(AllIDs) do
															if num ~= 0 then
																if ID == tostring(Existing) then
																	Possible = false
																end
															else
																if tonumber(actualHour) ~= tonumber(Existing) then
																	local delFile = pcall(function()
																		-- delfile("NotSameServers.json")
																		AllIDs = {}
																		table.insert(AllIDs, actualHour)
																	end)
																end
															end
															num = num + 1
														end
														if Possible == true then
															table.insert(AllIDs, ID)
															wait()
															pcall(function()
																-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
																wait()
																game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
															end)
															wait(4)
														end
													end
												end
											end
											function Teleport() 
												while wait() do
													pcall(function()
														TPReturner()
														if foundAnything ~= "" then
															TPReturner()
														end
													end)
												end
											end
											Teleport()
										end
									end
								end
							end
						else
							game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1399.4310302734, 352.84494018555, 148.5901184082)
							wait(1)
							if not game:GetService("Workspace").Monster.Boss:FindFirstChild("Expert Swordman [Lv. 3000]") then
								local PlaceID = game.PlaceId
								local AllIDs = {}
								local foundAnything = ""
								local actualHour = os.date("!*t").hour
								local Deleted = false
								function TPReturner()
									local Site;
									if foundAnything == "" then
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
									else
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
									end
									local ID = ""
									if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
										foundAnything = Site.nextPageCursor
									end
									local num = 0;
									for i,v in pairs(Site.data) do
										local Possible = true
										ID = tostring(v.id)
										if tonumber(v.maxPlayers) > tonumber(v.playing) then
											for _,Existing in pairs(AllIDs) do
												if num ~= 0 then
													if ID == tostring(Existing) then
														Possible = false
													end
												else
													if tonumber(actualHour) ~= tonumber(Existing) then
														local delFile = pcall(function()
															-- delfile("NotSameServers.json")
															AllIDs = {}
															table.insert(AllIDs, actualHour)
														end)
													end
												end
												num = num + 1
											end
											if Possible == true then
												table.insert(AllIDs, ID)
												wait()
												pcall(function()
													-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
													wait()
													game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
												end)
												wait(4)
											end
										end
									end
								end
								function Teleport() 
									while wait() do
										pcall(function()
											TPReturner()
											if foundAnything ~= "" then
												TPReturner()
											end
										end)
									end
								end
								Teleport()
							end
						end
					end)
				end
			end
		end)
		game:GetService("RunService").RenderStepped:Connect(function()
			if setting["Enmahop"] then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)


		spawn(function()
			while wait() do
				if setting["Kaido"] then
					pcall(function()
						if game.Players.LocalPlayer.Backpack:FindFirstChild("DragonGem") or game.Players.LocalPlayer.Character:FindFirstChild("DragonGem") then
							Message("Found DragonGem", Color3.new(0, 62, 255))
							farmkaido = false
							EquipWeapon("DragonGem")
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island.SummonAltar.Handle.CFrame * CFrame.new(0,-1,1)
						elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Dragon [Lv. 5000]") then
							farmkaido = false
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(64.137672424316, 365.87872314453, 7062.8930664063)
							for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if v.Name == "Dragon [Lv. 5000]" and v.Humanoid.Health > 0 then
									repeat wait()
										equip()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,11,0) * CFrame.Angles(math.rad(-90), 0, 0)
										game:GetService('VirtualUser'):CaptureController()
										game:GetService('VirtualUser'):Button1Down(Vector2.new(9999, 9999))
									until setting["Kaido"] == false or v.Humanoid.Health <= 0
								end
							end
						elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Elite Skeleton [Lv. 3100]") then
							farmkaido = true
						else
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-509.65982055664, 51.461029052734, 7220.4858398438)
						end
					end)    
				end
			end
		end)


		spawn(function()
			while wait() do
				if farmkaido and setting["Kaido"] then
					pcall(function()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-218.41452026367, 110.75109100342, 7230.5571289063)
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Elite Skeleton [Lv. 3100]" and v.Humanoid.Health > 0 then
								repeat wait()
									equip()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,11,0) * CFrame.Angles(math.rad(-90), 0, 0)
									game:GetService('VirtualUser'):CaptureController()
									game:GetService('VirtualUser'):Button1Down(Vector2.new(9999, 9999))
								until setting["Kaido"] == false or v.Humanoid.Health <= 0
							end
						end
					end)
				end
			end
		end)

		spawn(function()
			while wait() do
				if setting["Saber"] then
					pcall(function()
						if game:GetService("Workspace").Monster.Boss:FindFirstChild("Expert Swordman [Lv. 3000]") or game:GetService("ReplicatedStorage").MOB:FindFirstChild("Expert Swordman [Lv. 3000]") then
							for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if v.Name == "Expert Swordman [Lv. 3000]" and v.Humanoid.Health > 0 then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,8,0)
								end
							end
						end
					end)
				end
			end
		end)

		spawn(function()
			while wait() do 
				if setting["Saberhop"] then 
					pcall(function()
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Expert Swordman [Lv. 3000]" then
								if not v:FindFirstChild("Humanoid") or v.Humanoid.Health == 0 then
									local PlaceID = game.PlaceId
									local AllIDs = {}
									local foundAnything = ""
									local actualHour = os.date("!*t").hour
									local Deleted = false
									function TPReturner()
										local Site;
										if foundAnything == "" then
											Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
										else
											Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
										end
										local ID = ""
										if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
											foundAnything = Site.nextPageCursor
										end
										local num = 0;
										for i,v in pairs(Site.data) do
											local Possible = true
											ID = tostring(v.id)
											if tonumber(v.maxPlayers) > tonumber(v.playing) then
												for _,Existing in pairs(AllIDs) do
													if num ~= 0 then
														if ID == tostring(Existing) then
															Possible = false
														end
													else
														if tonumber(actualHour) ~= tonumber(Existing) then
															local delFile = pcall(function()
																-- delfile("NotSameServers.json")
																AllIDs = {}
																table.insert(AllIDs, actualHour)
															end)
														end
													end
													num = num + 1
												end
												if Possible == true then
													table.insert(AllIDs, ID)
													wait()
													pcall(function()
														-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
														wait()
														game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
													end)
													wait(4)
												end
											end
										end
									end
									function Teleport() 
										while wait() do
											pcall(function()
												TPReturner()
												if foundAnything ~= "" then
													TPReturner()
												end
											end)
										end
									end
									Teleport()
								end
							end
						end
					end)
				end
			end
		end)

		spawn(function()
			while wait() do 
				if setting["Saberhop"] then 
					pcall(function()
						if game:GetService("Workspace").Monster.Boss:FindFirstChild("Expert Swordman [Lv. 3000]") then
							for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if v.Name == "Expert Swordman [Lv. 3000]" then
									if v.Humanoid.Health ~= 0 or v:FindFirstChild("Humanoid") then
										repeat wait()
											pcall(function()
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,8,0) * CFrame.Angles(math.rad(-90), 0, 0)
												equip()
												autoskillheehee()
												wait(.1)
												attack()
											end)
										until setting["Saberhop"] == false or v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid")
									else
										game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9725.2412109375, 36.836204528809, -3905.3288574219)
										wait(1)
										if not game:GetService("Workspace").Monster.Boss:FindFirstChild("Expert Swordman [Lv. 3000]") or not v:FindFirstChild("Humanoid") then
											local PlaceID = game.PlaceId
											local AllIDs = {}
											local foundAnything = ""
											local actualHour = os.date("!*t").hour
											local Deleted = false
											function TPReturner()
												local Site;
												if foundAnything == "" then
													Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
												else
													Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
												end
												local ID = ""
												if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
													foundAnything = Site.nextPageCursor
												end
												local num = 0;
												for i,v in pairs(Site.data) do
													local Possible = true
													ID = tostring(v.id)
													if tonumber(v.maxPlayers) > tonumber(v.playing) then
														for _,Existing in pairs(AllIDs) do
															if num ~= 0 then
																if ID == tostring(Existing) then
																	Possible = false
																end
															else
																if tonumber(actualHour) ~= tonumber(Existing) then
																	local delFile = pcall(function()
																		-- delfile("NotSameServers.json")
																		AllIDs = {}
																		table.insert(AllIDs, actualHour)
																	end)
																end
															end
															num = num + 1
														end
														if Possible == true then
															table.insert(AllIDs, ID)
															wait()
															pcall(function()
																-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
																wait()
																game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
															end)
															wait(4)
														end
													end
												end
											end
											function Teleport() 
												while wait() do
													pcall(function()
														TPReturner()
														if foundAnything ~= "" then
															TPReturner()
														end
													end)
												end
											end
											Teleport()
										end
									end
								end
							end
						else
							game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9725.2412109375, 36.836204528809, -3905.3288574219)
							wait(1)
							if not game:GetService("Workspace").Monster.Boss:FindFirstChild("Expert Swordman [Lv. 3000]") then
								local PlaceID = game.PlaceId
								local AllIDs = {}
								local foundAnything = ""
								local actualHour = os.date("!*t").hour
								local Deleted = false
								function TPReturner()
									local Site;
									if foundAnything == "" then
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
									else
										Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
									end
									local ID = ""
									if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
										foundAnything = Site.nextPageCursor
									end
									local num = 0;
									for i,v in pairs(Site.data) do
										local Possible = true
										ID = tostring(v.id)
										if tonumber(v.maxPlayers) > tonumber(v.playing) then
											for _,Existing in pairs(AllIDs) do
												if num ~= 0 then
													if ID == tostring(Existing) then
														Possible = false
													end
												else
													if tonumber(actualHour) ~= tonumber(Existing) then
														local delFile = pcall(function()
															-- delfile("NotSameServers.json")
															AllIDs = {}
															table.insert(AllIDs, actualHour)
														end)
													end
												end
												num = num + 1
											end
											if Possible == true then
												table.insert(AllIDs, ID)
												wait()
												pcall(function()
													-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
													wait()
													game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
												end)
												wait(4)
											end
										end
									end
								end
								function Teleport() 
									while wait() do
										pcall(function()
											TPReturner()
											if foundAnything ~= "" then
												TPReturner()
											end
										end)
									end
								end
								Teleport()
							end
						end
					end)
				end
			end
		end)
		game:GetService("RunService").RenderStepped:Connect(function()
			if setting["Saberhop"] then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)

		spawn(function()
			while wait() do
				if setting["BigMom"] then
					pcall(function()
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Gem") or game.Players.LocalPlayer.Character:FindFirstChild("Gem") then
							farmshadow = false
							EquipWeapon("Gem")
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island["K - Zombie Island"].SummonAltar.Handle.CFrame * CFrame.new(0,-1,1)
						elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Monster [Lv. 2500]") then
							farmshadow = false
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(388.6223449707, 225.86317443848, 6532.1547851563)
							for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
								if v.Name == "Monster [Lv. 2500]" and v.Humanoid.Health > 0 then
									repeat wait()
										equip()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,11,0) * CFrame.Angles(math.rad(-90), 0, 0)
										autoskillheehee()
										wait(.1)
										attack()
									until setting["BigMom"] == false or v.Humanoid.Health <= 0
								end
							end
						elseif game:GetService("Workspace").Monster.Boss:FindFirstChild("Shadow Master [Lv. 1600]") then
							farmshadow = true
						else
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(388.6223449707, 225.86317443848, 6532.1547851563)
						end
					end)
				end
			end
		end)
		game:GetService("RunService").RenderStepped:Connect(function()
			if setting["BigMom"] then
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)

		spawn(function()
			while wait() do
				if farmshadow and setting["BigMom"] then
					pcall(function ()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(388.6223449707, 225.86317443848, 6532.1547851563)
						for i,v in pairs(game:GetService("Workspace").Monster.Boss:GetChildren()) do
							if v.Name == "Shadow Master [Lv. 1600]" and v.Humanoid.Health > 0 then
								repeat wait()
									equip()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,7,0) * CFrame.Angles(math.rad(-90), 0, 0)
									autoskillheehee()
									wait(.2)
									attack()
								until setting["BigMom"] == false or v.Humanoid.Health <= 0
							end
						end
					end)
				end
			end
		end)

		spawn(function()
			while game:GetService("RunService").RenderStepped:wait() do
				if setting["Defense"] then
					pcall(function()
						local args = {
							[1] = "Defense",
							[2] = PointStats
						}
						game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))
					end)
				end
				if setting["Melle"] then
					pcall(function()
						local args = {
							[1] = "Melee",
							[2] = PointStats
						}

						game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))

					end)
				end
				if setting["Sword"] then
					pcall(function()
						local args = {
							[1] = "Sword",
							[2] = PointStats
						}
						game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))
					end)
				end
				if setting["PowerFruit"] then
					pcall(function()
						local args = {
							[1] = "Devil Fruit",
							[2] = PointStats
						}
						game:GetService("Players").LocalPlayer.PlayerGui.Stats.Button.StatsFrame.RemoteEvent:FireServer(unpack(args))
					end)
				end
			end
		end)
		spawn(function()
			while wait() do
				if setting["SeaKing"] then
					pcall(function()
						equip()
						for i,v in pairs(game:GetService("Workspace").SeaMonster:GetDescendants()) do
							if game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") then
								if v.Name == "SeaKing" then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) - Vector3.new(0,25,0)
									attack()
									if v.Humanoid.Health <= 0 then
										if game:GetService("Workspace").Island:FindFirstChild("Legacy Island1") then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island1").ChestSpawner.CFrame
										elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island2") then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island2").ChestSpawner.CFrame
										elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island3") then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island3").ChestSpawner.CFrame
										elseif game:GetService("Workspace").Island:FindFirstChild("Legacy Island4") then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Island:FindFirstChild("Legacy Island4").ChestSpawner.CFrame
										end
									end
								end
							end
						end
					end)
				end
			end
		end)

		game:GetService("RunService").RenderStepped:Connect(function()
			if setting["SeaKing"] then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)
		spawn(function()
			while wait() do
				if setting["SeaKinghop"] then
					if not game:GetService("Workspace").SeaMonster:FindFirstChild("SeaKing") then
						local PlaceID = game.PlaceId
						local AllIDs = {}
						local foundAnything = ""
						local actualHour = os.date("!*t").hour
						local Deleted = false
						function TPReturner()
							local Site;
							if foundAnything == "" then
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
							else
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
							end
							local ID = ""
							if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
								foundAnything = Site.nextPageCursor
							end
							local num = 0;
							for i,v in pairs(Site.data) do
								local Possible = true
								ID = tostring(v.id)
								if tonumber(v.maxPlayers) > tonumber(v.playing) then
									for _,Existing in pairs(AllIDs) do
										if num ~= 0 then
											if ID == tostring(Existing) then
												Possible = false
											end
										else
											if tonumber(actualHour) ~= tonumber(Existing) then
												local delFile = pcall(function()
													-- delfile("NotSameServers.json")
													AllIDs = {}
													table.insert(AllIDs, actualHour)
												end)
											end
										end
										num = num + 1
									end
									if Possible == true then
										table.insert(AllIDs, ID)
										wait()
										pcall(function()
											-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
											wait()
											game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
										end)
										wait(4)
									end
								end
							end
						end
						function Teleport()
							while wait() do
								pcall(function()
									TPReturner()
									if foundAnything ~= "" then
										TPReturner()
									end
								end)
							end
						end
						Teleport()

					end
				end
			end
		end)
		function Skill(use)
			game:GetService("VirtualInputManager"):SendKeyEvent(true,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
			wait()
			game:GetService("VirtualInputManager"):SendKeyEvent(false,use,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
		end

		spawn(function()
			while wait() do
				if _G.Auto_Raid then
					pcall(function()
						if game.Players.LocalPlayer.Character.Humanoid.Health > game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * 20 then
							for i,v in pairs(game:GetService("Workspace").MOB:GetChildren()) do
								if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									if v.Humanoid.Health > 0 then
										repeat wait()
											spawn(function ()
												pcall(function ()
													VirtualUser:CaptureController()
													VirtualUser:ClickButton1(Vector2.new(50, 50), CFrame.new(Vector3.new(0, 0, 0)))
												end)
											end)
											spawn(function ()
												if _G.KillZ then
													pcall(function ()
														Skill("Z")
													end)
												end
											end)
											spawn(function ()
												if _G.KillX then
													pcall(function ()
														Skill("X")
													end)
												end
											end)
											spawn(function ()
												if _G.KillC then
													pcall(function ()
														Skill("C")
													end)
												end
											end)
											spawn(function ()
												if _G.KillV then
													pcall(function ()
														Skill("V")
													end)
												end
											end)
											spawn(function ()
												if _G.Auto_Raid then
													pcall(function ()
														game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0,0,6) 
													end)
												end
											end)
										until not v.Humanoid.Health <= 0 or _G.Auto_Raid or game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * 70
									else
										if not game:GetService("Workspace").MOB:FindFirstChild("HumanoidRootPart") and not game:GetService("Workspace").MOB:FindFirstChild("Humanoid") then
											_G.Equip_Wapon = false
											wait(.3)
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Cyborg"))
											repeat
												pcall(function()
													wait(.3)
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,500,0)
													wait()
													game:GetService("Players").LocalPlayer.Character.Cyborg.E:InvokeServer("holding")
													wait(.5)
												end)
											until game.Players.LocalPlayer.Character.Humanoid.Health == game.Players.LocalPlayer.Character.Humanoid.MaxHealth
											game:GetService("Players").LocalPlayer.Character.Cyborg.E:InvokeServer("release")
											_G.Equip_Wapon = true
										end
									end
								end
							end
						elseif game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * 50 then
							_G.Equip_Wapon = false
							wait(.3)
							game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Cyborg"))
							repeat
								wait(.3)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,500,0)
								wait()
								game:GetService("Players").LocalPlayer.Character.Cyborg.E:InvokeServer("holding")
								wait(.5)
							until game.Players.LocalPlayer.Character.Humanoid.Health == game.Players.LocalPlayer.Character.Humanoid.MaxHealth
							game:GetService("Players").LocalPlayer.Character.Cyborg.E:InvokeServer("release")
							_G.Equip_Wapon = true
						else
							pcall(function()
								for i,v in pairs(game:GetService("Workspace").MOB:GetChildren()) do
									if v:FindFirstChild("HumanoidRootPart") then
										if v.Humanoid.Health > 0 then
											repeat wait()
												spawn(function ()
													pcall(function ()
														VirtualUser:CaptureController()
														VirtualUser:ClickButton1(Vector2.new(50, 50), CFrame.new(Vector3.new(0, 0, 0)))
													end)
												end)
												spawn(function ()
													if _G.KillZ then
														pcall(function ()
															Skill("Z")
														end)
													end
												end)
												spawn(function ()
													if _G.KillX then
														pcall(function ()
															Skill("X")
														end)
													end
												end)
												spawn(function ()
													if _G.KillC then
														pcall(function ()
															Skill("C")
														end)
													end
												end)
												spawn(function ()
													if _G.KillV then
														pcall(function ()
															Skill("V")
														end)
													end
												end)
												game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) * CFrame.new(0,0,6) 
											until not v.Humanoid.Health <= 0 or _G.Auto_Raid or game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth / 100 * 40
										else
											if not game:GetService("Workspace").MOB:FindFirstChild("HumanoidRootPart") and not game:GetService("Workspace").MOB:FindFirstChild("Humanoid") then
												_G.Equip_Wapon = false
												wait(.3)
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Cyborg"))
												repeat
													wait(.3)
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,500,0)
													wait()
													game:GetService("Players").LocalPlayer.Character.Cyborg.E:InvokeServer("holding")
													wait(.5)
												until game.Players.LocalPlayer.Character.Humanoid.Health == game.Players.LocalPlayer.Character.Humanoid.MaxHealth
												game:GetService("Players").LocalPlayer.Character.Cyborg.E:InvokeServer("release")
												_G.Equip_Wapon = true
											end
										end
									end
								end
							end)
						end
					end)
				end
			end
		end)
		spawn(function()
			while wait() do
				if _G.Auto_Raid then
					if newworld then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2691.7334, 223.152374, 7.81725168, 0.882415473, -2.56165911e-09, 0.470470965, 1.2785689e-08, 1, -1.85359603e-08, -0.470470965, 2.23717134e-08, 0.882415473)
					end
					if OldWorld then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6717.84912, 103.706177, 955.801025, -0.327803254, 3.59077745e-08, -0.944746017, -1.93091996e-08, 1, 4.47076687e-08, 0.944746017, 3.289761e-08, -0.327803254)
					end
				end
			end
		end)
		game:GetService("RunService").Heartbeat:Connect(function()
			if _G.Auto_Raid then
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
					pcall(function()
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
					end)
				end
			end
		end)
		spawn(function()
			while wait() do
				if _G.Equip_Wapon then
					pcall(function()
						game:GetService("ReplicatedStorage").GoldenArenaEvents.StartEvent:FireServer()
						pcall(function()
							EquipWeapon(Select_Wapon_Raid1)
						end)
						wait(.5)
						pcall(function()
							EquipWeapon(Select_Wapon_Raid2)
						end)
						wait(.5)
						pcall(function()
							EquipWeapon(Select_Wapon_Raid3)
						end)
					end)
				end
			end
		end)
	end