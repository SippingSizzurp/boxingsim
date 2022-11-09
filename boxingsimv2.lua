game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "MADE BY",
    Text = "SippingSizzurp#0962"
})

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("BOXING SIM V2")

local b = w:CreateFolder("IN-RING COMBAT")

local c = w:CreateFolder("OUT-OF-RING COMBAT")

local target = nil
local start = CFrame.new(19.0015545, -11.8443146, 322.31842, -0.790705502, 3.99401134e-09, 0.612196743, 1.943951e-09, 1, -4.01328304e-09, -0.612196743, -1.98324446e-09, -0.790705502)
local mindist = math.huge
local outofringtarget = nil


getgenv().toggle = false
getgenv().toggle2 = false


b:Button("STUCK", function()
    local me = game:GetService("Players").LocalPlayer
    me.Character.HumanoidRootPart.CFrame = start
end)

b:Button("FIND TARGET",function()
    local folder = game:GetService("Workspace").MainGymFolder.MainGymRings:GetChildren()
    for _, v in pairs(folder) do
    
        local inner = v.Players:GetChildren()
    
        for _, playersfolders in pairs(inner) do
            local check = playersfolders:GetChildren()
        
            for _, player in pairs(check) do
                if player.name == game:GetService("Players").LocalPlayer.name then
                    print("found")
                    if player.Parent.name == Player1 then
                        for _, tar in pairs(player.Parent.Parent.Player2:GetChildren()) do
                            target = tar
                        end
                    else
                        for _, tar in pairs(player.Parent.Parent.Player1:GetChildren()) do
                            target = tar
                        end
                    end
                
                    print(target)
                else
                    continue
                end
            end
        end
    end
end)


b:Toggle("TOGGLE",function(bool)
    toggle = bool
    print(toggle)
    spawn(function()
        while toggle do
            wait()
            local me = game:GetService("Players").LocalPlayer
            local final = target.Part.CFrame * CFrame.new(3,5,0) * CFrame.Angles(-1.5708,0,0)
            me.Character.HumanoidRootPart.CFrame = final
        end
    end)
    
end)

c:Button("STUCK", function()
    local me = game:GetService("Players").LocalPlayer
    me.Character.HumanoidRootPart.CFrame = start
end)

c:Button("FIND CLOSEST", function()
    for _, player in next,game:GetService("Players"):GetPlayers() do
        if player~=game.Players.LocalPlayer and
            game.Players.LocalPlayer:DistanceFromCharacter(player.Character.Part.Position) < mindist then
                mindist=game.Players.LocalPlayer:DistanceFromCharacter(player.Character.Part.Position)
                outofringtarget = player
        end
    end
end)

c:Toggle("TOGGLE",function(bool)
    toggle2 = bool
    spawn(function()
        while toggle2 do
            wait()
            local me = game:GetService("Players").LocalPlayer
            local final = outofringtarget.Character.Part.CFrame * CFrame.new(3,5,0) * CFrame.Angles(-1.5708,0,0)
            me.Character.HumanoidRootPart.CFrame = final
        end
    end)
end)
