local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "ModernBloxFruitsUI"

-- Main Frame (Window)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 1
mainStroke.Color = Color3.fromRGB(50, 50, 50)
mainStroke.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
}
titleGradient.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.9, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Blox Fruits UI"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.SourceSansBold
closeButton.BorderSizePixel = 0
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeButton

-- Side Menu
local sideMenu = Instance.new("Frame")
sideMenu.Size = UDim2.new(0, 100, 1, -30)
sideMenu.Position = UDim2.new(0, 0, 0, 30)
sideMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
sideMenu.BorderSizePixel = 0
sideMenu.Parent = mainFrame

local sideCorner = Instance.new("UICorner")
sideCorner.CornerRadius = UDim.new(0, 10)
sideCorner.Parent = sideMenu

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(0, 300, 1, -30)
contentArea.Position = UDim2.new(0, 100, 0, 30)
contentArea.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
contentArea.BorderSizePixel = 0
contentArea.Parent = mainFrame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 10)
contentCorner.Parent = contentArea

-- Function to Get Player Data (Real-Time)
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

    return string.format(
        "Player: %s\nLevel: %s\nFruit: %s\nBeli: %s\nFragments: %s\nRace: %s",
        player.Name,
        tostring(level),
        fruit,
        tostring(beli),
        tostring(fragments),
        race
    )
end

-- Side Menu Buttons (Compact Design)
local buttons = {
    {Name = "Overview", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            child:Destroy()
        end
        
        local infoLabel = Instance.new("TextLabel")
        infoLabel.Size = UDim2.new(1, -20, 1, -20)
        infoLabel.Position = UDim2.new(0, 10, 0, 10)
        infoLabel.BackgroundTransparency = 1
        infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        infoLabel.TextSize = 16
        infoLabel.Font = Enum.Font.SourceSans
        infoLabel.TextXAlignment = Enum.TextXAlignment.Left
        infoLabel.TextYAlignment = Enum.TextYAlignment.Top
        infoLabel.Parent = contentArea

        RunService.RenderStepped:Connect(function()
            if infoLabel.Parent then
                infoLabel.Text = getPlayerData()
            end
        end)
    end},
    {Name = "Stats", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            child:Destroy()
        end
        local statsLabel = Instance.new("TextLabel")
        statsLabel.Size = UDim2.new(1, -20, 1, -20)
        statsLabel.Position = UDim2.new(0, 10, 0, 10)
        statsLabel.BackgroundTransparency = 1
        statsLabel.Text = "Stats Coming Soon!"
        statsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        statsLabel.TextSize = 16
        statsLabel.Font = Enum.Font.SourceSans
        statsLabel.Parent = contentArea
    end},
    {Name = "Inventory", Content = function()
        for _, child in pairs(contentArea:GetChildren()) do
            child:Destroy()
        end
        local invLabel = Instance.new("TextLabel")
        invLabel.Size = UDim2.new(1, -20, 1, -20)
        invLabel.Position = UDim2.new(0, 10, 0, 10)
        invLabel.BackgroundTransparency = 1
        invLabel.Text = "Inventory Coming Soon!"
        invLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        invLabel.TextSize = 16
        invLabel.Font = Enum.Font.SourceSans
        invLabel.Parent = contentArea
    end}
}

-- Create Side Menu Buttons (Compact and Modern)
for i, btnData in ipairs(buttons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 30) -- Reduced height for compactness
    button.Position = UDim2.new(0, 5, 0, (i-1) * 32 + 5) -- Tighter spacing
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = btnData.Name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14 -- Smaller text for modern feel
    button.Font = Enum.Font.SourceSansSemibold
    button.BorderSizePixel = 0
    button.Parent = sideMenu

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button

    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
    }
    btnGradient.Parent = button

    button.MouseEnter:Connect(function()
        btnGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 70)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 90, 90))
        }
    end)
    button.MouseLeave:Connect(function()
        btnGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
        }
    end)

    button.MouseButton1Click:Connect(btnData.Content)
end

-- Context Menu
local contextMenu = Instance.new("Frame")
contextMenu.Size = UDim2.new(0, 150, 0, #buttons * 30)
contextMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contextMenu.BorderSizePixel = 0
contextMenu.Visible = false
contextMenu.Parent = screenGui

local contextCorner = Instance.new("UICorner")
contextCorner.CornerRadius = UDim.new(0, 10)
contextCorner.Parent = contextMenu

local contextStroke = Instance.new("UIStroke")
contextStroke.Thickness = 1
contextStroke.Color = Color3.fromRGB(60, 60, 60)
contextStroke.Parent = contextMenu

for i, btnData in ipairs(buttons) do
    local contextButton = Instance.new("TextButton")
    contextButton.Size = UDim2.new(1, 0, 0, 30)
    contextButton.Position = UDim2.new(0, 0, 0, (i-1) * 30)
    contextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    contextButton.Text = btnData.Name
    contextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    contextButton.TextSize = 14
    contextButton.Font = Enum.Font.SourceSansSemibold
    contextButton.BorderSizePixel = 0
    contextButton.Parent = contextMenu

    local ctxBtnCorner = Instance.new("UICorner")
    ctxBtnCorner.CornerRadius = UDim.new(0, 8)
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