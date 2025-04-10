local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "ModernBloxFruitsUI"

-- Main Frame (Window)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 350)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 40))
}
mainGradient.Rotation = 45
mainGradient.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 2
mainStroke.Color = Color3.fromRGB(50, 50, 60)
mainStroke.Transparency = 0.8
mainStroke.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleBar

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 35))
}
titleGradient.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.9, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Blox Fruits Dashboard"
titleLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
titleLabel.TextSize = 20
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 20
closeButton.Font = Enum.Font.GothamBold
closeButton.BorderSizePixel = 0
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 15)
closeCorner.Parent = closeButton

-- Side Menu
local sideMenu = Instance.new("Frame")
sideMenu.Size = UDim2.new(0, 120, 1, -40)
sideMenu.Position = UDim2.new(0, 0, 0, 40)
sideMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
sideMenu.BorderSizePixel = 0
sideMenu.Parent = mainFrame

local sideCorner = Instance.new("UICorner")
sideCorner.CornerRadius = UDim.new(0, 15)
sideCorner.Parent = sideMenu

local sideGradient = Instance.new("UIGradient")
sideGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 45))
}
sideGradient.Rotation = 90
sideGradient.Parent = sideMenu

-- Content Area (Scrollable)
local contentArea = Instance.new("ScrollingFrame")
contentArea.Size = UDim2.new(0, 330, 1, -50)
contentArea.Position = UDim2.new(0, 120, 0, 45)
contentArea.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
contentArea.BackgroundTransparency = 0.2
contentArea.BorderSizePixel = 0
contentArea.CanvasSize = UDim2.new(0, 0, 0, 0) -- Auto-adjusts later
contentArea.ScrollBarThickness = 4
contentArea.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 150)
contentArea.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 15)
contentCorner.Parent = contentArea

local contentStroke = Instance.new("UIStroke")
contentStroke.Thickness = 1
contentStroke.Color = Color3.fromRGB(60, 60, 70)
contentStroke.Transparency = 0.7
contentStroke.Parent = contentArea

-- Player Data Function
local function getPlayerData()
    local data = player:WaitForChild("Data", 5)
    if not data then
        return "Data not found!"
    end

    local level = data:FindFirstChild("Level") and data.Level.Value or "N/A"
    local beli = data:FindFirstChild("Beli") and data.Beli.Value or "N/A"
    local fragments = data:FindFirstChild("Fragments") and data.Fragments.Value or "N/A"
    local fruit = data:FindFirstChild("DevilFruit") and data.DevilFruit.Value or "None"
    local race = data:FindFirstChild("Race") and data.Race.Value or "N/A"
    local bounty = data:FindFirstChild("Bounty") and data.Bounty.Value or "N/A" -- Assuming Bounty/Honor
    local fightingStyle = data:FindFirstChild("FightingStyle") and data.FightingStyle.Value or "N/A"
    local sword = data:FindFirstChild("Sword") and data.Sword.Value or "N/A"

    return string.format(
        "Player: %s\nLevel: %s\nFruit: %s\nBeli: %s\nFragments: %s\nRace: %s\nBounty/Honor: %s\nFighting Style: %s\nSword: %s",
        player.Name, tostring(level), fruit, tostring(beli), tostring(fragments), race, tostring(bounty), fightingStyle, sword
    )
end

-- Stats Data Function
local function getStatsData()
    local data = player:WaitForChild("Data", 5)
    if not data then
        return "Stats not found!"
    end

    local melee = data:FindFirstChild("Melee") and data.Melee.Value or "N/A"
    local defense = data:FindFirstChild("Defense") and data.Defense.Value or "N/A"
    local swordStat = data:FindFirstChild("SwordStat") and data.SwordStat.Value or "N/A"
    local gun = data:FindFirstChild("Gun") and data.Gun.Value or "N/A"
    local fruitStat = data:FindFirstChild("FruitStat") and data.FruitStat.Value or "N/A"

    return string.format(
        "Melee: %s\nDefense: %s\nSword: %s\nGun: %s\nFruit: %s",
        tostring(melee), tostring(defense), tostring(swordStat), tostring(gun), tostring(fruitStat)
    )
end

