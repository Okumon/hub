if getgenv().Setting then else
    getgenv().Setting = {
        ["Join Team"] = "Pirate", -- "Marine" / "Pirate"
    
        ["Auto Farm Full"] = false,
        ["Bring Devil Fruit"] = false,
        ["Auto Rengoku"] = false,
        ["Auto Kill Cake Prince"] = false,

        ["Devil Fruit Sniper Name"] = "",
        ["Devil Fruit Sniper"] = false,
        ["Auto Awakeken"] = false,
        ["Secret"] = false,
    }
end

if not game:IsLoaded() then game.Loaded:Wait() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
repeat wait()
    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
        if getgenv().Setting["Join Team"] == "Pirate" then
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
                v.Function()
            end
        elseif getgenv().Setting["Join Team"] == "Marine" then
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
                v.Function()
            end
        else
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
                v.Function()
            end
        end
    end
until game.Players.LocalPlayer.PlayerGui.Main.ChooseTeam.Visible == true or game.Players.LocalPlayer.PlayerGui.Main.ChooseTeam.Visible == false

if game.CoreGui.RobloxGui:FindFirstChild("Voice Chat Ui") then game.CoreGui.RobloxGui:FindFirstChild("Voice Chat Ui"):Destroy() end
local library = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(255, 0, 0)
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CloseBind = Enum.KeyCode.RightControl

local ScreenGui = Instance.new("ScreenGui")
local TabButtonLayout = Instance.new("UIListLayout")

ScreenGui.Name = "Voice Chat Ui"
ScreenGui.Parent = game.CoreGui.RobloxGui
local uitoggled = false
UserInputService.InputBegan:Connect(function(io, p)
	if io.KeyCode == Enum.KeyCode.RightControl then
		if uitoggled == false then
			ScreenGui.Enabled = false
			uitoggled = true
		else
			ScreenGui.Enabled = true
			uitoggled = false
		end
	end
end)

