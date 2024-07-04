if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end

function CheckQuest() 
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel == 1 or MyLevel <= 9 or SelectMonster == "" then -- Bandit
            Mon = "Bandit"
            NameQuest = "BanditQuest1"
            LevelQuest = 1
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
        elseif MyLevel == 10 or MyLevel <= 14 or SelectMonster == "Monkey" then -- Monkey
            Mon = "Monkey"
            NameQuest = "JungleQuest"
        end
    end
end

-- Hàm để tham gia bên Hải quân (Marine)
function JoinMarine()
    local player = game:GetService("Players").LocalPlayer
    local marineTeam = "Marine"  -- Tên team Hải quân, kiểm tra chính xác tên team trong game
    local teams = game:GetService("Teams")
    
    if teams:FindFirstChild(marineTeam) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", marineTeam)
        print("Đã tham gia team Hải quân!")
    else
        print("Không tìm thấy team Hải quân!")
    end
end

-- Hàm để tự động mua trái ác quỷ Kitsune
function AutoBuyDevilFruit()
    local player = game:GetService("Players").LocalPlayer
    local shop = game:GetService("Workspace").FruitShop  -- Đường dẫn thực tế đến shop trái ác quỷ
    local fruit = "Kitsune"  -- Tên trái ác quỷ Kitsune trong shop

    if shop:FindFirstChild(fruit) then
        local fruitItem = shop[fruit]
        if player.leaderstats.Beli.Value >= fruitItem.Cost.Value then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Purchase", fruitItem.Name)
            print("Đã mua trái ác quỷ Kitsune!")
        else
            print("Không đủ tiền để mua trái ác quỷ Kitsune!")
        end
    else
        print("Không tìm thấy trái ác quỷ Kitsune trong shop!")
    end
end

-- Gọi hàm tham gia bên Hải quân và mua trái ác quỷ Kitsune
JoinMarine()
AutoBuyDevilFruit()
