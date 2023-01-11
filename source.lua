local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "🏛 Cynacol's Script Hub", HidePremium = true, IntroEnabled = false, SaveConfig = true, ConfigFolder = "CynacolHubConfig"})
local playerslist = {}

for i, v in pairs(game.Players:GetChildren()) do
	if not v.Name == game.Players.LocalPlayer.Name then table.insert(playerslist, v.Name) return end	
end

local InfoTab = Window:MakeTab({
	Name = "Info & Welcome",
	PremiumOnly = false
})

local Randomscripts = Window:MakeTab({
	Name = "Miscellaneous",
	PremiumOnly = false
})

local Specific = Window:MakeTab({
	Name = "Specific Games",
	PremiumOnly = false
})


local SpecificSectionD = Specific:AddSection({
	Name = "Doors"
})

local SpecificSection1 = Specific:AddSection({
	Name = "Rainbow Friends"
})

local SpecificSectionF = Specific:AddSection({
	Name = "Fling Things and People"
})

local SpecificSection2 = Specific:AddSection({
	Name = "Epic Minigames"
})

local SpecificSection3 = Specific:AddSection({
	Name = "Horrific Housing"
})

local SpecificSection4 = Specific:AddSection({
	Name = "Build A Boat For Treasure"
})

local SpecificSection5 = Specific:AddSection({
	Name = "Victory Race"
})

local SpecificSectionS = Specific:AddSection({
	Name = "Shadovis RPG"
})

local SpecificSection6 = Specific:AddSection({
	Name = "Prison Life"
})