coroutine.wrap(
	function()
		while wait() do
			library.RainbowColorValue = library.RainbowColorValue + 1 / 255
			library.HueSelectionPosition = library.HueSelectionPosition + 1

			if library.RainbowColorValue >= 1 then
				library.RainbowColorValue = 0
			end

			if library.HueSelectionPosition == 80 then
				library.HueSelectionPosition = 0
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

local function RippleEffect(object)
	spawn(function()
		local Ripple = Instance.new("ImageLabel")
		Ripple.Name = "Ripple"
		Ripple.Parent = object
		Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Ripple.BackgroundTransparency = 1.000
		Ripple.ZIndex = 8
		Ripple.Image = "rbxassetid://2708891598"
		Ripple.ImageTransparency = 0.800
		Ripple.ScaleType = Enum.ScaleType.Fit
		Ripple.Position = UDim2.new((Mouse.X - Ripple.AbsolutePosition.X) / object.AbsoluteSize.X, 0, (Mouse.Y - Ripple.AbsolutePosition.Y) / object.AbsoluteSize.Y, 0)
		TweenService:Create(Ripple, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(-5.5, 0, -15, 0), Size = UDim2.new(12, 0, 30, 0)}):Play()
		wait(0.5)
		TweenService:Create(Ripple, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
		wait(0.5)
		Ripple:Destroy()
	end)
end

function library:Window(name,game)
	if getgenv().Theme ~= nil then
		ColorII = getgenv().Theme.Tab.Color

		ColorIII = getgenv().Theme.Line.LeftColor
		ColorIIII = getgenv().Theme.Line.RightColor

		ColorIIIII = getgenv().Theme.Toggle.LeftColor
		ColorIIIIII = getgenv().Theme.Toggle.RightColor

		ColorIIIIIII = getgenv().Theme.Slider.LeftColor
		ColorIIIIIIII = getgenv().Theme.Slider.RightColor
	else
		ColorII = Color3.fromRGB(255, 0, 0)

		ColorIII = Color3.fromRGB(255, 0, 0)
		ColorIIII = Color3.fromRGB(0, 0, 255)

		ColorIIIII = Color3.fromRGB(255, 0, 0)
		ColorIIIIII = Color3.fromRGB(0, 0, 255)

		ColorIIIIIII = Color3.fromRGB(255, 0, 0)
		ColorIIIIIIII = Color3.fromRGB(0, 0, 255)
	end

	local Main = Instance.new("Frame")
	local MainUICorner = Instance.new("UICorner")
	local TopMain = Instance.new("Frame")
	local TopMainUICorner = Instance.new("UICorner")
	local TopMainLine = Instance.new("Frame")
	local NameHub = Instance.new("TextLabel")
	local Toggleui = Instance.new("TextLabel")
	local HideTab = Instance.new("ImageButton")
	local SizeFullSection = Instance.new("Frame")

	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.5, -325, 0.5, -175)
	Main.Size = UDim2.new(0, 650, 0, 425)

	MainUICorner.Name = "MainUICorner"
	MainUICorner.Parent = Main

	TopMain.Name = "TopMain"
	TopMain.Parent = Main
	TopMain.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TopMain.Size = UDim2.new(0, 650, 0, 30)

	MakeDraggable(TopMain, Main)

	TopMainUICorner.Name = "TopMainUICorner"
	TopMainUICorner.Parent = TopMain

	TopMainLine.Name = "TopMainLine"
	TopMainLine.Parent = TopMain
	TopMainLine.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TopMainLine.BorderSizePixel = 0
	TopMainLine.Position = UDim2.new(0, 0, 0.833333313, 0)
	TopMainLine.Size = UDim2.new(1, 0, 0, 5)

	NameHub.Name = "NameHub"
	NameHub.Parent = TopMain
	NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.BackgroundTransparency = 1.000
	NameHub.Position = UDim2.new(0.0507692285, 0, 0, 0)
	NameHub.Size = UDim2.new(0, 160, 0, 30)
	NameHub.Font = Enum.Font.SourceSansSemibold
	NameHub.RichText =  true
	NameHub.Text = "<font color=\"rgb(".. math.floor(ColorII.R * 255) .. "," .. math.floor(ColorII.G * 255) .. ",".. math.floor(ColorII.B * 255) ..")\"> " .. name .. " </font> Hub | " .. game
	NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.TextSize = 25.000
	NameHub.TextXAlignment = Enum.TextXAlignment.Left

	Toggleui.Name = "Toggleui"
	Toggleui.Parent = TopMain
	Toggleui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Toggleui.BackgroundTransparency = 1.000
	Toggleui.Position = UDim2.new(0.803076923, 0, 0, 0)
	Toggleui.Size = UDim2.new(0, 120, 0, 30)
	Toggleui.Font = Enum.Font.SourceSansSemibold
	Toggleui.Text = "[ Right Control ]"
	Toggleui.TextColor3 = Color3.fromRGB(255, 0, 0)
	Toggleui.TextSize = 20.000

	HideTab.Name = "HideTab"
	HideTab.Parent = TopMain
	HideTab.BackgroundTransparency = 1.000
	HideTab.Position = UDim2.new(0.0125000002, 0, 0.0670000017, 0)
	HideTab.Size = UDim2.new(0, 25, 0, 25)
	HideTab.ZIndex = 2
	HideTab.Image = "rbxassetid://3926305904"
	HideTab.ImageRectOffset = Vector2.new(484, 204)
	HideTab.ImageRectSize = Vector2.new(36, 36)
	HideTab.AutoButtonColor = false

	SizeFullSection.Name = "SizeFullSection"
	SizeFullSection.Parent = Main
	SizeFullSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SizeFullSection.BackgroundTransparency = 1.000
	SizeFullSection.Position = UDim2.new(0.192307696, 0, 0.0933333337, 0)
	SizeFullSection.Size = UDim2.new(0, 525, 0, 340)

	local Taplist = Instance.new("Frame")
	local TaplistUIListLayout = Instance.new("UIListLayout")
	local TabSet = Instance.new("TextBox")
	local MainUICorner = Instance.new("UICorner")
	local BalckGrouitList = Instance.new("ScrollingFrame")
	local BalckGrouitListUICorner = Instance.new("UICorner")
	local BalckGrouitListUIListLayout = Instance.new("UIListLayout")
	
	Taplist.Name = "Taplist"
	Taplist.Parent = Main
	Taplist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Taplist.BackgroundTransparency = 1.000
	Taplist.Position = UDim2.new(0, 0, 0.0799999982, 0)
	Taplist.Size = UDim2.new(0, 130, 0, 345)

	TaplistUIListLayout.Name = "TaplistUIListLayout"
	TaplistUIListLayout.Parent = Taplist
	TaplistUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TaplistUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TaplistUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	TaplistUIListLayout.Padding = UDim.new(0, 5)

	TabSet.Name = "TabSet"
	TabSet.Parent = Taplist
	TabSet.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	TabSet.Size = UDim2.new(0, 120, 0, 25)
	TabSet.Font = Enum.Font.SourceSansSemibold
	TabSet.PlaceholderText = "Search : ..."
	TabSet.Text = ""
	TabSet.TextColor3 = Color3.fromRGB(255, 0, 0)
	TabSet.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
	TabSet.TextSize = 18.000
	TabSet.ClipsDescendants = true

	MainUICorner.Name = "MainUICorner"
	MainUICorner.Parent = TabSet

	BalckGrouitList.Name = "BalckGrouitList"
	BalckGrouitList.Parent = Taplist
	BalckGrouitList.Active = true
	BalckGrouitList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BalckGrouitList.BackgroundTransparency = 1.000
	BalckGrouitList.BorderColor3 = Color3.fromRGB(35, 35, 35)
	BalckGrouitList.Position = UDim2.new(0, 0, 0.0799999982, 0)
	BalckGrouitList.Size = UDim2.new(0, 120, 0, 305)
	BalckGrouitList.ScrollBarThickness = 1

	BalckGrouitListUICorner.Name = "BalckGrouitListUICorner"
	BalckGrouitListUICorner.Parent = BalckGrouitList

	BalckGrouitListUIListLayout.Name = "BalckGrouitListUIListLayout"
	BalckGrouitListUIListLayout.Parent = BalckGrouitList
	BalckGrouitListUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	BalckGrouitListUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	BalckGrouitListUIListLayout.Padding = UDim.new(0, 2)

	BalckGrouitListUIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		BalckGrouitList.CanvasSize = UDim2.new(0,0,0,BalckGrouitListUIListLayout.AbsoluteContentSize.Y)
	end)

	function library:Notification(name)
		local NotificationHold = Instance.new("TextButton")
		local NotificationFrame = Instance.new("Frame")
		local NotificationFrameUICorner = Instance.new("UICorner")
		local OkayBtn = Instance.new("TextButton")
		local OkayBtnCorner = Instance.new("UICorner")
		local OkayBtnTitle = Instance.new("TextLabel")
		local NotificationTitle = Instance.new("TextLabel")
		local NotificationDesc = Instance.new("TextLabel")

		NotificationHold.Name = "NotificationHold"
		NotificationHold.Parent = Main
		NotificationHold.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		NotificationHold.BackgroundTransparency = 0.700
		NotificationHold.BorderSizePixel = 0
		NotificationHold.Size = UDim2.new(1, 0, 1, 0)
		NotificationHold.AutoButtonColor = false
		NotificationHold.Font = Enum.Font.SourceSans
		NotificationHold.Text = ""
		NotificationHold.TextColor3 = Color3.fromRGB(0, 0, 0)
		NotificationHold.TextSize = 14.000
		NotificationHold.ZIndex = 10

		TweenService:Create(
			NotificationHold,
			TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{BackgroundTransparency = 0.7}
		):Play()

		wait(0.4)

		NotificationFrame.Name = "NotificationFrame"
		NotificationFrame.Parent = NotificationHold
		NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		NotificationFrame.BorderSizePixel = 0
		NotificationFrame.ClipsDescendants = true
		NotificationFrame.Position = UDim2.new(0.5, 0, 0.498432577, 0)
		NotificationFrame.Size = UDim2.new(0, 0, 0, 0)
		NotificationFrame.ZIndex = 11
		NotificationFrame:TweenSize(
			UDim2.new(0, 305, 0, 283),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quart,
			.6,
			true
		)
		NotificationFrameUICorner.Parent = NotificationFrame

		OkayBtn.Name = "OkayBtn"
		OkayBtn.Parent = NotificationFrame
		OkayBtn.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		OkayBtn.Position = UDim2.new(0.171131134, 0, 0.759717345, 0)
		OkayBtn.Size = UDim2.new(0, 200, 0, 42)
		OkayBtn.AutoButtonColor = false
		OkayBtn.Font = Enum.Font.SourceSans
		OkayBtn.Text = ""
		OkayBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
		OkayBtn.TextSize = 14.000
		OkayBtn.ZIndex = 11

		OkayBtnCorner.CornerRadius = UDim.new(0, 5)
		OkayBtnCorner.Name = "OkayBtnCorner"
		OkayBtnCorner.Parent = OkayBtn

		OkayBtnTitle.Name = "OkayBtnTitle"
		OkayBtnTitle.Parent = OkayBtn
		OkayBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OkayBtnTitle.BackgroundTransparency = 1.000
		OkayBtnTitle.Size = UDim2.new(0, 200, 0, 42)
		OkayBtnTitle.Text = "Okey"
		OkayBtnTitle.Font = Enum.Font.Gotham
		OkayBtnTitle.TextColor3 = Color3.fromRGB(202, 202, 202)
		OkayBtnTitle.TextSize = 24.000
		OkayBtnTitle.ZIndex = 11

		NotificationTitle.Name = "NotificationTitle"
		NotificationTitle.Parent = NotificationFrame
		NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationTitle.BackgroundTransparency = 1.000
		NotificationTitle.Position = UDim2.new(0.0559394211, 0, 0.0652336925, 0)
		NotificationTitle.Size = UDim2.new(0, 272, 0, 26)
		NotificationTitle.ZIndex = 3
		NotificationTitle.Font = Enum.Font.Gotham
		NotificationTitle.Text = "Notification!!"
		NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotificationTitle.TextSize = 24.000
		NotificationTitle.ZIndex = 11

		NotificationDesc.Name = "NotificationDesc"
		NotificationDesc.Parent = NotificationFrame
		NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotificationDesc.BackgroundTransparency = 1.000
		NotificationDesc.Position = UDim2.new(0.0670000017, 0, 0.218999997, 0)
		NotificationDesc.Size = UDim2.new(0, 274, 0, 146)
		NotificationDesc.Font = Enum.Font.Gotham
		NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotificationDesc.TextSize = 20.000
		NotificationDesc.TextWrapped = true
		NotificationDesc.TextXAlignment = Enum.TextXAlignment.Center
		NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top
		NotificationDesc.ZIndex = 11
		NotificationDesc.Text = name

		OkayBtn.MouseEnter:Connect(
			function()
				TweenService:Create(
					OkayBtn,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
				):Play()
			end
		)

		OkayBtn.MouseLeave:Connect(
			function()
				TweenService:Create(
					OkayBtn,
					TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(34, 34, 34)}):Play()
			end
		)

		OkayBtn.MouseButton1Click:Connect(
			function()
				NotificationFrame:TweenSize(
					UDim2.new(0, 0, 0, 0),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quart,
					.6,
					true
				)
				wait(0.4)
				TweenService:Create(
					NotificationHold,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
				wait(.3)
				NotificationHold:Destroy()
			end
		)
	end

	local Tabs = {}
	function Tabs:Tab(text,Real)
		if not Real or Real == nil then
			Real = false
		end
		RealName = ""
		if Real == true then
			RealName = "KakMoungMaiMee"
		elseif Real == false then
			RealName = "Tab"
		end
		local Tab = Instance.new("TextButton")
		local TabUICorner = Instance.new("UICorner")

		Tab.Name = RealName
		Tab.Parent = BalckGrouitList
		Tab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Tab.Position = UDim2.new(0, 0, 0.137704924, 0)
		Tab.Size = UDim2.new(0, 115, 0, 25)
		Tab.Font = Enum.Font.SourceSansSemibold
		Tab.Text = text
		Tab.TextColor3 = Color3.fromRGB(109,109,109)
		Tab.TextSize = 20.000
		Tab.TextWrapped = true
		Tab.AutoButtonColor = false
		Tab.Visible = not Real

		TabUICorner.Name = "TabUICorner"
		TabUICorner.Parent = Tab

		local MainSection = Instance.new("ImageLabel")
		local SectionBorder = Instance.new("ImageLabel")
		local SectionTitle = Instance.new("TextLabel")
		local SectionContent = Instance.new("ScrollingFrame")
		local SectionContentLayout = Instance.new("UIListLayout")

		MainSection.Name = "MainSection"
		MainSection.Parent = SizeFullSection
		MainSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		MainSection.BackgroundTransparency = 1
		MainSection.Position = UDim2.new(0.0266666673, 0, 0.0343861282, 0)
		MainSection.Size = UDim2.new(0, 503, 0, 0)
		MainSection.ZIndex = 4
		MainSection.Image = "rbxassetid://3570695787"
		MainSection.ImageColor3 = Color3.fromRGB(10, 10, 10)
		MainSection.ScaleType = Enum.ScaleType.Slice
		MainSection.SliceCenter = Rect.new(100, 100, 100, 100)
		MainSection.SliceScale = 0.050
		MainSection.Visible = false

		SectionBorder.Name = "SectionBorder"
		SectionBorder.Parent = MainSection
		SectionBorder.BackgroundColor3 = Color3.fromRGB(255, 129, 129)
		SectionBorder.BackgroundTransparency = 1.000
		SectionBorder.Position = UDim2.new(0, -1, 0, -1)
		SectionBorder.Size = UDim2.new(1, 2, 1, 2)
		SectionBorder.ZIndex = 3
		SectionBorder.Image = "rbxassetid://3570695787"
		SectionBorder.ImageColor3 = Color3.fromRGB(255, 0, 0)
		SectionBorder.ScaleType = Enum.ScaleType.Slice
		SectionBorder.SliceCenter = Rect.new(100, 100, 100, 100)
		SectionBorder.SliceScale = 0.050

		SectionContent.Name = "SectionContent"
		SectionContent.Parent = MainSection
		SectionContent.Active = true
		SectionContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SectionContent.BackgroundTransparency = 1.000
		SectionContent.BorderColor3 = Color3.fromRGB(27, 42, 53)
		SectionContent.BorderSizePixel = 0
		SectionContent.Position = UDim2.new(0, 0, 0.0350000001, 0)
		SectionContent.Size = UDim2.new(1, 0, 0.964999974, 0)
		SectionContent.ZIndex = 4
		SectionContent.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		SectionContent.CanvasSize = UDim2.new(0, 0, 0, 0)
		SectionContent.ScrollBarThickness = 4
		SectionContent.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

		function UpdateInputSearchText()
			local InputText = string.upper(TabSet.Text)
			for _,button in pairs(SectionContent:GetChildren())do
				if button:IsA("TextButton") or button:IsA("Frame") or button:IsA("TextLabel") then
					if InputText == "" or string.find(string.upper(button.Name),InputText) ~= nil then
						button.Visible = true
					else
						button.Visible = false
					end
				end
			end
		end
		TabSet.Changed:Connect(UpdateInputSearchText)

		SectionContentLayout.Name = "SectionContentLayout"
		SectionContentLayout.Parent = SectionContent
		SectionContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		SectionContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
		SectionContentLayout.Padding = UDim.new(0, 5)

		SectionContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			SectionContent.CanvasSize = UDim2.new(0,0,0,SectionContentLayout.AbsoluteContentSize.Y + 10 )
		end)

		if fspage == nil then
			fspage = true    
			MainSection.Visible = true
			TweenService:Create(MainSection, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 503, 0, 355)}):Play()
			TweenService:Create(Tab, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(10,10,10)}):Play()
			Tab.TextColor3 = ColorII
		end

		Tab.MouseButton1Click:Connect(function()
			for i, v in next, SizeFullSection:GetChildren() do
				if v.Name == "MainSection" then
					TweenService:Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 503, 0, 0)}):Play()
					v.Visible = false
				end
				MainSection.Visible = true
				TweenService:Create(MainSection, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 503, 0, 355)}):Play()
			end
			for i, v in next, BalckGrouitList:GetChildren() do
				if v.Name == "Tab" then
					TweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(109,109,109)}):Play()
					TweenService:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
				end
				TweenService:Create(Tab, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = ColorII}):Play()
				TweenService:Create(Tab, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(10,10,10)}):Play()
			end
		end)
		
		HideTab.MouseButton1Click:connect(function()
			if HideTab.ImageTransparency == 0 then
				MainSection.Visible = false
				TweenService:Create(
					HideTab,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 0.3} -- UDim2.new(0, 128, 0, 25)
				):Play()
				TweenService:Create(
					HideTab,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 90} -- UDim2.new(0, 128, 0, 25)
				):Play()
				for i,v in next,BalckGrouitList:GetChildren() do 
					if v.Name == "Tab" then
						v.Visible = false
					elseif v.Name == "KakMoungMaiMee" then
						v.Visible = true
					end
				end
			else
				MainSection.Visible = false
				TweenService:Create(
					HideTab,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 0} -- UDim2.new(0, 128, 0, 25)
				):Play()
				TweenService:Create(
					HideTab,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
				):Play()
				for i,v in next,BalckGrouitList:GetChildren() do 
					if v.Name == "Tab" then
						v.Visible = true
					elseif v.Name == "KakMoungMaiMee" then
						v.Visible = false
					end
				end
			end
		end)

		local TabElements = {}

		function TabElements:Button(text,callback)
			local NameButton = Instance.new("Frame")
			local Button = Instance.new("TextButton")
			local ButtonRounded = Instance.new("ImageLabel")
			local UICorner = Instance.new("UICorner")
			local UICorner_2 = Instance.new("UICorner")

			NameButton.Name = (text .. "Button")
			NameButton.Parent = SectionContent
			NameButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			NameButton.Position = UDim2.new(0, 0, 0.122807018, 0)
			NameButton.Size = UDim2.new(0, 475, 0, 30)
			NameButton.ZIndex = 5

			Button.Name = "Button"
			Button.Parent = NameButton
			Button.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
			Button.BackgroundTransparency = 1.000
			Button.BorderSizePixel = 0
			Button.ClipsDescendants = true
			Button.Position = UDim2.new(-0.000727273524, 0, 0, 0)
			Button.Size = UDim2.new(1, 0, 1, 0)
			Button.Text = text
			Button.ZIndex = 6
			Button.Font = Enum.Font.SourceSansBold
			Button.TextColor3 = Color3.fromRGB(185, 185, 185)
			Button.TextSize = 15.000

			ButtonRounded.Name = "ButtonRounded"
			ButtonRounded.Parent = Button
			ButtonRounded.Active = true
			ButtonRounded.AnchorPoint = Vector2.new(0.5, 0.5)
			ButtonRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonRounded.BackgroundTransparency = 1.000
			ButtonRounded.Position = UDim2.new(0.5, 0, 0.5, 0)
			ButtonRounded.Selectable = true
			ButtonRounded.Size = UDim2.new(1, 0, 1, 0)
			ButtonRounded.ZIndex = 5
			ButtonRounded.Image = "rbxassetid://3570695787"
			ButtonRounded.ImageColor3 = Color3.fromRGB(255, 75, 75)
			ButtonRounded.ImageTransparency = 1.000
			ButtonRounded.ScaleType = Enum.ScaleType.Slice
			ButtonRounded.SliceCenter = Rect.new(100, 100, 100, 100)
			ButtonRounded.SliceScale = 0.050

			UICorner.Parent = NameButton

			UICorner_2.Parent = Button

			local Lock = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local lock = Instance.new("ImageButton")

			Lock.Name = "Lock"
			Lock.Parent = Button
			Lock.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Lock.BackgroundTransparency = 0.500
			Lock.Size = UDim2.new(1, 0, 1, 0)
			Lock.ZIndex = 10
			Lock.Visible = false

			UICorner.Parent = Lock

			lock.Name = "lock"
			lock.Parent = Lock
			lock.AnchorPoint = Vector2.new(0.5, 0.5)
			lock.BackgroundTransparency = 1.000
			lock.Position = UDim2.new(0.525263131, -12, 0.899999976, -12)
			lock.Size = UDim2.new(0, 0, 0, 0)
			lock.ZIndex = 10
			lock.Image = "rbxassetid://3926305904"
			lock.ImageRectOffset = Vector2.new(4, 684)
			lock.ImageRectSize = Vector2.new(36, 36)

			Button.MouseButton1Down:Connect(function()
				if Lock.Visible == true then
					for i = 1,3 do
						TweenService:Create(lock, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
						wait(.1)
						TweenService:Create(lock, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
						wait(.1)
					end
					TweenService:Create(lock, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
				else
					RippleEffect(Button)
					callback(Button)
				end
			end)

			Button.MouseEnter:connect(function()
				TweenService:Create(
					Button,
					TweenInfo.new(.2, Enum.EasingStyle.Quad),
					{TextColor3 = Color3.fromRGB(255, 0, 0)}
				):Play()
			end)

			Button.MouseLeave:connect(function()
				TweenService:Create(
					Button,
					TweenInfo.new(.2, Enum.EasingStyle.Quad),
					{TextColor3 = Color3.fromRGB(185, 185, 185)}
				):Play()
			end)

			Button.MouseButton1Up:Connect(function()
				TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			end)

			Button.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
				end
			end)

			local funcbutton = {}

			function funcbutton:Delete()
				NameButton:Destroy()
			end
			function funcbutton:Lock()
				Lock.Visible = true
				TweenService:Create(lock, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 25, 0, 25)}):Play()
			end
			function funcbutton:Unlock()
				TweenService:Create(lock, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				wait(.5)
				Lock.Visible = false
			end
			return funcbutton
		end

		function TabElements:Toggle(text,stats,callback)

			if stats == nil then
				stats = false
			end

			local ToggleName = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local Toggle = Instance.new("TextButton")
			local CheckboxOutline = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")
			local CheckboxTicked = Instance.new("ImageLabel")
			local UIGradient_2 = Instance.new("UIGradient")
			local TickCover = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")

			ToggleName.Name = (text .. "Toggle")
			ToggleName.Parent = SectionContent
			ToggleName.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			ToggleName.Size = UDim2.new(0, 475, 0, 35)
			ToggleName.ZIndex = 5

			Title.Name = "Title"
			Title.Parent = ToggleName
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Title.Position = UDim2.new(0, 13, 0, 0)
			Title.Size = UDim2.new(0, 149, 0, 35)
			Title.ZIndex = 5
			Title.Font = Enum.Font.SourceSansBold
			Title.Text = text
			Title.TextColor3 = Color3.fromRGB(185, 185, 185)
			Title.TextSize = 15.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.Name = "Toggle"
			Toggle.Parent = ToggleName
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.Size = UDim2.new(1, 0, 1, 0)
			Toggle.ZIndex = 5
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.SourceSansBold
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextSize = 14.000

			CheckboxOutline.Name = "CheckboxOutline"
			CheckboxOutline.Parent = Toggle
			CheckboxOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CheckboxOutline.BackgroundTransparency = 1.000
			CheckboxOutline.Position = UDim2.new(1, -35, 0.5, -12)
			CheckboxOutline.Size = UDim2.new(0, 24, 0, 24)
			CheckboxOutline.ZIndex = 5
			CheckboxOutline.Image = "http://www.roblox.com/asset/?id=5416796047"

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, ColorIIIII), ColorSequenceKeypoint.new(1.00, ColorIIIIII)}
			UIGradient.Parent = CheckboxOutline

			CheckboxTicked.Name = "CheckboxTicked"
			CheckboxTicked.Parent = Toggle
			CheckboxTicked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CheckboxTicked.BackgroundTransparency = 1.000
			CheckboxTicked.Position = UDim2.new(1, -35, 0.5, -12)
			CheckboxTicked.Size = UDim2.new(0, 24, 0, 24)
			CheckboxTicked.ZIndex = 5
			CheckboxTicked.Image = "http://www.roblox.com/asset/?id=5416796675"

			UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, ColorIIIII), ColorSequenceKeypoint.new(1.00, ColorIIIIII)}
			UIGradient_2.Parent = CheckboxTicked

			TickCover.Name = "TickCover"
			TickCover.Parent = Toggle
			TickCover.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			TickCover.BorderSizePixel = 0
			TickCover.Position = UDim2.new(1, -30, 0.5, -7)
			TickCover.Size = UDim2.new(0, 14, 0, 14)
			TickCover.ZIndex = 5

			UICorner.Parent = ToggleName

			local Lock = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local lock = Instance.new("ImageButton")

			Lock.Name = "Lock"
			Lock.Parent = Toggle
			Lock.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Lock.BackgroundTransparency = 0.500
			Lock.Size = UDim2.new(1, 0, 1, 0)
			Lock.ZIndex = 10
			Lock.Visible = false

			UICorner.Parent = Lock

			lock.Name = "lock"
			lock.Parent = Lock
			lock.AnchorPoint = Vector2.new(0.5, 0.5)
			lock.BackgroundTransparency = 1.000
			lock.Position = UDim2.new(0.525263131, -12, 0.899999976, -12)
			lock.Size = UDim2.new(0, 0, 0, 0)
			lock.ZIndex = 10
			lock.Image = "rbxassetid://3926305904"
			lock.ImageRectOffset = Vector2.new(4, 684)
			lock.ImageRectSize = Vector2.new(36, 36)

			local function SetState(state)
				if state then
					TweenService:Create(Title, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(255, 0, 0)}):Play()
					TweenService:Create(TickCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, -30, 0.5, -7), Size = UDim2.new(0, 0, 0, 0)}):Play()
				elseif not state then
					TweenService:Create(Title, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
					TweenService:Create(TickCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, -30, 0.5, -7), Size = UDim2.new(0, 14, 0, 14)}):Play()
				end
				-- callback(Toggled)
			end

			if stats then
				SetState(stats)
				callback(stats)
			end

			Toggle.MouseButton1Down:Connect(function()
				if Lock.Visible == true then
					for i = 1,3 do
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
						wait(.1)
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
						wait(.1)
					end
					TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
				else
					Toggled = not Toggled
					SetState(Toggled)
					callback(Toggled)
				end
			end)

			local functoggle = {}

			function functoggle:Lock()
				Lock.Visible = true
				TweenService:Create(lock, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 25, 0, 25)}):Play()
			end
			function functoggle:Unlock()
				TweenService:Create(lock, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				wait(.5)
				Lock.Visible = false
			end
			return functoggle
		end

		function TabElements:Slider(name, minimumvalue, maximumvalue, presetvalue, precisevalue, callback)
			local SliderDragging = false
			local StartingValue = presetvalue

			if StartingValue == nil then
				StartingValue = presetvalue
			end

			local SliderName = Instance.new("Frame")
			local Title = Instance.new("TextLabel")
			local SliderBackground = Instance.new("ImageLabel")
			local SliderIndicator = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")
			local CircleSelector = Instance.new("ImageLabel")
			local UICorner = Instance.new("UICorner")
			local SliderValue = Instance.new("ImageLabel")
			local Value = Instance.new("TextBox")

			SliderName.Name = (name.."Slider")
			SliderName.Parent = SectionContent
			SliderName.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			SliderName.Position = UDim2.new(0.104166672, 0, 0.445901573, 0)
			SliderName.Size = UDim2.new(0, 475, 0, 50)
			SliderName.ZIndex = 5

			Title.Name = "Title"
			Title.Parent = SliderName
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Title.Position = UDim2.new(0, 10, 0, 0)
			Title.Size = UDim2.new(0, 121, 0, 35)
			Title.ZIndex = 5
			Title.Font = Enum.Font.SourceSansBold
			Title.Text = name
			Title.TextColor3 = Color3.fromRGB(185, 185, 185)
			Title.TextSize = 15.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			SliderBackground.Name = "SliderBackground"
			SliderBackground.Parent = SliderName
			SliderBackground.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			SliderBackground.BackgroundTransparency = 1.000
			SliderBackground.Position = UDim2.new(0.0199999996, 0, 0.699999988, 0)
			SliderBackground.Size = UDim2.new(0, 450, 0, 4)
			SliderBackground.ZIndex = 5
			SliderBackground.Image = "rbxassetid://3570695787"
			SliderBackground.ImageColor3 = Color3.fromRGB(55, 55, 55)
			SliderBackground.ScaleType = Enum.ScaleType.Slice
			SliderBackground.SliceCenter = Rect.new(100, 100, 100, 100)
			SliderBackground.SliceScale = 0.150

			SliderIndicator.Name = "SliderIndicator"
			SliderIndicator.Parent = SliderBackground
			SliderIndicator.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			SliderIndicator.BackgroundTransparency = 1.000
			SliderIndicator.Size = UDim2.new(((StartingValue or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)
			SliderIndicator.ZIndex = 5
			SliderIndicator.Image = "rbxassetid://3570695787"
			SliderIndicator.ScaleType = Enum.ScaleType.Slice
			SliderIndicator.SliceCenter = Rect.new(100, 100, 100, 100)
			SliderIndicator.SliceScale = 0.150

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, ColorIIIIIII), ColorSequenceKeypoint.new(1.00, ColorIIIIIIII)}
			UIGradient.Parent = SliderIndicator

			CircleSelector.Name = "CircleSelector"
			CircleSelector.Parent = SliderIndicator
			CircleSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CircleSelector.BackgroundTransparency = 1.000
			CircleSelector.Position = UDim2.new(0.986565471, -7, 0.75, -7)
			CircleSelector.Size = UDim2.new(0, 12, 0, 12)
			CircleSelector.ZIndex = 5
			CircleSelector.Image = "rbxassetid://3570695787"

			UICorner.Parent = SliderName

			SliderValue.Name = "SliderValue"
			SliderValue.Parent = SliderName
			SliderValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
			SliderValue.BackgroundTransparency = 1.000
			SliderValue.Position = UDim2.new(0.899999976, -7, 0.400000006, -12)
			SliderValue.Size = UDim2.new(0, 40, 0, 19)
			SliderValue.ZIndex = 5
			SliderValue.Image = "rbxassetid://3570695787"
			SliderValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
			SliderValue.ScaleType = Enum.ScaleType.Slice
			SliderValue.SliceCenter = Rect.new(100, 100, 100, 100)
			SliderValue.SliceScale = 0.030

			Value.Name = "Value"
			Value.Parent = SliderValue
			Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value.BackgroundTransparency = 1.000
			Value.Size = UDim2.new(1, 0, 1, 0)
			Value.ZIndex = 5
			Value.Font = Enum.Font.SourceSansBold
			Value.Text = tostring(StartingValue or precisevalue and tonumber(string.format("%.2f", StartingValue)))
			Value.TextColor3 = Color3.fromRGB(255, 255, 255)
			Value.TextSize = 14.000

			local Lock = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local lock = Instance.new("ImageButton")

			Lock.Name = "Lock"
			Lock.Parent = SliderName
			Lock.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Lock.BackgroundTransparency = 0.500
			Lock.Size = UDim2.new(1, 0, 1, 0)
			Lock.ZIndex = 10
			Lock.Visible = false

			UICorner.Parent = Lock

			lock.Name = "lock"
			lock.Parent = Lock
			lock.AnchorPoint = Vector2.new(0.5, 0.5)
			lock.BackgroundTransparency = 1.000
			lock.Position = UDim2.new(0.525263131, -12, 0.899999976, -12)
			lock.Size = UDim2.new(0, 0, 0, 0)
			lock.ZIndex = 10
			lock.Image = "rbxassetid://3926305904"
			lock.ImageRectOffset = Vector2.new(4, 684)
			lock.ImageRectSize = Vector2.new(36, 36)

			SliderName.MouseEnter:connect(function()
				if Lock.Visible ~= true then
					TweenService:Create(
						Title,
						TweenInfo.new(.2, Enum.EasingStyle.Quad),
						{TextColor3 = Color3.fromRGB(255, 0, 0)}
					):Play()
				end
			end)

			SliderName.MouseLeave:connect(function()
				if Lock.Visible ~= true then
					TweenService:Create(
						Title,
						TweenInfo.new(.2, Enum.EasingStyle.Quad),
						{TextColor3 = Color3.fromRGB(185, 185, 185)}
					):Play()
				end
			end)

			local function Sliding(input)
				local SliderPosition = UDim2.new(math.clamp((input.Position.X - SliderBackground.AbsolutePosition.X) / SliderBackground.AbsoluteSize.X, 0, 1), 0, 1, 0)
				TweenService:Create(SliderIndicator, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = SliderPosition}):Play()

				local NonSliderPreciseValue = math.floor(((SliderPosition.X.Scale * maximumvalue) / maximumvalue) * (maximumvalue - minimumvalue) + minimumvalue)
				local SliderPreciseValue = ((SliderPosition.X.Scale * maximumvalue) / maximumvalue) * (maximumvalue - minimumvalue) + minimumvalue

				local SlidingValue = (precisevalue and SliderPreciseValue or NonSliderPreciseValue)
				SlidingValue = tonumber(string.format("%.2f", SlidingValue))

				Value.Text = tostring(SlidingValue)
				callback(SlidingValue)
			end

			Value.FocusLost:Connect(function()
				if not tonumber(Value.Text) then
					Value.Text = tostring(StartingValue or precisevalue and tonumber(string.format("%.2f", StartingValue)))
				elseif Value.Text == "" or tonumber(Value.Text) <= minimumvalue then
					Value.Text = minimumvalue
				elseif Value.Text == "" or tonumber(Value.Text) >= maximumvalue then
					Value.Text = maximumvalue
				end

				TweenService:Create(SliderIndicator, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(((tonumber(Value.Text) or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)}):Play()
				callback(tonumber(Value.Text))
			end)


			CircleSelector.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Lock.Visible == true then
						for i = 1,3 do
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
							wait(.1)
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
							wait(.1)
						end
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					else
						SliderDragging = true
					end
				end
			end)

			CircleSelector.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Lock.Visible == true then
						for i = 1,3 do
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
							wait(.1)
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
							wait(.1)
						end
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					else
						SliderDragging = false
					end
				end
			end)

			CircleSelector.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Lock.Visible == true then
						for i = 1,3 do
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
							wait(.1)
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
							wait(.1)
						end
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					else
						Sliding(input)
					end
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if SliderDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					if Lock.Visible == true then
						for i = 1,3 do
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
							wait(.1)
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
							wait(.1)
						end
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					else
						Sliding(input)
					end
				end
			end)
			local function SetSliderValue(value)
				if Lock.Visible == true then
					for i = 1,3 do
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
						wait(.1)
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
						wait(.1)
					end
					TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
				else
					Value.Text = value
					TweenService:Create(SliderIndicator, TweenInfo.new(0.02, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(((tonumber(Value.Text) or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1, 0)}):Play()
					callback(tonumber(Value.Text))
				end
			end
			callback(StartingValue)
			local funcSli = {}

			function funcSli:Lock()
				Lock.Visible = true
				TweenService:Create(lock, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 25, 0, 25)}):Play()
			end
			function funcSli:Unlock()
				TweenService:Create(lock, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				wait(.5)
				Lock.Visible = false
			end
			return funcSli
		end

		function TabElements:Dropdown(name, options, presetoption, callback)
			local NameDropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local TitleToggle = Instance.new("TextButton")
			local Dropdown = Instance.new("ScrollingFrame")
			local UICorner_2 = Instance.new("UICorner")
			local DropdownContentLayout = Instance.new("UIListLayout")
			local add = Instance.new("ImageButton")

			local DropdownToggled = true
			if type(presetoption) == "number" then
				if presetoption <= 0 then
					SelectedOption = "nil"
				else
					if options[presetoption] ~= nil then
						SelectedOption = options[presetoption]
						TitleToggle.TextColor3 = Color3.fromRGB(255, 0, 0)
						callback(options[presetoption])
					else
						SelectedOption = "nil"
					end
				end
			elseif type(presetoption) == "string" then
				if presetoption == "" then
					SelectedOption = "nil"
				else
					for i,v in next,options do 
						if v == tostring(presetoption) then
							ReturnCallBack = v
						end
					end
					if ReturnCallBack ~= nil then
						SelectedOption = ReturnCallBack
						TitleToggle.TextColor3 = Color3.fromRGB(255, 0, 0)
						callback(ReturnCallBack)
					else
						SelectedOption = "nil"
					end
				end
			end

			NameDropdown.Name = (name.."NameDropdown")
			NameDropdown.Parent = SectionContent
			NameDropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			NameDropdown.Position = UDim2.new(0.020833334, 0, 0, 0)
			NameDropdown.Size = UDim2.new(0, 475, 0, 30)
			NameDropdown.ZIndex = 5

			UICorner.Parent = NameDropdown

			TitleToggle.Name = "TitleToggle"
			TitleToggle.Parent = NameDropdown
			TitleToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleToggle.BackgroundTransparency = 1.000
			TitleToggle.BorderSizePixel = 0
			TitleToggle.Position = UDim2.new(0, 13, 0, 0)
			TitleToggle.Size = UDim2.new(0, 475, 0, 30)
			TitleToggle.ZIndex = 7
			TitleToggle.Font = Enum.Font.SourceSansBold
			TitleToggle.Text = (name .. " : " .. SelectedOption)
			if SelectedOption == "nil" then
				TitleToggle.TextColor3 = Color3.fromRGB(185, 185, 185)
			end
			TitleToggle.TextSize = 15.000
			TitleToggle.TextXAlignment = Enum.TextXAlignment.Left

			local Find = Instance.new("TextBox")

			Find.Name = "Find"
			Find.Parent = NameDropdown
			Find.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Find.BackgroundTransparency = 1.000
			Find.Position = UDim2.new(0, 13, 0, 0)
			Find.Size = UDim2.new(0, 135, 0, 30)
			Find.ZIndex = 10
			Find.Font = Enum.Font.SourceSansBold
			Find.PlaceholderColor3 = Color3.fromRGB(255,255,255)
			Find.PlaceholderText = "Search : ..."
			Find.Text = ""
			Find.TextColor3 = Color3.fromRGB(185, 185, 185)
			Find.TextSize = 15.000
			Find.TextXAlignment = Enum.TextXAlignment.Left
			Find.Visible = false

			function UpdateInputOfSearchText()
				local InputText = string.upper(Find.Text)
				for _,button in pairs(Dropdown:GetChildren())do
					if button:IsA("TextButton") then
						if InputText == "" or string.find(string.upper(button.Name),InputText) ~= nil then
							button.Visible = true
						else
							button.Visible = false
						end
					end
				end
			end
			Find.Changed:Connect(UpdateInputOfSearchText)

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = NameDropdown
			Dropdown.Active = true
			Dropdown.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
			Dropdown.BorderSizePixel = 0
			Dropdown.Position = UDim2.new(0, 15, 0, 30)
			Dropdown.Size = UDim2.new(0, 450, 0, 0)
			Dropdown.ZIndex = 15
			Dropdown.CanvasSize = UDim2.new(0, 0, 0, 0)
			Dropdown.ScrollBarThickness = 5

			UICorner_2.Parent = Dropdown

			DropdownContentLayout.Name = "DropdownContentLayout"
			DropdownContentLayout.Parent = Dropdown
			DropdownContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

			add.Name = "add"
			add.Parent = NameDropdown
			add.BackgroundTransparency = 1.000
			add.Position = UDim2.new(0.925263166, 0, 0.0217391253, 0)
			add.Size = UDim2.new(0, 25, 0, 25)
			add.ZIndex = 10
			add.Image = "rbxassetid://3926307971"
			add.ImageRectOffset = Vector2.new(324, 364)
			add.ImageRectSize = Vector2.new(36, 36)

			local Lock = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local lock = Instance.new("ImageButton")

			Lock.Name = "Lock"
			Lock.Parent = NameDropdown
			Lock.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Lock.BackgroundTransparency = 0.500
			Lock.Size = UDim2.new(1, 0, 1, 0)
			Lock.ZIndex = 10
			Lock.Visible = false

			UICorner.Parent = Lock

			lock.Name = "lock"
			lock.Parent = Lock
			lock.AnchorPoint = Vector2.new(0.5, 0.5)
			lock.BackgroundTransparency = 1.000
			lock.Position = UDim2.new(0.525263131, -12, 0.899999976, -12)
			lock.Size = UDim2.new(0, 0, 0, 0)
			lock.ZIndex = 10
			lock.Image = "rbxassetid://3926305904"
			lock.ImageRectOffset = Vector2.new(4, 684)
			lock.ImageRectSize = Vector2.new(36, 36)

			local function ResetAllDropdownItems()
				for i, v in pairs(Dropdown:GetChildren()) do
					if v:IsA("TextButton") then
						TweenService:Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					end
				end
			end

			local function ClearAllDropdownItems()
				for i, v in pairs(Dropdown:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
				DropdownToggled = true
				TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
				TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 30)}):Play()
				TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 0)}):Play()
			end

			for i, v in pairs(options) do
				local NameButton = Instance.new("TextButton")

				NameButton.Name = (v .. "DropdownButton")
				NameButton.Parent = Dropdown
				NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NameButton.BackgroundTransparency = 1.000
				NameButton.BorderSizePixel = 0
				NameButton.Size = UDim2.new(0, 450, 0, 25)
				NameButton.ZIndex = 15
				NameButton.AutoButtonColor = false
				NameButton.Font = Enum.Font.SourceSansBold
				NameButton.Text = v
				NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				NameButton.TextSize = 15.000

				if v == SelectedOption then
					NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				end

				NameButton.MouseButton1Down:Connect(function()
					SelectedOption = v
					ResetAllDropdownItems()
					TitleToggle.Text = (name .. " : " .. SelectedOption)
					TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = ColorII}):Play()
					Find.Visible = false
					TitleToggle.TextTransparency = 0
					if SelectedOption ~= "nil" then
						TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 0, 0)}):Play()
					end
					TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 30)}):Play()
					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(0, 0, 0, 0)}):Play()
					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 0)}):Play()
					TweenService:Create(add, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					callback(NameButton.Text)
				end)

				NameButton.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
					end
				end)

				NameButton.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
					end
				end)
			end

			TitleToggle.MouseButton1Down:Connect(function()
				DropdownToggled = not DropdownToggled
				if DropdownToggled then
					Find.Visible = false
					TitleToggle.TextTransparency = 0
					if SelectedOption ~= "nil" then
						TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 0, 0)}):Play()
					end
					TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 30)}):Play()
					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(0, 0, 0, 0)}):Play()
					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 0)}):Play()
					TweenService:Create(add, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
				elseif not DropdownToggled then
					if Lock.Visible == true then
						for i = 1,3 do
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
							wait(.1)
							TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
							wait(.1)
						end
						TweenService:Create(lock, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					else
						Find.Visible = true
						TitleToggle.TextTransparency = 1
						TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
						TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 115)}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(0, 0, 0, DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
						TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 75)}):Play()
						TweenService:Create(add, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 360}):Play()
					end
				end
			end)

			local funcdrop = {}

			function funcdrop:Refresh(newdate)
				ClearAllDropdownItems()
				for i, v in pairs(newdate) do
					local NameButton = Instance.new("TextButton")

					NameButton.Name = (v .. "DropdownButton")
					NameButton.Parent = Dropdown
					NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					NameButton.BackgroundTransparency = 1.000
					NameButton.BorderSizePixel = 0
					NameButton.Size = UDim2.new(0, 450, 0, 25)
					NameButton.ZIndex = 15
					NameButton.AutoButtonColor = false
					NameButton.Font = Enum.Font.SourceSansBold
					NameButton.Text = v
					NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					NameButton.TextSize = 15.000

					if v == SelectedOption then
						NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					end

					NameButton.MouseButton1Down:Connect(function()
						SelectedOption = v
						ResetAllDropdownItems()
						TitleToggle.Text = (name .. " : " .. SelectedOption)
						TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = ColorII}):Play()
						callback(NameButton.Text)
					end)

					NameButton.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
						end
					end)

					NameButton.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
						end
					end)
				end
			end

			function funcdrop:Lock()
				Lock.Visible = true
				Find.Visible = false
				TitleToggle.TextTransparency = 0
				if SelectedOption ~= "nil" then
					TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 0, 0)}):Play()
				end
				TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 30)}):Play()
				TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(0, 0, 0, 0)}):Play()
				TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 0)}):Play()
				TweenService:Create(add, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
				TweenService:Create(lock, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 25, 0, 25)}):Play()
			end
			function funcdrop:Unlock()
				TweenService:Create(lock, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				wait(.5)
				Lock.Visible = false
			end
			return funcdrop
		end

		function TabElements:ColorPicker(name, presetcolor, callback)
			local NameColorPicker = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local ColorPickerToggle = Instance.new("ImageButton")
			local ColorPicker = Instance.new("ImageLabel")
			local Color = Instance.new("ImageLabel")
			local ColorRound = Instance.new("ImageLabel")
			local ColorSelection = Instance.new("ImageLabel")
			local RValue = Instance.new("ImageLabel")
			local ValueR = Instance.new("TextLabel")
			local GValue = Instance.new("ImageLabel")
			local ValueG = Instance.new("TextLabel")
			local BValue = Instance.new("ImageLabel")
			local ValueB = Instance.new("TextLabel")
			local RainbowToggle = Instance.new("Frame")
			local RainbowToggleTitle = Instance.new("TextLabel")
			local Toggle = Instance.new("TextButton")
			local CheckboxOutline = Instance.new("ImageLabel")
			local CheckboxTicked = Instance.new("ImageLabel")
			local TickCover = Instance.new("Frame")
			local Hue = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")
			local HueSelection = Instance.new("ImageLabel")
			local Frame = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Frame_2 = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")

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

			NameColorPicker.Name = (name.."NameColorPicker")
			NameColorPicker.Parent = SectionContent
			NameColorPicker.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			NameColorPicker.ClipsDescendants = true
			NameColorPicker.Position = UDim2.new(0, 0, 0.138121545, 0)
			NameColorPicker.Size = UDim2.new(0, 475, 0, 30)
			NameColorPicker.ZIndex = 5

			UICorner.Parent = NameColorPicker

			Title.Name = "Title"
			Title.Parent = NameColorPicker
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0, 13, 0, 0)
			Title.Size = UDim2.new(0, 151, 0, 30)
			Title.ZIndex = 5
			Title.Font = Enum.Font.SourceSansBold
			Title.Text = name
			Title.TextColor3 = Color3.fromRGB(185, 185, 185)
			Title.TextSize = 15.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			ColorPickerToggle.Name = "ColorPickerToggle"
			ColorPickerToggle.Parent = NameColorPicker
			ColorPickerToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorPickerToggle.BackgroundTransparency = 1.000
			ColorPickerToggle.Position = UDim2.new(1, -55, 0, 5)
			ColorPickerToggle.Size = UDim2.new(0, 42, 0, 20)
			ColorPickerToggle.ZIndex = 5
			ColorPickerToggle.Image = "rbxassetid://3570695787"
			ColorPickerToggle.ImageColor3 = presetcolor
			ColorPickerToggle.ScaleType = Enum.ScaleType.Slice
			ColorPickerToggle.SliceCenter = Rect.new(100, 100, 100, 100)
			ColorPickerToggle.SliceScale = 0.030

			ColorPicker.Name = "ColorPicker"
			ColorPicker.Parent = NameColorPicker
			ColorPicker.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			ColorPicker.BackgroundTransparency = 1.000
			ColorPicker.ClipsDescendants = true
			ColorPicker.Position = UDim2.new(0.02, 0, 0, 30)
			ColorPicker.Size = UDim2.new(0, 450, 0, 125)
			ColorPicker.ZIndex = 10
			ColorPicker.Image = "rbxassetid://3570695787"
			ColorPicker.ImageColor3 = Color3.fromRGB(45, 45, 45)
			ColorPicker.ImageTransparency = 1.000
			ColorPicker.ScaleType = Enum.ScaleType.Slice
			ColorPicker.SliceCenter = Rect.new(100, 100, 100, 100)
			ColorPicker.SliceScale = 0.070

			Color.Name = "Color"
			Color.Parent = ColorPicker
			Color.BackgroundColor3 = presetcolor
			Color.BorderSizePixel = 0
			Color.Position = UDim2.new(0, 9, 0, 10)
			Color.Size = UDim2.new(0, 124, 0, 105)
			Color.ZIndex = 10
			Color.Image = "rbxassetid://4155801252"

			ColorRound.Name = "ColorRound"
			ColorRound.Parent = Color
			ColorRound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorRound.BackgroundTransparency = 1.000
			ColorRound.ClipsDescendants = true
			ColorRound.Size = UDim2.new(1, 0, 1, 0)
			ColorRound.ZIndex = 10
			ColorRound.Image = "rbxassetid://4695575676"
			ColorRound.ImageColor3 = Color3.fromRGB(45, 45, 45)
			ColorRound.ScaleType = Enum.ScaleType.Slice
			ColorRound.SliceCenter = Rect.new(128, 128, 128, 128)
			ColorRound.SliceScale = 0.050

			ColorSelection.Name = "ColorSelection"
			ColorSelection.Parent = Color
			ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
			ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorSelection.BackgroundTransparency = 1.000
			ColorSelection.Position = UDim2.new(presetcolor and select(3, Color3.toHSV(presetcolor)))
			ColorSelection.Size = UDim2.new(0, 18, 0, 18)
			ColorSelection.ZIndex = 25
			ColorSelection.Image = "rbxassetid://4953646208"
			ColorSelection.ScaleType = Enum.ScaleType.Fit

			RValue.Name = "RValue"
			RValue.Parent = ColorPicker
			RValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
			RValue.Position = UDim2.new(0, 195, 0, 10)
			RValue.Size = UDim2.new(0, 42, 0, 19)
			RValue.ZIndex = 10
			RValue.Image = "rbxassetid://3570695787"
			RValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
			RValue.ScaleType = Enum.ScaleType.Slice
			RValue.SliceCenter = Rect.new(100, 100, 100, 100)
			RValue.SliceScale = 0.030

			ValueR.Name = "ValueR"
			ValueR.Parent = RValue
			ValueR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ValueR.BackgroundTransparency = 1.000
			ValueR.Size = UDim2.new(1, 0, 1, 0)
			ValueR.ZIndex = 11
			ValueR.Font = Enum.Font.SourceSansBold
			ValueR.Text = "R: 255"
			ValueR.TextColor3 = Color3.fromRGB(255, 255, 255)
			ValueR.TextSize = 14.000

			GValue.Name = "GValue"
			GValue.Parent = ColorPicker
			GValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
			GValue.Position = UDim2.new(0, 195, 0, 35)
			GValue.Size = UDim2.new(0, 42, 0, 19)
			GValue.ZIndex = 10
			GValue.Image = "rbxassetid://3570695787"
			GValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
			GValue.ScaleType = Enum.ScaleType.Slice
			GValue.SliceCenter = Rect.new(100, 100, 100, 100)
			GValue.SliceScale = 0.030

			ValueG.Name = "ValueG"
			ValueG.Parent = GValue
			ValueG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ValueG.BackgroundTransparency = 1.000
			ValueG.Size = UDim2.new(1, 0, 1, 0)
			ValueG.ZIndex = 11
			ValueG.Font = Enum.Font.SourceSansBold
			ValueG.Text = "G: 255"
			ValueG.TextColor3 = Color3.fromRGB(255, 255, 255)
			ValueG.TextSize = 14.000

			BValue.Name = "BValue"
			BValue.Parent = ColorPicker
			BValue.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
			BValue.Position = UDim2.new(0, 195, 0, 60)
			BValue.Size = UDim2.new(0, 42, 0, 19)
			BValue.ZIndex = 10
			BValue.Image = "rbxassetid://3570695787"
			BValue.ImageColor3 = Color3.fromRGB(65, 65, 65)
			BValue.ScaleType = Enum.ScaleType.Slice
			BValue.SliceCenter = Rect.new(100, 100, 100, 100)
			BValue.SliceScale = 0.030

			ValueB.Name = "ValueB"
			ValueB.Parent = BValue
			ValueB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ValueB.BackgroundTransparency = 1.000
			ValueB.Size = UDim2.new(1, 0, 1, 0)
			ValueB.ZIndex = 11
			ValueB.Font = Enum.Font.SourceSansBold
			ValueB.Text = "B: 255"
			ValueB.TextColor3 = Color3.fromRGB(255, 255, 255)
			ValueB.TextSize = 14.000

			RainbowToggle.Name = "RainbowToggle"
			RainbowToggle.Parent = ColorPicker
			RainbowToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			RainbowToggle.BackgroundTransparency = 1.000
			RainbowToggle.Position = UDim2.new(0, 267, 0, 10)
			RainbowToggle.Size = UDim2.new(0, 160, 0, 35)
			RainbowToggle.ZIndex = 100

			RainbowToggleTitle.Name = "RainbowToggleTitle"
			RainbowToggleTitle.Parent = RainbowToggle
			RainbowToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			RainbowToggleTitle.BackgroundTransparency = 1.000
			RainbowToggleTitle.Size = UDim2.new(0, 120, 0, 30)
			RainbowToggleTitle.ZIndex = 10
			RainbowToggleTitle.Font = Enum.Font.SourceSansBold
			RainbowToggleTitle.Text = "          Rainbow"
			RainbowToggleTitle.TextColor3 = Color3.fromRGB(185, 185, 185)
			RainbowToggleTitle.TextSize = 15.000
			RainbowToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.Name = "Toggle"
			Toggle.Parent = RainbowToggle
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.Position = UDim2.new(0, 131, 0, 5)
			Toggle.Size = UDim2.new(0, 20, 0, 20)
			Toggle.ZIndex = 10
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.SourceSansBold
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			CheckboxOutline.Name = "CheckboxOutline"
			CheckboxOutline.Parent = Toggle
			CheckboxOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CheckboxOutline.BackgroundTransparency = 1.000
			CheckboxOutline.Position = UDim2.new(0.5, -12, 0.5, -12)
			CheckboxOutline.Size = UDim2.new(0, 24, 0, 24)
			CheckboxOutline.ZIndex = 10
			CheckboxOutline.Image = "http://www.roblox.com/asset/?id=5416796047"
			CheckboxOutline.ImageColor3 = Color3.fromRGB(65, 65, 65)

			CheckboxTicked.Name = "CheckboxTicked"
			CheckboxTicked.Parent = Toggle
			CheckboxTicked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CheckboxTicked.BackgroundTransparency = 1.000
			CheckboxTicked.Position = UDim2.new(0.5, -12, 0.5, -12)
			CheckboxTicked.Size = UDim2.new(0, 24, 0, 24)
			CheckboxTicked.ZIndex = 10
			CheckboxTicked.Image = "http://www.roblox.com/asset/?id=5416796675"
			CheckboxTicked.ImageColor3 = Color3.fromRGB(65, 65, 65)

			TickCover.Name = "TickCover"
			TickCover.Parent = Toggle
			TickCover.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			TickCover.BorderSizePixel = 0
			TickCover.Position = UDim2.new(0.5, -7, 0.5, -7)
			TickCover.Size = UDim2.new(0, 14, 0, 14)
			TickCover.ZIndex = 10

			Hue.Name = "Hue"
			Hue.Parent = ColorPicker
			Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Hue.BackgroundTransparency = 1.000
			Hue.Position = UDim2.new(0, 136, 0, 10)
			Hue.Size = UDim2.new(0, 25, 0, 105)
			Hue.ZIndex = 10
			Hue.Image = "rbxassetid://3570695787"
			Hue.ScaleType = Enum.ScaleType.Slice
			Hue.SliceCenter = Rect.new(100, 100, 100, 100)
			Hue.SliceScale = 0.050

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))}
			UIGradient.Rotation = 270
			UIGradient.Parent = Hue

			HueSelection.Name = "HueSelection"
			HueSelection.Parent = Hue
			HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
			HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HueSelection.BackgroundTransparency = 1.000
			HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(presetcolor)))
			HueSelection.Size = UDim2.new(0, 18, 0, 18)
			HueSelection.ZIndex = 10
			HueSelection.Image = "rbxassetid://4953646208"
			HueSelection.ScaleType = Enum.ScaleType.Fit

			Frame.Parent = ColorPicker
			Frame.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			Frame.Position = UDim2.new(0.39, 0, 0.0799999982, 0)
			Frame.Size = UDim2.new(0, 2, 0, 100)
			Frame.ZIndex = 10

			UICorner_2.Parent = Frame

			Frame_2.Parent = ColorPicker
			Frame_2.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
			Frame_2.Position = UDim2.new(0.57, 0, 0.055999998, 0)
			Frame_2.Size = UDim2.new(0, 2, 0, 100)
			Frame_2.ZIndex = 10

			UICorner_3.Parent = Frame_2

			local function SetRGBValues()
				ValueR.Text = ("R: " .. math.floor(ColorPickerToggle.ImageColor3.r * 255))
				ValueG.Text = ("G: " .. math.floor(ColorPickerToggle.ImageColor3.g * 255))
				ValueB.Text = ("B: " .. math.floor(ColorPickerToggle.ImageColor3.b * 255))
			end


			local function UpdateColorPicker(nope)
				ColorPickerToggle.ImageColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
				Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

				SetRGBValues()
				callback(ColorPickerToggle.ImageColor3)
			end

			ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
			ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
			ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

			ColorPickerToggle.ImageColor3 = presetcolor
			Color.BackgroundColor3 = presetcolor
			SetRGBValues()
			callback(Color.BackgroundColor3)

			Color.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if RainbowColorPicker then return end

					if ColorInput then
						ColorInput:Disconnect()
					end

					ColorInput = RunService.RenderStepped:Connect(function()
						local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
						local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)

						ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
						ColorS = ColorX
						ColorV = 1 - ColorY

						UpdateColorPicker(true)
					end)
				end
			end)

			Color.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if ColorInput then
						ColorInput:Disconnect()
					end
				end
			end)

			Hue.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if RainbowColorPicker then return end

					if HueInput then
						HueInput:Disconnect()
					end

					HueInput = RunService.RenderStepped:Connect(function()
						local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)

						HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
						ColorH = 1 - HueY

						UpdateColorPicker(true)
					end)
				end
			end)

			Hue.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if HueInput then
						HueInput:Disconnect()
					end
				end
			end)

			Toggle.MouseButton1Down:Connect(function()
				RainbowColorPicker = not RainbowColorPicker

				if ColorInput then
					ColorInput:Disconnect()
				end

				if HueInput then
					HueInput:Disconnect()
				end

				if RainbowColorPicker then              
					TweenService:Create(RainbowToggleTitle, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					TweenService:Create(TickCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 0, 0, 0)}):Play()
					TweenService:Create(CheckboxOutline, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					TweenService:Create(CheckboxTicked, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

					OldToggleColor = ColorPickerToggle.ImageColor3
					OldColor = Color.BackgroundColor3
					OldColorSelectionPosition = ColorSelection.Position
					OldHueSelectionPosition = HueSelection.Position

					while RainbowColorPicker do
						ColorPickerToggle.ImageColor3 = Color3.fromHSV(library.RainbowColorValue, 1, 1)
						Color.BackgroundColor3 = Color3.fromHSV(library.RainbowColorValue, 1, 1)

						ColorSelection.Position = UDim2.new(1, 0, 0, 0)
						HueSelection.Position = UDim2.new(0.48, 0, 0, library.HueSelectionPosition)

						SetRGBValues()
						callback(Color.BackgroundColor3)
						wait()
					end
				elseif not RainbowColorPicker then
					ColorPickerToggle.ImageColor3 = OldToggleColor
					Color.BackgroundColor3 = OldColor

					ColorSelection.Position = OldColorSelectionPosition
					HueSelection.Position = OldHueSelectionPosition

					SetRGBValues()
					callback(ColorPickerToggle.ImageColor3)
					TweenService:Create(RainbowToggleTitle, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
					TweenService:Create(TickCover, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -7, 0.5, -7), Size = UDim2.new(0, 14, 0, 14)}):Play()
					TweenService:Create(CheckboxOutline, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(65, 65, 65)}):Play()
					TweenService:Create(CheckboxTicked, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageColor3 = Color3.fromRGB(65, 65, 65)}):Play()
				end
			end)
			ColorPickerToggle.MouseButton1Click:Connect(function()
				ColorPickerToggled = not ColorPickerToggled
				if ColorPickerToggled then
					TweenService:Create(NameColorPicker, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 160)}):Play()
					TweenService:Create(ColorPicker, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
				elseif not ColorPickerToggled then
					TweenService:Create(NameColorPicker, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 30)}):Play()
					TweenService:Create(ColorPicker, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
				end
			end)
		end

		function TabElements:Line()
			local Line = Instance.new("Frame")
			local Button = Instance.new("TextButton")
			local ButtonRounded = Instance.new("ImageLabel")
			local UIGradient = Instance.new("UIGradient")

			Line.Name = "Line"
			Line.Parent = SectionContent
			Line.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			Line.BackgroundTransparency = 1.000
			Line.Position = UDim2.new(0, 0, 0.298245609, 0)
			Line.Size = UDim2.new(0, 475, 0, 5)
			Line.ZIndex = 5

			Button.Name = "Button"
			Button.Parent = Line
			Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			Button.BackgroundTransparency = 1.000
			Button.BorderSizePixel = 0
			Button.ClipsDescendants = true
			Button.Size = UDim2.new(0, 475, 0, 5)
			Button.ZIndex = 6
			Button.Font = Enum.Font.SourceSansBold
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 15.000

			ButtonRounded.Name = "ButtonRounded"
			ButtonRounded.Parent = Button
			ButtonRounded.Active = true
			ButtonRounded.AnchorPoint = Vector2.new(0.5, 0.5)
			ButtonRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonRounded.BackgroundTransparency = 1.000
			ButtonRounded.Position = UDim2.new(0.49999997, 0, 0.5, 0)
			ButtonRounded.Selectable = true
			ButtonRounded.Size = UDim2.new(1, 0, 1, 0)
			ButtonRounded.ZIndex = 5
			ButtonRounded.Image = "rbxassetid://3570695787"
			ButtonRounded.ScaleType = Enum.ScaleType.Slice
			ButtonRounded.SliceCenter = Rect.new(100, 100, 100, 100)
			ButtonRounded.SliceScale = 0.050

			UIGradient.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, 
					ColorIII
				), 
				ColorSequenceKeypoint.new(1.00, 
					ColorIIII
				)
			}
			UIGradient.Parent = ButtonRounded
		end

		function TabElements:Label(text)
			local Label = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")

			Label.Name = (text.."Label")
			Label.Parent = SectionContent
			Label.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Label.Position = UDim2.new(-0.0278330017, 0, 0.022457853, 0)
			Label.Size = UDim2.new(0, 475, 0, 35)
			Label.ZIndex = 5
			Label.RichText = true
			Label.Text = text
			Label.Font = Enum.Font.SourceSansBold
			Label.TextColor3 = Color3.fromRGB(255, 0, 0)
			Label.TextSize = 18.000

			UICorner.Parent = Label

			local funclabel = {}

			Label.MouseEnter:connect(function()
				pcall(function()
					TweenService:Create(
						Title,
						TweenInfo.new(.2, Enum.EasingStyle.Quad),
						{TextColor3 = Color3.fromRGB(255, 129, 129)}
					):Play()
				end)
			end)

			Label.MouseLeave:connect(function()
				pcall(function()
					TweenService:Create(
						Title,
						TweenInfo.new(.2, Enum.EasingStyle.Quad),
						{TextColor3 = Color3.fromRGB(255, 255, 255)}
					):Play()
				end)
			end)

			function funclabel:Refresh(newtext)
				Label.Text = newtext
			end

			function funclabel:Delete()
				Label:Destroy()
			end

			return funclabel
		end

		function TabElements:LabelList(name)
			local NameDropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local TitleToggle = Instance.new("TextButton")
			local Dropdown = Instance.new("ScrollingFrame")
			local UICorner_2 = Instance.new("UICorner")
			local DropdownContentLayout = Instance.new("UIListLayout")
			local add = Instance.new("ImageButton")

			local DropdownToggled = true

			NameDropdown.Name = (name.."LabelList")
			NameDropdown.Parent = SectionContent
			NameDropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			NameDropdown.Position = UDim2.new(0.020833334, 0, 0, 0)
			NameDropdown.Size = UDim2.new(0, 475, 0, 30)
			NameDropdown.ZIndex = 5

			UICorner.Parent = NameDropdown

			TitleToggle.Name = "TitleToggle"
			TitleToggle.Parent = NameDropdown
			TitleToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TitleToggle.BackgroundTransparency = 1.000
			TitleToggle.BorderSizePixel = 0
			TitleToggle.Position = UDim2.new(0, 13, 0, 0)
			TitleToggle.Size = UDim2.new(0, 475, 0, 30)
			TitleToggle.ZIndex = 7
			TitleToggle.Font = Enum.Font.SourceSansBold
			TitleToggle.Text = (name)
			TitleToggle.TextColor3 = Color3.fromRGB(185, 185, 185)
			TitleToggle.TextSize = 15.000
			TitleToggle.TextXAlignment = Enum.TextXAlignment.Left

			local Find = Instance.new("TextBox")

			Find.Name = "Find"
			Find.Parent = NameDropdown
			Find.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Find.BackgroundTransparency = 1.000
			Find.Position = UDim2.new(0, 13, 0, 0)
			Find.Size = UDim2.new(0, 135, 0, 30)
			Find.ZIndex = 10
			Find.Font = Enum.Font.SourceSansBold
			Find.PlaceholderColor3 = Color3.fromRGB(255,255,255)
			Find.PlaceholderText = "Search : ..."
			Find.Text = ""
			Find.TextColor3 = Color3.fromRGB(185, 185, 185)
			Find.TextSize = 15.000
			Find.TextXAlignment = Enum.TextXAlignment.Left
			Find.Visible = false

			Dropdown.Name = "Dropdown"
			Dropdown.Parent = NameDropdown
			Dropdown.Active = true
			Dropdown.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
			Dropdown.BorderSizePixel = 0
			Dropdown.Position = UDim2.new(0, 15, 0, 30)
			Dropdown.Size = UDim2.new(0, 450, 0, 0)
			Dropdown.ZIndex = 15
			Dropdown.CanvasSize = UDim2.new(0, 0, 0, 0)
			Dropdown.ScrollBarThickness = 5

			UICorner_2.Parent = Dropdown

			DropdownContentLayout.Name = "DropdownContentLayout"
			DropdownContentLayout.Parent = Dropdown
			DropdownContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

			local function ResetAllDropdownItems()
				for i, v in pairs(Dropdown:GetChildren()) do
					if v:IsA("TextButton") then
						TweenService:Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					end
				end
			end

			local function ClearAllDropdownItems()
				for i, v in pairs(Dropdown:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
				TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, DropdownContentLayout.AbsoluteContentSize.Y + 45)}):Play()
				TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, DropdownContentLayout.AbsoluteContentSize.Y + 5)}):Play()
			end

			TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
			TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, DropdownContentLayout.AbsoluteContentSize.Y + 30)}):Play()
			TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(0, 0, 0, DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
			TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
			TweenService:Create(add, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 360}):Play()

			local funcdrop = {}

			function funcdrop:Add(text)
				local NameButton = Instance.new("TextButton")

				NameButton.Name = (text .. "DropdownButton")
				NameButton.Parent = Dropdown
				NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NameButton.BackgroundTransparency = 1.000
				NameButton.BorderSizePixel = 0
				NameButton.Size = UDim2.new(0, 450, 0, 25)
				NameButton.ZIndex = 15
				NameButton.AutoButtonColor = false
				NameButton.RichText = true
				NameButton.Font = Enum.Font.SourceSansBold
				NameButton.Text = text
				NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				NameButton.TextSize = 15.000

				TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
				TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, DropdownContentLayout.AbsoluteContentSize.Y + 45)}):Play()
				TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, DropdownContentLayout.AbsoluteContentSize.Y + 5)}):Play()
				TweenService:Create(add, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 360}):Play()
			end
			function funcdrop:Clear()
				ClearAllDropdownItems()
			end
			return funcdrop
		end

		function TabElements:Title(text)
			local Title = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")

			Title.Name = (text.."Title")
			Title.Parent = SectionContent
			Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Title.Position = UDim2.new(-0.0278330017, 0, 0.022457853, 0)
			Title.Size = UDim2.new(0, 475, 0, 35)
			Title.ZIndex = 5
			Title.Font = Enum.Font.SourceSansBold
			Title.Text = "          "..text
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 18.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UICorner.Parent = Title

			local funcTitle = {}

			function funcTitle:Refresh(newtext)
				Label.Text = newtext
			end

			return funcTitle
		end

		function TabElements:DestroyGui()
			local NameButton = Instance.new("Frame")
			local Button = Instance.new("TextButton")
			local ButtonRounded = Instance.new("ImageLabel")
			local UICorner = Instance.new("UICorner")
			local UICorner_2 = Instance.new("UICorner")

			NameButton.Name = "DestroyGui"
			NameButton.Parent = SectionContent
			NameButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			NameButton.Position = UDim2.new(0, 0, 0.122807018, 0)
			NameButton.Size = UDim2.new(0, 475, 0, 30)
			NameButton.ZIndex = 5

			Button.Name = "Button"
			Button.Parent = NameButton
			Button.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
			Button.BackgroundTransparency = 1.000
			Button.BorderSizePixel = 0
			Button.ClipsDescendants = true
			Button.Position = UDim2.new(-0.000727273524, 0, 0, 0)
			Button.Size = UDim2.new(1, 0, 1, 0)
			Button.Text = "Destroy Gui"
			Button.ZIndex = 6
			Button.Font = Enum.Font.SourceSansBold
			Button.TextColor3 = Color3.fromRGB(185, 185, 185)
			Button.TextSize = 15.000

			ButtonRounded.Name = "ButtonRounded"
			ButtonRounded.Parent = Button
			ButtonRounded.Active = true
			ButtonRounded.AnchorPoint = Vector2.new(0.5, 0.5)
			ButtonRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonRounded.BackgroundTransparency = 1.000
			ButtonRounded.Position = UDim2.new(0.5, 0, 0.5, 0)
			ButtonRounded.Selectable = true
			ButtonRounded.Size = UDim2.new(1, 0, 1, 0)
			ButtonRounded.ZIndex = 5
			ButtonRounded.Image = "rbxassetid://3570695787"
			ButtonRounded.ImageColor3 = Color3.fromRGB(255, 75, 75)
			ButtonRounded.ImageTransparency = 1.000
			ButtonRounded.ScaleType = Enum.ScaleType.Slice
			ButtonRounded.SliceCenter = Rect.new(100, 100, 100, 100)
			ButtonRounded.SliceScale = 0.050

			UICorner.Parent = NameButton

			UICorner_2.Parent = Button

			local Lock = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local lock = Instance.new("ImageButton")

			Lock.Name = "Lock"
			Lock.Parent = Button
			Lock.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Lock.BackgroundTransparency = 0.500
			Lock.Size = UDim2.new(1, 0, 1, 0)
			Lock.ZIndex = 10
			Lock.Visible = false

			UICorner.Parent = Lock

			lock.Name = "lock"
			lock.Parent = Lock
			lock.AnchorPoint = Vector2.new(0.5, 0.5)
			lock.BackgroundTransparency = 1.000
			lock.Position = UDim2.new(0.525263131, -12, 0.899999976, -12)
			lock.Size = UDim2.new(0, 0, 0, 0)
			lock.ZIndex = 10
			lock.Image = "rbxassetid://3926305904"
			lock.ImageRectOffset = Vector2.new(4, 684)
			lock.ImageRectSize = Vector2.new(36, 36)

			Button.MouseButton1Down:Connect(function()
				if Lock.Visible == true then
					for i = 1,3 do
						TweenService:Create(lock, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 10}):Play()
						wait(.1)
						TweenService:Create(lock, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = -10}):Play()
						wait(.1)
					end
					TweenService:Create(lock, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
				else
					RippleEffect(Button)
					ScreenGui:Destroy()
				end
			end)

			Button.MouseEnter:connect(function()
				TweenService:Create(
					Button,
					TweenInfo.new(.2, Enum.EasingStyle.Quad),
					{TextColor3 = Color3.fromRGB(255, 0, 0)}
				):Play()
			end)

			Button.MouseLeave:connect(function()
				TweenService:Create(
					Button,
					TweenInfo.new(.2, Enum.EasingStyle.Quad),
					{TextColor3 = Color3.fromRGB(185, 185, 185)}
				):Play()
			end)

			Button.MouseButton1Up:Connect(function()
				TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			end)

			Button.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					TweenService:Create(ButtonRounded, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
				end
			end)
		end

        function TabElements:NewDropdown(name, options, presetoption, callback)
            local NameDropdown = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local TitleToggle = Instance.new("TextButton")
            local Dropdown = Instance.new("ScrollingFrame")
            local UICorner_2 = Instance.new("UICorner")
            local DropdownContentLayout = Instance.new("UIListLayout")
            local add = Instance.new("ImageButton")

            local DropdownToggled = true
            if presetoption <= 0 then
                SelectedOption = "nil"
            else
                SelectedOption = options[presetoption]
                callback(options[presetoption])
            end
            
            NameDropdown.Name = (name.."NameDropdown")
            NameDropdown.Parent = SectionContent
            NameDropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            NameDropdown.Position = UDim2.new(0.020833334, 0, 0, 0)
            NameDropdown.Size = UDim2.new(0, 475, 0, 30)
            NameDropdown.ZIndex = 5

            UICorner.Parent = NameDropdown

            TitleToggle.Name = "TitleToggle"
            TitleToggle.Parent = NameDropdown
            TitleToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TitleToggle.BackgroundTransparency = 1.000
            TitleToggle.BorderSizePixel = 0
            TitleToggle.Position = UDim2.new(0, 13, 0, 0)
            TitleToggle.Size = UDim2.new(0, 475, 0, 30)
            TitleToggle.ZIndex = 7
            TitleToggle.Font = Enum.Font.SourceSansBold
            TitleToggle.Text = (name .. " : " .. SelectedOption)
            TitleToggle.TextColor3 = Color3.fromRGB(185, 185, 185)
            TitleToggle.TextSize = 15.000
            TitleToggle.TextXAlignment = Enum.TextXAlignment.Left

            local Find = Instance.new("TextBox")

            Find.Name = "Find"
            Find.Parent = NameDropdown
            Find.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Find.BackgroundTransparency = 1.000
            Find.Position = UDim2.new(0, 13, 0, 0)
            Find.Size = UDim2.new(0, 135, 0, 30)
            Find.ZIndex = 10
            Find.Font = Enum.Font.SourceSansBold
            Find.PlaceholderColor3 = Color3.fromRGB(255,255,255)
            Find.PlaceholderText = "Search : ..."
            Find.Text = ""
            Find.TextColor3 = Color3.fromRGB(185, 185, 185)
            Find.TextSize = 15.000
            Find.TextXAlignment = Enum.TextXAlignment.Left
            Find.Visible = false

            function UpdateInputOfSearchText()
                local InputText = string.upper(Find.Text)
                for _,button in pairs(Dropdown:GetChildren())do
                    if button:IsA("TextButton") then
                        if InputText == "" or string.find(string.upper(button.Name),InputText) ~= nil then
                            button.Visible = true
                        else
                            button.Visible = false
                        end
                    end
                end
            end
            Find.Changed:Connect(UpdateInputOfSearchText)

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = NameDropdown
            Dropdown.Active = true
            Dropdown.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
            Dropdown.BorderSizePixel = 0
            Dropdown.Position = UDim2.new(0, 15, 0, 30)
            Dropdown.Size = UDim2.new(0, 450, 0, 0)
            Dropdown.ZIndex = 15
            Dropdown.CanvasSize = UDim2.new(0, 0, 0, 0)
            Dropdown.ScrollBarThickness = 5

            UICorner_2.Parent = Dropdown

            DropdownContentLayout.Name = "DropdownContentLayout"
            DropdownContentLayout.Parent = Dropdown
            DropdownContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

            add.Name = "add"
            add.Parent = NameDropdown
            add.BackgroundTransparency = 1.000
            add.Position = UDim2.new(0.925263166, 0, 0.0217391253, 0)
            add.Size = UDim2.new(0, 25, 0, 25)
            add.ZIndex = 10
            add.Image = "rbxassetid://3926307971"
            add.ImageRectOffset = Vector2.new(324, 364)
            add.ImageRectSize = Vector2.new(36, 36)

            local function ResetAllDropdownItems()
                for i, v in pairs(Dropdown:GetChildren()) do
                    if v:IsA("TextButton") then
                        TweenService:Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    end
                end
            end

            local function ClearAllDropdownItems()
                for i, v in pairs(Dropdown:GetChildren()) do
                    if v:IsA("TextButton") then
                        v:Destroy()
                    end
                end
                DropdownToggled = true
                TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 30)}):Play()
                TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 0)}):Play()
            end

            for v,i in pairs(options) do
                local NameButton = Instance.new("TextButton")

                NameButton.Name = (v .. "DropdownButton")
                NameButton.Parent = Dropdown
                NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                NameButton.BackgroundTransparency = 1.000
                NameButton.BorderSizePixel = 0
                NameButton.Size = UDim2.new(0, 450, 0, 25)
                NameButton.ZIndex = 15
                NameButton.AutoButtonColor = false
                NameButton.Font = Enum.Font.SourceSansBold
                NameButton.Text = v
                NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                NameButton.TextSize = 15.000
                
                if v == SelectedOption then
                    NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
                
                NameButton.MouseButton1Down:Connect(function()
                    SelectedOption = v
                    ResetAllDropdownItems()
                    TitleToggle.Text = (name .. " : " .. SelectedOption)
                    TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = ColorII}):Play()
                    callback(NameButton.Text)
                end)
                
                NameButton.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
                    end
                end)
                
                NameButton.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    end
                end)
            end

            TitleToggle.MouseButton1Down:Connect(function()
                DropdownToggled = not DropdownToggled
                
                if DropdownToggled then
                    Find.Visible = false
                    TitleToggle.TextTransparency = 0
                    TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 30)}):Play()
                    TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(0, 0, 0, 0)}):Play()
                    TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 0)}):Play()
                    TweenService:Create(add, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                elseif not DropdownToggled then
                    Find.Visible = true
                    TitleToggle.TextTransparency = 1
                    TweenService:Create(TitleToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(185, 185, 185)}):Play()
                    TweenService:Create(NameDropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 475, 0, 115)}):Play()
                    TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(0, 0, 0, DropdownContentLayout.AbsoluteContentSize.Y)}):Play()
                    TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 75)}):Play()
                    TweenService:Create(add, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 360}):Play()
                end
            end)
            
            local funcdrop = {}

            function funcdrop:Refresh(newdate)
                ClearAllDropdownItems()
                for v,i in pairs(newdate) do
                    local NameButton = Instance.new("TextButton")
    
                    NameButton.Name = (v .. "DropdownButton")
                    NameButton.Parent = Dropdown
                    NameButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    NameButton.BackgroundTransparency = 1.000
                    NameButton.BorderSizePixel = 0
                    NameButton.Size = UDim2.new(0, 450, 0, 25)
                    NameButton.ZIndex = 15
                    NameButton.AutoButtonColor = false
                    NameButton.Font = Enum.Font.SourceSansBold
                    NameButton.Text = v
                    NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    NameButton.TextSize = 15.000
                    
                    if v == SelectedOption then
                        NameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                    
                    NameButton.MouseButton1Down:Connect(function()
                        SelectedOption = v
                        ResetAllDropdownItems()
                        TitleToggle.Text = (name .. " : " .. SelectedOption)
                        TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextColor3 = ColorII}):Play()
                        callback(NameButton.Text)
                    end)
                    
                    NameButton.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement then
                            TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
                        end
                    end)
                    
                    NameButton.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement then
                            TweenService:Create(NameButton, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                        end
                    end)
                end
            end
            return funcdrop
        end

		return TabElements
	end
	return Tabs
