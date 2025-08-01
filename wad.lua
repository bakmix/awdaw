local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Notification function
local onMessage = function(message)  
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Notification",
        Text = message,
        Duration = 10,
        Icon = "rbxassetid://120191430745933"
    })
end

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 320)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -160)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 6)
Corner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TopBar.BorderSizePixel = 0

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Key Status"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.Gotham
Title.TextSize = 14

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.Parent = CloseButton

-- Logo
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0.5, -30, 0, 35)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://1500x1500" -- Replace with your logo asset ID

-- Description text
local Description = Instance.new("TextLabel")
Description.Name = "Description"
Description.Size = UDim2.new(1, -40, 0, 40)
Description.Position = UDim2.new(0, 20, 0, 100)
Description.BackgroundTransparency = 1
Description.Text = "Check your premium key expiration date."
Description.TextColor3 = Color3.fromRGB(200, 200, 200)
Description.Font = Enum.Font.Gotham
Description.TextSize = 14
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left

-- Key input
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(1, -40, 0, 35)
KeyInput.Position = UDim2.new(0, 20, 0, 150)
KeyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Enter your key."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.ClearTextOnFocus = false

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 4)
KeyInputCorner.Parent = KeyInput

-- Checkbox container
local CheckboxContainer = Instance.new("Frame")
CheckboxContainer.Name = "CheckboxContainer"
CheckboxContainer.Size = UDim2.new(1, -40, 0, 70)
CheckboxContainer.Position = UDim2.new(0, 20, 0, 195)
CheckboxContainer.BackgroundTransparency = 1

-- Get Key checkbox
local GetKeyFrame = Instance.new("Frame")
GetKeyFrame.Name = "GetKeyFrame"
GetKeyFrame.Size = UDim2.new(1, 0, 0, 25)
GetKeyFrame.BackgroundTransparency = 1

local GetKeyCheckbox = Instance.new("ImageButton")
GetKeyCheckbox.Name = "GetKeyCheckbox"
GetKeyCheckbox.Size = UDim2.new(0, 20, 0, 20)
GetKeyCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GetKeyCheckbox.Image = "rbxassetid://3570695787" -- Default checkbox image
GetKeyCheckbox.ScaleType = Enum.ScaleType.Fit

local GetKeyCheckboxCorner = Instance.new("UICorner")
GetKeyCheckboxCorner.CornerRadius = UDim.new(0, 4)
GetKeyCheckboxCorner.Parent = GetKeyCheckbox

local GetKeyLabel = Instance.new("TextLabel")
GetKeyLabel.Name = "GetKeyLabel"
GetKeyLabel.Size = UDim2.new(1, -25, 1, 0)
GetKeyLabel.Position = UDim2.new(0, 25, 0, 0)
GetKeyLabel.BackgroundTransparency = 1
GetKeyLabel.Text = "Get Key"
GetKeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyLabel.Font = Enum.Font.Gotham
GetKeyLabel.TextSize = 14
GetKeyLabel.TextXAlignment = Enum.TextXAlignment.Left

local GetKeyIcon = Instance.new("ImageLabel")
GetKeyIcon.Name = "GetKeyIcon"
GetKeyIcon.Size = UDim2.new(0, 18, 0, 18)
GetKeyIcon.Position = UDim2.new(0, 0, 0.5, -9)
GetKeyIcon.BackgroundTransparency = 1
GetKeyIcon.Image = "rbxassetid://3570695787" -- Replace with your icon asset ID

GetKeyCheckbox.Parent = GetKeyFrame
GetKeyLabel.Parent = GetKeyFrame
GetKeyIcon.Parent = GetKeyFrame
GetKeyFrame.Parent = CheckboxContainer

-- Check Expiry Date checkbox
local CheckExpiryFrame = Instance.new("Frame")
CheckExpiryFrame.Name = "CheckExpiryFrame"
CheckExpiryFrame.Size = UDim2.new(1, 0, 0, 25)
CheckExpiryFrame.Position = UDim2.new(0, 0, 0, 30)
CheckExpiryFrame.BackgroundTransparency = 1

local CheckExpiryCheckbox = Instance.new("ImageButton")
CheckExpiryCheckbox.Name = "CheckExpiryCheckbox"
CheckExpiryCheckbox.Size = UDim2.new(0, 20, 0, 20)
CheckExpiryCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CheckExpiryCheckbox.Image = "rbxassetid://3570695787" -- Default checkbox image
CheckExpiryCheckbox.ScaleType = Enum.ScaleType.Fit

local CheckExpiryCheckboxCorner = Instance.new("UICorner")
CheckExpiryCheckboxCorner.CornerRadius = UDim.new(0, 4)
CheckExpiryCheckboxCorner.Parent = CheckExpiryCheckbox

local CheckExpiryLabel = Instance.new("TextLabel")
CheckExpiryLabel.Name = "CheckExpiryLabel"
CheckExpiryLabel.Size = UDim2.new(1, -25, 1, 0)
CheckExpiryLabel.Position = UDim2.new(0, 25, 0, 0)
CheckExpiryLabel.BackgroundTransparency = 1
CheckExpiryLabel.Text = "Check Expiry Date"
CheckExpiryLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckExpiryLabel.Font = Enum.Font.Gotham
CheckExpiryLabel.TextSize = 14
CheckExpiryLabel.TextXAlignment = Enum.TextXAlignment.Left