InfoTab:AddParagraph("Welcome","This is something I originally made for myself just for easily executing scripts, so I don't have to keep looking them up and pasting them into my executor. This mainly is for multiple games I play every now and then, and it may contain some remote event manipulation. It will mostly be scripts that I find for games that I play. If you want me to add something tell me at my discord: Cynacol#2589                        Made by Cynacol / DementedDivinity")
Randomscripts:AddButton({
    Name = "Infinite Yield FE Admin",
    Callback = function()
        loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

Randomscripts:AddButton({
    Name = "CMD-X FE Admin",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
    end
})

Randomscripts:AddButton({
    Name = "Remote Spy Developer Console Mode",
    Callback = function()
                --[[

            -Created by Vaeb.

        ]]

        _G.scanRemotes = true

        _G.ignoreNames = {
            Event = true;
            MessagesChanged = true;
        }

        setreadonly(getrawmetatable(game), false)
        local pseudoEnv = {}
        local gameMeta = getrawmetatable(game)

        local tabChar = "      "

        local function getSmaller(a, b, notLast)
            local aByte = a:byte() or -1
            local bByte = b:byte() or -1
            if aByte == bByte then
                if notLast and #a == 1 and #b == 1 then
                    return -1
                elseif #b == 1 then
                    return false
                elseif #a == 1 then
                    return true
                else
                    return getSmaller(a:sub(2), b:sub(2), notLast)
                end
            else
                return aByte < bByte
            end
        end

        local function parseData(obj, numTabs, isKey, overflow, noTables, forceDict)
            local objType = typeof(obj)
            local objStr = tostring(obj)
            if objType == "table" then
                if noTables then
                    return objStr
                end
                local isCyclic = overflow[obj]
                overflow[obj] = true
                local out = {}
                local nextIndex = 1
                local isDict = false
                local hasTables = false
                local data = {}

                for key, val in next, obj do
                    if not hasTables and typeof(val) == "table" then
                        hasTables = true
                    end

                    if not isDict and key ~= nextIndex then
                        isDict = true
                    else
                        nextIndex = nextIndex + 1
                    end

                    data[#data+1] = {key, val}
                end

                if isDict or hasTables or forceDict then
                    out[#out+1] = (isCyclic and "Cyclic " or "") .. "{"
                    table.sort(data, function(a, b)
                        local aType = typeof(a[2])
                        local bType = typeof(b[2])
                        if bType == "string" and aType ~= "string" then
                            return false
                        end
                        local res = getSmaller(aType, bType, true)
                        if res == -1 then
                            return getSmaller(tostring(a[1]), tostring(b[1]))
                        else
                            return res
                        end
                    end)
                    for i = 1, #data do
                        local arr = data[i]
                        local nowKey = arr[1]
                        local nowVal = arr[2]
                        local parseKey = parseData(nowKey, numTabs+1, true, overflow, isCyclic)
                        local parseVal = parseData(nowVal, numTabs+1, false, overflow, isCyclic)
                        if isDict then
                            local nowValType = typeof(nowVal)
                            local preStr = ""
                            local postStr = ""
                            if i > 1 and (nowValType == "table" or typeof(data[i-1][2]) ~= nowValType) then
                                preStr = "\n"
                            end
                            if i < #data and nowValType == "table" and typeof(data[i+1][2]) ~= "table" and typeof(data[i+1][2]) == nowValType then
                                postStr = "\n"
                            end
                            out[#out+1] = preStr .. string.rep(tabChar, numTabs+1) .. parseKey .. " = " .. parseVal .. ";" .. postStr
                        else
                            out[#out+1] = string.rep(tabChar, numTabs+1) .. parseVal .. ";"
                        end
                    end
                    out[#out+1] = string.rep(tabChar, numTabs) .. "}"
                else
                    local data2 = {}
                    for i = 1, #data do
                        local arr = data[i]
                        local nowVal = arr[2]
                        local parseVal = parseData(nowVal, 0, false, overflow, isCyclic)
                        data2[#data2+1] = parseVal
                    end
                    out[#out+1] = "{" .. table.concat(data2, ", ") .. "}"
                end

                return table.concat(out, "\n")
            else
                local returnVal = nil
                if (objType == "string" or objType == "Content") and (not isKey or tonumber(obj:sub(1, 1))) then
                    local retVal = '"' .. objStr .. '"'
                    if isKey then
                        retVal = "[" .. retVal .. "]"
                    end
                    returnVal = retVal
                elseif objType == "EnumItem" then
                    returnVal = "Enum." .. tostring(obj.EnumType) .. "." .. obj.Name
                elseif objType == "Enum" then
                    returnVal = "Enum." .. objStr
                elseif objType == "Instance" then
                    returnVal = obj.Parent and obj:GetFullName() or obj.ClassName
                elseif objType == "CFrame" then
                    returnVal = "CFrame.new(" .. objStr .. ")"
                elseif objType == "Vector3" then
                    returnVal = "Vector3.new(" .. objStr .. ")"
                elseif objType == "Vector2" then
                    returnVal = "Vector2.new(" .. objStr .. ")"
                elseif objType == "UDim2" then
                    returnVal = "UDim2.new(" .. objStr:gsub("[{}]", "") .. ")"
                elseif objType == "BrickColor" then
                    returnVal = "BrickColor.new(\"" .. objStr .. "\")"
                elseif objType == "Color3" then
                    returnVal = "Color3.new(" .. objStr .. ")"
                elseif objType == "NumberRange" then
                    returnVal = "NumberRange.new(" .. objStr:gsub("^%s*(.-)%s*$", "%1"):gsub(" ", ", ") .. ")"
                elseif objType == "PhysicalProperties" then
                    returnVal = "PhysicalProperties.new(" .. objStr .. ")"
                else
                    returnVal = objStr
                end
                return returnVal
            end
        end

        function tableToString(t)
            return parseData(t, 0, false, {}, nil, false)
        end

        local detectClasses = {
            BindableEvent = true;
            BindableFunction = true;
            RemoteEvent = true;
            RemoteFunction = true;
        }

        local classMethods = {
            BindableEvent = "Fire";
            BindableFunction = "Invoke";
            RemoteEvent = "FireServer";
            RemoteFunction = "InvokeServer";
        }

        local realMethods = {}

        for name, enabled in next, detectClasses do
            if enabled then
                realMethods[classMethods[name]] = Instance.new(name)[classMethods[name]]
            end
        end

        for key, value in next, gameMeta do pseudoEnv[key] = value end

        local incId = 0

        local function getValues(self, key, ...)
            return {realMethods[key](self, ...)}
        end

        gameMeta.__index, gameMeta.__namecall = function(self, key)
            if not realMethods[key] or _G.ignoreNames[self.Name] or not _G.scanRemotes then return pseudoEnv.__index(self, key) end
            return function(_, ...)
                incId = incId + 1
                local nowId = incId
                local strId = "[RemoteSpy_" .. nowId .. "]"

                local allPassed = {...}
                local returnValues = {}

                local ok, data = pcall(getValues, self, key, ...)

                if ok then
                    returnValues = data
                    print("\n" .. strId .. " ClassName: " .. self.ClassName .. " | Path: " .. self:GetFullName() .. " | Method: " .. key .. "\n" .. strId .. " Packed Arguments: " .. tableToString(allPassed) .. "\n" .. strId .. " Packed Returned: " .. tableToString(returnValues) .. "\n")
                else
                    print("\n" .. strId .. " ClassName: " .. self.ClassName .. " | Path: " .. self:GetFullName() .. " | Method: " .. key .. "\n" .. strId .. " Packed Arguments: " .. tableToString(allPassed) .. "\n" .. strId .. " Packed Returned: [ERROR] " .. data .. "\n")
                end

                return unpack(returnValues)
            end
        end

        print("\nRan Vaeb's RemoteSpy\n")
    end
})

Randomscripts:AddButton({
    Name = "Simple Spy (better version of remotespy)",
    Callback = function()
        loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
    end
})


Randomscripts:AddButton({
    Name = "Fullbright Module",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
    end
})

Randomscripts:AddButton({
    Name = "Net Bypass, stops hats falling off in fe scripts most of the time",
    Callback = function()
        print("fe bypass on")
        spawn(function()
            while true do 
                game:GetService("RunService").Heartbeat:Wait()
                settings().Physics.AllowSleep = false
                settings().Physics.ThrottleAdjustTime = math.huge-math.huge
                setsimulationradius(1e9, 1e9)
                game:GetService("RunService").Stepped:Wait()
            end
        end)
    end
})

Randomscripts:AddButton({
    Name = "Chams/ESP Module",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/ZyRZ3ruy", true))()
    end
})


Randomscripts:AddButton({
    Name = "FE Telekinesis (targeted part needs to be unanchored)",
    Callback = function()
                -- Q & E - bring closer and further
        -- R - Roates Block
        -- T - Tilts Block
        -- Y - Throws Block
        local function a(b, c)
            local d = getfenv(c)
            local e =
                setmetatable(
                {},
                {__index = function(self, f)
                        if f == "script" then
                            return b
                        else
                            return d[f]
                        end
                    end}
            )
            setfenv(c, e)
            return c
        end
        local g = {}
        local h = Instance.new("Model", game:GetService("Lighting"))
        local i = Instance.new("Tool")
        local j = Instance.new("Part")
        local k = Instance.new("Script")
        local l = Instance.new("LocalScript")
        local m = sethiddenproperty or set_hidden_property
        i.Name = "Telekinesis"
        i.Parent = h
        i.Grip = CFrame.new(0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
        i.GripForward = Vector3.new(-0, -1, -0)
        i.GripRight = Vector3.new(0, 0, 1)
        i.GripUp = Vector3.new(1, 0, 0)
        j.Name = "Handle"
        j.Parent = i
        j.CFrame = CFrame.new(-17.2635937, 15.4915619, 46, 0, 1, 0, 1, 0, 0, 0, 0, -1)
        j.Orientation = Vector3.new(0, 180, 90)
        j.Position = Vector3.new(-17.2635937, 15.4915619, 46)
        j.Rotation = Vector3.new(-180, 0, -90)
        j.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
        j.Transparency = 1
        j.Size = Vector3.new(1, 1.20000005, 1)
        j.BottomSurface = Enum.SurfaceType.Weld
        j.BrickColor = BrickColor.new("Really black")
        j.Material = Enum.Material.Metal
        j.TopSurface = Enum.SurfaceType.Smooth
        j.brickColor = BrickColor.new("Really black")
        k.Name = "LineConnect"
        k.Parent = i
        table.insert(
            g,
            a(
                k,
                function()
                    wait()
                    local n = script.Part2
                    local o = script.Part1.Value
                    local p = script.Part2.Value
                    local q = script.Par.Value
                    local color = script.Color
                    local r = Instance.new("Part")
                    r.TopSurface = 0
                    r.BottomSurface = 0
                    r.Reflectance = .5
                    r.Name = "Laser"
                    r.Locked = true
                    r.CanCollide = false
                    r.Anchored = true
                    r.formFactor = 0
                    r.Size = Vector3.new(1, 1, 1)
                    local s = Instance.new("BlockMesh")
                    s.Parent = r
                    while true do
                        if n.Value == nil then
                            break
                        end
                        if o == nil or p == nil or q == nil then
                            break
                        end
                        if o.Parent == nil or p.Parent == nil then
                            break
                        end
                        if q.Parent == nil then
                            break
                        end
                        local t = CFrame.new(o.Position, p.Position)
                        local dist = (o.Position - p.Position).magnitude
                        r.Parent = q
                        r.BrickColor = color.Value.BrickColor
                        r.Reflectance = color.Value.Reflectance
                        r.Transparency = color.Value.Transparency
                        r.CFrame = CFrame.new(o.Position + t.lookVector * dist / 2)
                        r.CFrame = CFrame.new(r.Position, p.Position)
                        s.Scale = Vector3.new(.25, .25, dist)
                        wait()
                    end
                    r:remove()
                    script:remove()
                end
            )
        )
        k.Disabled = true
        l.Name = "MainScript"
        l.Parent = i
        table.insert(
            g,
            a(
                l,
                function()
                    wait()
                    tool = script.Parent
                    lineconnect = tool.LineConnect
                    object = nil
                    mousedown = false
                    found = false
                    BP = Instance.new("BodyPosition")
                    BP.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
                    BP.P = BP.P * 1.1
                    dist = nil
                    point = Instance.new("Part")
                    point.Locked = true
                    point.Anchored = true
                    point.formFactor = 0
                    point.Shape = 0
                    point.BrickColor = BrickColor.Black()
                    point.Size = Vector3.new(1, 1, 1)
                    point.CanCollide = false
                    local s = Instance.new("SpecialMesh")
                    s.MeshType = "Sphere"
                    s.Scale = Vector3.new(.7, .7, .7)
                    s.Parent = point
                    handle = tool.Handle
                    front = tool.Handle
                    color = tool.Handle
                    objval = nil
                    local u = false
                    local v = BP:clone()
                    v.maxForce = Vector3.new(30000, 30000, 30000)
                    function LineConnect(o, p, q)
                        local w = Instance.new("ObjectValue")
                        w.Value = o
                        w.Name = "Part1"
                        local x = Instance.new("ObjectValue")
                        x.Value = p
                        x.Name = "Part2"
                        local y = Instance.new("ObjectValue")
                        y.Value = q
                        y.Name = "Par"
                        local z = Instance.new("ObjectValue")
                        z.Value = color
                        z.Name = "Color"
                        local A = lineconnect:clone()
                        A.Disabled = false
                        w.Parent = A
                        x.Parent = A
                        y.Parent = A
                        z.Parent = A
                        A.Parent = workspace
                        if p == object then
                            objval = x
                        end
                    end
                    function onButton1Down(B)
                        if mousedown == true then
                            return
                        end
                        mousedown = true
                        coroutine.resume(
                            coroutine.create(
                                function()
                                    local C = point:clone()
                                    C.Parent = tool
                                    LineConnect(front, C, workspace)
                                    while mousedown == true do
                                        C.Parent = tool
                                        if object == nil then
                                            if B.Target == nil then
                                                local t = CFrame.new(front.Position, B.Hit.p)
                                                C.CFrame = CFrame.new(front.Position + t.lookVector * 1000)
                                            else
                                                C.CFrame = CFrame.new(B.Hit.p)
                                            end
                                        else
                                            LineConnect(front, object, workspace)
                                            break
                                        end
                                        wait()
                                    end
                                    C:remove()
                                end
                            )
                        )
                        while mousedown == true do
                            if B.Target ~= nil then
                                local D = B.Target
                                if D.Anchored == false then
                                    object = D
                                    dist = (object.Position - front.Position).magnitude
                                    break
                                end
                            end
                            wait()
                        end
                        while mousedown == true do
                            if object.Parent == nil then
                                break
                            end
                            local t = CFrame.new(front.Position, B.Hit.p)
                            BP.Parent = object
                            BP.position = front.Position + t.lookVector * dist
                            wait()
                        end
                        BP:remove()
                        object = nil
                        objval.Value = nil
                    end
                    function onKeyDown(E, B)
                        local E = E:lower()
                        local F = false
                        if E == "q" then
                            if dist >= 5 then
                                dist = dist - 10
                            end
                        end
                        if E == "r" then
                            if object == nil then
                                return
                            end
                            for G, H in pairs(object:children()) do
                                if H.className == "BodyGyro" then
                                    return nil
                                end
                            end
                            BG = Instance.new("BodyGyro")
                            BG.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
                            BG.cframe = CFrame.new(object.CFrame.p)
                            BG.Parent = object
                            repeat
                                wait()
                            until object.CFrame == CFrame.new(object.CFrame.p)
                            BG.Parent = nil
                            if object == nil then
                                return
                            end
                            for G, H in pairs(object:children()) do
                                if H.className == "BodyGyro" then
                                    H.Parent = nil
                                end
                            end
                            object.Velocity = Vector3.new(0, 0, 0)
                            object.RotVelocity = Vector3.new(0, 0, 0)
                            object.Orientation = Vector3.new(0, 0, 0)
                        end
                        if E == "e" then
                            dist = dist + 10
                        end
                        if E == "t" then
                            if dist ~= 10 then
                                dist = 10
                            end
                        end
                        if E == "y" then
                            if dist ~= 200 then
                                dist = 200
                            end
                        end
                        if E == "=" then
                            BP.P = BP.P * 1.5
                        end
                        if E == "-" then
                            BP.P = BP.P * 0.5
                        end
                    end
                    function onEquipped(B)
                        keymouse = B
                        local I = tool.Parent
                        human = I.Humanoid
                        human.Changed:connect(
                            function()
                                if human.Health == 0 then
                                    mousedown = false
                                    BP:remove()
                                    point:remove()
                                    tool:remove()
                                end
                            end
                        )
                        B.Button1Down:connect(
                            function()
                                onButton1Down(B)
                            end
                        )
                        B.Button1Up:connect(
                            function()
                                mousedown = false
                            end
                        )
                        B.KeyDown:connect(
                            function(E)
                                onKeyDown(E, B)
                            end
                        )
                        B.Icon = "rbxasset://textures\\GunCursor.png"
                    end
                    tool.Equipped:connect(onEquipped)
                end
            )
        )
        for J, H in pairs(h:GetChildren()) do
            H.Parent = game:GetService("Players").LocalPlayer.Backpack
            pcall(
                function()
                    H:MakeJoints()
                end
            )
        end
        h:Destroy()
        for J, H in pairs(g) do
            spawn(
                function()
                    pcall(H)
                end
            )
        end
    end
})

Randomscripts:AddButton({
    Name = "helicopter",
    Callback = function()
        if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
		spawn(function()
			local speaker = game.Players.LocalPlayer
			local Anim = Instance.new("Animation")
			     Anim.AnimationId = "rbxassetid://27432686"
			     local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
			bruh:Play()
			bruh:AdjustSpeed(0)
			speaker.Character.Animate.Disabled = true
			local hi = Instance.new("Sound")
			hi.Name = "Sound"
			hi.SoundId = "http://www.roblox.com/asset/?id=165113352"
			hi.Volume = 2
			hi.Looped = true
			hi.archivable = false
			hi.Parent = game.Workspace
			hi:Play()

			local spinSpeed = 40
			local Spin = Instance.new("BodyAngularVelocity")
			Spin.Name = "Spinning"
			Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			Spin.MaxTorque = Vector3.new(0, math.huge, 0)
			Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
		end)
	else
		spawn(function()
			local speaker = game.Players.LocalPlayer
			local Anim = Instance.new("Animation")
			     Anim.AnimationId = "rbxassetid://507776043"
			     local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
			bruh:Play()
			bruh:AdjustSpeed(0)
			speaker.Character.Animate.Disabled = true
			local hi = Instance.new("Sound")
			hi.Name = "Sound"
			hi.SoundId = "http://www.roblox.com/asset/?id=165113352"
			hi.Volume = 2
			hi.Looped = true
			hi.archivable = false
			hi.Parent = game.Workspace
			hi:Play()

			local spinSpeed = 40
			local Spin = Instance.new("BodyAngularVelocity")
			Spin.Name = "Spinning"
			Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			Spin.MaxTorque = Vector3.new(0, math.huge, 0)
			Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
		end)    
	end
	local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local u = game.Players.LocalPlayer
	local urchar = u.Character

	task.spawn(function()
		qUp = Mouse.KeyUp:Connect(function(KEY)
			if KEY == 'q' then
				urchar.Humanoid.HipHeight = urchar.Humanoid.HipHeight - 3
			end
		end)
		eUp = Mouse.KeyUp:Connect(function(KEY)
		if KEY == 'e' then
			urchar.Humanoid.HipHeight = urchar.Humanoid.HipHeight + 3
		end
	end)
	end)
    end
})

Randomscripts:AddButton({
    Name = "FE Telekinesis 2",
    Callback = function()
        function sandbox(var,func)
            local env = getfenv(func)
            local newenv = setmetatable({},{
                __index = function(self,k)
                    if k=="script" then
                        return var
                    else
                        return env[k]
                    end
                end,
            })
            setfenv(func,newenv)
            return func
        end
        cors = {}
        mas = Instance.new("Model",game:GetService("Lighting"))
        Tool0 = Instance.new("Tool")
        Part1 = Instance.new("Part")
        CylinderMesh2 = Instance.new("CylinderMesh")
        Part3 = Instance.new("Part")
        LocalScript4 = Instance.new("LocalScript")
        Script5 = Instance.new("Script")
        LocalScript6 = Instance.new("LocalScript")
        Script7 = Instance.new("Script")
        LocalScript8 = Instance.new("LocalScript")
        Part9 = Instance.new("Part")
        Script10 = Instance.new("Script")
        Part11 = Instance.new("Part")
        Script12 = Instance.new("Script")
        Part13 = Instance.new("Part")
        Script14 = Instance.new("Script")
        Tool0.Name = "Telekinesis Gun"
        Tool0.Parent = mas
        Tool0.CanBeDropped = false
        Part1.Name = "Handle"
        Part1.Parent = Tool0
        Part1.Material = Enum.Material.Neon
        Part1.BrickColor = BrickColor.new("Cyan")
        Part1.Transparency = 1
        Part1.Rotation = Vector3.new(0, 15.4200001, 0)
        Part1.CanCollide = false
        Part1.FormFactor = Enum.FormFactor.Custom
        Part1.Size = Vector3.new(1, 0.400000036, 0.300000012)
        Part1.CFrame = CFrame.new(-55.2695465, 0.696546972, 0.383156985, 0.96399641, -4.98074878e-05, 0.265921414, 4.79998416e-05, 1, 1.32960558e-05, -0.265921414, -5.30653779e-08, 0.96399641)
        Part1.BottomSurface = Enum.SurfaceType.Smooth
        Part1.TopSurface = Enum.SurfaceType.Smooth
        Part1.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        Part1.Position = Vector3.new(-55.2695465, 0.696546972, 0.383156985)
        Part1.Orientation = Vector3.new(0, 15.4200001, 0)
        Part1.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        CylinderMesh2.Parent = Part1
        CylinderMesh2.Scale = Vector3.new(0.100000001, 0.100000001, 0.100000001)
        CylinderMesh2.Scale = Vector3.new(0.100000001, 0.100000001, 0.100000001)
        Part3.Name = "Shoot"
        Part3.Parent = Tool0
        Part3.Material = Enum.Material.Neon
        Part3.BrickColor = BrickColor.new("Cyan")
        Part3.Reflectance = 0.30000001192093
        Part3.Transparency = 1
        Part3.Rotation = Vector3.new(90.9799957, 0.25999999, -91.409996)
        Part3.CanCollide = false
        Part3.FormFactor = Enum.FormFactor.Custom
        Part3.Size = Vector3.new(0.200000003, 0.25, 0.310000032)
        Part3.CFrame = CFrame.new(-54.7998123, 0.774299085, -0.757350147, -0.0245519895, 0.99968797, 0.00460194098, 0.0169109926, 0.00501798885, -0.999844491, -0.999555528, -0.0244703442, -0.0170289185)
        Part3.BottomSurface = Enum.SurfaceType.Smooth
        Part3.TopSurface = Enum.SurfaceType.Smooth
        Part3.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        Part3.Position = Vector3.new(-54.7998123, 0.774299085, -0.757350147)
        Part3.Orientation = Vector3.new(88.9899979, 164.87999, 73.4700012)
        Part3.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        LocalScript4.Parent = Tool0
        table.insert(cors,sandbox(LocalScript4,function()
        -- Variables for services
        local render = game:GetService("RunService").RenderStepped
        local contextActionService = game:GetService("ContextActionService")
        local userInputService = game:GetService("UserInputService")
        
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        local Tool = script.Parent
        
        -- Variables for Module Scripts
        local screenSpace = require(Tool:WaitForChild("ScreenSpace"))
        
        local connection
        -- Variables for character joints
        
        local neck, shoulder, oldNeckC0, oldShoulderC0 
        
        local mobileShouldTrack = true
        
        -- Thourough check to see if a character is sitting
        local function amISitting(character)
            local t = character.Torso
            for _, part in pairs(t:GetConnectedParts(true)) do
                if part:IsA("Seat") or part:IsA("VehicleSeat") then
                    return true
                end
            end
        end
        
        -- Function to call on renderstepped. Orients the character so it is facing towards
        -- the player mouse's position in world space. If character is sitting then the torso
        -- should not track
        local function frame(mousePosition)
            -- Special mobile consideration. We don't want to track if the user was touching a ui
            -- element such as the movement controls. Just return out of function if so to make sure
            -- character doesn't track
            if not mobileShouldTrack then return end
            
            -- Make sure character isn't swiming. If the character is swimming the following code will
            -- not work well; the character will not swim correctly. Besides, who shoots underwater?
            if player.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Swimming then
                local torso = player.Character.Torso
                local head = player.Character.Head
                
                local toMouse = (mousePosition - head.Position).unit
                local angle = math.acos(toMouse:Dot(Vector3.new(0,1,0)))
                
                local neckAngle = angle
            
                -- Limit how much the head can tilt down. Too far and the head looks unnatural
                if math.deg(neckAngle) > 110 then
                    neckAngle = math.rad(110)
                end
                neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(math.pi - neckAngle,math.pi,0)
                
                -- Calculate horizontal rotation
                local arm = player.Character:FindFirstChild("Right Arm")
                local fromArmPos = torso.Position + torso.CFrame:vectorToWorldSpace(Vector3.new(
                    torso.Size.X/2 + arm.Size.X/2, torso.Size.Y/2 - arm.Size.Z/2, 0))
                local toMouseArm = ((mousePosition - fromArmPos) * Vector3.new(1,0,1)).unit
                local look = (torso.CFrame.lookVector * Vector3.new(1,0,1)).unit
                local lateralAngle = math.acos(toMouseArm:Dot(look))		
                
                -- Check for rogue math
                if tostring(lateralAngle) == "-1.#IND" then
                    lateralAngle = 0
                end		
                
                -- Handle case where character is sitting down
                if player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then			
                    
                    local cross = torso.CFrame.lookVector:Cross(toMouseArm)
                    if lateralAngle > math.pi/2 then
                        lateralAngle = math.pi/2
                    end
                    if cross.Y < 0 then
                        lateralAngle = -lateralAngle
                    end
                end	
                
                -- Turn shoulder to point to mouse
                shoulder.C0 = CFrame.new(1,0.5,0) * CFrame.Angles(math.pi/2 - angle,math.pi/2 + lateralAngle,0)	
                
                -- If not sitting then aim torso laterally towards mouse
                if not amISitting(player.Character) then
                    torso.CFrame = CFrame.new(torso.Position, torso.Position + (Vector3.new(
                        mousePosition.X, torso.Position.Y, mousePosition.Z)-torso.Position).unit)
                else
                    --print("sitting")		
                end	
            end
        end
        
        -- Function to bind to render stepped if player is on PC
        local function pcFrame()
            frame(mouse.Hit.p)
        end
        
        -- Function to bind to touch moved if player is on mobile
        local function mobileFrame(touch, processed)
            -- Check to see if the touch was on a UI element. If so, we don't want to update anything
            if not processed then
                -- Calculate touch position in world space. Uses Stravant's ScreenSpace Module script
                -- to create a ray from the camera.
                local test = screenSpace.ScreenToWorld(touch.Position.X, touch.Position.Y, 1)
                local nearPos = game.Workspace.CurrentCamera.CoordinateFrame:vectorToWorldSpace(screenSpace.ScreenToWorld(touch.Position.X, touch.Position.Y, 1))
                nearPos = game.Workspace.CurrentCamera.CoordinateFrame.p - nearPos
                local farPos = screenSpace.ScreenToWorld(touch.Position.X, touch.Position.Y,50) 
                farPos = game.Workspace.CurrentCamera.CoordinateFrame:vectorToWorldSpace(farPos) * -1
                if farPos.magnitude > 900 then
                    farPos = farPos.unit * 900
                end
                local ray = Ray.new(nearPos, farPos)
                local part, pos = game.Workspace:FindPartOnRay(ray, player.Character)
                
                -- if a position was found on the ray then update the character's rotation
                if pos then
                    frame(pos)
                end
            end
        end
        
        local oldIcon = nil
        -- Function to bind to equip event
        local function equip()
            local torso = player.Character.Torso
            
            -- Setup joint variables
            neck = torso.Neck	
            oldNeckC0 = neck.C0
            shoulder = torso:FindFirstChild("Right Shoulder")
            oldShoulderC0 = shoulder.C0
            
            -- Remember old mouse icon and update current
            oldIcon = mouse.Icon
            mouse.Icon = "rbxassetid:// 2184939409"
            
            -- Bind TouchMoved event if on mobile. Otherwise connect to renderstepped
            if userInputService.TouchEnabled then
                connection = userInputService.TouchMoved:connect(mobileFrame)
            else
                connection = render:connect(pcFrame)
            end
            
            -- Bind TouchStarted and TouchEnded. Used to determine if character should rotate
            -- during touch input
            userInputService.TouchStarted:connect(function(touch, processed)
                mobileShouldTrack = not processed
            end)	
            userInputService.TouchEnded:connect(function(touch, processed)
                mobileShouldTrack = false
            end)
            
            -- Fire server's equip event
            game.ReplicatedStorage.ROBLOX_PistolEquipEvent:FireServer()
            
            -- Bind event for when mouse is clicked to fire server's fire event
            mouse.Button1Down:connect(function()
                game.ReplicatedStorage.ROBLOX_PistolFireEvent:FireServer(mouse.Hit.p)
            end)
            
            -- Bind reload event to mobile button and r key
            contextActionService:BindActionToInputTypes("Reload", function() 
                game.ReplicatedStorage.ROBLOX_PistolReloadEvent:FireServer()		
            end, true, "")
            
            -- If game uses filtering enabled then need to update server while tool is
            -- held by character.
            if workspace.FilteringEnabled then
                while connection do
                    wait()
                    game.ReplicatedStorage.ROBLOX_PistolUpdateEvent:FireServer(neck.C0, shoulder.C0)
                end
            end
        end
        
        -- Function to bind to Unequip event
        local function unequip()
            if connection then connection:disconnect() end
            contextActionService:UnbindAction("Reload")
            game.ReplicatedStorage.ROBLOX_PistolUnequipEvent:FireServer()
            mouse.Icon = oldIcon
            neck.C0 = oldNeckC0
            shoulder.C0 = oldShoulderC0
        end
        
        -- Bind tool events
        Tool.Equipped:connect(equip)
        Tool.Unequipped:connect(unequip)
        end))
        Script5.Name = "qPerfectionWeld"
        Script5.Parent = Tool0
        table.insert(cors,sandbox(Script5,function()
        -- Created by Quenty (@Quenty, follow me on twitter).
        -- Should work with only ONE copy, seamlessly with weapons, trains, et cetera.
        -- Parts should be ANCHORED before use. It will, however, store relatives values and so when tools are reparented, it'll fix them.
        
        --[[ INSTRUCTIONS
        - Place in the model
        - Make sure model is anchored
        - That's it. It will weld the model and all children. 
        
        THIS SCRIPT SHOULD BE USED ONLY BY ITSELF. THE MODEL SHOULD BE ANCHORED. 
        THIS SCRIPT SHOULD BE USED ONLY BY ITSELF. THE MODEL SHOULD BE ANCHORED. 
        THIS SCRIPT SHOULD BE USED ONLY BY ITSELF. THE MODEL SHOULD BE ANCHORED. 
        THIS SCRIPT SHOULD BE USED ONLY BY ITSELF. THE MODEL SHOULD BE ANCHORED. 
        THIS SCRIPT SHOULD BE USED ONLY BY ITSELF. THE MODEL SHOULD BE ANCHORED. 
        THIS SCRIPT SHOULD BE USED ONLY BY ITSELF. THE MODEL SHOULD BE ANCHORED. 
        THIS SCRIPT SHOULD BE USED ONLY BY ITSELF. THE MODEL SHOULD BE ANCHORED. 
        THIS SCRIPT SHOULD BE USED ONLY BY ITSELF. THE MODEL SHOULD BE ANCHORED. 
        
        This script is designed to be used is a regular script. In a local script it will weld, but it will not attempt to handle ancestory changes. 
        ]]
        
        --[[ DOCUMENTATION
        - Will work in tools. If ran more than once it will not create more than one weld.  This is especially useful for tools that are dropped and then picked up again.
        - Will work in PBS servers
        - Will work as long as it starts out with the part anchored
        - Stores the relative CFrame as a CFrame value
        - Takes careful measure to reduce lag by not having a joint set off or affected by the parts offset from origin
        - Utilizes a recursive algorith to find all parts in the model
        - Will reweld on script reparent if the script is initially parented to a tool.
        - Welds as fast as possible
        ]]
        
        -- qPerfectionWeld.lua
        -- Created 10/6/2014
        -- Author: Quenty
        -- Version 1.0.3
        
        -- Updated 10/14/2014 - Updated to 1.0.1
        --- Bug fix with existing ROBLOX welds ? Repro by asimo3089
        
        -- Updated 10/14/2014 - Updated to 1.0.2
        --- Fixed bug fix. 
        
        -- Updated 10/14/2014 - Updated to 1.0.3
        --- Now handles joints semi-acceptably. May be rather hacky with some joints. :/
        
        local NEVER_BREAK_JOINTS = false -- If you set this to true it will never break joints (this can create some welding issues, but can save stuff like hinges).
        
        
        local function CallOnChildren(Instance, FunctionToCall)
            -- Calls a function on each of the children of a certain object, using recursion.  
        
            FunctionToCall(Instance)
        
            for _, Child in next, Instance:GetChildren() do
                CallOnChildren(Child, FunctionToCall)
            end
        end
        
        local function GetNearestParent(Instance, ClassName)
            -- Returns the nearest parent of a certain class, or returns nil
        
            local Ancestor = Instance
            repeat
                Ancestor = Ancestor.Parent
                if Ancestor == nil then
                    return nil
                end
            until Ancestor:IsA(ClassName)
        
            return Ancestor
        end
        
        local function GetBricks(StartInstance)
            local List = {}
        
            -- if StartInstance:IsA("BasePart") then
            -- 	List[#List+1] = StartInstance
            -- end
        
            CallOnChildren(StartInstance, function(Item)
                if Item:IsA("BasePart") then
                    List[#List+1] = Item;
                end
            end)
        
            return List
        end
        
        local function Modify(Instance, Values)
            -- Modifies an Instance by using a table.  
        
            assert(type(Values) == "table", "Values is not a table");
        
            for Index, Value in next, Values do
                if type(Index) == "number" then
                    Value.Parent = Instance
                else
                    Instance[Index] = Value
                end
            end
            return Instance
        end
        
        local function Make(ClassType, Properties)
            -- Using a syntax hack to create a nice way to Make new items.  
        
            return Modify(Instance.new(ClassType), Properties)
        end
        
        local Surfaces = {"TopSurface", "BottomSurface", "LeftSurface", "RightSurface", "FrontSurface", "BackSurface"}
        local HingSurfaces = {"Hinge", "Motor", "SteppingMotor"}
        
        local function HasWheelJoint(Part)
            for _, SurfaceName in pairs(Surfaces) do
                for _, HingSurfaceName in pairs(HingSurfaces) do
                    if Part[SurfaceName].Name == HingSurfaceName then
                        return true
                    end
                end
            end
            
            return false
        end
        
        local function ShouldBreakJoints(Part)
            --- We do not want to break joints of wheels/hinges. This takes the utmost care to not do this. There are
            --  definitely some edge cases. 
        
            if NEVER_BREAK_JOINTS then
                return false
            end
            
            if HasWheelJoint(Part) then
                return false
            end
            
            local Connected = Part:GetConnectedParts()
            
            if #Connected == 1 then
                return false
            end
            
            for _, Item in pairs(Connected) do
                if HasWheelJoint(Item) then
                    return false
                elseif not Item:IsDescendantOf(script.Parent) then
                    return false
                end
            end
            
            return true
        end
        
        local function WeldTogether(Part0, Part1, JointType, WeldParent)
            --- Weld's 2 parts together
            -- @param Part0 The first part
            -- @param Part1 The second part (Dependent part most of the time).
            -- @param [JointType] The type of joint. Defaults to weld.
            -- @param [WeldParent] Parent of the weld, Defaults to Part0 (so GC is better).
            -- @return The weld created.
        
            JointType = JointType or "Weld"
            local RelativeValue = Part1:FindFirstChild("qRelativeCFrameWeldValue")
            
            local NewWeld = Part1:FindFirstChild("qCFrameWeldThingy") or Instance.new(JointType)
            Modify(NewWeld, {
                Name = "qCFrameWeldThingy";
                Part0  = Part0;
                Part1  = Part1;
                C0     = CFrame.new();--Part0.CFrame:inverse();
                C1     = RelativeValue and RelativeValue.Value or Part1.CFrame:toObjectSpace(Part0.CFrame); --Part1.CFrame:inverse() * Part0.CFrame;-- Part1.CFrame:inverse();
                Parent = Part1;
            })
        
            if not RelativeValue then
                RelativeValue = Make("CFrameValue", {
                    Parent     = Part1;
                    Name       = "qRelativeCFrameWeldValue";
                    Archivable = true;
                    Value      = NewWeld.C1;
                })
            end
        
            return NewWeld
        end
        
        local function WeldParts(Parts, MainPart, JointType, DoNotUnanchor)
            -- @param Parts The Parts to weld. Should be anchored to prevent really horrible results.
            -- @param MainPart The part to weld the model to (can be in the model).
            -- @param [JointType] The type of joint. Defaults to weld. 
            -- @parm DoNotUnanchor Boolean, if true, will not unachor the model after cmopletion.
            
            for _, Part in pairs(Parts) do
                if ShouldBreakJoints(Part) then
                    Part:BreakJoints()
                end
            end
            
            for _, Part in pairs(Parts) do
                if Part ~= MainPart then
                    WeldTogether(MainPart, Part, JointType, MainPart)
                end
            end
        
            if not DoNotUnanchor then
                for _, Part in pairs(Parts) do
                    Part.Anchored = false
                end
                MainPart.Anchored = false
            end
        end
        
        local function PerfectionWeld()	
            local Tool = GetNearestParent(script, "Tool")
        
            local Parts = GetBricks(script.Parent)
            local PrimaryPart = Tool and Tool:FindFirstChild("Handle") and Tool.Handle:IsA("BasePart") and Tool.Handle or script.Parent:IsA("Model") and script.Parent.PrimaryPart or Parts[1]
        
            if PrimaryPart then
                WeldParts(Parts, PrimaryPart, "Weld", false)
            else
                warn("qWeld - Unable to weld part")
            end
            
            return Tool
        end
        
        local Tool = PerfectionWeld()
        
        
        if Tool and script.ClassName == "Script" then
            --- Don't bother with local scripts
        
            script.Parent.AncestryChanged:connect(function()
                PerfectionWeld()
            end)
        end
        
        -- Created by Quenty (@Quenty, follow me on twitter).
        
        end))
        LocalScript6.Name = "Animate"
        LocalScript6.Parent = Tool0
        table.insert(cors,sandbox(LocalScript6,function()
        local arms = nil
        local torso = nil
        local welds = {}
        local Tool = script.Parent
        local neck = nil
        local orginalC0 = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
        
        function Equip(mouse)
        wait(0.01)
        arms = {Tool.Parent:FindFirstChild("Left Arm"), Tool.Parent:FindFirstChild("Right Arm")}
        head = Tool.Parent:FindFirstChild("Head") 
        torso = Tool.Parent:FindFirstChild("Torso")
        if neck == nil then 
        neck = Tool.Parent:FindFirstChild("Torso").Neck
        end 
        if arms ~= nil and torso ~= nil then
        local sh = {torso:FindFirstChild("Left Shoulder"), torso:FindFirstChild("Right Shoulder")}
        if sh ~= nil then
        local yes = true
        if yes then
        yes = false
        sh[1].Part1 = nil
        sh[2].Part1 = nil
        local weld1 = Instance.new("Weld")
        weld1.Part0 = head
        weld1.Parent = head
        weld1.Part1 = arms[1]
        welds[1] = weld1
        local weld2 = Instance.new("Weld")
        weld2.Part0 = head
        weld2.Parent = head
        weld2.Part1 = arms[2]
        welds[2] = weld2
        -------------------------here
        weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(-90))
        weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(-15), 0)
            mouse.Move:connect(function ()
                --local Direction = Tool.Direction.Value 
                local Direction = mouse.Hit.p
                local b = head.Position.Y-Direction.Y
                local dist = (head.Position-Direction).magnitude
                local answer = math.asin(b/dist)
                neck.C0=orginalC0*CFrame.fromEulerAnglesXYZ(answer,0,0)
                wait(0.1)
            end)end
        else
        print("sh")
        end
        else
        print("arms")
        end
        end
        
        function Unequip(mouse)
        if arms ~= nil and torso ~= nil then
        local sh = {torso:FindFirstChild("Left Shoulder"), torso:FindFirstChild("Right Shoulder")}
        if sh ~= nil then
        local yes = true
        if yes then
        yes = false
            neck.C0 = orginalC0
        
        sh[1].Part1 = arms[1]
        sh[2].Part1 = arms[2]
        welds[1].Parent = nil
        welds[2].Parent = nil
        end
        else
        print("sh")
        end
        else
        print("arms")
        end
        end
        Tool.Equipped:connect(Equip)
        Tool.Unequipped:connect(Unequip)
        
        function Animate()
        arms = {Tool.Parent:FindFirstChild("Left Arm"), Tool.Parent:FindFirstChild("Right Arm")}
            if Tool.AnimateValue.Value == "Shoot" then 
                local weld1 = welds[1]
                local weld2 = welds[2]
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(-15), 0)
                wait(0.00001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.05, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(-15), 0)
                wait(0.00001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.1, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-95), math.rad(-15), 0)
                wait(0.00001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.3, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-110), math.rad(-15), 0)
                wait(0.00001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.35, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-115), math.rad(-15), 0)
                wait(0.00001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-120), math.rad(-15), 0)
                wait(0.00001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(-15), 0)	
                Tool.AnimateValue.Value = "None"
            end 
            if Tool.AnimateValue.Value == "Reload" then 
                local weld1 = welds[1]
                local weld2 = welds[2]
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-95), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-100), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-105), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-110), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.4, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-115), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.45, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-120), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.9, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.5, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-120), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 1, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.55, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-120), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 1.1, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.57, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-120), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 1.2, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.6, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-120), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 1.3, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0.6, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-120), math.rad(-15), 0)
                wait(0.0001)
                weld1.C1 = CFrame.new(-0.5+1.5, 0.8, .9)* CFrame.fromEulerAnglesXYZ(math.rad(290), 0, math.rad(-90))
                weld2.C1 = CFrame.new(-1, 0.8, 0.5-1.5) * CFrame.fromEulerAnglesXYZ(math.rad(-90), math.rad(-15), 0)	
                Tool.AnimateValue.Value = "None"
            end 
        end 
        
        Tool.AnimateValue.Changed:connect(Animate)
        
        end))
        Script7.Name = "LineConnect"
        Script7.Parent = Tool0
        Script7.Disabled = true
        table.insert(cors,sandbox(Script7,function()
        wait()
        local check = script.Part2
        local part1 = script.Part1.Value
        local part2 = script.Part2.Value
        local parent = script.Par.Value
        local color = script.Color
        local line = Instance.new("Part")
        line.TopSurface = 0
        line.BottomSurface = 0
        line.Reflectance = .5
        line.Name = "Laser"
        line.Transparency = 0.6
        line.Locked = true
        line.CanCollide = false
        line.Anchored = true
        line.formFactor = 0
        line.Size = Vector3.new(0.4,0.4,1)
        local mesh = Instance.new("BlockMesh")
        mesh.Parent = line
        while true do
            if (check.Value==nil) then break end
            if (part1==nil or part2==nil or parent==nil) then break end
            if (part1.Parent==nil or part2.Parent==nil) then break end
            if (parent.Parent==nil) then break end
            local lv = CFrame.new(part1.Position,part2.Position)
            local dist = (part1.Position-part2.Position).magnitude
            line.Parent = parent
            line.Material = "Neon"
            line.BrickColor = color.Value.BrickColor
            line.Reflectance = color.Value.Reflectance
            line.Transparency = "0.2"
            line.CFrame = CFrame.new(part1.Position+lv.lookVector*dist/2)
            line.CFrame = CFrame.new(line.Position,part2.Position)
            mesh.Scale = Vector3.new(.25,.25,dist)
            wait()
        end
        line:remove()
        script:remove() 
        end))
        LocalScript8.Name = "MainScript"
        LocalScript8.Parent = Tool0
        table.insert(cors,sandbox(LocalScript8,function()
        --Physics gun created by Killersoldier45
        wait() 
        tool = script.Parent
        lineconnect = tool.LineConnect
        object = nil
        mousedown = false
        found = false
        BP = Instance.new("BodyPosition")
        BP.maxForce = Vector3.new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge) --pwns everyone elses bodyposition
        BP.P = BP.P*10 --faster movement. less bounceback.
        dist = nil
        point = Instance.new("Part")
        point.Locked = true
        point.Anchored = true
        point.formFactor = 0
        point.Shape = 0
        point.Material = 'Neon'
        point.BrickColor = BrickColor.new("Toothpaste")
        point.Size = Vector3.new(1,1,1)
        point.CanCollide = false
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshType = "Sphere"
        mesh.Scale = Vector3.new(.2,.2,.2)
        mesh.Parent = point
        handle = tool.Shoot
        front = tool.Shoot
        color = tool.Shoot
        objval = nil
        local hooked = false 
        local hookBP = BP:clone() 
        hookBP.maxForce = Vector3.new(30000,30000,30000) 
        
        function LineConnect(part1,part2,parent)
            local p1 = Instance.new("ObjectValue")
            p1.Value = part1
            p1.Name = "Part1"
            local p2 = Instance.new("ObjectValue")
            p2.Value = part2
            p2.Name = "Part2"
            local par = Instance.new("ObjectValue")
            par.Value = parent
            par.Name = "Par"
            local col = Instance.new("ObjectValue")
            col.Value = color
            col.Name = "Color"
            local s = lineconnect:clone()
            s.Disabled = false
            p1.Parent = s
            p2.Parent = s
            par.Parent = s
            col.Parent = s
            s.Parent = workspace
            if (part2==object) then
                objval = p2
            end
        end
        
        function onButton1Down(mouse)
            if (mousedown==true) then return end
            mousedown = true
            coroutine.resume(coroutine.create(function()
                local p = point:clone()
                p.Parent = tool
                LineConnect(front,p,workspace)
                while (mousedown==true) do
                    p.Parent = tool
                    if (object==nil) then
                        if (mouse.Target==nil) then
                            local lv = CFrame.new(front.Position,mouse.Hit.p)
                            p.CFrame = CFrame.new(front.Position+(lv.lookVector*1000))
                        else
                            p.CFrame = CFrame.new(mouse.Hit.p)
                        end
                    else
                        LineConnect(front,object,workspace)
                        break
                    end
                    wait()
                end
                p:remove()
            end))
            while (mousedown==true) do
                if (mouse.Target~=nil) then
                    local t = mouse.Target
                    if (t.Anchored==false) then
                        object = t
                        dist = (object.Position-front.Position).magnitude
                        break
                    end
                end
                wait()
            end
            while (mousedown==true) do
                if (object.Parent==nil) then break end
                local lv = CFrame.new(front.Position,mouse.Hit.p)
                BP.Parent = object
                BP.position = front.Position+lv.lookVector*dist
                wait()
            end
            BP:remove()
            object = nil
            objval.Value = nil
        end
        
        function onKeyDown(key,mouse) 
            local key = key:lower() 
            local yesh = false 
            if (key=="q") then 
                if (dist>=5) then 
                    dist = dist-5 
                end 
            end 
            if key == "t" then 
            if (object==nil) then return end 
            for _,v in pairs(object:children()) do 
            if v.className == "BodyGyro" then 
            return nil 
            end 
            end 
            BG = Instance.new("BodyGyro") 
            BG.maxTorque = Vector3.new(math.huge,math.huge,math.huge) 
            BG.cframe = CFrame.new(object.CFrame.p) 
            BG.Parent = object 
            repeat wait() until(object.CFrame == CFrame.new(object.CFrame.p)) 
            BG.Parent = nil 
            if (object==nil) then return end 
            for _,v in pairs(object:children()) do 
            if v.className == "BodyGyro" then 
            v.Parent = nil 
            end 
            end 
            object.Velocity = Vector3.new(0,0,0) 
            object.RotVelocity = Vector3.new(0,0,0) 
            end 
            if (key=="e") then
                dist = dist+5
            end
            if (string.byte(key)==27) then 
                if (object==nil) then return end
                local e = Instance.new("Explosion")
                e.Parent = workspace
                e.Position = object.Position
                color.BrickColor = BrickColor.Black()
                point.BrickColor = BrickColor.White() 
                wait(.48)
                color.BrickColor = BrickColor.White() 
                point.BrickColor = BrickColor.Black() 
            end
            if (key=="") then 
                if not hooked then 
                if (object==nil) then return end 
                hooked = true 
                hookBP.position = object.Position 
                if tool.Parent:findFirstChild("Torso") then 
                hookBP.Parent = tool.Parent.Torso 
                if dist ~= (object.Size.x+object.Size.y+object.Size.z)+5 then 
                dist = (object.Size.x+object.Size.y+object.Size.z)+5 
                end 
                end 
                else 
                hooked = false 
                hookBP.Parent = nil 
                end 
            end 
            if (key=="r") then 
                if (object==nil) then return end 
                color.BrickColor = BrickColor.new("Toothpaste") 
                point.BrickColor = BrickColor.new("Toothpaste") 
                object.Parent = nil 
                wait(.48) 
                color.BrickColor = BrickColor.new("Toothpaste")
                point.BrickColor = BrickColor.new("Toothpaste")
            end 
            if (key=="x") then 
            if (object==nil) then return end 
            local New = object:clone() 
            New.Parent = object.Parent 
            for _,v in pairs(New:children()) do 
            if v.className == "BodyPosition" or v.className == "BodyGyro" then 
            v.Parent = nil 
            end 
            end 
            object = New 
            mousedown = false 
            mousedown = true 
            LineConnect(front,object,workspace) 
                while (mousedown==true) do
                if (object.Parent==nil) then break end
                local lv = CFrame.new(front.Position,mouse.Hit.p)
                BP.Parent = object
                BP.position = front.Position+lv.lookVector*dist
                wait()
            end
            BP:remove()
            object = nil
            objval.Value = nil
            end 
            if (key=="c") then 
                local Cube = Instance.new("Part") 
                Cube.Locked = true 
                Cube.Size = Vector3.new(4,4,4) 
                Cube.formFactor = 0 
                Cube.TopSurface = 0 
                Cube.BottomSurface = 0 
                Cube.Name = "WeightedStorageCube" 
                Cube.Parent = workspace 
                Cube.CFrame = CFrame.new(mouse.Hit.p) + Vector3.new(0,2,0) 
                for i = 0,5 do 
                    local Decal = Instance.new("Decal") 
                    Decal.Texture = "http://www.roblox.com/asset/?id=2662260" 
                    Decal.Face = i 
                    Decal.Name = "WeightedStorageCubeDecal" 
                    Decal.Parent = Cube 
                end 
            end 
            if (key=="y") then 
                if dist ~= 200 then 
                    dist += 200 
                end 
            end 
        end
        
        function onEquipped(mouse)
            keymouse = mouse
            local char = tool.Parent
            human = char.Humanoid
            human.Changed:connect(function() if (human.Health==0) then mousedown = false BP:remove() point:remove() tool:remove() end end)
            mouse.Button1Down:connect(function() onButton1Down(mouse) end)
            mouse.Button1Up:connect(function() mousedown = false end)
            mouse.KeyDown:connect(function(key) onKeyDown(key,mouse) end)
            mouse.Icon = "rbxassetid://2184939409"
        end
        
        tool.Equipped:connect(onEquipped)
        end))
        Part9.Name = "GlowPart"
        Part9.Parent = Tool0
        Part9.Material = Enum.Material.Neon
        Part9.BrickColor = BrickColor.new("Cyan")
        Part9.Transparency = 0.5
        Part9.Rotation = Vector3.new(0, -89.5899963, 0)
        Part9.Shape = Enum.PartType.Cylinder
        Part9.Size = Vector3.new(1.20000005, 0.649999976, 2)
        Part9.CFrame = CFrame.new(-54.8191681, 0.773548007, -0.0522949994, 0.00736002205, 4.68389771e-11, -0.999974668, 4.72937245e-11, 1, 1.41590961e-10, 0.999974668, 5.09317033e-11, 0.00736002252)
        Part9.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        Part9.Position = Vector3.new(-54.8191681, 0.773548007, -0.0522949994)
        Part9.Orientation = Vector3.new(0, -89.5799942, 0)
        Part9.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        Script10.Name = "Glow Script"
        Script10.Parent = Part9
        table.insert(cors,sandbox(Script10,function()
        while true do
        wait(0.05)
        script.Parent.Transparency = .5
        wait(0.05)
        script.Parent.Transparency = .6
        wait(0.05)
        script.Parent.Transparency = .7
        wait(0.05)
        script.Parent.Transparency = .8
        wait(0.05)
        script.Parent.Transparency = .9
        wait(0.05)
        script.Parent.Transparency = .8
        wait(0.05)
        script.Parent.Transparency = .7
        wait(0.05)
        script.Parent.Transparency = .6
        wait(0.05)
        script.Parent.Transparency = .5
        end
        
        end))
        Part11.Name = "GlowPart"
        Part11.Parent = Tool0
        Part11.Material = Enum.Material.Neon
        Part11.BrickColor = BrickColor.new("Cyan")
        Part11.Transparency = 0.5
        Part11.Rotation = Vector3.new(-89.3799973, -55.7399979, -89.25)
        Part11.Size = Vector3.new(0.280000001, 0.25999999, 0.200000003)
        Part11.CFrame = CFrame.new(-54.9808807, 0.99843204, 0.799362957, 0.00736002205, 0.562958956, -0.826454222, 4.72937245e-11, 0.826475084, 0.56297338, 0.999974668, -0.00414349511, 0.00608287565)
        Part11.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        Part11.Position = Vector3.new(-54.9808807, 0.99843204, 0.799362957)
        Part11.Orientation = Vector3.new(-34.2599983, -89.5799942, 0)
        Part11.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        Script12.Name = "Glow Script"
        Script12.Parent = Part11
        table.insert(cors,sandbox(Script12,function()
        while true do
        wait(0.05)
        script.Parent.Transparency = .5
        wait(0.05)
        script.Parent.Transparency = .6
        wait(0.05)
        script.Parent.Transparency = .7
        wait(0.05)
        script.Parent.Transparency = .8
        wait(0.05)
        script.Parent.Transparency = .9
        wait(0.05)
        script.Parent.Transparency = .8
        wait(0.05)
        script.Parent.Transparency = .7
        wait(0.05)
        script.Parent.Transparency = .6
        wait(0.05)
        script.Parent.Transparency = .5
        end
        
        end))
        Part13.Name = "GlowPart"
        Part13.Parent = Tool0
        Part13.Material = Enum.Material.Neon
        Part13.BrickColor = BrickColor.new("Cyan")
        Part13.Transparency = 0.5
        Part13.Rotation = Vector3.new(95.1500015, -53.8199997, 98.0799942)
        Part13.Size = Vector3.new(0.280000001, 0.25999999, 0.200000003)
        Part13.CFrame = CFrame.new(-54.5909271, 0.978429973, 0.799362957, -0.0830051303, -0.584483683, -0.807150841, 0.0241250042, 0.808528602, -0.58796227, 0.996258855, -0.0682764053, -0.0530113392)
        Part13.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        Part13.Position = Vector3.new(-54.5909271, 0.978429973, 0.799362957)
        Part13.Orientation = Vector3.new(36.0099983, -93.7599945, 1.70999992)
        Part13.Color = Color3.new(0.0156863, 0.686275, 0.92549)
        Script14.Name = "Glow Script"
        Script14.Parent = Part13
        table.insert(cors,sandbox(Script14,function()
        while true do
        wait(0.05)
        script.Parent.Transparency = .5
        wait(0.05)
        script.Parent.Transparency = .6
        wait(0.05)
        script.Parent.Transparency = .7
        wait(0.05)
        script.Parent.Transparency = .8
        wait(0.05)
        script.Parent.Transparency = .9
        wait(0.05)
        script.Parent.Transparency = .8
        wait(0.05)
        script.Parent.Transparency = .7
        wait(0.05)
        script.Parent.Transparency = .6
        wait(0.05)
        script.Parent.Transparency = .5
        end
        
        end))
        for i,v in pairs(mas:GetChildren()) do
            v.Parent = game:GetService("Players").LocalPlayer.Backpack
            pcall(function() v:MakeJoints() end)
        end
        mas:Destroy()
        for i,v in pairs(cors) do
            spawn(function()
                pcall(v)
            end)
        end
    end
})