end

-- Load Function 
local ServerHop = loadstring(game:HttpGet('https://raw.githubusercontent.com/NoNiName/Library/main/Serverhop.lua'))()
local CodeLibrary = loadstring(game:HttpGet('https://pastebin.com/raw/CcGsHUpT'))()
-- Quest
local placeId = game.PlaceId
if placeId == 2753915549 then
    OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
    ThreeWorld = true
end
function CheckQuest()
	local MyLevel = game.Players.LocalPlayer.Data.Level.Value
	if OldWorld then
		if MyLevel == 1 or MyLevel <= 9 then -- Bandit
			Ms = "Bandit [Lv. 5]"
			NameQuest = "BanditQuest1"
			LevelQuest = 1
			NameMon = "Bandit"
			CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
			CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
		elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
			Ms = "Monkey [Lv. 14]"
			NameQuest = "JungleQuest"
			LevelQuest = 1
			NameMon = "Monkey"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
		elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
			Ms = "Gorilla [Lv. 20]"
			NameQuest = "JungleQuest"
			LevelQuest = 2
			NameMon = "Gorilla"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-1267.89001, 66.2034225, -531.818115, -0.813996196, -5.25169774e-08, -0.580869019, -5.58769671e-08, 1, -1.21082593e-08, 0.580869019, 2.26011476e-08, -0.813996196)
		elseif MyLevel == 30 or MyLevel <= 39 then -- Pirate
			Ms = "Pirate [Lv. 35]"
			NameQuest = "BuggyQuest1"
			LevelQuest = 1
			NameMon = "Pirate"
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(-1311.44727, 4.77785587, 3878.10913, -0.266229719, 2.94305789e-08, -0.963909626, -1.10684184e-07, 1, 6.11032362e-08, 0.963909626, 1.22957047e-07, -0.266229719)
		elseif MyLevel == 40 or MyLevel <= 59 then -- Brute
			Ms = "Brute [Lv. 45]"
			NameQuest = "BuggyQuest1"
			LevelQuest = 2
			NameMon = "Brute"
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(-1349.54773, 4.77724838, 4440.31836, 0.905865192, -0.000296127051, -0.423566043, -1.13833148e-05, 0.999999762, -0.000723473262, 0.423566163, 0.000660190824, 0.905864954)
		elseif MyLevel == 60 or MyLevel <= 74 then -- Desert Bandit
			Ms = "Desert Bandit [Lv. 60]"
			NameQuest = "DesertQuest"
			LevelQuest = 1
			NameMon = "Desert Bandit"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
			CFrameMon = CFrame.new(1054.46924, 28.8281326, 4487.78516, 0.095742099, 9.99517002e-09, 0.995405734, 3.27853407e-08, 1, -1.31947298e-08, -0.995405734, 3.38979973e-08, 0.095742099)
		elseif MyLevel == 75 or MyLevel <= 89 then -- Desert Officre
			Ms = "Desert Officer [Lv. 70]"
			NameQuest = "DesertQuest"
			LevelQuest = 2
			NameMon = "Desert Officer"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
			CFrameMon = CFrame.new(1539.19324, 1.63675952, 4372.31982, 0.367986321, -7.58386349e-08, -0.929831564, -1.96705994e-08, 1, -8.93464929e-08, 0.929831564, 5.11685769e-08, 0.367986321)
		elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
			Ms = "Snow Bandit [Lv. 90]"
			NameQuest = "SnowQuest"
			LevelQuest = 1
			NameMon = "Snow Bandits"
			CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
			CFrameMon = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388, 0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
		elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
			Ms = "Snowman [Lv. 100]"
			NameQuest = "SnowQuest"
			LevelQuest = 2
			NameMon = "Snowman"
			CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
			CFrameMon = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925, 7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
		elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
			Ms = "Chief Petty Officer [Lv. 120]"
			NameQuest = "MarineQuest2"
			LevelQuest = 1
			NameMon = "Chief Petty Officer"
			CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
		elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
			Ms = "Sky Bandit [Lv. 150]"
			NameQuest = "SkyQuest"
			LevelQuest = 1
			NameMon = "Sky Bandit"
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453, -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
		elseif MyLevel == 175 or MyLevel <= 249 then -- Dark Master
			Ms = "Dark Master [Lv. 175]"
			NameQuest = "SkyQuest"
			LevelQuest = 2
			NameMon = "Dark Master"
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461, 3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
		elseif MyLevel == 255 or MyLevel <= 274 then -- Toga Warrior
			Ms = "Toga Warrior [Lv. 250]"
			NameQuest = "ColosseumQuest"
			LevelQuest = 1
			NameMon = "Toga Warrior"
			CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
			CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
		elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
			Ms = "Gladiator [Lv. 275]"
			NameQuest = "ColosseumQuest"
			LevelQuest = 2
			NameMon = "Gladiato"
			CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
			CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
		elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
			Ms = "Military Soldier [Lv. 300]"
			NameQuest = "MagmaQuest"
			LevelQuest = 1
			NameMon = "Military Soldier"
			CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
		elseif MyLevel == 330 or MyLevel <= 374 then -- Military Spy
			Ms = "Military Spy [Lv. 325]"
			NameQuest = "MagmaQuest"
			LevelQuest = 2
			NameMon = "Military Spy"
			CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
		elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
			Ms = "Fishman Warrior [Lv. 375]"
			NameQuest = "FishmanQuest"
			LevelQuest = 1
			NameMon = "Fishman Warrior"
			CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
		elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
			Ms = "Fishman Commando [Lv. 400]"
			NameQuest = "FishmanQuest"
			LevelQuest = 2
			NameMon = "Fishman Commando"
			CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504)
			CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.916871)
		elseif MyLevel == 450 or MyLevel <= 474 then 
			Ms = "God's Guard [Lv. 450]"
			NameQuest = "SkyExp1Quest"
			LevelQuest = 1
			NameMon = "God's Guards"
			CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105)
			CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
		elseif MyLevel == 475 or MyLevel <= 524 then 
			Ms = "Shanda [Lv. 475]"
			NameQuest = "SkyExp1Quest"
			LevelQuest = 2
			NameMon = "Shandas"
			CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
			CFrameMon = CFrame.new(-7904.57373, 5584.37646, -459.62973, 0.65171206, 5.11171692e-08, 0.758466363, -4.76232476e-09, 1, -6.33034247e-08, -0.758466363, 3.76435416e-08, 0.65171206)
		elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
			Ms = "Royal Squad [Lv. 525]"
			NameQuest = "SkyExp2Quest"
			LevelQuest = 1
			NameMon = "Royal Squad"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame.new(-7555.04199, 5606.90479, -1303.24744, -0.896107852, -9.6057462e-10, -0.443836004, -4.24974544e-09, 1, 6.41599973e-09, 0.443836004, 7.63560326e-09, -0.896107852)
		elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
			Ms = "Royal Soldier [Lv. 550]"
			NameQuest = "SkyExp2Quest"
			LevelQuest = 2
			NameMon = "Royal Soldier"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582, -0.716008604, 0.0104285581, -0.698013008, 5.02521061e-06, 0.99988848, 0.0149335321, 0.69809103, 0.0106890313, -0.715928733)
		elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
			Ms = "Galley Pirate [Lv. 625]"
			NameQuest = "FountainQuest"
			LevelQuest = 1
			NameMon = "Galley Pirate"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
			CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196, 0.896460414, 3.98027495e-08, 0.443124533, -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, 0.896460414)
		elseif MyLevel >= 650 then -- Galley Captain
			Ms = "Galley Captain [Lv. 650]"
			NameQuest = "FountainQuest"
			LevelQuest = 2
			NameMon = "Galley Captain"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
			CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586, 2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
		end
	end
	if NewWorld then
		if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
			Ms = "Raider [Lv. 700]"
			NameQuest = "Area1Quest"
			LevelQuest = 1
			NameMon = "Raider"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
		elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
			Ms = "Mercenary [Lv. 725]"
			NameQuest = "Area1Quest"
			LevelQuest = 2
			NameMon = "Mercenary"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0, 0.135460541, 0, -0.990782857)
		elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
			Ms = "Swan Pirate [Lv. 775]"
			NameQuest = "Area2Quest"
			LevelQuest = 1
			NameMon = "Swan Pirate"
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
			CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999, 1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
		elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
			Ms = "Factory Staff [Lv. 800]"
			NameQuest = "Area2Quest"
			LevelQuest = 2
			NameMon = "Factory Staff"
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
			CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738, -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
		elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
			Ms = "Marine Lieutenant [Lv. 875]"
			NameQuest = "MarineQuest3"
			LevelQuest = 1
			NameMon = "Marine Lieutenant"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0, 0.64724648, 0, -0.762281299)
		elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
			Ms = "Marine Captain [Lv. 900]"
			NameQuest = "MarineQuest3"
			LevelQuest = 2
			NameMon = "Marine Captain"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526, 3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
		elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
			Ms = "Zombie [Lv. 950]"
			NameQuest = "ZombieQuest"
			LevelQuest = 1
			NameMon = "Zombie"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
			CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743, 0.355238914, -8.10359282e-08, 0.934775114, 1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, 0.355238914)
		elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
			Ms = "Vampire [Lv. 975]"
			NameQuest = "ZombieQuest"
			LevelQuest = 2
			NameMon = "Vampire"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
			CFrameMon = CFrame.new(-6030.32031, 0.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
		elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
			Ms = "Snow Trooper [Lv. 1000]"
			NameQuest = "SnowMountainQuest"
			LevelQuest = 1
			NameMon = "Snow Trooper"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604, 0.481644779, 0, 0.876366913, 0, 1, 0, -0.876366913, 0, 0.481644779)
		elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
			Ms = "Winter Warrior [Lv. 1050]"
			NameQuest = "SnowMountainQuest"
			LevelQuest = 2
			NameMon = "Winter Warrior"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636, -1.98835952e-08, 1, -9.63858184e-08, 0.71606636, -5.30424877e-08, -0.698032081)
		elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
			Ms = "Lab Subordinate [Lv. 1100]"
			NameQuest = "IceSideQuest"
			LevelQuest = 1
			NameMon = "Lab Subordinate"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
			CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
		elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
			Ms = "Horned Warrior [Lv. 1125]"
			NameQuest = "IceSideQuest"
			LevelQuest = 2
			NameMon = "Horned Warrior"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
			CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316, 0.388303697, 0, -0.921531856, 0, 1, 0, 0.921531856, 0, 0.388303697)
		elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
			Ms = "Magma Ninja [Lv. 1175]"
			NameQuest = "FireSideQuest"
			LevelQuest = 1
			NameMon = "Magma Ninja"
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-5466.06445, 57.6952019, -5837.42822, -0.988835871, 0, -0.149006829, 0, 1, 0, 0.149006829, 0, -0.988835871)
		elseif MyLevel == 1200 or MyLevel <= 1249 then 
			Ms = "Lava Pirate [Lv. 1200]"
			NameQuest = "FireSideQuest"
			LevelQuest = 2
			NameMon = "Lava Pirate"
			CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
			CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
		elseif MyLevel == 1250 or MyLevel <= 1274 then 
			Ms = "Ship Deckhand [Lv. 1250]"
			NameQuest = "ShipQuest1"
			LevelQuest = 1
			NameMon = "Ship Deckhand"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
		elseif MyLevel == 1275 or MyLevel <= 1299 then 
			Ms = "Ship Engineer [Lv. 1275]"
			NameQuest = "ShipQuest1"
			LevelQuest = 2
			NameMon = "Ship Engineer"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
		elseif MyLevel == 1300 or MyLevel <= 1324 then 
			Ms = "Ship Steward [Lv. 1300]"
			NameQuest = "ShipQuest2"
			LevelQuest = 1
			NameMon = "Ship Steward"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
		elseif MyLevel == 1325 or MyLevel <= 1349 then 
			Ms = "Ship Officer [Lv. 1325]"
			NameQuest = "ShipQuest2"
			LevelQuest = 2
			NameMon = "Ship Officer"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
		elseif MyLevel == 1350 or MyLevel <= 1374 then 
			Ms = "Arctic Warrior [Lv. 1350]"
			NameQuest = "FrostQuest"
			LevelQuest = 1
			NameMon = "Arctic Warrior"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
			CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, 0.892505825, -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
		elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
			Ms = "Snow Lurker [Lv. 1375]"
			NameQuest = "FrostQuest"
			LevelQuest = 2
			NameMon = "Snow Lurker"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
			CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, 0.284439981, -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
		elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
			Ms = "Sea Soldier [Lv. 1425]"
			NameQuest = "ForgottenQuest"
			LevelQuest = 1
			NameMon = "Sea Soldier"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			CFrameMon = CFrame.new(-3115.78223, 63.8785706, -9808.38574, -0.913427353, 3.11199457e-08, 0.407000452, 7.79564235e-09, 1, -5.89660658e-08, -0.407000452, -5.06883708e-08, -0.913427353)
		elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
			Ms = "Water Fighter [Lv. 1450]"
			NameQuest = "ForgottenQuest"
			LevelQuest = 2
			NameMon = "Water Fighter"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			CFrameMon = CFrame.new(-3212.99683, 263.809296, -10551.8799, 0.742111444, -5.59139615e-08, -0.670276582, 1.69155214e-08, 1, -6.46908234e-08, 0.670276582, 3.66697037e-08, 0.742111444)
		end
	end
	if ThreeWorld then
		if MyLevel >= 1500 and MyLevel <= 1524 then -- Pirate Millionaire [Lv. 1500]
			Ms = "Pirate Millionaire [Lv. 1500]"
			NameQuest = "PiratePortQuest"
			LevelQuest = 1
			NameMon = "Pirate Millionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
		elseif MyLevel >= 1525 and MyLevel <= 1574 then -- Pistol Billionaire [Lv. 1525]
			Ms = "Pistol Billionaire [Lv. 1525]"
			NameQuest = "PiratePortQuest"
			LevelQuest = 2
			NameMon = "Pistol Billionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
		elseif MyLevel >= 1575 and MyLevel <= 1599 then -- Dragon Crew Warrior [Lv. 1575]
			Ms = "Dragon Crew Warrior [Lv. 1575]"
			NameQuest = "AmazonQuest"
			LevelQuest = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
		elseif MyLevel >= 1600 and MyLevel <= 1624 then -- Dragon Crew Archer [Lv. 1600]
			Ms = "Dragon Crew Archer [Lv. 1600]"
			NameQuest = "AmazonQuest"
			LevelQuest = 2
			NameMon = "Dragon Crew Archer"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
		elseif MyLevel >= 1625 and MyLevel <= 1649 then -- Female Islander [Lv. 1625]
			Ms = "Female Islander [Lv. 1625]"
			NameQuest = "AmazonQuest2"
			LevelQuest = 1
			NameMon = "Female Islander"
			CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
		elseif MyLevel >= 1650 and MyLevel <= 1699 then -- Giant Islander [Lv. 1650]
			Ms = "Giant Islander [Lv. 1650]"
			NameQuest = "AmazonQuest2"
			LevelQuest = 2
			NameMon = "Giant Islander"
			CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
		elseif MyLevel >= 1700 and MyLevel <= 1724 then -- Marine Commodore [Lv. 1700]
			Ms = "Marine Commodore [Lv. 1700]"
			NameQuest = "MarineTreeIsland"
			LevelQuest = 1
			NameMon = "Marine Commodore"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
		elseif MyLevel >= 1725 and MyLevel <= 1774 then -- Marine Rear Admiral [Lv. 1725]
			Ms = "Marine Rear Admiral [Lv. 1725]"
			NameQuest = "MarineTreeIsland"
			LevelQuest = 2
			NameMon = "Marine Rear Admiral"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
		elseif MyLevel >= 1775 and MyLevel <= 1799 then -- Fishman Raider [Lv. 1775]
			Ms = "Fishman Raider [Lv. 1775]"
			NameQuest = "DeepForestIsland3"
			LevelQuest = 1
			NameMon = "Fishman Raider"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
		elseif MyLevel >= 1800 and MyLevel <= 1824 then -- Fishman Captain [Lv. 1800]
			Ms = "Fishman Captain [Lv. 1800]"
			NameQuest = "DeepForestIsland3"
			LevelQuest = 2
			NameMon = "Fishman Captain"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
		elseif MyLevel >= 1825 and MyLevel <= 1849 then -- Forest Pirate [Lv. 1825]
			Ms = "Forest Pirate [Lv. 1825]"
			NameQuest = "DeepForestIsland"
			LevelQuest = 1
			NameMon = "Forest Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
		elseif MyLevel >= 1850 and MyLevel <= 1899 then -- Mythological Pirate [Lv. 1850]
			Ms = "Mythological Pirate [Lv. 1850]"
			NameQuest = "DeepForestIsland"
			LevelQuest = 2
			NameMon = "Mythological Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
		elseif MyLevel >= 1900 and MyLevel <= 1924 then -- Jungle Pirate [Lv. 1900]
			Ms = "Jungle Pirate [Lv. 1900]"
			NameQuest = "DeepForestIsland2"
			LevelQuest = 1
			NameMon = "Jungle Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
		elseif MyLevel >= 1925 and MyLevel <= 1974 then -- Musketeer Pirate [Lv. 1925]
			Ms = "Musketeer Pirate [Lv. 1925]"
			NameQuest = "DeepForestIsland2"
			LevelQuest = 2
			NameMon = "Musketeer Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
		elseif MyLevel >= 1975 and MyLevel <= 1999 then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			LevelQuest = 1
			NameMon = "Reborn Skeleton"
			CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
			CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
		elseif MyLevel >= 2000 and MyLevel <= 2024 then
			Ms = "Living Zombie [Lv. 2000]"
			NameQuest = "HauntedQuest1"
			LevelQuest = 2
			NameMon = "Living Zombie"
			CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
			CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
		elseif MyLevel >= 2025 and MyLevel <= 2049  then
			Ms = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			LevelQuest = 1
			NameMon = "Demonic Soul"
			CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
			CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
		elseif MyLevel >= 2050 and MyLevel <= 2074 then
			Ms = "Posessed Mummy [Lv. 2050]"
			NameQuest = "HauntedQuest2"
			LevelQuest = 2
			NameMon = "Posessed Mummy"
			CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
			CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)    
		elseif MyLevel >= 2075 and MyLevel <= 2099 then
			Ms = "Peanut Scout [Lv. 2075]"
			NameQuest = "NutsIslandQuest"
			LevelQuest = 1
			NameMon = "Peanut Scout"
			CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
			CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867, 0.983392298, -9.57031787e-08, 0.181492642, 8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, 0.983392298)
		elseif MyLevel >= 2100 and MyLevel <= 2124 then
			Ms = "Peanut President [Lv. 2100]"
			NameQuest = "NutsIslandQuest"
			LevelQuest = 2
			NameMon = "Peanut President"
			CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
			CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939, 0.0553516336, -2.83836812e-08, 0.998466909, -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, 0.0553516336)
		elseif MyLevel >= 2125 and MyLevel <= 2149 then
			Ms = "Ice Cream Chef [Lv. 2125]"
			NameQuest = "IceCreamIslandQuest"
			LevelQuest = 1
			NameMon = "Ice Cream Chef"
			CFrameQuest = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08, -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
			CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, 0.492881238, -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
		elseif MyLevel >= 2150 and MyLevel <= 2199 then 
			Ms = "Ice Cream Commander [Lv. 2150]"
			NameQuest = "IceCreamIslandQuest"
			LevelQuest = 2
			NameMon = "Ice Cream Commander"
			CFrameQuest = CFrame.new(-819.376526, 67.4634171, -10967.2832)
			CFrameMon = CFrame.new(-610.11669921875, 208.26904296875, -11253.686523438)
		elseif MyLevel >= 2200 and MyLevel <= 2224 then 
			Ms = "Cookie Crafter [Lv. 2200]"
			NameQuest = "CakeQuest1"
			LevelQuest = 1
			NameMon = "Cookie Crafter"
			CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
			CFrameMon = CFrame.new(-2286.684326171875, 146.5656280517578, -12226.8818359375)
		elseif MyLevel >= 2225 and MyLevel <= 2249 then 
			Ms = "Cake Guard [Lv. 2225]"
			NameQuest = "CakeQuest1"
			LevelQuest = 2
			NameMon = "Cake Guard"
			CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
			CFrameMon = CFrame.new(-1817.9747314453125, 209.5632781982422, -12288.9228515625)
		elseif MyLevel >= 2250 and MyLevel <= 2274 then 
			Ms = "Baking Staff [Lv. 2250]"
			NameQuest = "CakeQuest2"
			LevelQuest = 1
			NameMon = "Baking Staff"
			CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
			CFrameMon = CFrame.new(-1818.347900390625, 93.41275787353516, -12887.66015625)
		elseif MyLevel >= 2275 then 
			Ms = "Head Baker [Lv. 2275]"
			NameQuest = "CakeQuest2"
			LevelQuest = 2
			NameMon = "Head Baker"
			CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
			CFrameMon = CFrame.new(-2288.795166015625, 106.9419174194336, -12811.111328125)
		end
	end
