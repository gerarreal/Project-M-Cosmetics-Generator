--===============================================OTHER FUNCTIONS THAT MAKE THE PROGRAM BETTER===============================================
--Ternary operator because Lua doesn't have it natively
local function tern(cond,iftrue,iffalse)
	if cond then return iftrue else return iffalse end
end

--Creates the directories if they don't exist
local function mkdir(dir)
    if love.filesystem.getInfo(dir) == nil then
        love.filesystem.createDirectory(dir)
    end
end

--Modifies the names of characters/stages so they appear better
local function nameMod(name,noc)
    name = name:gsub("/ ", "/")
	if noc == false then name = name:gsub("\n"," ")
    elseif noc == true then name = name:gsub("\n","")
    elseif noc == nil then name = name
	end
    return name
end

local function latinCapital(name)
    name = name:gsub("à","À")
    name = name:gsub("á","Á")
    name = name:gsub("â","Â")
    name = name:gsub("ã","Ã")
    name = name:gsub("ä","Ä")
    name = name:gsub("å","Å")
    name = name:gsub("æ","Æ")
    name = name:gsub("ç","Ç")
    name = name:gsub("è","È")
    name = name:gsub("é","É")
    name = name:gsub("ê","Ê")
    name = name:gsub("ë","Ë")
    name = name:gsub("ì","Ì")
    name = name:gsub("í","Í")
    name = name:gsub("î","Î")
    name = name:gsub("ï","Ï")
    name = name:gsub("ð","Ð")
    name = name:gsub("ñ","Ñ")
    name = name:gsub("ò","Ò")
    name = name:gsub("ó","Ó")
    name = name:gsub("ô","Ô")
    name = name:gsub("õ","Õ")
    name = name:gsub("ö","Ö")
    name = name:gsub("ø","Ø")
    name = name:gsub("ù","Ù")
    name = name:gsub("ú","Ú")
    name = name:gsub("û","Û")
    name = name:gsub("ü","Ü")
    name = name:gsub("ý","Ý")
    name = name:gsub("þ","Þ")
    name = name:gsub("ÿ","ß")
    return name
end

local function delatin(name)
    name = name:gsub("à","A")
    name = name:gsub("á","A")
    name = name:gsub("â","A")
    name = name:gsub("ã","A")
    name = name:gsub("ä","A")
    name = name:gsub("å","A")
    name = name:gsub("æ","AE")
    name = name:gsub("ç","C")
    name = name:gsub("è","E")
    name = name:gsub("é","E")
    name = name:gsub("ê","E")
    name = name:gsub("ë","E")
    name = name:gsub("ì","I")
    name = name:gsub("í","I")
    name = name:gsub("î","I")
    name = name:gsub("ï","I")
    name = name:gsub("ð","TH")
    name = name:gsub("ñ","NA")
    name = name:gsub("ò","O")
    name = name:gsub("ó","O")
    name = name:gsub("ô","O")
    name = name:gsub("õ","O")
    name = name:gsub("ö","O")
    name = name:gsub("ø","O")
    name = name:gsub("ù","U")
    name = name:gsub("ú","U")
    name = name:gsub("û","U")
    name = name:gsub("ü","U")
    name = name:gsub("ý","Y")
    name = name:gsub("þ","TH")
    name = name:gsub("ÿ","SS")
    return name
end