Randomscripts:AddButton({
    Name = "DINO TRANSFORM (REQUIRES R6 AND A SPECIFIC AVATAR)",
    Callback = function()
        loadstring(game:HttpGetAsync(('https://raw.githubusercontent.com/PYXDYT/DinoBlox/main/FE%20Script'),true))()
    end
})

Randomscripts:AddButton({
    Name = "ZOMBIE SUMMON (REQUIRES R6 AND A SPECIFIC AVATAR)",
    Callback = function()
        loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/someunknowndude/18f1d979ad9a25ad69064be75f55f735/raw/dc36f1e9ad906a7434bd77bcd0ce8218fb5f4d88/zombie.lua"))()
    end
})

Randomscripts:AddButton({
    Name = "FE GUN (REQUIRES R6 AND A SPECIFIC AVATAR)",
    Callback = function()
                --- sub to VmKoofer for choclate 🥺 ---
        -- hats needed here --
        -- after wearing all execute it --
        --FIXED template by fx 8320
        --https://www.roblox.com/catalog/5917433699/Old-Town-Cowboy-Hat-Lil-Nas-X-LNX
        --https://www.roblox.com/catalog/8136940617/Ice-Brain
        --https://www.roblox.com/catalog/48474294/ROBLOX-Girl-Hair
        --https://www.roblox.com/catalog/451220849/Lavender-Updo
        --https://www.roblox.com/catalog/62724852/Chestnut-Bun
        --https://www.roblox.com/catalog/63690008/Pal-Hair
        --https://www.roblox.com/catalog/48474313/Red-Roblox-Cap
        --https://www.roblox.com/catalog/376527115/Jade-Necklace-with-Shell-Pendant
        local HatChar = game.Players.LocalPlayer.Character






        HumanDied = false
        local reanim
        function noplsmesh(hat)
        _G.OldCF=workspace.Camera.CFrame
        oldchar=game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Character=workspace[game.Players.LocalPlayer.Name]
        for i,v in next, workspace[game.Players.LocalPlayer.Name][hat]:GetDescendants() do
        if v:IsA('Mesh') or v:IsA('SpecialMesh') then
        v:Remove()
        end
        end

        end
        _G.ClickFling=false -- Set this to true if u want.
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/OofHead-FE/nexo-before-deleted/main/NexoPD'),true))()



        IT = Instance.new
        CF = CFrame.new
        VT = Vector3.new
        RAD = math.rad
        C3 = Color3.new
        UD2 = UDim2.new
        BRICKC = BrickColor.new
        ANGLES = CFrame.Angles
        EULER = CFrame.fromEulerAnglesXYZ
        COS = math.cos
        ACOS = math.acos
        SIN = math.sin
        ASIN = math.asin
        ABS = math.abs
        MRANDOM = math.random
        FLOOR = math.floor

        speed = 1
        sine = 1
        srv = game:GetService('RunService')

        function hatset(yes,part,c1,c0,nm)
        reanim[yes].Handle.AccessoryWeld.Part1=reanim[part]
        reanim[yes].Handle.AccessoryWeld.C1=c1 or CFrame.new()
        reanim[yes].Handle.AccessoryWeld.C0=c0 or CFrame.new()--3bbb322dad5929d0d4f25adcebf30aa5
        if nm==true then
        noplsmesh(yes)
        end
        end

        --put the hat script converted below

        reanim = game.Players.LocalPlayer.Character.CWExtra.NexoPD
        RJ = reanim.HumanoidRootPart.RootJoint
        RS = reanim.Torso['Right Shoulder']
        LS = reanim.Torso['Left Shoulder']
        RH = reanim.Torso['Right Hip']
        LH = reanim.Torso['Left Hip']
        Root = reanim.HumanoidRootPart
        NECK = reanim.Torso.Neck
        NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        RJ.C1 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        RS.C1 = CF(-0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        RH.C1 = CF(0.5,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        LH.C1 = CF(-0.5,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
        LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))

        Mode='1'

        mousechanger=game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == 'f' then-- first mode
        Mode='1'
        elseif k == 'r' then-- first mode
        Mode='2'
        end
        end)



        attacklol=game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
        if Mode == '1' then
        Mode='Attack0'
        wait(0.07) -- time of attack u can edit this
        Mode='Attack1'
        wait(.1)
        Mode='Attack3'
        wait(.2)
        Mode ='1'
        elseif Mode == '2' then
        Mode='Attack0'
        wait(0.07) -- time of attack u can edit this
        Mode='Attack1'
        wait(.1)
        Mode='Attack3'
        wait(.2)
        Mode ='2'
        end
        end)

        reanim['Necklace'].Handle.AccessoryWeld.C0 = reanim['Necklace'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),1.7+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        reanim['rol_icebrainAccessory'].Handle.AccessoryWeld.C0 = reanim['rol_icebrainAccessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),2.6+0*math.cos(sine/13),1.7+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        reanim['Pink Hair'].Handle.AccessoryWeld.C0 = reanim['Pink Hair'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),4+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        reanim['LavanderHair'].Handle.AccessoryWeld.C0 = reanim['LavanderHair'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),-1.5+0*math.cos(sine/13),5.5+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        reanim['Pal Hair'].Handle.AccessoryWeld.C0 = reanim['Pal Hair'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),-1.5+0*math.cos(sine/13),1.5+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        reanim['Robloxclassicred'].Handle.AccessoryWeld.C0 = reanim['Robloxclassicred'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        reanim['Kate Hair'].Handle.AccessoryWeld.C0 = reanim['Kate Hair'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),-1.5+0*math.cos(sine/13),3.5+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        coroutine.wrap(function()
        hatset('Necklace','Right Arm',CFrame.new(),reanim['Necklace'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0*math.cos(sine/13),1.7+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),true)
        hatset('rol_icebrainAccessory','Right Arm',CFrame.new(),reanim['rol_icebrainAccessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),2.6+0*math.cos(sine/13),1.7+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),true)
        hatset('Pink Hair','Right Arm',CFrame.new(),reanim['Pink Hair'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),4+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),true)
        hatset('LavanderHair','Right Arm',CFrame.new(),reanim['LavanderHair'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),-1.5+0*math.cos(sine/13),5.5+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),true)
        hatset('Kate Hair','Right Arm',CFrame.new(),reanim['Kate Hair'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),-1.5+0*math.cos(sine/13),3.5+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),true)
        hatset('Pal Hair','Right Arm',CFrame.new(),reanim['Pal Hair'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),-1.5+0*math.cos(sine/13),1.5+0*math.cos(sine/13))*ANGLES(RAD(90+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),true)
        hatset('Robloxclassicred','Right Arm',CFrame.new(),reanim['Robloxclassicred'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),1),true)
        while true do -- anim changer
        if HumanDied then mousechanger:Disconnect() attacklol:Disconnect() break end
        sine = sine + speed
        local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
        local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
        local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
        local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
        local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
        local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
        if lookvector > reanim.Humanoid.WalkSpeed then
        lookvector = reanim.Humanoid.WalkSpeed
        end
        if lookvector < -reanim.Humanoid.WalkSpeed then
        lookvector = -reanim.Humanoid.WalkSpeed
        end
        if rightvector > reanim.Humanoid.WalkSpeed then
        rightvector = reanim.Humanoid.WalkSpeed
        end
        if rightvector < -reanim.Humanoid.WalkSpeed then
        rightvector = -reanim.Humanoid.WalkSpeed
        end
        local lookvel = lookvector / reanim.Humanoid.WalkSpeed
        local rightvel = rightvector / reanim.Humanoid.WalkSpeed
        if Mode == '1' then
        if Root.Velocity.y > 1 then -- jump
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(3+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(95+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-3+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(-85+0*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/13),-0.6+-0.1*math.cos(sine/13),-0.5+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/13),-0.89+-0.1*math.cos(sine/13),0.3+0*math.cos(sine/13))*ANGLES(RAD(-15+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        elseif Root.Velocity.y < -1 then -- fall
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-4+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(3+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(130+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-3+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(-118+0*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/13),-0.6+-0.1*math.cos(sine/13),-0.5+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/13),-0.89+-0.1*math.cos(sine/13),0.3+0*math.cos(sine/13))*ANGLES(RAD(-15+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        elseif Root.Velocity.Magnitude < 2 then -- idle

        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(3+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(61+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(-51+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),-2+0.1*math.cos(sine/13))*ANGLES(RAD(56+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(1+0*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/13),-1+-0.1*math.cos(sine/13)+(rlegendPoint.Y+1-reanim['Right Leg'].Position.Y),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(-6+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/13),-1+-0.1*math.cos(sine/13)+(llegendPoint.Y+1-reanim['Left Leg'].Position.Y),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(23+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        elseif Root.Velocity.Magnitude < 200 then -- walk

        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(3+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(61+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(-51+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),-2+0.1*math.cos(sine/13))*ANGLES(RAD(56+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(1+0*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/8),-1+0.5*math.cos(sine/8),0+0*math.cos(sine/8))*ANGLES(RAD(0*1+50*math.sin(sine/8))*lookvel,RAD(0+0*math.cos(sine/8)),RAD(0+25*math.sin(sine/8))*rightvel),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/8),-1+-0.5*math.cos(sine/8),0+0*math.cos(sine/8))*ANGLES(RAD(0*1+-50*math.sin(sine/8))*lookvel,RAD(0+0*math.cos(sine/8)),RAD(0+-25*math.sin(sine/8))*rightvel),.3)
        end
        elseif Mode == '2' then
        if Root.Velocity.y > 1 then -- jump
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-15+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(43+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(-51+0*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/13),-1+-0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-24+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/13),-1+-0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(23+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        elseif Root.Velocity.y < -1 then -- fall
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(12+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(121+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(-122+0*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/13),-1+-0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(24+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/13),-1+-0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-24+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        elseif Root.Velocity.Magnitude < 2 then -- idle
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(212+14*math.cos(sine/13)),RAD(0+12*math.cos(sine/13)),RAD(0+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(-51+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(39+14*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/13),-1+-0.1*math.cos(sine/13)+(rlegendPoint.Y+1-reanim['Right Leg'].Position.Y),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/13),-1+-0.1*math.cos(sine/13)+(llegendPoint.Y+1-reanim['Left Leg'].Position.Y),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        elseif Root.Velocity.Magnitude < 200 then -- walk
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(212+14*math.cos(sine/13)),RAD(0+12*math.cos(sine/13)),RAD(0+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-1.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),0+0.1*math.cos(sine/13))*ANGLES(RAD(-51+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(39+14*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/8),-1+0.5*math.cos(sine/8),0+0*math.cos(sine/8))*ANGLES(RAD(0*1+50*math.sin(sine/8))*lookvel,RAD(0+0*math.cos(sine/8)),RAD(0+25*math.sin(sine/8))*rightvel),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/8),-1+-0.5*math.cos(sine/8),0+0*math.cos(sine/8))*ANGLES(RAD(0*1+-50*math.sin(sine/8))*lookvel,RAD(0+0*math.cos(sine/8)),RAD(0+-25*math.sin(sine/8))*rightvel),.3)

        end
        elseif Mode == 'Attack0' then --attack clerp 
        NECK.C0 = NECK.C0:Lerp(CF(0+0*math.cos(sine/13),1+0*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RJ.C0 = RJ.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.1*math.cos(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-4+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        RS.C0 = RS.C0:Lerp(CF(0.6+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),-1.5+0.1*math.cos(sine/13))*ANGLES(RAD(85+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(1+0*math.sin(sine/13))),.3)
        LS.C0 = LS.C0:Lerp(CF(-0.5+0.1*math.sin(sine/13),0.5+0.1*math.sin(sine/13),-5+0.1*math.cos(sine/13))*ANGLES(RAD(92+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.sin(sine/13))),.3)
        RH.C0 = RH.C0:Lerp(CF(1+0*math.cos(sine/13),-0.6+-0.1*math.cos(sine/13),-0.5+0*math.cos(sine/13))*ANGLES(RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)
        LH.C0 = LH.C0:Lerp(CF(-1+0*math.cos(sine/13),-0.89+-0.1*math.cos(sine/13),0.3+0*math.cos(sine/13))*ANGLES(RAD(-15+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13)),RAD(0+0*math.cos(sine/13))),.3)

        elseif Mode == 'Attack1' then --attack clerp 
        elseif Mode == 'Attack3' then --attack clerp 


        end
        srv.RenderStepped:Wait()
        end
        end)()
        --template by fx 8320
    end
})

Randomscripts:AddButton({
    Name = "backdoor.exe v8, allows you to run SS scripts on certain games",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/main.lua"))();
    end
})

Randomscripts:AddButton({
    Name = "Unanchored Part Bringer GUI",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/WkZwcGjf", true))()
    end
})

Randomscripts:AddButton({
    Name = "LeftCtrl+Click TP",
    Callback = function()
        local Plr = game:GetService("Players").LocalPlayer local Mouse = Plr:GetMouse()

	Mouse.Button1Down:connect( function() if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end if not Mouse.Target then return end Plr.Character:MoveTo(Mouse.Hit.p) end )
    end
})

Randomscripts:AddButton({
    Name = "Dark Dex V4",
    Callback = function()
        loadstring(game:HttpGetAsync(("https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4")))()
    end
})

Randomscripts:AddDropdown({
	Name = "FE Bring (requires a tool, may not work sometimes)",
	Default = playerslist[1],
	Options = playerslist,
	Callback = function(Value)
		Target = Value
 
		NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.Humanoid.Name = 1
		local l = game.Players.LocalPlayer.Character["1"]:Clone()
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		wait()
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		wait()
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		end
		local function tp(player,player2)
		local char1,char2=player.Character,player2.Character
		if char1 and char2 then
		char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
		end
		end
		local function getout(player,player2)
		local char1,char2=player.Character,player2.Character
		if char1 and char2 then
		char1:MoveTo(char2.Head.Position)
		end
		end
		tp(game.Players[Target], game.Players.LocalPlayer)
		wait()
		tp(game.Players[Target], game.Players.LocalPlayer)
		wait()
		getout(game.Players.LocalPlayer, game.Players[Target])
		wait()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
	end    
})

SpecificSectionD:AddButton({
    Name = "Doors GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OminousVibes-Exploit/Scripts/main/doors/main.lua"))()
    end
})

SpecificSectionD:AddButton({
    Name = "Doors GUI 2",
    Callback = function()
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
        local Window = OrionLib:MakeWindow({IntroText = "Doors GUI v1.2",Name = "Doors", HidePremium = false, SaveConfig = true, ConfigFolder = "DoorsSex"})
        if game.PlaceId == 6516141723 then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Please execute when in game, not in lobby.",
                Time = 2
            })
        end
        local VisualsTab = Window:MakeTab({
            Name = "Visuals",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        local CF = CFrame.new
        local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
        local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart

        local KeyChams = {}
        VisualsTab:AddToggle({
            Name = "Key Chams",
            Default = false,
            Flag = "KeyToggle",
            Save = true,
            Callback = function(Value)
                for i,v in pairs(KeyChams) do
                    v.Enabled = Value
                end
            end    
        })

        local function ApplyKeyChams(inst)
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Adornee = inst
            Cham.Enabled = OrionLib.Flags["KeyToggle"].Value
            Cham.RobloxLocked = true
            return Cham
        end

        local KeyCoroutine = coroutine.create(function()
            workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
                if inst.Name == "KeyObtain" then
                    table.insert(KeyChams,ApplyKeyChams(inst))
                end
            end)
        end)
        for i,v in ipairs(workspace:GetDescendants()) do
            if v.Name == "KeyObtain" then
                table.insert(KeyChams,ApplyKeyChams(v))
            end
        end
        coroutine.resume(KeyCoroutine)

        local BookChams = {}
        VisualsTab:AddToggle({
            Name = "Book Chams",
            Default = false,
            Flag = "BookToggle",
            Save = true,
            Callback = function(Value)
                for i,v in pairs(BookChams) do
                    v.Enabled = Value
                end
            end    
        })

        local FigureChams = {}
        VisualsTab:AddToggle({
            Name = "Figure Chams",
            Default = false,
            Flag = "FigureToggle",
            Save = true,
            Callback = function(Value)
                for i,v in pairs(FigureChams) do
                    v.Enabled = Value
                end
            end
        })

        local function ApplyBookChams(inst)
            if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50 then
                wait()
                local Cham = Instance.new("Highlight")
                Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                Cham.FillColor = Color3.new(0, 1, 0.749019)
                Cham.FillTransparency = 0.5
                Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
                Cham.Parent = game:GetService("CoreGui")
                Cham.Enabled = OrionLib.Flags["BookToggle"].Value
                Cham.Adornee = inst
                Cham.RobloxLocked = true
                return Cham
            end
        end

        local function ApplyEntityChams(inst)
            wait()
            local Cham = Instance.new("Highlight")
            Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Cham.FillColor = Color3.new(1, 0, 0)
            Cham.FillTransparency = 0.5
            Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
            Cham.Parent = game:GetService("CoreGui")
            Cham.Enabled = OrionLib.Flags["FigureToggle"].Value
            Cham.Adornee = inst
            Cham.RobloxLocked = true
            return Cham
        end

        local BookCoroutine = coroutine.create(function()
            task.wait(1)
            for i,v in pairs(game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants()) do
                if v.Name == "LiveHintBook" then
                    table.insert(BookChams,ApplyBookChams(v))
                end
            end
        end)
        local EntityCoroutine = coroutine.create(function()
            local Entity = game:GetService("Workspace").CurrentRooms["50"].FigureSetup:WaitForChild("FigureRagdoll",5)
            Entity:WaitForChild("Torso",2.5)
            table.insert(FigureChams,ApplyEntityChams(Entity))
        end)


        local GameTab = Window:MakeTab({
            Name = "Game",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        local CharTab = Window:MakeTab({
            Name = "Character",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        local TargetWalkspeed
        CharTab:AddSlider({
            Name = "Speed",
            Min = 0,
            Max = 50,
            Default = 5,
            Color = Color3.fromRGB(255,255,255),
            Increment = 1,
            Callback = function(Value)
                TargetWalkspeed = Value
            end    
        })

        local pcl = Instance.new("SpotLight")
        pcl.Brightness = 1
        pcl.Face = Enum.NormalId.Front
        pcl.Range = 90
        pcl.Parent = game.Players.LocalPlayer.Character.Head
        pcl.Enabled = false


        CharTab:AddToggle({
            Name = "Headlight",
            Default = false,
            Callback = function(Value)
                pcl.Enabled = Value
            end
        })

        GameTab:AddToggle({
            Name = "No seek arms/obstructions",
            Default = false,
            Flag = "NoSeek",
            Save = true
        })

        GameTab:AddToggle({
            Name = "Instant Interact",
            Default = false,
            Flag = "InstantToggle",
            Save = true
        })
        GameTab:AddButton({
            Name = "Skip level",
            Callback = function()
                pcall(function()
                    local HasKey = false
                    local CurrentDoor = workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
                    for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                        if v.Name == "KeyObtain" then
                            HasKey = v
                        end
                    end
                    if HasKey then
                        game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                        wait(0.3)
                        fireproximityprompt(HasKey.ModulePrompt,0)
                        game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                        wait(0.3)
                        fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
                    end
                    if LatestRoom == 50 then
                        CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
                    end
                    game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                    wait(0.3)
                    CurrentDoor.ClientOpen:FireServer()
                end)
            end    
        })

        GameTab:AddToggle({
            Name = "Auto skip level",
            Default = false,
            Save = false,
            Flag = "AutoSkip"
        })

        local AutoSkipCoro = coroutine.create(function()
                while true do
                    task.wait()
                    pcall(function()
                    if OrionLib.Flags["AutoSkip"].Value == true and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value < 100 then
                        local HasKey = false
                        local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value
                        local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom)]:WaitForChild("Door")
                        for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                            if v.Name == "KeyObtain" then
                                HasKey = v
                            end
                        end
                        if HasKey then
                            game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                            task.wait(0.3)
                            fireproximityprompt(HasKey.ModulePrompt,0)
                            game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                            task.wait(0.3)
                            fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
                        end
                        if LatestRoom == 50 then
                            CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
                        end
                        game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                        task.wait(0.3)
                        CurrentDoor.ClientOpen:FireServer()
                    end
                end)
                end
        end)
        coroutine.resume(AutoSkipCoro)

        GameTab:AddButton({
            Name = "No jumpscares",
            Callback = function()
                pcall(function()
                    game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
                end)
            end    
        })
        GameTab:AddToggle({
            Name = "Avoid Rush/Ambush",
            Default = false,
            Flag = "AvoidRushToggle",
            Save = true
        })
        GameTab:AddToggle({
            Name = "No Screech",
            Default = false,
            Flag = "ScreechToggle",
            Save = true
        })

        GameTab:AddToggle({
            Name = "Always win heartbeat",
            Default = false,
            Flag = "HeartbeatWin",
            Save = true
        })

        GameTab:AddToggle({
            Name = "Predict chases",
            Default = false,
            Flag = "PredictToggle" ,
            Save = true
        })
        GameTab:AddToggle({
            Name = "Notify when mob spawns",
            Default = false,
            Flag = "MobToggle" ,
            Save = true
        })
        GameTab:AddButton({
            Name = "Complete breaker box minigame",
            Callback = function()
                game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
            end    
        })
        GameTab:AddButton({
            Name = "Skip level 50",
            Callback = function()
                local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
            end    
        })
        GameTab:AddParagraph("Warning","You may need to open/close the panel a few times for this to work, fixing soon.")

        --// ok actual code starts here

        game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed/50)
                end
            end)
        end)

        game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(descendant)
            if OrionLib.Flags["NoSeek"].Value == true and descendant.Name == ("Seek_Arm" or "ChandelierObstruction") then
                task.spawn(function()
                    wait()
                    descendant:Destroy()
                end)
            end
        end)

        game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
            if OrionLib.Flags["InstantToggle"].Value == true then
                fireproximityprompt(prompt)
            end
        end)

        local old
        old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
            local args = {...}
            local method = getnamecallmethod()

            if tostring(self) == 'Screech' and method == "FireServer" and OrionLib.Flags["ScreechToggle"].Value == true then
                args[1] = true
                return old(self,unpack(args))
            end
            if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and OrionLib.Flags["HeartbeatWin"].Value == true then
                args[2] = true
                return old(self,unpack(args))
            end

            return old(self,...)
        end))

        workspace.CurrentCamera.ChildAdded:Connect(function(child)
            if child.Name == "Screech" and OrionLib.Flags["ScreechToggle"].Value == true then
                child:Destroy()
            end
        end)

        local NotificationCoroutine = coroutine.create(function()
            LatestRoom.Changed:Connect(function()
                if OrionLib.Flags["PredictToggle"].Value == true then
                    local n = ChaseStart.Value - LatestRoom.Value
                    if 0 < n and n < 4 then
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Event in " .. tostring(n) .. " rooms.",
                            Time = 5
                        })
                    end
                end
                if OrionLib.Flags["BookToggle"].Value == true then
                    if LatestRoom.Value == 50 then
                        coroutine.resume(BookCoroutine)
                    end
                end
                if OrionLib.Flags["FigureToggle"].Value == true then
                    if LatestRoom.Value == 50 then
                        coroutine.resume(EntityCoroutine)
                    end
                end
            end)
            workspace.ChildAdded:Connect(function(inst)
                if inst.Name == "RushMoving" and OrionLib.Flags["MobToggle"].Value == true then
                    if OrionLib.Flags["AvoidRushToggle"].Value == true then
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Avoiding Rush. Please wait.",
                            Time = 5
                        })
                        local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local con = game:GetService("RunService").Heartbeat:Connect(function()
                            game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                        end)

                        inst.Destroying:Wait()
                        con:Disconnect()

                        game.Players.LocalPlayer.Character:MoveTo(OldPos)
                    else
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Rush has spawned, hide!",
                            Time = 5
                        })
                    end
                elseif inst.Name == "AmbushMoving" and OrionLib.Flags["MobToggle"].Value == true then
                    if OrionLib.Flags["AvoidRushToggle"].Value == true then
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Avoiding Ambush. Please wait.",
                            Time = 5
                        })
                        local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local con = game:GetService("RunService").Heartbeat:Connect(function()
                            game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0,20,0))
                        end)

                        inst.Destroying:Wait()
                        con:Disconnect()

                        game.Players.LocalPlayer.Character:MoveTo(OldPos)
                    else
                        OrionLib:MakeNotification({
                            Name = "Warning!",
                            Content = "Ambush has spawned, hide!",
                            Time = 5
                        })
                    end
                end
            end)
        end)

        --// ok actual code ends here

        local CreditsTab = Window:MakeTab({
            Name = "Credits",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })

        CreditsTab:AddParagraph("Credits to","OminousVibes - (Got most of the ideas from their thread, check it out! - https://v3rmillion.net/showthread.php?tid=1184088)")

        coroutine.resume(NotificationCoroutine)

        OrionLib:Init()

        task.wait(2)
    end
})

