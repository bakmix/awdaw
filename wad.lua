local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Notification function
local function onMessage(message)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Bakmix",
        Text = message,
        Duration = 5,
        Icon = "rbxassetid://1500x1500logo" -- Replace with your logo asset ID
    })
end

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BakmixKeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main container with modern design
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 300) -- Adjusted height
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = MainFrame

-- Top bar with logo
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
TopBar.BorderSizePixel = 0

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 10)
TopBarCorner.Parent = TopBar

-- Logo (replace with your asset ID)
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0, 30, 0, 30)
Logo.Position = UDim2.new(0, 10, 0.5, -15)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://1500x1500logo" -- Your logo asset ID
Logo.ScaleType = Enum.ScaleType.Fit

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 50, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "KEY STATUS"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

local CloseButton = Instance.new("ImageButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0.5, -15)
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Image = "rbxassetid://closeicon" -- Replace with your close icon asset ID

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(1, 0)
CloseButtonCorner.Parent = CloseButton

-- Key input section
local KeyInputLabel = Instance.new("TextLabel")
KeyInputLabel.Name = "KeyInputLabel"
KeyInputLabel.Size = UDim2.new(1, -40, 0, 20)
KeyInputLabel.Position = UDim2.new(0, 20, 0, 60)
KeyInputLabel.BackgroundTransparency = 1
KeyInputLabel.Text = "ENTER YOUR KEY"
KeyInputLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
KeyInputLabel.TextXAlignment = Enum.TextXAlignment.Left
KeyInputLabel.Font = Enum.Font.Gotham
KeyInputLabel.TextSize = 12

local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(1, -40, 0, 40)
KeyInput.Position = UDim2.new(0, 20, 0, 85)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Paste your key here..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.ClearTextOnFocus = false

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 6)
KeyInputCorner.Parent = KeyInput

-- Get Key button with icon
local GetKeyButton = Instance.new("ImageButton")
GetKeyButton.Name = "GetKeyButton"
GetKeyButton.Size = UDim2.new(1, -40, 0, 40)
GetKeyButton.Position = UDim2.new(0, 20, 0, 140)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(255, 180, 0) -- Yellow
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Image = "rbxassetid://getkeyicon" -- Replace with your icon asset ID
GetKeyButton.ScaleType = Enum.ScaleType.Fit

local GetKeyLabel = Instance.new("TextLabel")
GetKeyLabel.Name = "GetKeyLabel"
GetKeyLabel.Size = UDim2.new(1, -50, 1, 0)
GetKeyLabel.Position = UDim2.new(0, 50, 0, 0)
GetKeyLabel.BackgroundTransparency = 1
GetKeyLabel.Text = "GET KEY"
GetKeyLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
GetKeyLabel.TextXAlignment = Enum.TextXAlignment.Left
GetKeyLabel.Font = Enum.Font.GothamBold
GetKeyLabel.TextSize = 14

local GetKeyButtonCorner = Instance.new("UICorner")
GetKeyButtonCorner.CornerRadius = UDim.new(0, 6)
GetKeyButtonCorner.Parent = GetKeyButton

-- Check Key button with icon
local CheckKeyButton = Instance.new("ImageButton")
CheckKeyButton.Name = "CheckKeyButton"
CheckKeyButton.Size = UDim2.new(1, -40, 0, 40)
CheckKeyButton.Position = UDim2.new(0, 20, 0, 190)
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(0, 180, 120) -- Green
CheckKeyButton.BorderSizePixel = 0
CheckKeyButton.Image = "rbxassetid://checkkeyicon" -- Replace with your icon asset ID
CheckKeyButton.ScaleType = Enum.ScaleType.Fit

local CheckKeyLabel = Instance.new("TextLabel")
CheckKeyLabel.Name = "CheckKeyLabel"
CheckKeyLabel.Size = UDim2.new(1, -50, 1, 0)
CheckKeyLabel.Position = UDim2.new(0, 50, 0, 0)
CheckKeyLabel.BackgroundTransparency = 1
CheckKeyLabel.Text = "CHECK EXPIRY DATE"
CheckKeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyLabel.TextXAlignment = Enum.TextXAlignment.Left
CheckKeyLabel.Font = Enum.Font.GothamBold
CheckKeyLabel.TextSize = 14

local CheckKeyButtonCorner = Instance.new("UICorner")
CheckKeyButtonCorner.CornerRadius = UDim.new(0, 6)
CheckKeyButtonCorner.Parent = CheckKeyButton

-- Info text
local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoText"
InfoText.Size = UDim2.new(1, -40, 0, 20)
InfoText.Position = UDim2.new(0, 20, 0, 240)
InfoText.BackgroundTransparency = 1
InfoText.Text = "Keys typically last 30 days"
InfoText.TextColor3 = Color3.fromRGB(150, 150, 150)
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 12

-- Footer with social buttons
local Footer = Instance.new("Frame")
Footer.Name = "Footer"
Footer.Size = UDim2.new(1, -40, 0, 40)
Footer.Position = UDim2.new(0, 20, 1, -50)
Footer.BackgroundTransparency = 1

-- Website button
local WebsiteButton = Instance.new("ImageButton")
WebsiteButton.Name = "WebsiteButton"
WebsiteButton.Size = UDim2.new(0, 35, 0, 35)
WebsiteButton.Position = UDim2.new(0, 0, 0, 0)
WebsiteButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
WebsiteButton.BorderSizePixel = 0
WebsiteButton.Image = "rbxassetid://websiteicon" -- Replace with your icon asset ID

