local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "MaterialBloxFruitsUI"

-- Main Frame (Window)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Visible = true

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1
mainStroke.Color = Color3.fromRGB(180, 180, 180)
mainStroke.Transparency = 0.6
mainStroke.Parent = mainFrame

-- Title Bar (App Bar)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 48)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 137, 123)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 137, 123)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 167, 153))
}
titleGradient.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 12, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Blox Fruits Dashboard v1.3.1"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.RobotoMedium
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -44, 0, 4)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(0, 137, 123)
closeButton.TextSize = 20
closeButton.Font = Enum.Font.RobotoBold
closeButton.BorderSizePixel = 0
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

local closeStroke = Instance.new("UIStroke")
closeStroke.Thickness = 1
closeStroke.Color = Color3.fromRGB(180, 180, 180)
closeStroke.Transparency = 0.6
closeStroke.Parent = closeButton

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 40, 0, 40)
minimizeButton.Position = UDim2.new(1, -88, 0, 4)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Text = "−"
minimizeButton.TextColor3 = Color3.fromRGB(0, 137, 123)
minimizeButton.TextSize = 20
minimizeButton.Font = Enum.Font.RobotoBold
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(1, 0)
minimizeCorner.Parent = minimizeButton

local minimizeStroke = Instance.new("UIStroke")
minimizeStroke.Thickness = 1
minimizeStroke.Color = Color3.fromRGB(180, 180, 180)
minimizeStroke.Transparency = 0.6
minimizeStroke.Parent = minimizeButton

-- Bubble (Minimized State)
local bubble = Instance.new("TextButton")
bubble.Size = UDim2.new(0, 50, 0, 50)
bubble.Position = UDim2.new(0.5, -25, 0.5, -25)
bubble.BackgroundColor3 = Color3.fromRGB(0, 137, 123)
bubble.Text = "🗗"
bubble.TextColor3 = Color3.fromRGB(255, 255, 255)
bubble.TextSize = 24
bubble.Font = Enum.Font.RobotoBold
bubble.BorderSizePixel = 0
bubble.Visible = false
bubble.Parent = screenGui

local bubbleCorner = Instance.new("UICorner")
bubbleCorner.CornerRadius = UDim.new(1, 0)
bubbleCorner.Parent = bubble

local bubbleStroke = Instance.new("UIStroke")
bubbleStroke.Thickness = 2
bubbleStroke.Color = Color3.fromRGB(0, 107, 93)
bubbleStroke.Transparency = 0.5
bubbleStroke.Parent = bubble

-- Side Menu
local sideMenu = Instance.new("Frame")
sideMenu.Size = UDim2.new(0, 100, 1, -48)
sideMenu.Position = UDim2.new(0, 0, 0, 48)
sideMenu.BackgroundTransparency = 1
sideMenu.Parent = mainFrame

-- Content Area (Card)
local contentArea = Instance.new("ScrollingFrame")
contentArea.Size = UDim2.new(0, 300, 1, -56)
contentArea.Position = UDim2.new(0, 100, 0, 52)
contentArea.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
contentArea.BorderSizePixel = 0
contentArea.CanvasSize = UDim2.new(0, 0, 0, 0)
contentArea.ScrollBarThickness = 3
contentArea.ScrollBarImageColor3 = Color3.fromRGB(189, 189, 189)
contentArea.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentArea

local contentStroke = Instance.new("UIStroke")
contentStroke.Thickness = 1
contentStroke.Color = Color3.fromRGB(200, 200, 200)
contentStroke.Transparency = 0.7
contentStroke.Parent = contentArea