SpecificSection1:AddButton({
    Name = "Rainbow Friends GUI",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()
    end
})

SpecificSection1:AddButton({
    Name = "Better Rainbow Friends GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TweedLeak/Scripts/main/Rainbow-Friends.lua"))()
    end
})

SpecificSectionF:AddButton({
    Name = "Super Strength (throw really far)",
    Callback = function()
        local bodyvel_Name = "FlingVelocity"
	local userinputs = game:GetService("UserInputService")
	local w = game:GetService("Workspace")
	local r = game:GetService("RunService")
	local d = game:GetService("Debris")
	local strength = 1500

	w.ChildAdded:Connect(function(model)
	    if model.Name == "GrabParts" then
		local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1

		if part_to_impulse then
		    print("Part found!")

		    local inputObj
		    local velocityObj = Instance.new("BodyVelocity", part_to_impulse)

		    model:GetPropertyChangedSignal("Parent"):Connect(function()
			if not model.Parent then
			    if userinputs:GetLastInputType() == Enum.UserInputType.MouseButton2 then
				print("Launched!")
				velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				velocityObj.Velocity = workspace.CurrentCamera.CFrame.lookVector * strength
				d:AddItem(velocityObj, 1)
			    elseif userinputs:GetLastInputType() == Enum.UserInputType.MouseButton1 then
				velocityObj:Destroy()
				print("Cancel Launch!")
			    else
				velocityObj:Destroy()
				print("No two keys pressed!")
			    end
			end
		    end)
		end
	    end
	end)
    end
})