end
CheckQuest()
-- Function
function toTarget(CFgo)
    local tweenfunc = {}
    if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude <= 20 then
        pcall(function()
            tween:Cancel()

            game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo

            return
        end)
    end
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/275, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
    tween:Play()

    function tweenfunc:Stop()
        tween:Cancel()
    end 

    if not tween then return tween end
    return tweenfunc
end

function Click()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton1(Vector2.new(-1,1))
end
function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end 
local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
Table_DevilFruitSniper = {}
for i,v in next,Remote_GetFruits do
    table.insert(Table_DevilFruitSniper,v.Name)
end

local CombatFrameworkROld = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local CombatFrameworkR = getupvalues(CombatFrameworkROld)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            CombatFrameworkR.activeController.hitboxMagnitude = 55
            if Usefastattack or SuperFastAttack then
                if fastattect then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                        CombatFrameworkR.activeController.timeToNextAttack = 3
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
                        CombatFrameworkR.activeController.timeToNextAttack = 2
                    else
                        CombatFrameworkR.activeController.timeToNextAttack = 0
                    end
                    CombatFrameworkR.activeController.attacking = false
                    CombatFrameworkR.activeController.increment = 3
                    if CombatFrameworkR.activeController:attack() then
                        CombatFrameworkR.activeController:attack()
                    end
                    CombatFrameworkR.activeController.blocking = false
                    CombatFrameworkR.activeController.timeToNextBlock = 0
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false						
                end
            end
        end)
    end)