local CheckExpiryIcon = Instance.new("ImageLabel")
CheckExpiryIcon.Name = "CheckExpiryIcon"
CheckExpiryIcon.Size = UDim2.new(0, 18, 0, 18)
CheckExpiryIcon.Position = UDim2.new(0, 0, 0.5, -9)
CheckExpiryIcon.BackgroundTransparency = 1
CheckExpiryIcon.Image = "rbxassetid://3570695787" -- Replace with your icon asset ID

CheckExpiryCheckbox.Parent = CheckExpiryFrame
CheckExpiryLabel.Parent = CheckExpiryFrame
CheckExpiryIcon.Parent = CheckExpiryFrame
CheckExpiryFrame.Parent = CheckboxContainer

-- Footer text
local FooterText = Instance.new("TextLabel")
FooterText.Name = "FooterText"
FooterText.Size = UDim2.new(1, -40, 0, 20)
FooterText.Position = UDim2.new(0, 20, 0, 270)
FooterText.BackgroundTransparency = 1
FooterText.Text = "Keys typically last 30 days"
FooterText.TextColor3 = Color3.fromRGB(150, 150, 150)
FooterText.Font = Enum.Font.Gotham
FooterText.TextSize = 12
FooterText.TextXAlignment = Enum.TextXAlignment.Left

-- Social buttons container
local SocialButtons = Instance.new("Frame")
SocialButtons.Name = "SocialButtons"
SocialButtons.Size = UDim2.new(1, -40, 0, 30)
SocialButtons.Position = UDim2.new(0, 20, 0, 280)
SocialButtons.BackgroundTransparency = 1

-- Discord button
local DiscordButton = Instance.new("ImageButton")
DiscordButton.Name = "DiscordButton"
DiscordButton.Size = UDim2.new(0, 30, 0, 30)
DiscordButton.Position = UDim2.new(0, 0, 0, 0)
DiscordButton.BackgroundTransparency = 1
DiscordButton.Image = "rbxassetid://discordicon" -- Replace with your Discord icon asset ID

-- Website button
local WebsiteButton = Instance.new("ImageButton")
WebsiteButton.Name = "WebsiteButton"
WebsiteButton.Size = UDim2.new(0, 30, 0, 30)
WebsiteButton.Position = UDim2.new(0, 40, 0, 0)
WebsiteButton.BackgroundTransparency = 1
WebsiteButton.Image = "rbxassetid://3570695787" -- Replace with your website icon asset ID

DiscordButton.Parent = SocialButtons
WebsiteButton.Parent = SocialButtons

-- Assemble GUI
TopBar.Parent = MainFrame
Title.Parent = TopBar
CloseButton.Parent = TopBar
Logo.Parent = MainFrame
Description.Parent = MainFrame
KeyInput.Parent = MainFrame
CheckboxContainer.Parent = MainFrame
FooterText.Parent = MainFrame
SocialButtons.Parent = MainFrame
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

-- Checkbox functionality
local function toggleCheckbox(checkbox)
    local isChecked = checkbox.Image == "rbxassetid://3570695787" -- Default unchecked image
    if isChecked then
        checkbox.Image = "rbxassetid://3570695787" -- Replace with checked image asset ID
    else
        checkbox.Image = "rbxassetid://3570695787" -- Default unchecked image
    end
end

GetKeyCheckbox.MouseButton1Click:Connect(function()
    toggleCheckbox(GetKeyCheckbox)
    setclipboard("https://bakmix.pro/key-sytem")
    onMessage("🌐 Key website copied to clipboard")
end)

CheckExpiryCheckbox.MouseButton1Click:Connect(function()
    toggleCheckbox(CheckExpiryCheckbox)
    local key = KeyInput.Text:gsub("%s+", "")
    
    if key == "" then
        onMessage("🔑 Please enter a key!")
        return
    end
    
    -- Create request URL
    local url = "https://bakmix.pro/raw/callback?key=" .. HttpService:UrlEncode(key)
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success then
        local data = HttpService:JSONDecode(response)
        if data.status == "success" then
            onMessage("✅ Key is valid!")
            onMessage("⏳ Expires: " .. data.data.expires_at)
        else
            onMessage("❌ " .. (data.message or "Invalid key"))
        end
    else
        onMessage("🌐 Connection Error")
        warn("🌐 Request Error: " .. response)
    end
end)

-- Social buttons functionality
DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/9vWsKfRnQr")
    onMessage("🌐 Discord link copied to clipboard")
end)

WebsiteButton.MouseButton1Click:Connect(function()
    setclipboard("https://bakmix.pro")
    onMessage("🌐 Website URL copied to clipboard")
end)

-- Make GUI responsive to different devices
local function updateUIScale()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
    local scale = isMobile and 1.2 or 1
    
    MainFrame.Size = UDim2.new(0, 350 * scale, 0, 320 * scale)
    MainFrame.Position = UDim2.new(0.5, -175 * scale, 0.5, -160 * scale)
end

updateUIScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateUIScale)
UserInputService.TouchEnabled:Connect(updateUIScale)
