local sounds = love.sound.newSoundData("1.wav")
sounds = love.audio.newSource(sounds)
sounds:play()

local backimage = love.graphics.newImage("background.png")

local sddataCSSi
local hddataCSSi
local sddataName
local hddataName
local BackgroundHeight
local warp
local position = {}
local wait = 0
local keycooldown = 0
local sdIcon = love.graphics.newCanvas(80*1,24*1)
local hdIcon = love.graphics.newCanvas(80*3,24*3)
local sdName = love.graphics.newCanvas(144*1,32*1)
local hdName = love.graphics.newCanvas(144*3,32*3)
local operation = false
function love.load()
    if love.filesystem.getInfo("CSSi","directory") == nil then love.filesystem.createDirectory("CSSi") end
    if love.filesystem.getInfo("CSSi HD","directory") == nil then love.filesystem.createDirectory("CSSi HD") end
    if love.filesystem.getInfo("Nameplates","directory") == nil then love.filesystem.createDirectory("Nameplates") end
    if love.filesystem.getInfo("Nameplates HD","directory") == nil then love.filesystem.createDirectory("Nameplates HD") end
    love.graphics.setDefaultFilter("nearest","nearest")
    font = {}
    font.SDCSSi = love.graphics.newFont("FOT-RodinPro-EB.otf",11);font.SDCSSi:setLineHeight(0.5)
    font.HDCSSi = love.graphics.newFont("FOT-RodinPro-EB.otf",33);font.HDCSSi:setLineHeight(0.5)
    font.SDName_big = love.graphics.newFont("Genuine.ttf",28);font.SDName_sml = love.graphics.newFont("Genuine.ttf",20);
    font.HDName_big = love.graphics.newFont("Genuine.ttf",84);font.HDName_sml = love.graphics.newFont("Genuine.ttf",60);
    Directory = "list.txt"
    fileoperation = love.filesystem.getInfo("list.txt","file")
    i = 1
    IconNames = {}
    if fileoperation == nil then
        file = love.filesystem.newFile("list.txt")
        file:open("a")
        file:write("MARIO\n")
        file:write("DONKEY KONG\n")
        file:write("LINK\n")
        file:write("SAMUS\n")
        file:write("YOSHI\n")
        file:write("KIRBY\n")
        file:write("FOX\n")
        file:write("PIKACHU\n")
        file:write("LUIGI\n")
        file:write("CAPTAIN FALCON\n")
        file:write("NESS\n")
        file:write("BOWSER\n")
        file:write("PEACH\n")
        file:write("ZELDA\n")
        file:write("SHEIK\n")
        file:write("ICE\\nCLIMBERS\n")
        file:write("MARTH\n")
        file:write("Mr. GAME & WATCH\n")
        file:write("FALCO\n")
        file:write("GANONDORF\n\n")
        file:write("META\\nKNIGHT\n")
        file:write("PIT\n")
        file:write("ZERO SUIT SAMUS\n")
        file:write("OLIMAR\n")
        file:write("LUCAS\n")
        file:write("DIDDY\\nKONG\n")
        file:write("MEWTWO\n")
        file:write("CHARIZARD\n")
        file:write("SQUIRTLE\n")
        file:write("IVYSAUR\n")
        file:write("DEDEDE\n")
        file:write("LUCARIO\n")
        file:write("IKE\n")
        file:write("R.O.B.\n\n")
        file:write("JIGGLYPUFF\n")
        file:write("WARIO\n\n")
        file:write("ROY\n")
        file:write("TOON LINK\n\n")
        file:write("KNUCKLES\n")
        file:write("WOLF\n\n")
        file:write("SNAKE\n")
        file:write("SONIC\n\n\n\n")
        file:write("RANDOM")
        file:open("c")
    end
    fileoperation = love.filesystem.getInfo("list-vBrawl.txt","file")
    if fileoperation == nil then
        file = love.filesystem.newFile("list-vBrawl.txt")
        file:open("a")
        file:write("MARIO\n")
        file:write("DONKEY KONG\n")
        file:write("LINK\n")
        file:write("SAMUS\n")
        file:write("YOSHI\n")
        file:write("KIRBY\n")
        file:write("FOX\n")
        file:write("PIKACHU\n")
        file:write("LUIGI\n")
        file:write("CAPTAIN FALCON\n")
        file:write("NESS\n")
        file:write("BOWSER\n")
        file:write("PEACH\n")
        file:write("ZELDA\n")
        file:write("SHEIK\n")
        file:write("ICE\\nCLIMBERS\n")
        file:write("MARTH\n")
        file:write("Mr. GAME & WATCH\n")
        file:write("FALCO\n")
        file:write("GANONDORF\n\n")
        file:write("META\\nKNIGHT\n")
        file:write("PIT\n")
        file:write("ZERO SUIT SAMUS\n")
        file:write("OLIMAR\n")
        file:write("LUCAS\n")
        file:write("DIDDY\\nKONG\n")
        file:write("POKÉMON TRAINER\n")
        file:write("CHARIZARD\n")
        file:write("SQUIRTLE\n")
        file:write("IVYSAUR\n")
        file:write("KING\\nDEDEDE\n")
        file:write("LUCARIO\n")
        file:write("IKE\n")
        file:write("R.O.B.\n\n")
        file:write("JIGGLYPUFF\n")
        file:write("WARIO\n\n\n")
        file:write("TOON LINK\n")
        file:write("ZELDA/\\nSHEIK\n\n")
        file:write("WOLF\n\n")
        file:write("SNAKE\n")
        file:write("SONIC\n\n\n\n")
        file:write("RANDOM")
        file:open("c")
    end
    for line in love.filesystem.lines(Directory) do
        table.insert(IconNames,line)
        IconNames[#IconNames] = IconNames[#IconNames]:gsub("\\n","\n")
        if IconNames[#IconNames] ~= "" then
            table.insert(position,#IconNames)
        end
    end
end

function love.draw()
    love.graphics.setColor(1,1,1,1);
    love.graphics.draw(backimage,0,0,0,love.graphics.getWidth()/1280,love.graphics.getHeight()/720)
    local sdCSSi = love.graphics.newImage(sddataCSSi)
    local hdCSSi = love.graphics.newImage(hddataCSSi)
    local sdName = love.graphics.newImage(sddataName)
    local hdName = love.graphics.newImage(hddataName)
    love.graphics.draw(sdCSSi,0,15)
    love.graphics.draw(hdCSSi,0,64)
    love.graphics.draw(sdName,0,165)
    love.graphics.draw(hdName,0,215)
    local pos = {0,0}
    love.graphics.setColor(55/255,55/255,55/255,0.5);
    for i=1,4 do
        if i%2 == 1 then pos[1] = -2 else pos[1] = 2 end
        if math.ceil(i/2) == 1 then pos[2] = -2 else pos[2] = 2 end
        love.graphics.printf("Character Select Screen Icon Name",font.SDCSSi,0+pos[1],0+pos[2],400,"left",0,1,1)
        love.graphics.printf("HD Character Select Screen Icon Name for Dolphin",font.SDCSSi,0+pos[1],50+pos[2],400,"left",0,1,1)
        love.graphics.printf("Character Select Screen Name",font.SDCSSi,0+pos[1],150+pos[2],400,"left",0,1,1)
        love.graphics.printf("HD Character Select Screen Name for Dolphin",font.SDCSSi,0+pos[1],200+pos[2],400,"left",0,1,1)
    end
    love.graphics.setColor(221/255,221/255,221/255,1);
    love.graphics.printf("Character Select Screen Icon Name",font.SDCSSi,0,0,400,"left",0,1,1)
    love.graphics.printf("HD Character Select Screen Icon Name for Dolphin",font.SDCSSi,0,50,400,"left",0,1,1)
    love.graphics.printf("Character Select Screen Name",font.SDCSSi,0,150,400,"left",0,1,1)
    love.graphics.printf("HD Character Select Screen Name for Dolphin",font.SDCSSi,0,200,400,"left",0,1,1)
    if operation == true then
        love.graphics.setColor(34/255,34/255,34/255,191/255);love.graphics.rectangle("fill",0,0,500,300)
        love.graphics.setColor(221/255,221/255,221/255,1);love.graphics.printf("Process complete!\nPress Enter to close.",font.SDCSSi,0,0,500,"center",0,1,1)
    end
end
function drawSDCSSi()
    love.graphics.setColor(34/255,34/255,34/255,1);love.graphics.rectangle("fill",0,0,80,BackgroundHeight)
    love.graphics.setColor(221/255,221/255,221/255,1);
    if BackgroundHeight == 16 then
        love.graphics.printf(IconNames[position[i]],font.SDCSSi,0,3,80,"center",0,1,1)
    elseif BackgroundHeight == 24 then
        love.graphics.printf(IconNames[position[i]],font.SDCSSi,0,1,80,"center",0,1,1)
    end
end
function drawHDCSSi()
    love.graphics.setColor(34/255,34/255,34/255,1);love.graphics.rectangle("fill",0,0,240,BackgroundHeight)
    love.graphics.setColor(221/255,221/255,221/255,1);
    if BackgroundHeight == 48 then
        love.graphics.printf(IconNames[position[i]],font.HDCSSi,0,9,240,"center",0,1,1)
    elseif BackgroundHeight == 72 then
        love.graphics.printf(IconNames[position[i]],font.HDCSSi,0,3,240,"center",0,1,1)
    end
end
function drawSDName()
    --{start,end,width,is big}
    local string = IconNames[position[i]]
    string = string:gsub("\n"," ")
    local substrings, scale, width = NameString(string,1)
    love.graphics.setColor(0,0,0,1);love.graphics.rectangle("fill",0,0,144,32)
    love.graphics.setColor(1,1,1,1);
    for i=1,#substrings do
        if width == 0 then
            if substrings[i][4] == false then
                love.graphics.printf(string:sub(substrings[i][1],substrings[i][2]),font.SDName_big,substrings[i][3]+width/2,14,144,"left",0,scale,1,0,14)
            else
                love.graphics.printf(string:sub(substrings[i][1],substrings[i][2]),font.SDName_sml,substrings[i][3]+width/2,18,144,"left",0,scale,1,0,10)
            end
        else
            if substrings[i][4] == false then
                love.graphics.printf(string:sub(substrings[i][1],substrings[i][2]),font.SDName_big,substrings[i][3]+width/2,14,144,"left",0,scale,1,-2,14)
            else
                love.graphics.printf(string:sub(substrings[i][1],substrings[i][2]),font.SDName_sml,substrings[i][3]+width/2,18,144,"left",0,scale,1,-2,10)
            end
        end
    end
end
function drawHDName()
    --{start,end,width,is big}
    local string = IconNames[position[i]]
    string = string:gsub("\n"," ")
    local substrings, scale, width = NameString(string,3)
    love.graphics.setColor(0,0,0,1);love.graphics.rectangle("fill",0,0,144*3,32*3)
    love.graphics.setColor(1,1,1,1);
    for i=1,#substrings do
        if width == 0 then
            if substrings[i][4] == false then
                love.graphics.printf(string:sub(substrings[i][1],substrings[i][2]),font.HDName_big,substrings[i][3]+width/2,42,144*3,"left",0,scale,1,0,42)
            else
                love.graphics.printf(string:sub(substrings[i][1],substrings[i][2]),font.HDName_sml,substrings[i][3]+width/2,54,144*3,"left",0,scale,1,0,30)
            end
        else
            if substrings[i][4] == false then
                love.graphics.printf(string:sub(substrings[i][1],substrings[i][2]),font.HDName_big,substrings[i][3]+width/2,42,144*3,"left",0,scale,1,-6,42)
            else
                love.graphics.printf(string:sub(substrings[i][1],substrings[i][2]),font.HDName_sml,substrings[i][3]+width/2,54,144*3,"left",0,scale,1,-6,30)
            end
        end
    end
end

function NameString(string,mult)
    local substrings = {}
    local s_bool = false
    local s_numb = 1
    local scale = 1
    local width = 0
    local i = 1
    for j=1,2 do
        if j == 2 then
            if width > (144*mult) then
                scale = 1/(width/(144*mult))
                substrings = {}
                s_bool = false
                s_numb = 1
                width = 0
                i = 1
            else
                break
            end
        end
        while i<=string:len() do
            if s_bool == true then
                if string:sub(i,i) == " "
                or string:sub(i,i) == "."
                or i == string:len() then
                    table.insert(substrings,{s_numb+1,i,width,true})
                    s_bool = false
                    width = width+((font.SDName_sml:getWidth(string:sub(s_numb+1,i)))*scale)*mult
                    if (string:sub(i-1,i) == ". " and i > 1)
                    or (string:sub(i,i+1) == ". " and i > 1) then
                        i = i + 1
                    end
                end
            elseif s_bool == false then
                if string:sub(i,i) == "-"
                or string:sub(i,i) == "~" then
                    table.insert(substrings,{i,i,width,true})
                    width = width+((font.SDName_sml:getWidth(string:sub(i,i)))*scale)*mult
                elseif string:sub(i,i) == "1"
                or string:sub(i,i) == "2"
                or string:sub(i,i) == "3"
                or string:sub(i,i) == "4"
                or string:sub(i,i) == "5"
                or string:sub(i,i) == "6"
                or string:sub(i,i) == "7"
                or string:sub(i,i) == "8"
                or string:sub(i,i) == "9"
                or string:sub(i,i) == "0" then
                    table.insert(substrings,{i,i,width,false})
                    s_numb = i
                    width = width+((font.SDName_big:getWidth(string:sub(i,i)))*scale)*mult
                else
                    table.insert(substrings,{i,i,width,false})
                    width = width+((font.SDName_big:getWidth(string:sub(i,i)))*scale)*mult
                    s_bool = true
                    s_numb = i
                end
            end
            i = i + 1
        end
    end
    if width > 140*mult then
        return substrings, scale, 0
    else
        return substrings, scale, (140*mult)-width
    end
end

function love.update(dt)
    if love.keyboard.isDown("return") == true
    or love.keyboard.isDown("kpenter") == true then
        if keycooldown > 0 then
            keycooldown = 10
        else
            keycooldown = 10
            wait = 0
            sounds:play()
        end
    end
    if keycooldown > 0 then
        keycooldown = keycooldown - 1
    end
    if wait > 0 then
        wait = wait - 1
    elseif wait <= 0 then
        if i > #position then
            if operation == false then
                operation = true
            else
                if love.keyboard.isDown("return") == true
                or love.keyboard.isDown("kpenter") == true then
                    love.event.quit()
                end
            end
        else
            IconName = IconNames[position[i]]
            if IconNames[position[i]] ~= "" then
                wrap = 80
                warpa, warpb = font.SDCSSi:getWrap(IconNames[position[i]],wrap)
                BackgroundHeight = (#warpb+1)*8
                sdIcon:renderTo(drawSDCSSi)
                sddataCSSi = sdIcon:newImageData( 1, 1, 0, 0, 80,BackgroundHeight)
                if love.filesystem.getInfo("CSSi/MenSelchrChrNmS."..string.format("%03d",position[i])..".png","file") == nil then
                    sddataCSSi:encode("png","CSSi/MenSelchrChrNmS."..string.format("%03d",position[i])..".png")
                end
                wrap = 240
                warpa, warpb = font.HDCSSi:getWrap(IconNames[position[i]],wrap)
                BackgroundHeight = (#warpb+1)*24
                hdIcon:renderTo(drawHDCSSi)
                hddataCSSi = hdIcon:newImageData( 1, 1, 0, 0, 240,BackgroundHeight)
                if love.filesystem.getInfo("CSSi HD/MenSelchrChrNmS."..string.format("%03d",position[i])..".png","file") == nil then
                    hddataCSSi:encode("png","CSSi HD/MenSelchrChrNmS."..string.format("%03d",position[i])..".png")
                end
                sdName:renderTo(drawSDName)
                sddataName = sdName:newImageData( 1, 1, 0, 0, 144,32)
                if love.filesystem.getInfo("Nameplates/MenSelchrChrNm."..string.format("%03d",((position[i]-1)*10)+1)..".png","file") == nil then
                    sddataName:encode("png","Nameplates/MenSelchrChrNm."..string.format("%03d",((position[i]-1)*10)+1)..".png")
                end
                hdName:renderTo(drawHDName)
                hddataName = hdName:newImageData( 1, 1, 0, 0, 144*3,32*3)
                if love.filesystem.getInfo("Nameplates HD/MenSelchrChrNm."..string.format("%03d",((position[i]-1)*10)+1)..".png","file") == nil then
                    hddataName:encode("png","Nameplates HD/MenSelchrChrNm."..string.format("%03d",((position[i]-1)*10)+1)..".png")
                end
            end
            i = i + 1
            if IconNames[position[i]] ~= "" then
                wait = 300
                sounds:play()
            else
                wait = 0
            end
        end
    end
end

function love.quit()
end