end)

spawn(function()
    while wait() do
        pcall(function()
            if  SuperFastAttack then
                if fastattect then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                        CombatFrameworkR.activeController.timeToNextAttack = 3
                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
                        CombatFrameworkR.activeController.timeToNextAttack = 2
                    else
                        CombatFrameworkR.activeController.timeToNextAttack = 0
                    end
                    CombatFrameworkR.activeController.attacking = false
                    CombatFrameworkR.activeController.increment = 3
                    if CombatFrameworkR.activeController:attack() then
                        CombatFrameworkR.activeController:attack()
                    end
                    CombatFrameworkR.activeController.blocking = false
                    CombatFrameworkR.activeController.timeToNextBlock = 0
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false		
                end
            end
        end)
    end
end)

spawn(function()
    while wait() do
        if Usefastattack or SuperFastAttack then
            if fastattect then
                CombatFrameworkR.activeController:attack()
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Usefastattack or SuperFastAttack then
            if fastattect then
                CombatFrameworkR.activeController:attack()
            end
        end
    end
end)

spawn(function()
    while wait() do
        if Usefastattack or SuperFastAttack then
            if fastattect then
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                    CombatFrameworkR.activeController.timeToNextAttack = 3
                elseif game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
                    CombatFrameworkR.activeController.timeToNextAttack = 2
                else
                    CombatFrameworkR.activeController.timeToNextAttack = 0
                end
                CombatFrameworkR.activeController.attacking = false
                CombatFrameworkR.activeController.increment = 3
                if CombatFrameworkR.activeController:attack() then
                    CombatFrameworkR.activeController:attack()
                end
                CombatFrameworkR.activeController.blocking = false
                CombatFrameworkR.activeController.timeToNextBlock = 0
                game.Players.LocalPlayer.Character.Humanoid.Sit = false		
            end
        end
    end
end)
spawn(function()
    while wait() do
        if Usefastattack or SuperFastAttack then
            if fastattect then
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                    v2.activeController.timeToNextAttack = 3
                elseif game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
                    v2.activeController.timeToNextAttack = 2
                else
                    v2.activeController.timeToNextAttack = 0
                end
                v2.activeController.attacking = false
                v2.activeController.increment = 3
                if v2.activeController:attack() then
                    v2.activeController:attack()
                end
                v2.activeController.blocking = false
                v2.activeController.timeToNextBlock = 0
                game.Players.LocalPlayer.Character.Humanoid.Sit = false		
            end
        end
    end
end)

