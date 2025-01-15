local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Cynacol's Script Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local plr = game.Players.LocalPlayer
local character = plr.Character
local hum = workspace:FindFirstChild(plr.Name).HumanoidRootPart
local Randomscripts = Window:CreateTab("Miscellaneous")
local flingscripts = Window:CreateTab("Fling Things and People")
local gamescripts = Window:CreateTab("Random games")

local Button = Randomscripts:CreateButton({
   Name = "Infinite Yield FE Admin",
   Callback = function()
        loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button2 = Randomscripts:CreateButton({
   Name = "CMDX FE Admin",
   Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
   end,
})

local Button3 = Randomscripts:CreateButton({
   Name = "SimpleSpy",
   Callback = function()
        loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
   end,
})



local Button4 = Randomscripts:CreateButton({
   Name = "Net bypass",
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
   end,
})

local Button35 = Randomscripts:CreateButton({
   Name = "telekinesis",
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
   end,
})



local Button31 = Randomscripts:CreateButton({
   Name = "hydroxide",
   Callback = function()
        local owner = "Upbolt"
	local branch = "revision"

	local function webImport(file)
		return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
	end

	webImport("init")
	webImport("ui/main")
   end,
})


local luckybutton = Randomscripts:CreateButton({
    Name = "lucky block battlegrounds rainbow block",
    Callback = function()
        game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    end,
})

local luckybutton2 = Randomscripts:CreateButton({
    Name = "lucky block battlegrounds galaxy block",
    Callback = function()
        game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    end,
})

local flingbuttom = flingscripts:CreateButton({
    Name = "fling things and people throw far",
    Callback = function()
        local bodyvel_Name = "FlingVelocity"
	local userinputs = game:GetService("UserInputService")
	local w = game:GetService("Workspace")
	local r = game:GetService("RunService")
	local d = game:GetService("Debris")
	local strength = 2500

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
    end,
})

local flinganti2 = flingscripts:CreateButton({
    Name = "fling things anti hold",
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
    end,
})

local bcb = gamescripts:CreateLabel("Be Crushed by a Speeding Wall")
local Toggle = gamescripts:CreateToggle({
   Name = "Autofarm Coins",
   CurrentValue = false,
   Callback = function(Value)
    CurrentValue = Value

    
	if Value == true then

		task.spawn(function()

			while CurrentValue == true do task.wait()

                hum.CFrame = workspace.Lifebricks["1"].CFrame
                task.wait(1)
                hum.CFrame = workspace.Lifebricks["2"].CFrame
                task.wait(1)
                hum.CFrame = workspace.Lifebricks["3"].CFrame
                task.wait(1)
                hum.CFrame = workspace.Lifebricks["4"].CFrame
                task.wait(1)
                hum.Parent.Humanoid.Health = -1
                plr.CharacterAdded:Wait()
                task.wait(1)
                hum = workspace:FindFirstChild(plr.Name).HumanoidRootPart
            end
		end)
	end
   end,
})
Rayfield:LoadConfiguration()
