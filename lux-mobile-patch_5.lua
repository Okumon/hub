local get
get = hookfunction(game.HttpGet, function(asd, url, ...)
    if url == "https://raw.githubusercontent.com/SixZensED/Secret-0.01/main/Secret016.lua" then
        url = "https://raw.githubusercontent.com/bigbangk123/give-evr/main/README.md"
    end
    return get(asd, url, ...) 
end)

task.spawn(function()
	game:GetService("CoreGui"):WaitForChild("libs", math.huge)
	game:GetService("UserInputService").InputBegan:Connect(function(io, p)
		if io.KeyCode == Enum.KeyCode.RightControl and not p then
			local ui = game:GetService("CoreGui").libs
			ui.Enabled = not ui.Enabled
		end
	end)
end)

-- This file was generated using Luraph Obfuscator v13.5.9