if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
    game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
        pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                    game.Players.LocalPlayer.Character.Stun.Value = 0
                end
        end)
    end)
end
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if AutoFarmLevel then
            if not KRNL_LOADED and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            else
                if not game:GetService("Workspace"):FindFirstChild("LOL") then
                    local LOL = Instance.new("Part")
                    LOL.Name = "LOL"
                    LOL.Parent = game.Workspace
                    LOL.Anchored = true
                    LOL.Transparency = 0.8
                    LOL.Size = Vector3.new(10,0.5,10)
                elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                    game.Workspace["LOL"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.9,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                end
            end
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

platform = Instance.new("Part")
platform.Name = "WaterWalk"
platform.Size = Vector3.new(math.huge, 1, math.huge)
platform.Transparency = 1
platform.Anchored = true
platform.Parent = game.workspace
spawn(function()
    while wait() do
        if AutoFarmLevel then
            platform.CanCollide = true
            platform.Position = Vector3.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y * 0 -5, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z)
        else
            platform.CanCollide = false
            platform.Position = Vector3.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y * 0 -6, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z)
        end
    end
end)

HaveSaber = false
StatusSaber = "Not Finished" 
-- Auto Farm Zone
HaveDevilFruitSea3 = false
haveFruitDrop = false
UseThireWorld = false
HaveRengoku = false
local function RemoveSpaces(str)
    return str:gsub(" Fruit", "")