SpecificSectionF:AddButton({
    Name = "Anti-Hold (people can not hold you)",
    Callback = function()
        local PS = game:GetService("Players")
	local Player = PS.LocalPlayer
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local RS = game:GetService("ReplicatedStorage")
	local CE = RS:WaitForChild("CharacterEvents")
	local R = game:GetService("RunService")
	local BeingHeld = Player:WaitForChild("IsHeld")
	local PlayerScripts = Player:WaitForChild("PlayerScripts")

	--[[ Remotes ]]
	local StruggleEvent = CE:WaitForChild("Struggle")

	--[[ Anti-Explosion ]]
	workspace.DescendantAdded:Connect(function(v)
	if v:IsA("Explosion") then
	v.BlastPressure = 0
	end
	end)

	--[[ Anti-grab ]]

	BeingHeld.Changed:Connect(function(C)
	    if C == true then
		local char = Player.Character

		if BeingHeld.Value == true then
		    local Event;
		    Event = R.RenderStepped:Connect(function()
			if BeingHeld.Value == true then
			    char["HumanoidRootPart"].AssemblyLinearVelocity = Vector3.new()
			    StruggleEvent:FireServer(Player)
			elseif BeingHeld.Value == false then
			    Event:Disconnect()
			end
		    end)
		end
	    end
	end)

	local function reconnect()
	    local Character = Player.Character or Player.CharacterAdded:Wait()
	    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid") or Character:WaitForChild("Humanoid")
	    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

	    HumanoidRootPart:WaitForChild("FirePlayerPart"):Remove()

	    Humanoid.Changed:Connect(function(C)
		if C == "Sit" and Humanoid.Sit == true then
		    if Humanoid.SeatPart ~= nil and tostring(Humanoid.SeatPart.Parent) == "CreatureBlobman" then
		    elseif Humanoid.SeatPart == nil then
		    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
		    Humanoid.Sit = false
		    end
		end
	    end)
	end

	reconnect()

	Player.CharacterAdded:Connect(reconnect)
    end
})