-- Player Data Function
local function getPlayerData()
    local data = player:WaitForChild("Data", 5)
    if not data then return "Data not found!" end

    local level = data:FindFirstChild("Level") and data.Level.Value or "N/A"
    local beli = data:FindFirstChild("Beli") and data.Beli.Value or "N/A"
    local fragments = data:FindFirstChild("Fragments") and data.Fragments.Value or "N/A"
    local fruit = data:FindFirstChild("DevilFruit") and data.DevilFruit.Value or "None"
    local race = data:FindFirstChild("Race") and data.Race.Value or "N/A"
    local bounty = data:FindFirstChild("Bounty") and data.Bounty.Value or "N/A"
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
    if not data then return "Stats not found!" end

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
    {Name = "Overview", Icon = "📋", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            if child:IsA("TextLabel") then child:Destroy() end
        end
        
        local infoLabel = Instance.new("TextLabel")
        infoLabel.Size = UDim2.new(1, -20, 0, 180)
        infoLabel.Position = UDim2.new(0, 10, 0, 10)
        infoLabel.BackgroundTransparency = 1
        infoLabel.TextColor3 = Color3.fromRGB(33, 33, 33)
        infoLabel.TextSize = 14
        infoLabel.Font = Enum.Font.Roboto
        infoLabel.TextXAlignment = Enum.TextXAlignment.Left
        infoLabel.TextYAlignment = Enum.TextYAlignment.Top
        infoLabel.Parent = contentArea

        contentArea.CanvasSize = UDim2.new(0, 0, 0, 200)
        
        spawn(function()
            while wait(0.5) and infoLabel.Parent do
                infoLabel.Text = getPlayerData()
            end
        end)
    end},
    {Name = "Stats", Icon = "📊", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            if child:IsA("TextLabel") then child:Destroy() end
        end
        
        local statsLabel = Instance.new("TextLabel")
        statsLabel.Size = UDim2.new(1, -20, 0, 140)
        statsLabel.Position = UDim2.new(0, 10, 0, 10)
        statsLabel.BackgroundTransparency = 1
        statsLabel.TextColor3 = Color3.fromRGB(33, 33, 33)
        statsLabel.TextSize = 14
        statsLabel.Font = Enum.Font.Roboto
        statsLabel.TextXAlignment = Enum.TextXAlignment.Left
        statsLabel.TextYAlignment = Enum.TextYAlignment.Top
        statsLabel.Parent = contentArea

        contentArea.CanvasSize = UDim2.new(0, 0, 0, 160)
        
        spawn(function()
            while wait(0.5) and statsLabel.Parent do
                statsLabel.Text = getStatsData()
            end
        end)
    end},
    {Name = "Inventory", Icon = "🎒", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            if child:IsA("TextLabel") then child:Destroy() end
        end
        local invLabel = Instance.new("TextLabel")
        invLabel.Size = UDim2.new(1, -20, 0, 40)
        invLabel.Position = UDim2.new(0, 10, 0, 10)
        invLabel.BackgroundTransparency = 1
        invLabel.Text = "Inventory Coming Soon!"
        invLabel.TextColor3 = Color3.fromRGB(33, 33, 33)
        invLabel.TextSize = 14
        invLabel.Font = Enum.Font.Roboto
        invLabel.Parent = contentArea

        contentArea.CanvasSize = UDim2.new(0, 0, 0, 60)
    end}
}

-- Create Side Menu Buttons
for i, btnData in ipairs(buttons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -6, 0, 40)
    button.Position = UDim2.new(0, 3, 0, (i-1) * 44 + 6)
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = btnData.Icon .. " " .. btnData.Name
    button.TextColor3 = Color3.fromRGB(0, 137, 123)
    button.TextSize = 14
    button.Font = Enum.Font.RobotoMedium
    button.BorderSizePixel = 0
    button.Parent = sideMenu

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 1
    btnStroke.Color = Color3.fromRGB(180, 180, 180)
    btnStroke.Transparency = 0.7
    btnStroke.Parent = button

    local rippleEffect = Instance.new("Frame")
    rippleEffect.Size = UDim2.new(0, 0, 0, 0)
    rippleEffect.Position = UDim2.new(0.5, 0, 0.5, 0)
    rippleEffect.BackgroundColor3 = Color3.fromRGB(0, 137, 123)
    rippleEffect.BackgroundTransparency = 0.7
    rippleEffect.BorderSizePixel = 0
    rippleEffect.Parent = button
    rippleEffect.Visible = false

    local rippleCorner = Instance.new("UICorner")
    rippleCorner.CornerRadius = UDim.new(1, 0)
    rippleCorner.Parent = rippleEffect

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(1, -6, 0, 42)}):Play()
        btnStroke.Transparency = 0.5
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(1, -6, 0, 40)}):Play()
        btnStroke.Transparency = 0.7
    end)

    button.MouseButton1Down:Connect(function()
        rippleEffect.Visible = true
        local tween = TweenService:Create(rippleEffect, TweenInfo.new(0.3), {
            Size = UDim2.new(2, 0, 2, 0),
            BackgroundTransparency = 1
        })
        tween:Play()
        tween.Completed:Connect(function()
            rippleEffect.Visible = false
            rippleEffect.Size = UDim2.new(0, 0, 0, 0)
            rippleEffect.BackgroundTransparency = 0.7
        end)
    end)

    button.MouseButton1Click:Connect(btnData.Content)