local WebsiteButtonCorner = Instance.new("UICorner")
WebsiteButtonCorner.CornerRadius = UDim.new(1, 0)
WebsiteButtonCorner.Parent = WebsiteButton

-- Discord button
local DiscordButton = Instance.new("ImageButton")
DiscordButton.Name = "DiscordButton"
DiscordButton.Size = UDim2.new(0, 35, 0, 35)
DiscordButton.Position = UDim2.new(0, 45, 0, 0)
DiscordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- Discord blue
DiscordButton.BorderSizePixel = 0
DiscordButton.Image = "rbxassetid://discordicon" -- Replace with your icon asset ID

local DiscordButtonCorner = Instance.new("UICorner")
DiscordButtonCorner.CornerRadius = UDim.new(1, 0)
DiscordButtonCorner.Parent = DiscordButton

-- Assemble GUI
TopBar.Parent = MainFrame
Logo.Parent = TopBar
Title.Parent = TopBar
CloseButton.Parent = TopBar

KeyInputLabel.Parent = MainFrame
KeyInput.Parent = MainFrame
GetKeyButton.Parent = MainFrame
GetKeyLabel.Parent = GetKeyButton
CheckKeyButton.Parent = MainFrame
CheckKeyLabel.Parent = CheckKeyButton
InfoText.Parent = MainFrame
Footer.Parent = MainFrame
WebsiteButton.Parent = Footer
DiscordButton.Parent = Footer

MainFrame.Parent = ScreenGui
ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Draggable functionality
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Button hover effects
local function createHoverEffect(button)
    local originalColor = button.BackgroundColor3
    local hoverColor = Color3.new(
        math.min(originalColor.R * 1.2, 1),
        math.min(originalColor.G * 1.2, 1),
        math.min(originalColor.B * 1.2, 1)
    )
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
    end)
end

createHoverEffect(GetKeyButton)
createHoverEffect(CheckKeyButton)
createHoverEffect(WebsiteButton)
createHoverEffect(DiscordButton)

-- Button click effects
local function createClickEffect(button)
    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {Size = UDim2.new(button.Size.X.Scale, button.Size.X.Offset * 0.95, button.Size.Y.Scale, button.Size.Y.Offset * 0.95)}):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {Size = UDim2.new(button.Size.X.Scale, button.Size.X.Offset / 0.95, button.Size.Y.Scale, button.Size.Y.Offset / 0.95)}):Play()
    end)
end

createClickEffect(GetKeyButton)
createClickEffect(CheckKeyButton)
createClickEffect(WebsiteButton)
createClickEffect(DiscordButton)

-- Get Key button functionality
GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://bakmix.pro/key-system")
    onMessage("🌐 Key website copied to clipboard")
end)

-- Website button functionality
WebsiteButton.MouseButton1Click:Connect(function()
    setclipboard("https://bakmix.pro")
    onMessage("🌐 Website URL copied to clipboard")
end)

-- Discord button functionality
DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/bakmix")
    onMessage("🌐 Discord link copied to clipboard")
end)

-- Check Key button functionality
CheckKeyButton.MouseButton1Click:Connect(function()
    local key = KeyInput.Text:gsub("%s+", "")
    
    if key == "" then
        onMessage("🔑 Please enter a key!")
        return
    end
    
    -- Create request URL
    local url = "https://bakmix.pro/api/check-key?key=" .. HttpService:UrlEncode(key)
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success then
        local data = HttpService:JSONDecode(response)
        if data.status == "success" then
            onMessage("✅ Key is valid!")
            onMessage("⏳ Expires: " .. data.expiry_date)
            
            -- Set global variables
            _G.Key = key
            _G.PASSWORD = "bakmix2023"
            
            -- Load script if in supported place
            local allowedPlaces = {
                {placeId = 3678761576, scriptUrl = "https://bakmix.pro/scripts/ww1.lua"}
            }
            
            local playerPlaceId = game.PlaceId
            local scriptToLoad = nil
            
            for _, place in ipairs(allowedPlaces) do
                if playerPlaceId == place.placeId then
                    scriptToLoad = place.scriptUrl
                    break
                end
            end
            
            if scriptToLoad then
                loadstring(game:HttpGet(scriptToLoad))()
                wait(1)
                loadstring(game:HttpGet("https://bakmix.pro/scripts/webhook.lua"))()
                ScreenGui:Destroy()
            end
        else
            onMessage("❌ " .. (data.message or "Invalid key"))
        end
    else
        onMessage("🌐 Connection Error")
        warn("🌐 Request Error: " .. response)
    end
end)

-- Make GUI responsive to different devices
local function updateUIScale()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
    local scale = isMobile and math.min(1, math.min(viewportSize.X / 800, viewportSize.Y / 600)) 
                 or math.min(1, math.min(viewportSize.X / 1920, viewportSize.Y / 1080) * 1.2)
    
    MainFrame.Size = UDim2.new(0, 350 * scale, 0, 300 * scale)
    MainFrame.Position = UDim2.new(0.5, -175 * scale, 0.5, -150 * scale)
    
    -- Adjust text sizes for mobile
    if isMobile then
        Title.TextSize = 14 * scale
        KeyInputLabel.TextSize = 10 * scale
        KeyInput.TextSize = 12 * scale
        GetKeyLabel.TextSize = 12 * scale
        CheckKeyLabel.TextSize = 12 * scale
        InfoText.TextSize = 10 * scale
    end
end

updateUIScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateUIScale)
