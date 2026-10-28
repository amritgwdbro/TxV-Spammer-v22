-- [[ 👑 TvX Ultimate Spammer - kiAn Presets Panel Edition 👑 ]] --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Purana GUI safely delete karo
pcall(function()
    if PlayerGui:FindFirstChild("TvX Ultimate Spammer Made By Kian Sir") then
        PlayerGui["TvX Ultimate Spammer Made By Kian Sir"]:Destroy()
    end
end)

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TvX Ultimate Spammer Made By Kian Sir"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 1. Floating Toggle Button (Circle shape, bada, ☠️ Emoji ke sath)
local FloatBtn = Instance.new("TextButton")
FloatBtn.Size = UDim2.new(0, 60, 0, 60)
FloatBtn.Position = UDim2.new(0, 20, 0.4, 0)
FloatBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FloatBtn.Text = "☠️"
FloatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatBtn.TextSize = 24
FloatBtn.Font = Enum.Font.SourceSansBold
FloatBtn.Active = true
FloatBtn.Draggable = true
FloatBtn.Parent = ScreenGui

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 0)
FloatCorner.Parent = FloatBtn

-- 2. Main Spammer Control Panel (Mid mein rectangular bada size)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 430)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -215)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false -- Shuru mein hidden rahega
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Extra Banner Box (Purple Title & Blue Subtitle ke sath)
local BannerBox = Instance.new("Frame")
BannerBox.Size = UDim2.new(0.9, 0, 0, 75)
BannerBox.Position = UDim2.new(0.05, 0, 0.03, 0)
BannerBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BannerBox.BorderSizePixel = 0
BannerBox.Parent = MainFrame

local BannerCorner = Instance.new("UICorner")
BannerCorner.CornerRadius = UDim.new(0, 8)
BannerCorner.Parent = BannerBox

-- Purple Title Text
local PurpleTitle = Instance.new("TextLabel")
PurpleTitle.Size = UDim2.new(1, 0, 0, 35)
PurpleTitle.Position = UDim2.new(0, 0, 0.1, 0)
PurpleTitle.BackgroundTransparency = 1
PurpleTitle.Text = "The Ultimate spammer Made By Kian Sir"
PurpleTitle.TextColor3 = Color3.fromRGB(170, 0, 255) -- Purple Color
PurpleTitle.TextSize = 15
PurpleTitle.Font = Enum.Font.SourceSansBold
PurpleTitle.TextWrapped = true
PurpleTitle.Parent = BannerBox

-- Blue Subtitle Text
local BlueSubtitle = Instance.new("TextLabel")
BlueSubtitle.Size = UDim2.new(1, 0, 0, 30)
BlueSubtitle.Position = UDim2.new(0, 0, 0.52, 0)
BlueSubtitle.BackgroundTransparency = 1
BlueSubtitle.Text = "This script isnot for kids it's for only Adults LWL"
BlueSubtitle.TextColor3 = Color3.fromRGB(0, 170, 255) -- Blue Color
BlueSubtitle.TextSize = 12
BlueSubtitle.Font = Enum.Font.SourceSansBold
BlueSubtitle.TextWrapped = true
BlueSubtitle.Parent = BannerBox

-- Target Name Input
local TargetBox = Instance.new("TextBox")
TargetBox.Size = UDim2.new(0.9, 0, 0, 35)
TargetBox.Position = UDim2.new(0.05, 0, 0.22, 0)
TargetBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.PlaceholderText = "Target Name (e.g. Player1)"
TargetBox.Text = ""
TargetBox.TextSize = 13
TargetBox.Font = Enum.Font.SourceSans
TargetBox.ClearTextOnFocus = false
TargetBox.Parent = MainFrame

local TargetCorner = Instance.new("UICorner")
TargetCorner.CornerRadius = UDim.new(0, 6)
TargetCorner.Parent = TargetBox

-- Delay Input (0.1 se 10 seconds tak)
local DelayBox = Instance.new("TextBox")
DelayBox.Size = UDim2.new(0.9, 0, 0, 35)
DelayBox.Position = UDim2.new(0.05, 0, 0.35, 0)
DelayBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DelayBox.TextColor3 = Color3.fromRGB(255, 255, 255)
DelayBox.PlaceholderText = "Delay (0.1 - 10 seconds)"
DelayBox.Text = "1.5"
DelayBox.TextSize = 13
DelayBox.Font = Enum.Font.SourceSans
DelayBox.Parent = MainFrame