--===============================================STAGE COSMETICS===============================================
--REX Stage Select Name
local function makeStage_REX(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("gomarice_nanikano_capsule.ttf",21*size);localfont:setLineHeight(0.8);
    localfont:setFilter("nearest","nearest",1.0)
    local string = delatin(nameMod(name:upper(),false))
    local spaces = 0
    local newlines = 0
    local i = 1
    local wrapa, wrapb = localfont:getWrap(string,200*size)
    local text = {}
	for i=1,#wrapb do
        if wrapb[i]:sub(1,1) == " " then
            wrapb[i] = wrapb[i]:sub(2,-1)
        end
        if wrapb[i]:sub(wrapb[i]:len(),wrapb[i]:len()) == " " then
            wrapb[i] = wrapb[i]:sub(1,-2)
        end
        wrapb[i] = wrapb[i]:gsub("\n","")
		text[i] = love.graphics.newText(localfont,wrapb[i])
	end
    local modified = false
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
	BackgroundHeight = 56*size
    love.graphics.rectangle("fill",0,0,208,BackgroundHeight)
    love.graphics.setColor(1,1,1,1)
    local scale = 1
    for i=1,#wrapb do
        localscale = tern(localfont:getWidth(wrapb[i])>(208*size),(208*size)/localfont:getWidth(wrapb[i]),1)
        if localscale < scale then
            scale = localscale
        end
    end
	for i=1,#wrapb do
        love.graphics.draw(text[i],math.ceil(width/2),tern(#wrapb==1,28,21+14*(i-1))*size,0,scale,0.75,math.ceil(text[i]:getWidth()/2),5*size)
    end
	height = BackgroundHeight
end

--Brawl Stage Select Name
local function makeStage_Brawl(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("LT_70137.TTF",41*size);localfont:setLineHeight(0.8);
    localfont:setFilter("nearest","nearest",1.0)
    local string = latinCapital(nameMod(name:upper(),false))
    local spaces = 0
    local newlines = 0
    local i = 1
    local wrapa, wrapb = localfont:getWrap(string,416*size)
    local text = {}
	for i=1,#wrapb do
        if wrapb[i]:sub(1,1) == " " then
            wrapb[i] = wrapb[i]:sub(2,-1)
        end
        if wrapb[i]:sub(wrapb[i]:len(),wrapb[i]:len()) == " " then
            wrapb[i] = wrapb[i]:sub(1,-2)
        end
        wrapb[i] = wrapb[i]:gsub("\n","")
		text[i] = love.graphics.newText(localfont,wrapb[i])
	end
    local modified = false
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
	BackgroundHeight = 56*size
    love.graphics.rectangle("fill",0,0,208,BackgroundHeight)
    love.graphics.setColor(1,1,1,1)
    local scale = 1
    for i=1,#wrapb do
        localscale = tern(localfont:getWidth(wrapb[i])>(208*size),(208*size)/localfont:getWidth(wrapb[i]),1)
        if localscale < scale then
            scale = localscale
        end
    end
	for i=1,#wrapb do
        love.graphics.draw(text[i],math.ceil(width/2),tern(#wrapb==1,15,30*(i-1))*size,0,scale,0.75,math.ceil(text[i]:getWidth()/2),5*size)
    end
	height = BackgroundHeight
end

--PM Stage Select Screen Name
local function makeStage(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("Genuine_StageNames.ttf",37*size)
    localfont:setFilter("nearest","nearest",1.0)
    local string = nameMod(name,false)
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
    local scale = tern(localfont:getWidth(string)>(234*size),(234*size)/localfont:getWidth(string),1)
    love.graphics.rectangle("fill",0,0,234*size,63*size)
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(string,localfont,1,27*size,((234/scale)*size),"left",0,scale)
end

--Ultimate Stage Select Screen Names
local function makeStage_Ultimate(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("FOT-RodinPro-EB.otf",24*size)
    localfont:setFilter("nearest","nearest",1.0)
    local string = nameMod(name,false)
	string = string:gsub("/\\n","/")
	string = string:gsub("\\n"," ")
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
    local scale = tern(localfont:getWidth(string)>(234*size),(234*size)/localfont:getWidth(string),1)
    love.graphics.rectangle("fill",0,0,234*size,63*size)
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(string,localfont,0,20,(234/scale)*size,"center",0,scale)
end

--===============================================CHARACTER COSMETICS===============================================
--Brawl Character Select Screen Name
local function makeName_Brawl(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("DFMinchoPro6N-W14.otf",40*size)
    localfont:setFilter("nearest","nearest",1.0)
    local string = nameMod(name,nil)
	string = string:gsub("\\n","\n")
    local spaces = 0
    local i = 1
    local lines = 1
    local longwords = false
    while i<=string:len() do
        if string:sub(i,i) == " " then spaces = spaces + 1 end
--        if string:sub(i,i) == "g" then longwords = true end
        if string:sub(i,i) == "j" then longwords = true end
        if string:sub(i,i) == "p" then longwords = true end
        if string:sub(i,i) == "q" then longwords = true end
--        if string:sub(i,i) == "y" then longwords = true end
        if string:sub(i,i) == "\n" then lines = lines + 1 end
        i = i + 1
    end
	local wrapwidth, wrappedtext = localfont:getWrap(string,144*size)
    local fontsize = 40*size
    while (#wrappedtext > lines) do
        fontsize = fontsize - size
        localfont = love.graphics.newFont("DFMinchoPro6N-W14.otf",fontsize)
        wrapwidth, wrappedtext = localfont:getWrap(string,144*size)
    end
    longwords = tern(#wrappedtext==1,longwords,false)
	BackgroundHeight = tern(#wrappedtext == 1,24*size,32*size)
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
    love.graphics.rectangle("fill",0,0,144*size,BackgroundHeight*size)
	love.graphics.setColor(1,1,1,1)
	local text = {}
	local longest = localfont:getWrap(wrappedtext[1],144*size)
	for i=1,#wrappedtext do
		if longest < localfont:getWrap(wrappedtext[i],144*size) then
			longest = localfont:getWrap(wrappedtext[i],144*size)
		end
		width = 144*size
		height = (16+(#wrappedtext*8))*size
		text[i] = love.graphics.newText(localfont,wrappedtext[i])
	end
	for i=1,#wrappedtext do
		love.graphics.draw(text[i],math.ceil(width/2),(-3*size)+(((14*size)+tern(longwords==true,(2*size),0))*(i-1))+(0.1*((40*size)-fontsize)),0,1,(0.75+tern(longwords==true,-0.1,0.0)+(0.015*(((40*size)-fontsize)/size)))-(0.2*(#wrappedtext-1)),math.ceil(text[i]:getWidth()/2),0)
	end
	height = BackgroundHeight
    localfont = love.graphics.newFont("DFMinchoPro6N-W14.otf",40);localfont:setLineHeight(0.8)
end

--REX Character Select Screen Names
local function makeName_REX(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("Vipnagorgialla.otf",19.5*size)
    localfont:setFilter("nearest","nearest",1.0)
    local string = nameMod(name,false)
	string = string:gsub("\\n"," ")
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
    local scale = tern(localfont:getWidth(string)>(144*size),(144*size)/localfont:getWidth(string),1)
    love.graphics.rectangle("fill",0,0,144*size,32*size)
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(string,localfont,0,9,(144/scale)*size,"center",0,scale,1,0,0)
end

--Ultimate Character Select Screen Names
local function makeName_Ultimate(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("FOT-RodinPro-EB.otf",24*size)
    localfont:setFilter("nearest","nearest",1.0)
    local string = nameMod(name,false)
	string = string:gsub("/\\n","/")
	string = string:gsub("\\n"," ")
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
    local scale = tern(localfont:getWidth(string)>(144*size),(144*size)/localfont:getWidth(string),1)
    love.graphics.rectangle("fill",0,0,144*size,32*size)
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(string,localfont,0,0,(144/scale)*size,"center",0,scale,1,0,0)
end

--PM Character Select Screen Names
local function makeName(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("Genuine_PMNames.ttf",28*size)
    localfont:setFilter("nearest","nearest",1.0)
    local string = nameMod(name,false)
	string = string:gsub("/\\n","/")
	string = string:gsub("\\n"," ")
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
    local scale = tern(localfont:getWidth(string)>(144*size),(144*size)/localfont:getWidth(string),1)
    love.graphics.rectangle("fill",0,0,144*size,32*size)
    love.graphics.setColor(1,1,1,1)
    love.graphics.printf(string,localfont,0,0,(144/scale)*size,"center",0,scale,1,0,0)
end

--Brawl Battle Names
local function makeBattle(name,width,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("FOT-RodinPro-EB.otf",11*size);localfont:setLineHeight(0.5);
    localfont:setFilter("nearest","nearest",1.0)
    local string = nameMod(name,false)
	string = string:gsub("/\\n","/")
	string = string:gsub("\\n"," ")
    width = width
    local text = love.graphics.newText(localfont,string)
    local scale = 1.5
    while scale > (width*size)/text:getWidth() do
        text = love.graphics.newText(localfont,string)
        scale = tern((width*size) > text:getWidth(),1,(width*size)/text:getWidth())
    end
    if size == 1 then
        love.graphics.setColor(0,0,0,1)
    else
        love.graphics.setColor(0,0,0,0)
    end
    love.graphics.rectangle("fill",0,0,width*size,12*size)
	love.graphics.setColor(1,1,1,1)
	love.graphics.draw(text,0,-1*size,0,scale,1)
end

--PM / Brawl Character Select Screen Names
local function makeIcon(name,size)
	love.graphics.clear()
    local localfont = love.graphics.newFont("FOT-RodinPro-EB.otf",11*size);localfont:setLineHeight(0.5);
    localfont:setFilter("nearest","nearest",1.0)
    local string = nameMod(name,nil)
	string = string:gsub("\\n","\n")
	local wrapwidth, wrappedtext = localfont:getWrap(string,80*size)
	for i=1,#wrappedtext do
        if wrappedtext[i]:sub(1,1) == " " then
            wrappedtext[i] = wrappedtext[i]:sub(2,-1)
        end
        if wrappedtext[i]:sub(wrappedtext[i]:len(),wrappedtext[i]:len()) == " " then
            wrappedtext[i] = wrappedtext[i]:sub(1,-2)
        end
	end
    if size == 1 then
        love.graphics.setColor(34/255,34/255,34/255,1)
    else
        love.graphics.setColor(0,0,0,34/255)
    end
    love.graphics.rectangle("fill",0,0,80*size,(4+(#wrappedtext*10))*size)
    if size == 1 then
        love.graphics.setColor(221/255,221/255,221/255,1)
    else
        love.graphics.setColor(1,1,1,221/255)
    end
	local text = {}
	local longest = localfont:getWrap(wrappedtext[1],80*size)
	for i=1,#wrappedtext do
		if longest < localfont:getWrap(wrappedtext[i],80*size) then
			longest = localfont:getWrap(wrappedtext[i],80*size)
		end
		width = tern(longest > 0 and longest <= 48*size,48*size,tern(longest > 48*size and longest <= 56*size,56*size,tern(longest > 56*size and longest <= 64*size,64*size,tern(longest > 64*size and longest <= 72*size,72*size,80*size))))
		height = (4+(#wrappedtext*10))*size
		text[i] = love.graphics.newText(localfont,wrappedtext[i])
	end
	for i=1,#wrappedtext do
		love.graphics.draw(text[i],math.ceil(width/2),((10*(i-1)))*size,0,1,1,math.ceil(text[i]:getWidth()/2))
	end
end

function love.load()
	local export_directory = "Out"
	mkdir(export_directory)
	mkdir(export_directory.."/Character Select Screen Icon")
	mkdir(export_directory.."/Brawl Battle Name")
	mkdir(export_directory.."/PM Character Select Screen Name")
	mkdir(export_directory.."/Brawl Character Select Screen Name")
	mkdir(export_directory.."/Ultimate Character Select Screen Name")
	mkdir(export_directory.."/REX Character Select Screen Name")

	mkdir(export_directory.."/PM Stage Select Screen Name")
	mkdir(export_directory.."/Brawl Stage Select Screen Name")
	mkdir(export_directory.."/REX Stage Select Screen Name")
	mkdir(export_directory.."/Ultimate Stage Select Screen Name")

    --Generates char_list.txt
    fileoperation = love.filesystem.getInfo(export_directory.."/char_list.txt","file")
    local ID = 1
    local IconNames = {}
    if fileoperation == nil then
        file = love.filesystem.newFile(export_directory.."/char_list.txt")
        file:open("a")
        file:write("Mario\n")
        file:write("Donkey\\nKong\n")
        file:write("Link\n")
        file:write("Samus\n")
        file:write("Yoshi\n")
        file:write("Kirby\n")
        file:write("Fox\n")
        file:write("Pikachu\n")
        file:write("Luigi\n")
        file:write("Captain\\nFalcon\n")
        file:write("Ness\n")
        file:write("Bowser\n")
        file:write("Peach\n")
        file:write("Zelda\n")
        file:write("Sheik\n")
        file:write("Ice\\nClimbers\n")
        file:write("Marth\n")
        file:write("Mr. Game\\n& Watch\n")
        file:write("Falco\n")
        file:write("Ganondorf\n")
        file:write("Meta\\nKnight\n")
        file:write("Pit\n")
        file:write("Zero Suit\\nSamus\n")
        file:write("Olimar\n")
        file:write("Lucas\n")
        file:write("Diddy\\nKong\n")
        file:write("Charizard\n")
        file:write("Squirtle\n")
        file:write("Ivysaur\n")
        file:write("King\\nDedede\n")
        file:write("Lucario\n")
        file:write("Ike\n")
        file:write("R.O.B.\n")
        file:write("Jigglypuff\n")
        file:write("Wario\n")
        file:write("Toon Link\n")
        file:write("Wolf\n")
        file:write("Snake\n")
        file:write("Sonic\n")
        file:write("Random\n")
        file:write("Pokémon\\nTrainer\n")
        file:write("Dedede\n")
        file:write("Mewtwo\n")
        file:write("Roy\n")
        file:write("Knuckles\n")
        file:write("Ridley\n")
        file:write("Waluigi\n")
        file:write("Fighting\\nAlloy Team\n")
        file:write("Red\\nAlloy\n")
        file:write("Blue\\nAlloy\n")
        file:write("Yellow\\nAlloy\n")
        file:write("Green\\nAlloy\n")
        file:write("Sceptile\n")
        file:write("Dark\\nSamus\n")
        file:write("Zero\n")
        file:open("c")
    end
    --Generates cosmetics from char_list.txt
    for line in love.filesystem.lines(export_directory.."/char_list.txt") do
        local localcanvas
        local exportfolder
        local encodedirectory
        local newfile
        local myimagedata
        local number
        local name
        local found = {}
        for w in line:gmatch( '[^|]+' ) do table.insert(found,w) end
        name = found[1]
        number = found[2]
        local cosmeticType = {
            "PM Character Select Screen Name",
            "REX Character Select Screen Name",
            "Brawl Character Select Screen Name",
            "Ultimate Character Select Screen Name"
        }
        local cosmeticFile = {
            "MenSelchrChrNm ",
            "MenSelchrChrNm ",
            "MenSelchrChrNm ",
            "MenSelchrChrNm "
        }
        local cosmeticWdth = {
            144,
            144,
            144,
            144
        }
        local cosmeticHght = {
            32,
            32,
            32,
            32
        }
        if line ~= "" then
            localcanvas = love.graphics.newCanvas(80,1000)
            for k=1,4 do
                exportfolder = cosmeticType[k]
                encodedirectory = export_directory.."/"..exportfolder.."/"..cosmeticFile[k]..ID
                for i=1,3,2 do
                    width, height = cosmeticWdth[k]*i,cosmeticHght[k]*i
                    localcanvas = love.graphics.newCanvas(width,height)
                    love.graphics.setCanvas(localcanvas)
                    if k==1 then makeName(name,i)
                    elseif k==2 then makeName_REX(name,i)
                    elseif k==3 then makeName_Brawl(name,i)
                    elseif k==4 then makeName_Ultimate(name,i)
                    end 
                    love.graphics.setCanvas()
                    newfile = love.filesystem.newFile(encodedirectory..tern(i==3," HD","")..".png")
                    myimagedata = localcanvas:newImageData( 1, 1, 0, 0,width,height)
                    newfile:open("w")
                    newfile:write(myimagedata:encode("png"))
                    newfile:close()
                end
            end
        end
        ID = ID + 1
		love.graphics.setColor(1,1,1,1);
		love.graphics.clear()
    end

    
    fileoperation = love.filesystem.getInfo(export_directory.."/char_cssi_list.txt","file")
    if fileoperation == nil then
        file = love.filesystem.newFile(export_directory.."/char_cssi_list.txt")
        file:open("a")
        file:write("MARIO\n")
        file:write("DONKEY\\nKONG\n")
        file:write("LINK\n")
        file:write("SAMUS\n")
        file:write("YOSHI\n")
        file:write("KIRBY\n")
        file:write("FOX\n")
        file:write("PIKACHU\n")
        file:write("LUIGI\n")
        file:write("CAPTAIN\\nFALCON\n")
        file:write("NESS\n")
        file:write("BOWSER\n")
        file:write("PEACH\n")
        file:write("ZELDA\n")
        file:write("SHEIK\n")
        file:write("ICE\\nCLIMBERS\n")
        file:write("MARTH\n")
        file:write("MR. GAME\\n& WATCH\n")
        file:write("FALCO\n")
        file:write("GANONDORF\n")
        file:write("META\\nKNIGHT\n")
        file:write("PIT\n")
        file:write("ZERO SUIT\\nSAMUS\n")
        file:write("OLIMAR\n")
        file:write("LUCAS\n")
        file:write("DIDDY\\nKONG\n")
        file:write("CHARIZARD\n")
        file:write("SQUIRTLE\n")
        file:write("IVYSAUR\n")
        file:write("KING\\nDEDEDE\n")
        file:write("LUCARIO\n")
        file:write("IKE\n")
        file:write("R.O.B.\n")
        file:write("JIGGLYPUFF\n")
        file:write("WARIO\n")
        file:write("TOON LINK\n")
        file:write("WOLF\n")
        file:write("SNAKE\n")
        file:write("SONIC\n")
        file:write("RANDOM\n")
        file:write("ZELDA/\\nSHEIK\n")
        file:write("POKÉMON\\nTRAINER\n")
        file:write("DEDEDE\n")
        file:write("MEWTWO\n")
        file:write("ROY\n")
        file:write("KNUCKLES\n")
        file:write("RIDLEY\n")
        file:write("WALUIGI\n")
        file:write("FIGHTING\\nALLOY TEAM\n")
        file:write("SCEPTILE\n")
        file:write("DARK\\nSAMUS\n")
        file:write("ZERO\n")
        file:open("c")
    end
    ID = 1
    --Generates cosmetics from char_cssi_list.txt
    for line in love.filesystem.lines(export_directory.."/char_cssi_list.txt") do
        local localcanvas
        local exportfolder
        local encodedirectory
        local newfile
        local myimagedata
        local cosmeticType = {
            "Character Select Screen Icon",
        }
        local cosmeticFile = {
            "MenSelchrChrNmS ",
        }
        local cosmeticWdth = {
            80,
        }
        local cosmeticHght = {
            24,
        }
        if line ~= "" then
            localcanvas = love.graphics.newCanvas(80,1000)
            exportfolder = cosmeticType[1]
            encodedirectory = export_directory.."/"..exportfolder.."/"..cosmeticFile[1]..ID
            for i=1,3,2 do
                width, height = cosmeticWdth[1]*i,cosmeticHght[1]*i
                localcanvas = love.graphics.newCanvas(width,height)
                love.graphics.setCanvas(localcanvas)
                makeIcon(line,i)
                love.graphics.setCanvas()
                newfile = love.filesystem.newFile(encodedirectory..tern(i==3," HD","")..".png")
                myimagedata = localcanvas:newImageData( 1, 1, 0, 0,width,height)
                newfile:open("w")
                newfile:write(myimagedata:encode("png"))
                newfile:close()
            end
        end
        ID = ID + 1
		love.graphics.setColor(1,1,1,1);
		love.graphics.clear()
    end


    fileoperation = love.filesystem.getInfo(export_directory.."/char_battle_list.txt","file")
    ID = 1
    if fileoperation == nil then
        file = love.filesystem.newFile(export_directory.."/char_battle_list.txt")
        file:open("a")
        file:write("MARIO|72\n")
        file:write("DONKEY KONG|104\n")
        file:write("LINK|72\n")
        file:write("SAMUS|72\n")
        file:write("YOSHI|72\n")
        file:write("KIRBY|72\n")
        file:write("FOX|72\n")
        file:write("PIKACHU|72\n")
        file:write("LUIGI|72\n")
        file:write("CAPTAIN FALCON|104\n")
        file:write("NESS|72\n")
        file:write("BOWSER|72\n")
        file:write("PEACH|72\n")
        file:write("ZELDA|72\n")
        file:write("SHEIK|72\n")
        file:write("ICE CLIMBERS|104\n")
        file:write("MARTH|72\n")
        file:write("MR. GAME & WATCH|104\n")
        file:write("FALCO|72\n")
        file:write("GANONDORF|88\n")
        file:write("META KNIGHT|104\n")
        file:write("PIT|72\n")
        file:write("ZERO SUIT SAMUS|112\n")
        file:write("OLIMAR|72\n")
        file:write("LUCAS|72\n")
        file:write("DIDDY KONG|104\n")
        file:write("CHARIZARD|96\n")
        file:write("SQUIRTLE|88\n")
        file:write("IVYSAUR|80\n")
        file:write("KING DEDEDE|104\n")
        file:write("LUCARIO|72\n")
        file:write("IKE|72\n")
        file:write("R.O.B.|72\n")
        file:write("JIGGLYPUFF|104\n")
        file:write("WARIO|72\n")
        file:write("TOON LINK|72\n")
        file:write("WOLF|72\n")
        file:write("SNAKE|72\n")
        file:write("SONIC|72\n")
        file:write("DEDEDE|72\n")
        file:write("MEWTWO|72\n")
        file:write("ROY|72\n")
        file:write("KNUCKLES|72\n")
        file:write("RIDLEY|72\n")
        file:write("WALUIGI|80\n")
        file:write("RED ALLOY|80\n")
        file:write("BLUE ALLOY|80\n")
        file:write("YELLOW ALLOY|80\n")
        file:write("GREEN ALLOY|80\n")
        file:write("SCEPTILE|72\n")
        file:write("DARK SAMUS|80\n")
        file:write("ZERO|72\n")
        file:open("c")
    end
    --Generates cosmetics from char_battle_list.txt
    for line in love.filesystem.lines(export_directory.."/char_battle_list.txt") do
        local localcanvas
        local exportfolder
        local encodedirectory
        local newfile
        local myimagedata
        local found = {}
        for w in line:gmatch( '[^|]+' ) do table.insert(found,w) end
        local name = found[1]
        local number = found[2]
        local cosmeticType = {
            "Brawl Battle Name",
        }
        local cosmeticFile = {
            "MenSelchrChrNmS ",
        }
        local cosmeticWdth = {
            144,
        }
        local cosmeticHght = {
            12,
        }
        if line ~= "" then
            localcanvas = love.graphics.newCanvas(80,1000)
            exportfolder = cosmeticType[1]
            encodedirectory = export_directory.."/"..exportfolder.."/"..cosmeticFile[1]..ID
            for i=1,3,2 do
                width, height = cosmeticWdth[1]*i,cosmeticHght[1]*i
                localcanvas = love.graphics.newCanvas(width,height)
                love.graphics.setCanvas(localcanvas)
                makeBattle(name,number,i); width = number*i
                love.graphics.setCanvas()
                newfile = love.filesystem.newFile(encodedirectory..tern(i==3," HD","")..".png")
                myimagedata = localcanvas:newImageData( 1, 1, 0, 0,width,height)
                newfile:open("w")
                newfile:write(myimagedata:encode("png"))
                newfile:close()
            end
        end
        ID = ID + 1
		love.graphics.setColor(1,1,1,1);
		love.graphics.clear()
    end

    --Generates stage_list.txt
	fileoperation = love.filesystem.getInfo(export_directory.."/stage_list.txt","file")
    ID = 1
    local IconNames = {}
    if fileoperation == nil then
        file = love.filesystem.newFile(export_directory.."/stage_list.txt")
        file:open("a")
        file:write("Battlefield\n")
        file:write("Final Destination\n")
        file:write("Delfino Plaza\n")
        file:write("Luigi's Mansion\n")
        file:write("Mushroomy Kingdom\n")
        file:write("Mario Circuit\n")
        file:write("Rumble Falls\n")
        file:write("Bridge of Eldin\n")
        file:write("Pirate Ship\n")
        file:write("Norfair\n")
        file:write("Frigate Orpheon\n")
        file:write("Yoshi's Island\n")
        file:write("Halberd\n")
        file:write("Lylat Cruise\n")
        file:write("Pokémon Stadium 2\n")
        file:write("Spear Pillar\n")
        file:write("Port Town Aero Dive\n")
        file:write("Castle Siege\n")
        file:write("WarioWare, Inc\n")
        file:write("Distant Planet\n")
        file:write("Smashville\n")
        file:write("New Pork City\n")
        file:write("Summit\n")
        file:write("Flat Zone 2\n")
        file:write("Skyworld\n")
        file:write("75m\n")
        file:write("Mario Bros.\n")
        file:write("Flat Zone 2\n")
        file:write("PictoChat\n")
        file:write("Hanenbow\n")
        file:write("Shadow Moses Island\n")
        file:write("Green Hill Zone\n")
        file:write("Temple\n")
        file:write("Dinosaur Land\n")
        file:write("Jungle Japes\n")
        file:write("Onett\n")
        file:write("Corneria\n")
        file:write("Rainbow Cruise\n")
        file:write("Green Greens\n")
        file:write("Big Blue\n")
        file:write("Brinstar\n")
        file:write("Pokémon Stadium\n")
        file:write("Yoshi's Story\n")
        file:write("Bowser's Castle\n")
        file:write("Sky Sanctuary Zone\n")
        file:write("Golden Temple\n")
        file:write("Ceres Space Colony\n")
        file:write("Wario Land\n")
        file:write("Fountain of Dreams\n")
        file:write("Metal Cavern\n")
        file:write("Dream Land\n")
        file:write("Frigate Husk\n")
        file:write("Temple of Time\n")
        file:write("Delfino's Secret\n")
        file:write("Peach's Castle\n")
        file:write("Kongo Jungle\n")
        file:write("Hyrule Castle\n")
        file:write("Planet Zebes\n")
        file:write("Saffron City\n")
        file:write("Fourside\n")
        file:write("Infinite Glacier\n")
        file:write("Training Room\n")
        file:write("Mushroom Kingdom\n")
        file:write("Minecart Madness\n")
        file:write("Cookie Country\n")
        file:write("Clock Town\n")
        file:write("Poké Floats\n")
        file:write("Bell Tower\n")
        file:write("Venom\n")
        file:write("Venus Lighthouse \n")
        file:write("Dracula's Castle\n")
        file:write("Dead Line\n")
        file:write("Subspace\n")
        file:open("c")
    end
    --Generates cosmetics from stage_list.txt
    for line in love.filesystem.lines(export_directory.."/stage_list.txt") do
        local localcanvas
        local exportfolder
        local encodedirectory
        local newfile
        local myimagedata
        local name
        local cssi
        local number
        local cosmeticType = {
            "PM Stage Select Screen Name",
            "REX Stage Select Screen Name",
            "Brawl Stage Select Screen Name",
            "Ultimate Stage Select Screen Name"
        }
        local cosmeticWdth = {
            234,
            208,
            208,
            234
        }
        local cosmeticHght = {
            63,
            56,
            56,
            63
        }
		if line ~= "" then
            for k=1,4 do
                exportfolder = cosmeticType[k]
                encodedirectory = export_directory.."/"..exportfolder.."/".."MenSelmapFrontStname."..ID
                for i=1,3,2 do
                    width, height = cosmeticWdth[k]*i,cosmeticHght[k]*i
                    localcanvas = love.graphics.newCanvas(width*i,height*i)
                    love.graphics.setCanvas(localcanvas)
                    if k==1 then makeStage(line,i)
                    elseif k==2 then makeStage_REX(line,i)
                    elseif k==3 then makeStage_Brawl(line,i)
                    elseif k==4 then makeStage_Ultimate(line,i)
                    end
                    love.graphics.setCanvas()
                    newfile = love.filesystem.newFile(encodedirectory..tern(i==3," HD","")..".png")
                    myimagedata = localcanvas:newImageData( 1, 1, 0, 0,width,height)
                    newfile:open("w")
                    newfile:write(myimagedata:encode("png"))
                    newfile:close()
                end
            end
        end
		ID = ID + 1
		love.graphics.setColor(1,1,1,1);
		love.graphics.clear()
    end
end

function love.update()
	love.event.quit()
end