end

-- Context Menu
local contextMenu = Instance.new("Frame")
contextMenu.Size = UDim2.new(0, 140, 0, #buttons * 44)
contextMenu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
contextMenu.BorderSizePixel = 0
contextMenu.Visible = false
contextMenu.Parent = screenGui

local contextCorner = Instance.new("UICorner")
contextCorner.CornerRadius = UDim.new(0, 8)
contextCorner.Parent = contextMenu

local contextStroke = Instance.new("UIStroke")
contextStroke.Thickness = 1
contextStroke.Color = Color3.fromRGB(180, 180, 180)
contextStroke.Transparency = 0.7
contextStroke.Parent = contextMenu

for i, btnData in ipairs(buttons) do
    local contextButton = Instance.new("TextButton")
    contextButton.Size = UDim2.new(1, -6, 0, 40)
    contextButton.Position = UDim2.new(0, 3, 0, (i-1) * 44 + 2)
    contextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    contextButton.Text = btnData.Icon .. " " .. btnData.Name
    contextButton.TextColor3 = Color3.fromRGB(0, 137, 123)
    contextButton.TextSize = 14
    contextButton.Font = Enum.Font.RobotoMedium
    contextButton.BorderSizePixel = 0
    contextButton.Parent = contextMenu

    local ctxBtnCorner = Instance.new("UICorner")
    ctxBtnCorner.CornerRadius = UDim.new(0, 8)
    ctxBtnCorner.Parent = contextButton

    local ctxBtnStroke = Instance.new("UIStroke")
    ctxBtnStroke.Thickness = 1
    ctxBtnStroke.Color = Color3.fromRGB(180, 180, 180)
    ctxBtnStroke.Transparency = 0.7
    ctxBtnStroke.Parent = contextButton

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

-- Minimize Functionality
minimizeButton.MouseButton1Click:Connect(function()
    local mainPos = mainFrame.Position
    mainFrame.Visible = false
    bubble.Position = mainPos
    bubble.Visible = true
    TweenService:Create(bubble, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 50, 0, 50)
    }):Play()
end)

bubble.MouseButton1Click:Connect(function()
    bubble.Visible = false
    mainFrame.Visible = true
    TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 400, 0, 300)
    }):Play()
end)

-- Close Button Functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Draggable Main Frame
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

-- Draggable Bubble
local bubbleDragging, bubbleDragInput, bubbleDragStart, bubbleStartPos
bubble.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        bubbleDragging = true
        bubbleDragStart = input.Position
        bubbleStartPos = bubble.Position
    end
end)

bubble.InputChanged:Connect(function(input)
    if bubbleDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        bubbleDragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if bubbleDragging and input == bubbleDragInput then
        local delta = input.Position - bubbleDragStart
        bubble.Position = UDim2.new(bubbleStartPos.X.Scale, bubbleStartPos.X.Offset + delta.X, bubbleStartPos.Y.Scale, bubbleStartPos.Y.Offset + delta.Y)
    end
end)

bubble.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        bubbleDragging = false
    end
end)

-- Load Overview by Default
buttons[1].Content()