local DelayCorner = Instance.new("UICorner")
DelayCorner.CornerRadius = UDim.new(0, 6)
DelayCorner.Parent = DelayBox

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.9, 0, 0, 25)
StatusLabel.Position = UDim2.new(0.05, 0, 0.48, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: OFF 🔴"
StatusLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
StatusLabel.TextSize = 15
StatusLabel.Font = Enum.Font.SourceSansBold
StatusLabel.Parent = MainFrame

-- START Button
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.42, 0, 0, 40)
StartBtn.Position = UDim2.new(0.05, 0, 0.58, 0)
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 75)
StartBtn.Text = "START"
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.TextSize = 15
StartBtn.Font = Enum.Font.SourceSansBold
StartBtn.Parent = MainFrame

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 8)
StartCorner.Parent = StartBtn

-- STOP Button
local StopBtn = Instance.new("TextButton")
StopBtn.Size = UDim2.new(0.42, 0, 0, 40)
StopBtn.Position = UDim2.new(0.53, 0, 0.58, 0)
StopBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
StopBtn.Text = "STOP"
StopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopBtn.TextSize = 15
StopBtn.Font = Enum.Font.SourceSansBold
StopBtn.Parent = MainFrame

local StopCorner = Instance.new("UICorner")
StopCorner.CornerRadius = UDim.new(0, 8)
StopCorner.Parent = StopBtn

-- CLOSE GUI Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0.9, 0, 0, 35)
CloseBtn.Position = UDim2.new(0.05, 0, 0.72, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CloseBtn.Text = "CLOSE GUI"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Floating Button click karne par Menu show/hide hoga
FloatBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Presets with @@@@@ and [Target name]
local presets = {
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[Target name] TMKC Mein godly beam godly wave parallel wave dimension ka bhandara TvX God",
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[Target name] TMKC Mein PowerFull Nova Dimension Dark Power bada Pao Diamond TvX God",
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[Target name] TMKC Mein Diamond Space Supre Nova Fairy tail Dimension JJK Series TvX God",
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[Target name] TMKC Mein Ice-Truck Thanda Fridge Ice land Ice ka fhawara TvX God",
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@[Target name] TMKC Mein Devil Dimension Hyper Power Lazy Dimension Plugboard TvX god"
}

-- Chat Send Function with your custom tag
local function sendChatMessage(msg)
    local extraTag = "//--//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//-//🔥UltiMateTvX Spammer VerSion2 By Kian🔥"
    local fullMsg = msg .. " | " .. extraTag

    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local generalChannel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if generalChannel then
                generalChannel:SendAsync(fullMsg)
                return
            end
        end
    end)
    
    pcall(function()
        local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents then
            local sayMessageRequest = chatEvents:FindFirstChild("SayMessageRequest")
            if sayMessageRequest then
                sayMessageRequest:FireServer(fullMsg, "All")
            end
        end
    end)
end

-- Spammer Logic Variables
local spamming = false

-- START Button Logic
StartBtn.MouseButton1Click:Connect(function()
    if not spamming then
        spamming = true
        StatusLabel.Text = "Status: ON 🟢"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        task.spawn(function()
            local index = 1
            while spamming do
                local targetName = TargetBox.Text
                if targetName == "" then targetName = "Target" end
                
                local rawPreset = presets[index]
                local finalMsg = rawPreset:gsub("%[Target name%]", targetName)
                
                sendChatMessage(finalMsg)
                
                index = index + 1
                if index > #presets then
                    index = 1
                end
                
                local delayTime = tonumber(DelayBox.Text) or 1.5
                if delayTime < 0.1 then delayTime = 0.1 end
                if delayTime > 10 then delayTime = 10 end
                
                task.wait(delayTime)
            end
        end)
    end
end)

-- STOP Button Logic
StopBtn.MouseButton1Click:Connect(function()
    spamming = false
    StatusLabel.Text = "Status: OFF 🔴"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
end)

-- CLOSE GUI Button Logic
CloseBtn.MouseButton1Click:Connect(function()
    spamming = false
    ScreenGui:Destroy()
end)