SpecificSectionF:AddButton({
    Name = "Poison (slowly kill people as you hold them)",
    Callback = function()
        print("Poison Loaded!")
 
	local userinputs = game:GetService("UserInputService")
	local w = game:GetService("Workspace")
	local r = game:GetService("RunService")

	local poison_part1 = workspace["Map"]["Hole"]["PoisonBigHole"]["PoisonHurtPart"]
	local poison_part2 = workspace["Map"]["Hole"]["PoisonSmallHole"]["PoisonHurtPart"]
	local poison_part3
	local poison_part4

	local Poison_Touch = true
	local key = Enum.KeyCode.K

	userinputs.InputBegan:Connect(function(input, chat) 
	    if input.KeyCode == key and not chat then
		if Poison_Touch then
		    Poison_Touch = false
		else
		    Poison_Touch = true
		end
	    end
	end)

	for _, part in pairs(workspace["Map"]["FactoryIsland"]:GetDescendants()) do
	    if part.Name == "PoisonHurtPart" then
		if not poison_part3 then
		    poison_part3 = part
		    part.Transparency = 1
		    part.Size = Vector3.new(0.5, 0.5, 0.5)
		    part.Position = Vector3.new()
		elseif not poison_part4 then
		    poison_part4 = part
		    part.Transparency = 1
		    part.Size = Vector3.new(0.5, 0.5, 0.5)
		    part.Position = Vector3.new()
		end
	    end
	end

	poison_part1.Size, poison_part2.Size = Vector3.new(0.5, 0.5, 0.5), Vector3.new(0.5, 0.5, 0.5)
	poison_part1.Position, poison_part2.Position = Vector3.new(0, 0, 0), Vector3.new(0,0,0)

	local poison_part = workspace["Map"]["Hole"]["PoisonBigHole"]["PoisonHurtPart"]
	poison_part.Size = Vector3.new(1,1,1)
	poison_part.Transparency = 1

	w.ChildAdded:Connect(function(model)
	    if model.Name == "GrabParts" then
		local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1

		if part_to_impulse then
		    print("Part found!")

		    if part_to_impulse.Parent:FindFirstChildOfClass("Humanoid") then
			print("Poison Started!")

			local head = part_to_impulse.Parent["Head"]

			while model.Parent do
			    if Poison_Touch then
				poison_part.Position = head.Position
				poison_part2.Position = head.Position
				poison_part3.Position = head.Position
				poison_part4.Position = head.Position
			    else
				poison_part3.Position = Vector3.new()
				poison_part4.Position = Vector3.new()
				poison_part2.Position = Vector3.new()
				poison_part.Position = Vector3.new()
			    end

			    task.wait()
			end

			print("Poison ended!")

			poison_part3.Position = Vector3.new()
			poison_part4.Position = Vector3.new()
			poison_part2.Position = Vector3.new()
			poison_part.Position = Vector3.new()
		    end
		end
	    end
	end)
    end
})