end
function AutoFarm()
    GetQuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
    GetQuest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
    MyLevelNow = game.Players.LocalPlayer.Data.Level.Value
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
    if OldWorld and MyLevelNow >= 700 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
        if HaveSaber then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
                if Workspace.Map.Ice.Door.Transparency == 1 then
                    if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 250 then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                            local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                            wait(.4)
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                        end
                        DoorNewWorldTween = toTarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                            if DoorNewWorldTween then
                                DoorNewWorldTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                        end
                    elseif game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") and game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 and (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                        if DoorNewWorldTween then
                            DoorNewWorldTween:Stop()
                        end
                        CheckBoss = true
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if CheckBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                repeat wait()
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then
                                            Farmtween:Stop()
                                        end
                                        EquipWeapon(SelectToolWeapon)
                                        Usefastattack = true
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end 
                                until not CheckBoss or not v.Parent or v.Humanoid.Health <= 0 or AutoFarmLevel== false
                                Usefastattack = false
                                repeat wait()
                                    a = 2
                                    local args = {
                                        [1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                until a == 1
                            end
                        end
                        CheckBoss = false
                    end 
                else
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                        DoorNewWorldTween = toTarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                            if DoorNewWorldTween then
                                DoorNewWorldTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                            local args = {
                                [1] = "DressrosaQuestProgress",
                                [2] = "Detective"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            wait(0.5)
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                                wait(.4)
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                            end
                        end
                    else
                        AutoNewWorldTween = toTarget(CFrame.new(4849.29883, 5.65138149, 719.611877))
                        if (CFrame.new(4849.29883, 5.65138149, 719.611877).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                            if AutoNewWorldTween then
                                AutoNewWorldTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4849.29883, 5.65138149, 719.611877)
                            local args = {
                                [1] = "DressrosaQuestProgress",
                                [2] = "Detective"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            wait(0.5)
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                                wait(.4)
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                            end
                        end
                    end
                end
            else
                local args = {
                    [1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        else
            if game.Workspace.Map.Jungle.Final.Part.CanCollide == false then
                if game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if AutoFarmLevel and v.Name == "Saber Expert [Lv. 200] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat wait()
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    EquipWeapon(SelectToolWeapon)
                                    Usefastattack = true
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        local args = {
                                            [1] = "Buso"
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10)
                                    Click()
                                end
                            until not AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0
                            local BuyAll = {
                                "Soru",
                                "Buso",
                                "Geppo"
                            }
                            for i,v in pairs(BuyAll) do
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", v)
                            end
                            Usefastattack = false
                        end
                    end
                else
                    Questtween = toTarget(CFrame.new(-1405.41956, 29.8519993, 5.62435055))
                    if (CFrame.new(-1405.41956, 29.8519993, 5.62435055).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.41956, 29.8519993, 5.62435055, 0.885240912, 3.52892613e-08, 0.465132833, -6.60881128e-09, 1, -6.32913171e-08, -0.465132833, 5.29540891e-08, 0.885240912)
                    end
                end
            elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") and game.Players.localPlayer.Data.Level.Value >= 200 then
                EquipWeapon("Relic")
                wait(0.5)
                Questtween = toTarget(CFrame.new(-1405.41956, 29.8519993, 5.62435055))
                if (CFrame.new(-1405.41956, 29.8519993, 5.62435055).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Questtween then
                        Questtween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.41956, 29.8519993, 5.62435055, 0.885240912, 3.52892613e-08, 0.465132833, -6.60881128e-09, 1, -6.32913171e-08, -0.465132833, 5.29540891e-08, 0.885240912)
                end
            else
                if Workspace.Map.Jungle.QuestPlates.Door.CanCollide == false then
                    if game.Workspace.Map.Desert.Burn.Part.CanCollide == false then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") == 0 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                if game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if AutoFarmLevel and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Mob Leader [Lv. 120] [Boss]" then
                                            repeat
                                                pcall(function() wait() 
                                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                        if Farmtween then
                                                            Farmtween:Stop()
                                                        end
                                                        EquipWeapon(SelectToolWeapon)
                                                        Usefastattack = true
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            local args = {
                                                                [1] = "Buso"
                                                            }
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        end
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10)
                                                        Click()
                                                    end
                                                end)
                                            until not AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0
                                            Usefastattack = false
                                        end
                                    end
                                else
                                    Questtween = toTarget(CFrame.new(-2848.59399, 7.4272871, 5342.44043))
                                    if (CFrame.new(-2848.59399, 7.4272871, 5342.44043).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Questtween then
                                            Questtween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.928248107)
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") then
                                    EquipWeapon("Relic")
                                    wait(0.5)
                                    Questtween = toTarget(CFrame.new(-1405.41956, 29.8519993, 5.62435055))
                                    if (CFrame.new(-1405.41956, 29.8519993, 5.62435055).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Questtween then
                                            Questtween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.41956, 29.8519993, 5.62435055)
                                    end
                                else
                                    Questtween = toTarget(CFrame.new(-910.979736, 13.7520342, 4078.14624))
                                    if (CFrame.new(-910.979736, 13.7520342, 4078.14624).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Questtween then
                                            Questtween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-910.979736, 13.7520342, 4078.14624, 0.00685182028, -1.53155766e-09, -0.999976516, 9.15205245e-09, 1, -1.46888401e-09, 0.999976516, -9.14177267e-09, 0.00685182028)
                                        wait(.5)
                                        local args = {
                                            [1] = "ProQuestProgress",
                                            [2] = "RichSon"
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                end
                            else
                                Questtween = toTarget(CFrame.new(-910.979736, 13.7520342, 4078.14624))
                                if (CFrame.new(-910.979736, 13.7520342, 4078.14624).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Questtween then
                                        Questtween:Stop()
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-910.979736, 13.7520342, 4078.14624)
                                    local args = {
                                        [1] = "ProQuestProgress",
                                        [2] = "RichSon"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                            end
                        else
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") or game.Players.LocalPlayer.Character:FindFirstChild("Cup") then
                                EquipWeapon("Cup")
                                if game.Players.LocalPlayer.Character.Cup.Handle:FindFirstChild("TouchInterest") then
                                    Questtween = toTarget(CFrame.new(1397.229, 37.3480148, -1320.85217))
                                    if (CFrame.new(1397.229, 37.3480148, -1320.85217).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Questtween then
                                            Questtween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1397.229, 37.3480148, -1320.85217, -0.11285457, 2.01368788e-08, 0.993611455, 1.91641178e-07, 1, 1.50028845e-09, -0.993611455, 1.90586206e-07, -0.11285457)
                                    end
                                else
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1458.54285, 88.2521744, -1390.34912, -0.00596274994, 1.13679788e-09, -0.999982238, 7.28181793e-10, 1, 1.132476e-09, 0.999982238, -7.21416205e-10, -0.00596274994)
                                    wait(0.5)
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                        local args = {
                                            [1] = "ProQuestProgress",
                                            [2] = "SickMan"
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                end
                            else
                                Questtween = toTarget(game.Workspace.Map.Desert.Cup.CFrame)
                                if (game.Workspace.Map.Desert.Cup.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Questtween then
                                        Questtween:Stop()
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Desert.Cup.CFrame
                                end
                            end
                        end
                    else
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            EquipWeapon("Torch")
                            Questtween = toTarget(CFrame.new(1114.87708, 4.9214654, 4349.8501))
                            if (CFrame.new(1114.87708, 4.9214654, 4349.8501).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Questtween then
                                    Questtween:Stop()
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1114.87708, 4.9214654, 4349.8501, -0.612586915, -9.68697833e-08, 0.790403247, -1.2634203e-07, 1, 2.4638446e-08, -0.790403247, -8.47679615e-08, -0.612586915)
                            end
                        else
                            Questtween = toTarget(CFrame.new(-1610.00757, 11.5049858, 164.001587))
                            if (CFrame.new(-1610.00757, 11.5049858, 164.001587).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Questtween then
                                    Questtween:Stop()
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408)
                            end
                        end
                    end
                else
                    for i,v in pairs(Workspace.Map.Jungle.QuestPlates:GetChildren()) do
                        if v:IsA("Model") then wait()
                            if v.Button.BrickColor ~= BrickColor.new("Camo") then
                                repeat wait()
                                    Questtween = toTarget(v.Button.CFrame)
                                    if (v.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                        if Questtween then Questtween:Stop() end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Button.CFrame
                                    end
                                until not AutoFarmLevel or v.Button.BrickColor == BrickColor.new("Camo")
                            end
                        end
                    end    
                end
            end
        end
    elseif NewWorld and MyLevelNow >= 850 and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2) then
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
            if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Swan Pirate [Lv. 775]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait()
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then Farmtween:Stop() end
                                        EquipWeapon(SelectToolWeapon)
                                        Usefastattack = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        StartMagnetAutoFarmLevel = true
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end 
                                until not v.Parent or v.Humanoid.Health <= 0 or AutoFarmLevel == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                Usefastattack = false
                                StartMagnetAutoFarmLevel = false
                            end)
                        end
                    end
                else
                    StartMagnetAutoFarmLevel = false
                    Questtween = toTarget(CFrame.new(1057.92761, 137.614319, 1242.08069))
                    if (CFrame.new(1057.92761, 137.614319, 1242.08069).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1057.92761, 137.614319, 1242.08069)
                    end
                end
            else
                Bartilotween = toTarget(CFrame.new(-456.28952, 73.0200958, 299.895966))
                if ( CFrame.new(-456.28952, 73.0200958, 299.895966).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Bartilotween then Bartilotween:Stop() end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  CFrame.new(-456.28952, 73.0200958, 299.895966)
                    local args = {
                        [1] = "StartQuest",
                        [2] = "BartiloQuest",
                        [3] = 1
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end 
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
            StartMagnetAutoFarmLevel = false
            if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == "Jeremy [Lv. 850] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat wait()
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                            elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Farmtween then Farmtween:Stop() end
                                EquipWeapon(SelectToolWeapon)
                                Usefastattack = true
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {
                                        [1] = "Buso"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                Click()
                            end 
                        until not v.Parent or v.Humanoid.Health <= 0 or AutoFarmLevel == false
                        Usefastattack = false
                    end
                end
            else
                Bartilotween = toTarget(CFrame.new(2099.88159, 448.931, 648.997375))
                if (CFrame.new(2099.88159, 448.931, 648.997375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Bartilotween then Bartilotween:Stop() end
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
                end
            end
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
            if (CFrame.new(-1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                Bartilotween = toTarget(CFrame.new(-1836, 11, 1714))
            elseif (CFrame.new(-1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                if Bartilotween then Bartilotween:Stop() end
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1836, 11, 1714)
                wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
            end
        end
    elseif NewWorld and MyLevelNow >= 1500 then
        if AutoRengoku and game:GetService("Workspace").Map.IceCastle:FindFirstChild("RengokuChest") and not HaveRengoku then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or  game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
                EquipWeapon("Hidden Key")
                if (CFrame.new(6571.81885, 296.689758, -6966.76514).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                    Farmtween = toTarget(CFrame.new(6571.81885, 296.689758, -6966.76514))
                elseif (CFrame.new(6571.81885, 296.689758, -6966.76514).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Farmtween then
                        Farmtween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6571.81885, 296.689758, -6966.76514, 0.825126112, 8.412257e-10, 0.564948559, -2.42370835e-08, 1, 3.39100339e-08, -0.564948559, -4.16727595e-08, 0.825126112)
                end 
            elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if AutoFarmLevel and v.Name == "Snow Lurker [Lv. 1375]" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat wait()
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                StartMagnetAutoFarmLevel = false
                            elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Farmtween then
                                    Farmtween:Stop()
                                end
                                PosMon = v.HumanoidRootPart.CFrame
                                EquipWeapon(SelectToolWeapon)
                                Usefastattack = true
                                StartMagnetAutoFarmLevel = true
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {
                                        [1] = "Buso"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10)
                                Click()
                            end 
                        until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or AutoFarmLevel == false or not v.Parent or v.Humanoid.Health <= 0
                        StartMagnetAutoFarmLevel = false
                        Usefastattack = false
                        if (CFrame.new(5518.00684, 60.5559731, -6828.80518).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                            Farmtween = toTarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
                        elseif (CFrame.new(5518.00684, 60.5559731, -6828.80518).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if Farmtween then
                                Farmtween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5518.00684, 60.5559731, -6828.80518, 0.825126112, 8.412257e-10, 0.564948559, -2.42370835e-08, 1, 3.39100339e-08, -0.564948559, -4.16727595e-08, 0.825126112)
                        end 
                    end
                end
            else
                StartMagnetAutoFarmLevel = false
                if (CFrame.new(5518.00684, 60.5559731, -6828.80518).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                    Farmtween = toTarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
                elseif (CFrame.new(5518.00684, 60.5559731, -6828.80518).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Farmtween then
                        Farmtween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
                end 
            end
        else
            local args = {
                [1] = "TravelZou" -- OLD WORLD to NEW WORLD
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                for i,v in pairs(game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("getInventoryFruits")) do
                    if v.Price >= 1000000 then 
                        HaveDevilFruitSea3 = true
                    end
                end
                if HaveDevilFruitSea3 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                    TabelDevilFruitStore = {}
                    TabelDevilFruitOpen = {}

                    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                        for i1,v1 in pairs(v) do
                            if i1 == "Name" then 
                                table.insert(TabelDevilFruitStore,v1)
                            end
                        end
                    end

                    for i,v in next,game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
                        if v.Price >= 1000000 then  
                            table.insert(TabelDevilFruitOpen,v.Name)
                        end
                    end

                    for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
                        for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
                            if DevilFruitOpenDoor == DevilFruitStore and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then    
                                if not game.Players.LocalPlayer.Backpack:FindFirstChild(DevilFruitStore) then   
                                    local string_1 = "LoadFruit";
                                    local string_2 = DevilFruitStore;
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    UseThireWorld = true wait(.1)
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "1";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "2";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "3";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                else
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "1";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "2";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "3";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                end
                            end
                        end
                    end
                    local string_1 = "TalkTrevor";
                    local string_2 = "1";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2);
                    local string_1 = "TalkTrevor";
                    local string_2 = "2";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2);
                    local string_1 = "TalkTrevor";
                    local string_2 = "3";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2);
                else
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:IsA("Tool") and string.find(v.Name,"Fruit") then 
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
                            EquipWeapon(SelectToolWeapon)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if string.find(v.Name,"Fruit") then
                                    local FruitName = RemoveSpaces(v.Name)
                                    if v.Name == "Bird: Falcon Fruit" then
                                        NameFruit = "Bird-Bird: Falcon"
                                    elseif v.Name == "Bird: Phoenix Fruit" then
                                        NameFruit = "Bird-Bird: Phoenix"
                                    elseif v.Name == "Human: Buddha Fruit" then
                                        NameFruit = "Human-Human: Buddha"
                                    else
                                        NameFruit = FruitName.."-"..FruitName
                                    end
                
                                    local string_1 = "getInventoryFruits";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    for i1,v1 in pairs(Target:InvokeServer(string_1)) do
                                        if v1.Name == NameFruit then
                                            HaveFruitInStore = true
                                        end
                                    end
                                    if not HaveFruitInStore then
                                        local string_1 = "StoreFruit";
                                        local string_2 = NameFruit;
                                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                        Target:InvokeServer(string_1, string_2);
                                    end
                                    HaveFruitInStore = false
                                end
                            end
                        end
                    end
                    wait(.5)
                    library:Notification("Server Hop")
                    ServerHop:Teleport()
                end
            else
                if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 0 then
                    if game.Workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then 	
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "rip_indra [Lv. 1500] [Boss]" and v:FindFirstChild("Humanoid")and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then
                                            Farmtween:Stop()
                                        end
                                        EquipWeapon(SelectToolWeapon)
                                        Usefastattack = true
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end 
                                until not AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0 
                                wait(.5)
                                asmrqq = 2
                                repeat wait()
                                    local args = {
                                        [1] = "TravelZou" -- OLD WORLD to NEW WORLD
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                until asmrqq == 1
                                Usefastattack = false
                            end
                        end
                    else -- SlashHit : rbxassetid://2453605589
                        local string_1 = "ZQuestProgress";
                        local string_2 = "Check";
                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                        Target:InvokeServer(string_1, string_2);
                        wait()
                        local string_1 = "ZQuestProgress";
                        local string_2 = "Begin";
                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                        Target:InvokeServer(string_1, string_2);
                    end
                elseif game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
                    local args = {
                        [1] = "TravelZou" -- OLD WORLD to NEW WORLD
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                else
                    if game.Workspace.Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then 	
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Don Swan [Lv. 1000] [Boss]" and v:FindFirstChild("Humanoid")and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then
                                            Farmtween:Stop()
                                        end
                                        EquipWeapon(SelectToolWeapon)
                                        Usefastattack = true
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end 
                                until not AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0 
                                Usefastattack = false
                            end
                        end
                    else -- SlashHit : rbxassetid://2453605589
                        TweenDonSwanthireworld = toTarget(CFrame.new(2288.802, 15.1870775, 863.034607))
                        if (CFrame.new(2288.802, 15.1870775, 863.034607).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if TweenDonSwanthireworld then
                                TweenDonSwanthireworld:Stop()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2288.802, 15.1870775, 863.034607)
                            end
                        end
                    end
                end
            end
        end
    elseif AutoKillCakePrince and game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if AutoFarmLevel and AutoKillCakePrince and v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat wait()
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                            Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                            Usefastattack = false
                        elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if Farmtween then
                                Farmtween:Stop()
                            end
                            PosFarmBone = v.HumanoidRootPart.CFrame
                            EquipWeapon(SelectToolWeapon)
                            Usefastattack = true
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local args = {
                                    [1] = "Buso"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                            Click()
                        end
                    until not AutoFarmLevel or not AutoKillCakePrince or not v.Parent or v.Humanoid.Health <= 0 or game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                    Usefastattack = false
                end
            end
        else
            Usefastattack = false
            Questtween = toTarget(CFrame.new(-2151.82153, 149.315704, -12404.9053))
            if (CFrame.new(-2151.82153, 149.315704, -12404.9053).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                if Questtween then Questtween:Stop() end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053)
            end
        end
    else
        if game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") then
            GOtween = toTarget(CFrame.new(448.46756, 199.356781, -441.389252))
            if NewWorld and game.ReplicatedStorage:FindFirstChild("Core") and (CFrame.new(448.46756, 199.356781, -441.389252).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                if Questtween then Questtween:Stop() end
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            elseif (CFrame.new(448.46756, 199.356781, -441.389252).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                if Farmtween then GOtween:Stop()end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(448.46756, 199.356781, -441.389252)
            end
        elseif game.Workspace.Enemies:FindFirstChild("Core") then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if AutoFarmLevel and v.Name == "Core" and v.Humanoid.Health > 0 then
                    repeat wait(.1)
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
                            Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                        elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                            if Farmtween then Farmtween:Stop() end
                            EquipWeapon(SelectToolWeapon)
                            Usefastattack = true
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local args = {
                                    [1] = "Buso"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10)
                            Click()
                        end
                    until not AutoFarmLevel or v.Humanoid.Health <= 0 or Factory == false
                    Usefastattack = false
                end
            end
        else
            if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
            if GetQuest.Visible == false then
                Usefastattack = false
                StartMagnetAutoFarmLevel = false
                Questtween = toTarget(CFrameQuest) wait(.1)
                if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
                if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Questtween then Questtween:Stop() end wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Questtween then Questtween:Stop() end wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Questtween then Questtween:Stop() end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Questtween then Questtween:Stop() end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                    if Questtween then Questtween:Stop() end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                    wait(1)
                    local string_1 = "StartQuest";
                    local string_2 = NameQuest;
                    local number_1 = LevelQuest;
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2, number_1);
                    local string_1 = "SetSpawnPoint";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1);
                end
            elseif GetQuest.Visible == true then
                if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if AutoFarmLevel and v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if string.find(GetQuestTitle.Text, NameMon) then
                                repeat wait()
                                    if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
                                    FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                        if FarmtoTarget then FarmtoTarget:Stop() end
                                        Usefastattack = true
                                        EquipWeapon(SelectToolWeapon)
                                        StartMagnetAutoFarmLevel = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end
                                until not game:GetService("Workspace").Enemies:FindFirstChild(Ms) or not AutoFarmLevel or not string.find(GetQuestTitle.Text, NameMon) or v.Humanoid.Health <= 0 or not v.Parent
                                if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
                                Usefastattack = false
                                StartMagnetAutoFarmLevel = false
                            else
                                game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                            end
                        end
                    end
                else
                    StartMagnetAutoFarmLevel = false
                    Usefastattack = false
                    if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
                    Modstween = toTarget(CFrameMon)
                    if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                    elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                    elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                    elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                    elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                    end 
                end
            end
        end
    end
end
local args = {
    [1] = "BuyElectro"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
spawn(function()
    while wait() do
        if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then 
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                SelectToolWeapon = "Combat"
                local args = {
                    [1] = "BuyElectro"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
                local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
                local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
                local args = {
                    [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
                local args = {
                    [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("Candies","Check") then
                    local args = {
                        [1] = "Candies",
                        [2] = "Buy",
                        [3] = 2,
                        [4] = 2
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                local args = {
                    [1] = "BlackbeardReward",
                    [2] = "DragonClaw",
                    [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300  then
                if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("Candies","Check") then
                    local args = {
                        [1] = "Candies",
                        [2] = "Buy",
                        [3] = 2,
                        [4] = 2
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                local args = {
                    [1] = "BlackbeardReward",
                    [2] = "DragonClaw",
                    [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                local args = {
                    [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                local args = {
                    [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end 

            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                SelectToolWeapon = "Black Leg"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299  then
                SelectToolWeapon = "Electro"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                SelectToolWeapon = "Fishman Karate"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299  then
                SelectToolWeapon = "Dragon Claw"
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                SelectToolWeapon = "Superhuman"
            end
        end
    end
end)
spawn(function()
    while wait() do
        local args = {
            [1] = "LegendarySwordDealer",
            [2] = "2"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value < 2200 then
            local args = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = 1
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        else
            local args = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = 1
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0
        end
    end
end)
spawn(function()
    while true do game:GetService("RunService").RenderStepped:Wait()
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if AutoFarmLevel and StartMagnetAutoFarmLevel and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                v.HumanoidRootPart.CFrame = PosMon
                v.Humanoid.JumpPower = 0
                v.Humanoid.WalkSpeed = 0
                v.HumanoidRootPart.CanCollide = false
                v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
                end
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
                v.Humanoid:ChangeState(11)
            end
        end
    end
end)

fastattect = true
local Main = library:Window("Ren","Blox Fruit (Full)")
local AutoFarmTab = Main:Tab("Main")
AllStatsFarm = AutoFarmTab:Label("N/S")
StatusBartilo = "Not Finished"
spawn(function()
    while wait() do
        if AutoFarmLevel then
            if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("Candies","Check") then
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Exp.Text,"2x ends in") then
                    local args = {
                        [1] = "Candies",
                        [2] = "Buy",
                        [3] = 1,
                        [4] = 1
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
            AllStatsFarm:Refresh("Status : Auto Farm Level Work | Elite Hunter : "..game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        else
            AllStatsFarm:Refresh("Status : Auto Farm Level Not Work | Elite Hunter : "..game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        end
    end
end)
AutoFarmTab:Toggle("Auto Farm Full", getgenv().Setting["Auto Farm Full"],function(a)
    AutoFarmLevel = a
end)

AutoFarmTab:Toggle("Auto Awakeken", getgenv().Setting["Auto Awakeken"],function(a)
    AutoAwakeken = a
end)

AutoFarmTab:Button("Secret",function()
    local Client = game.Players.LocalPlayer
    local PC = require(Client.PlayerScripts.CombatFramework.Particle)
    local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
    if not shared.orl then shared.orl = RL.wrapAttackAnimationAsync end
    if not shared.cpc then shared.cpc = PC.play end
    RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
        local Hits = RL.getBladeHits(b,c,d)
        if Hits then
            PC.play = function() end
            a:Play(0.01,0.01,0.01)
            func(Hits)
            PC.play = shared.cpc
            wait(a.length * 0.5)
            a:Stop()
        end
    end
end)

spawn(function()
    if getgenv().Setting["Secret"] == true then
        local Client = game.Players.LocalPlayer
        local PC = require(Client.PlayerScripts.CombatFramework.Particle)
        local RL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
        if not shared.orl then shared.orl = RL.wrapAttackAnimationAsync end
        if not shared.cpc then shared.cpc = PC.play end
        RL.wrapAttackAnimationAsync = function(a,b,c,d,func)
            local Hits = RL.getBladeHits(b,c,d)
            if Hits then
                PC.play = function() end
                a:Play(0.01,0.01,0.01)
                func(Hits)
                PC.play = shared.cpc
                wait(a.length * 0.5)
                a:Stop()
            end
        end
    end
end)

AutoFarmTab:Label("Auto Random Devil Fruit & Auto Store Devil Fruit")
AutoFarmTab:Toggle("Bring Devil Fruit", getgenv().Setting["Bring Devil Fruit"],function(a)
    BringDevilFruit = a
end)
spawn(function()
    while wait() do
        if game.Players.LocalPlayer.Data.Level.Value == 2300 or game.Players.LocalPlayer.Name == "YesIAmNowShutPlease" then

        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if string.find(v.Name,"Fruit") and not UseThireWorld then
                    local FruitName = RemoveSpaces(v.Name)
                    if v.Name == "Bird: Falcon Fruit" then
                        NameFruit = "Bird-Bird: Falcon"
                    elseif v.Name == "Bird: Phoenix Fruit" then
                        NameFruit = "Bird-Bird: Phoenix"
                    elseif v.Name == "Human: Buddha Fruit" then
                        NameFruit = "Human-Human: Buddha"
                    else
                        NameFruit = FruitName.."-"..FruitName
                    end
    
                    local string_1 = "getInventoryFruits";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    for i1,v1 in pairs(Target:InvokeServer(string_1)) do
                        if v1.Name == NameFruit then
                            HaveFruitInStore = true
                        end
                    end
                    if not HaveFruitInStore then
                        local string_1 = "StoreFruit";
                        local string_2 = NameFruit;
                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                        Target:InvokeServer(string_1, string_2);
                    end
                    HaveFruitInStore = false
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if BringDevilFruit then
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:IsA("Tool") and string.find(v.Name,"Fruit") then wait(60)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)  
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name,"Fruit") and not UseThireWorld then
                            local FruitName = RemoveSpaces(v.Name)
                            if v.Name == "Bird: Falcon Fruit" then
                                NameFruit = "Bird-Bird: Falcon"
                            elseif v.Name == "Bird: Phoenix Fruit" then
                                NameFruit = "Bird-Bird: Phoenix"
                            elseif v.Name == "Human: Buddha Fruit" then
                                NameFruit = "Human-Human: Buddha"
                            else
                                NameFruit = FruitName.."-"..FruitName
                            end
            
                            local string_1 = "getInventoryFruits";
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            for i1,v1 in pairs(Target:InvokeServer(string_1)) do
                                if v1.Name == NameFruit then
                                    HaveFruitInStore = true
                                end
                            end
                            if not HaveFruitInStore then
                                local string_1 = "StoreFruit";
                                local string_2 = NameFruit;
                                local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                Target:InvokeServer(string_1, string_2);
                            end
                            HaveFruitInStore = false
                        end
                    end  
                end
            end
        end 
    end
end)

local tablefruithave = {}
HaveStore2 =false
local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
for i,v in next,Remote_GetFruits do
    for i1,v1 in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
        if v.Name == v1.Name then
            HaveStore2 = true
        end
    end
    if HaveStore2 then
        table.insert(tablefruithave,v.Price,v.Name)
    end
    HaveStore2 = false
end

local FrutAwakeken = {
    "Flame-Flame";
    "Ice-Ice";
    "Quake-Quake";
    "Light-Light";
    "Dark-Dark";
    "String-String";
    "Rumble-Rumble";
    "Magma-Magma";
    "Human-Human: Buddha";
}
_G.EatThisFruit = "Notting"
_G.ThisMyFruit = "Not"
_G.NowUEat = false
_G.StopLoop = false
_G.UseThisFruit = "Not"
local YesIHave = false
local YesIHave = false
local function AutoAwakekens()
    if AutoFarmLevel and AutoAwakeken then
        if game.Players.LocalPlayer.Data.Level.Value == 2300 then
            if OldWorld then
                local args = {
                    [1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif NewWorld then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
            elseif ThreeWorld then
                spawn(function()
                    if _G.NowUEat == false then
                        for i,v in next,tablefruithave do
                            for i2,v2 in next,FrutAwakeken do
                                if v == v2 then
                                    YesIHave = true
                                end
                            end
                            if YesIHave then
                                if not game.Players.LocalPlayer.Backpack:FindFirstChild(v) or not game.Players.LocalPlayer.Character:FindFirstChild(v) then
                                    _G.EatThisFruit = v
                                    tablefruithave = {}
                                    HaveStore2 =false
                                    local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
                                    for i,v in next,Remote_GetFruits do
                                        for i1,v1 in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                                            if v.Name == v1.Name then
                                                HaveStore2 = true
                                            end
                                        end
                                        if HaveStore2 then
                                            table.insert(tablefruithave,v.Price,v.Name)
                                        end
                                        HaveStore2 = false
                                    end
                                end
                            end
                            YesIHave = false
                        end

                        for i2,v2 in next,FrutAwakeken do
                            if v == v2 then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v2) or game.Players.LocalPlayer.Character:FindFirstChild(v2) then
                                    _G.NowUEat = true
                                    _G.ThisMyFruit = v2
                                    _G.EatThisFruit = "Return"
                                end
                            end
                        end

                        if tostring(_G.EatThisFruit) ~= "Return" then
                            _G.NowUEat = true
                            print("re")
                            return;
                        end

                        if tostring(_G.EatThisFruit) ~= "Notting" then
                            local args = {
                                [1] = "LoadFruit",
                                [2] = _G.EatThisFruit
                            }
                            
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",tostring(_G.EatThisFruit))
                            _G.NowUEat = true
                        elseif tostring(_G.EatThisFruit) == "Notting" then
                            if _G.StopLoop == false then
                                print("Ws")
                                _G.StopLoop = true
                                local PlaceID = game.PlaceId
                                local AllIDs = {}
                                local foundAnything = ""
                                local actualHour = os.date("!*t").hour
                                local Deleted = false
                                --[[
                                local File = pcall(function()
                                    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                                end)
                                if not File then
                                    table.insert(AllIDs, actualHour)
                                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                end
                                ]]
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

                if _G.NowUEat == true then
                    for i,v in pairs(tablefruithave) do 
                        if tonumber(i) < 1000000 then
                            _G.UseThisFruit = v
                        end
                    end

                    if _G.ThisMyFruit == "Not" then
                        for i2,v2 in next,FrutAwakeken do
                            if v == v2 then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(v2) or game.Players.LocalPlayer.Character:FindFirstChild(v2) then
                                    _G.ThisMyFruit = v2
                                end
                            end
                        end
                        return;
                    end

                    if _G.ThisMyFruit ~= "Not" or _G.ThisMyFruit ~= nil then
                        if _G.ThisMyFruit ~= "Human-Human: Buddha" then
                            _G.BuyThisRaid = _G.ThisMyFruit:split("-")[1]
                        elseif _G.ThisMyFruit == "Human-Human: Buddha" then
                            _G.BuyThisRaid = "Buddha"
                        end
                    end

                    if (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") == nil) and _G.UseThisFruit ~= "Not" and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        spawn(function()
                            local args = {
                                [1] = "LoadFruit",
                                [2] = _G.UseThisFruit
                            }
                            
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.BuyThisRaid)
                            tablefruithave = {}
                            HaveStore2 =false
                            local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
                            for i,v in next,Remote_GetFruits do
                                for i1,v1 in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                                    if v.Name == v1.Name then
                                        HaveStore2 = true
                                    end
                                end
                                if HaveStore2 then
                                    table.insert(tablefruithave,v.Price,v.Name)
                                end
                                HaveStore2 = false
                            end
                        end)
                    elseif (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") == nil) and _G.UseThisFruit == "Not" and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        print("HOP")
                        local PlaceID = game.PlaceId
                        local AllIDs = {}
                        local foundAnything = ""
                        local actualHour = os.date("!*t").hour
                        local Deleted = false
                        --[[
                        local File = pcall(function()
                            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                        end)
                        if not File then
                            table.insert(AllIDs, actualHour)
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        end
                        ]]
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
                        wait(4)
                    end
                    spawn(function()
                        spawn(function()
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then 
                                if NewWorld then
                                    repeat toTarget(CFrame.new(-6438.73535, 250.645355, -4501.50684)) wait() until _G.StopTween == true or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-6438.73535, 250.645355, -4501.50684).Position).Magnitude <= 8
                                elseif ThreeWorld then
                                    repeat toTarget(CFrame.new(-5017.40869, 314.844055, -2823.0127)) wait() until _G.StopTween == true or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-5017.40869, 314.844055, -2823.0127).Position).Magnitude <= 8
                                end
                                if NewWorld then
                                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                                elseif ThreeWorld then
                                    fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                                end
                            end
                        end)
                        spawn(function()
							while wait() do
								pcall(function()
									if game.Players.LocalPlayer.Data.Level.Value == 2300 or game.Players.LocalPlayer.Name == "YesIAmNowShutPlease" then
										if sethiddenproperty then
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
									end
								end) 
							end
						end)
                        spawn(function()
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if game.Players.LocalPlayer.Data.Level.Value == 2300 and AutoAwakeken and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
                                    pcall(function()
                                        repeat wait(.1)
                                            if sethiddenproperty then
                                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                            end
                                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid:ChangeState(15)
                                        until not game.Players.LocalPlayer.Data.Level.Value == 2300 or not v.Parent or v.Humanoid.Health <= 0
                                    end)
                                end
                            end
                        end)

                        if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == true and game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
							if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then

								toTarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,50,0))

							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then

								toTarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,50,0))

							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then

								toTarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,50,0))

							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then

								toTarget(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,50,0))

							elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then

								

							end
						else
                            if game:GetService("Workspace").NPCs:FindFirstChild("Mysterious Entity") then
                                local args = {
                                    [1] = "Awakener",
                                    [2] = "Check"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                local args = {
                                    [1] = "Awakener",
                                    [2] = "Awaken"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            else
                                if NewWorld then
                                    toTarget(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                                elseif ThreeWorld then
                                    toTarget(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818))
                                end
                            end
						end
                    end) 
                end
            end
        end
    end
end

spawn(function()
    while wait() do
        CheckQuest()
        if AutoFarmLevel then
            if game.Players.LocalPlayer.Data.Level.Value ~= 2300 or not AutoAwakeken then
                AutoFarm()
            elseif game.Players.LocalPlayer.Data.Level.Value == 2300 and AutoAwakeken then
                AutoAwakekens()
            end
        end
    end
end)



AutoFarmTab:Button("Redeem All Code",function()
    spawn(function()
        function UseCode(Text)
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
        end
        for i,v in pairs(CodeLibrary) do
            UseCode(v) 
        end
    end)
end)
---------------------------------------------------------------------------------------------------------------------
StatusFinish = Main:Tab("Status Finish")
StatusFinish:Label("Sea 1")
SaberQuest = StatusFinish:Label("Saber Quest : ".. StatusSaber)

StatusFinish:Label("Sea 2")
BartiloQuestLable = StatusFinish:Label("N/S")
RengokuQuestLable = StatusFinish:Label("N/S")
RengokuToggle = StatusFinish:Toggle("Auto Rengoku [ It Auto Work Farm Full At Level 1500 ]",getgenv().Setting["Auto Rengoku"],function(a)
    AutoRengoku = a
end)
if NewWorld then
    RengokuToggle:Unlock()
else
    RengokuToggle:Lock()
end
EvoV2Lable = StatusFinish:Label("Evo V.2 : ".. game:GetService("Players").LocalPlayer.Data.Race.Value .. " Not Evo V.2")
StatusFinish:Label("Sea 3")
PortalKill = StatusFinish:Label("N/S")
CakePrinceToggle = StatusFinish:Toggle("Auto Kill Cake Prince [ It Auto Kill Boss in Sea 3 If Spawn ]",getgenv().Setting["Auto Kill Cake Prince"],function(a)
    AutoKillCakePrince = a
end)
if ThreeWorld then
    CakePrinceToggle:Unlock()
else
    CakePrinceToggle:Lock()
end
spawn(function()
    while wait() do
        if game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
            PortalKill:Refresh("Can Open Door To Kill Cake Prince")
        else
            PortalKill:Refresh("Need Kill Mods " .. string.match(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true), "%d+") .. " To Open Kill Cake Prince")
        end

        BartiloQuestProgress = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") 
        if BartiloQuestProgress == 3 then
            BartiloQuestLable:Refresh("Bartilo Quest : Finished")
        else    
            BartiloQuestLable:Refresh("Bartilo Quest : Not Finished")
        end

        if game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
            EvoV2Lable:Refresh("Evo V.2 : ".. game:GetService("Players").LocalPlayer.Data.Race.Value .. " Evo V.2")
        else    
            EvoV2Lable:Refresh("Evo V.2 : ".. game:GetService("Players").LocalPlayer.Data.Race.Value .. " Not Evo V.2")
        end

        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
            if v.Name == "Rengoku" then
                HaveRengoku = true
            end
            if v.Name == "Saber" then
                HaveSaber = true
            end
        end
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Saber") or game.Players.LocalPlayer.Character:FindFirstChild("Saber") then
            HaveSaber = true
        end
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Rengoku") or game.Players.LocalPlayer.Character:FindFirstChild("Rengoku") then
            HaveRengoku = true
        end

        if HaveSaber then
            SaberQuest:Refresh("Saber Quest : Finished")
        else
            SaberQuest:Refresh("Saber Quest : Not Finished")
        end

        if HaveRengoku then
            RengokuQuestLable:Refresh("Rengoku Quest : Finished")
        else
            RengokuQuestLable:Refresh("Rengoku Quest : Not Finished")
        end
    end
end)

---------------------------------------------------------------------------------------------------------------------
DevilfruitStore = Main:Tab("Devil fruit Store")
RefreshDevilFruitMyStore = DevilfruitStore:Button("Refresh Devil Fruit My Store",function()
    ResetDebilStore()
end)
MyStore = DevilfruitStore:LabelList("Devil Fruit My Store")
OldText = ""
local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
for i,v in next,Remote_GetFruits do
    for i1,v1 in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
        if v.Name == v1.Name then
            HaveStore = true
        end
    end
    if HaveStore then
        MyStore:Add('<font color="#00FF00">' .. v.Name .. " : Have [ " .. v.Price .. " ]</font>")
    else
        MyStore:Add('<font color="#F50D00">' .. v.Name .. " : Not Have [ " .. v.Price .. " ]</font>")
    end
    HaveStore = false
end
function ResetDebilStore()
    RefreshDevilFruitMyStore:Lock()
    MyStore:Clear()
    wait(.5)
    for i,v in next,Remote_GetFruits do
        for i1,v1 in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
            if v.Name == v1.Name then
                HaveStore = true
            end
        end
        if HaveStore then
            MyStore:Add('<font color="#00FF00">' .. v.Name .. " : Have [ " .. v.Price .. " ]</font>")
        else
            MyStore:Add('<font color="#F50D00">' .. v.Name .. " : Not Have [ " .. v.Price .. " ]</font>")
        end
        HaveStore = false
    end
    RefreshDevilFruitMyStore:Unlock()
end
---------------------------------------------------------------------------------------------------------------------
DevilfruitSniper = Main:Tab("Devil fruit Sniper")
SelectDevil = "" or getgenv().Setting["Devil Fruit Sniper Name"]
DevilfruitSniper:Dropdown("Select Devil Fruit Sniper",Table_DevilFruitSniper,0,function(a)
    SelectDevil = a
end)
DevilfruitSniper:Toggle("Buy Devil Fruit Sinper",getgenv().Setting["Devil Fruit Sniper"],function(value)
    if SelectDevil == "" and value then
        royxui:Notification("Notification","Select Devil Fruit",5)
    else
        BuyFruitSinper = value
    end	
end)
spawn(function()
    while wait() do
        if BuyFruitSinper then
            local string_1 = "PurchaseRawFruit";
            local string_2 = SelectDevil;
            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
            Target:InvokeServer(string_1, string_2);
        end   
    end
end)
---------------------------------------------------------------------------------------------------------------------
SettingTab = Main:Tab("Setting")
SettingTab:Button("Rejoin",function()
    ServerHop:Rejoin()
end)
local function HttpGet(url)
    return game:GetService("HttpService"):JSONDecode(htgetf(url))
end
SettingTab:Button("Server Hop",function()
    ServerHop:Teleport()
end)
SettingTab:Button("Server Hop (Less People)",function()
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
            if tonumber(2) > tonumber(v.playing) and v.ping <= 75 then
                print("Find")
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
                    wait(1)
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
SettingTab:Line()
SettingTab:Button("Join discord",function()
	local request = request or http_request or (syn and syn.request)
	if not request then return end
	local start = 6463
	local invCode = 'QgQdx7uCUT'
	for i = start-10, start+1 do
		spawn(function()
			pcall(function()
				request({Url = "http://127.0.0.1:"..tostring(i).."/rpc?v=1",Method = "POST",Headers = {["Content-Type"] = "application/json",["Origin"] = "https://discord.com"},Body = game:GetService("HttpService"):JSONEncode({["cmd"] = "INVITE_BROWSER",["nonce"] = game:GetService("HttpService"):GenerateGUID(false),["args"] = {["invite"] = {["code"] = invCode,},["code"] = invCode}})})
			end)
		end)
	end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

SettingTab:DestroyGui()

local SecretTab = Main:Tab("Secret Tab",true)

SecretTab:Toggle("Super Fast Attack",false,function(value)
    SuperFastAttack = value
end)