-- Side Menu Buttons
local buttons = {
    {Name = "📋 Overview", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            if child:IsA("TextLabel") then child:Destroy() end
        end
        
        local infoLabel = Instance.new("TextLabel")
        infoLabel.Size = UDim2.new(1, -20, 0, 200)
        infoLabel.Position = UDim2.new(0, 10, 0, 10)
        infoLabel.BackgroundTransparency = 1
        infoLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
        infoLabel.TextSize = 16
        infoLabel.Font = Enum.Font.Gotham
        infoLabel.TextXAlignment = Enum.TextXAlignment.Left
        infoLabel.TextYAlignment = Enum.TextYAlignment.Top
        infoLabel.Parent = contentArea

        contentArea.CanvasSize = UDim2.new(0, 0, 0, 220)
        
        RunService.RenderStepped:Connect(function()
            if infoLabel.Parent then
                infoLabel.Text = getPlayerData()
            end
        end)
    end},
    {Name = "📊 Stats", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            if child:IsA("TextLabel") then child:Destroy() end
        end
        
        local statsLabel = Instance.new("TextLabel")
        statsLabel.Size = UDim2.new(1, -20, 0, 150)
        statsLabel.Position = UDim2.new(0, 10, 0, 10)
        statsLabel.BackgroundTransparency = 1
        statsLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
        statsLabel.TextSize = 16
        statsLabel.Font = Enum.Font.Gotham
        statsLabel.TextXAlignment = Enum.TextXAlignment.Left
        statsLabel.TextYAlignment = Enum.TextYAlignment.Top
        statsLabel.Parent = contentArea

        contentArea.CanvasSize = UDim2.new(0, 0, 0, 170)
        
        RunService.RenderStepped:Connect(function()
            if statsLabel.Parent then
                statsLabel.Text = getStatsData()
            end
        end)
    end},
    {Name = "🎒 Inventory", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            if child:IsA("TextLabel") then child:Destroy() end
        end
        local invLabel = Instance.new("TextLabel")
        invLabel.Size = UDim2.new(1, -20, 0, 50)
        invLabel.Position = UDim2.new(0, 10, 0, 10)
        invLabel.BackgroundTransparency = 1
        invLabel.Text = "Inventory Coming Soon!"
        invLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
        invLabel.TextSize = 16
        invLabel.Font = Enum.Font.Gotham
        invLabel.Parent = contentArea

        contentArea.CanvasSize = UDim2.new(0, 0, 0, 70)
    end}
}

-- Create Side Menu Buttons
for i, btnData in ipairs(buttons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 35)
    button.Position = UDim2.new(0, 5, 0, (i-1) * 40 + 10)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    button.Text = btnData.Name
    button.TextColor3 = Color3.fromRGB(200, 200, 255)
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.BorderSizePixel = 0
    button.Parent = sideMenu

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = button

    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 70))
    }
    btnGradient.Parent = button

    button.MouseEnter:Connect(function()
        btnGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 80)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 100))
        }
    end)
    button.MouseLeave:Connect(function()
        btnGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 50)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 70))
        }
    end)

    button.MouseButton1Click:Connect(btnData.Content)
end

-- Context Menu
local contextMenu = Instance.new("Frame")
contextMenu.Size = UDim2.new(0, 160, 0, #buttons * 35)
contextMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
contextMenu.BackgroundTransparency = 0.1
contextMenu.BorderSizePixel = 0
contextMenu.Visible = false
contextMenu.Parent = screenGui

local contextCorner = Instance.new("UICorner")
contextCorner.CornerRadius = UDim.new(0, 15)
contextCorner.Parent = contextMenu

local contextStroke = Instance.new("UIStroke")
contextStroke.Thickness = 2
contextStroke.Color = Color3.fromRGB(50, 50, 60)
contextStroke.Transparency = 0.8
contextStroke.Parent = contextMenu

for i, btnData in ipairs(buttons) do
    local contextButton = Instance.new("TextButton")
    contextButton.Size = UDim2.new(1, -10, 0, 30)
    contextButton.Position = UDim2.new(0, 5, 0, (i-1) * 35 + 5)
    contextButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    contextButton.Text = btnData.Name
    contextButton.TextColor3 = Color3.fromRGB(200, 200, 255)
    contextButton.TextSize = 14
    contextButton.Font = Enum.Font.GothamSemibold
    contextButton.BorderSizePixel = 0
    contextButton.Parent = contextMenu

    local ctxBtnCorner = Instance.new("UICorner")
    ctxBtnCorner.CornerRadius = UDim.new(0, 10)
    ctxBtnCorner.Parent = contextButton

    contextButton.MouseButton1Click:Connect(function()
        btnData.Content()
        contextMenu.Visible = false
    end)
end

-- Right-Click Context Menu
sideMenu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        contextMenu.Position = UDim2.new(0, input.Position.X, 0, input.Position.Y)
        contextMenu.Visible = true
    end
end)

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        contextMenu.Visible = false
    end
end)

-- Close Button
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Draggable Window
local dragging, dragInput, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

titleBar.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Load Overview by Default
buttons[1].Content()