SpecificSection2:AddButton({
    Name = "Epic Minigames GUI",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Epic%20Minigames/EpicMinigamesGUI"))()
    end
})


SpecificSection3:AddButton({
    Name = "Horrific Housing GUI",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/typical-overk1ll/scripts/main/HorrificHousing",true))()
    end
})

SpecificSection4:AddButton({
    Name = "Build A Boat For Treasure GUI",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/Build-A-Boat'))()
    end
})

SpecificSection5:AddButton({
    Name = "Victory Race GUI",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SmoxHub/SmoxHub-V2/main/Victory-Race-V2", true))()
    end
})

SpecificSection5:AddButton({
    Name = "Shadovis RPG GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LioK251/RbScripts/main/shadovis_rpg.lua"))()
    end
})

SpecificSection6:AddButton({
    Name = "M9 Giver",
    Callback = function()
        local itemhandler = game.Workspace.Remote.ItemHandler
        itemhandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["M9"].ITEMPICKUP)
    end
})

SpecificSection6:AddButton({
    Name = "Remington 870 Giver",
    Callback = function()
        local itemhandler = game.Workspace.Remote.ItemHandler
        itemhandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
    end
})

SpecificSection6:AddButton({
    Name = "AK47 Giver",
    Callback = function()
        local itemhandler = game.Workspace.Remote.ItemHandler
        itemhandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["AK-47"].ITEMPICKUP)
    end
})

SpecificSection6:AddButton({
    Name = "M4A1 Giver (must have the gamepass)",
    Callback = function()
        local itemhandler = game.Workspace.Remote.ItemHandler
        itemhandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["M4A1"].ITEMPICKUP)
    end
})

SpecificSection6:AddButton({
    Name = "Riot Shield Giver (must have the gamepass)",
    Callback = function()
        local itemhandler = game.Workspace.Remote.ItemHandler
        itemhandler:InvokeServer(game.Workspace.Prison_ITEMS.giver["Riot Shield"].ITEMPICKUP)
    end
})

SpecificSection6:AddButton({
    Name = "Hammer Giver (check the console if it doesn't work)",
    Callback = function()
        local itemhandler = game.Workspace.Remote.ItemHandler
        if game.Workspace.Prison_ITEMS.single["Hammer"].ITEMPICKUP then
            itemhandler:InvokeServer(game.Workspace.Prison_ITEMS.single["Hammer"].ITEMPICKUP)
        else
            print("You need to wait for the Hammer to respawn in order to be given it. You also need to be a Prisoner.")
        end
    end
})

SpecificSection6:AddButton({
    Name = "Crude Knife Giver (check the console if it doesn't work)",
    Callback = function()
        local itemhandler = game.Workspace.Remote.ItemHandler
        if game.Workspace.Prison_ITEMS.single["Crude Knife"].ITEMPICKUP then
            itemhandler:InvokeServer(game.Workspace.Prison_ITEMS.single["Crude Knife"].ITEMPICKUP)
        else
            print("You need to wait for the Crude Knife to respawn in order to be given it. You also need to be a Prisoner.")
        end
    end
})

SpecificSection6:AddButton({
    Name = "Key Card Giver (check the console if it doesn't work)",
    Callback = function()
        local itemhandler = game.Workspace.Remote.ItemHandler
        if game.Workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP then
            itemhandler:InvokeServer(game.Workspace.Prison_ITEMS.single["Key card"].ITEMPICKUP)
        else
            print("There needs to be a key card that has been already dropped in the map. Such ways this could happen: A cop being killed, and it dropping a key card.")
        end
    end
})

SpecificSection6:AddButton({
    Name = "Prison Life Admin",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife"))()
    end
})


OrionLib:Init()

game.Players.PlayerAdded:Connect(function(player)
	if not v.Name == game.Players.LocalPlayer.Name then table.insert(playerslist, v.Name) return end
end)
	
game.Players.PlayerRemoving:Connect(function(player)
	local playername = player.Name
	for i = 1, #playerlist do
		if playerlist[i] == playername then
			table.remove(playerlist, i)
		end
	end
end)
