-- Hàm để tham gia bên Hải quân (Marine)
function JoinMarine()
    local player = game:GetService("Players").LocalPlayer
    local marineTeam = "Marine"  -- Tên team Hải quân
    if game:GetService("Teams")[marineTeam] then
        player.Team = game:GetService("Teams")[marineTeam]
    else
        print("Không tìm thấy team Hải quân!")
    end
end

-- Hàm để tự động mua trái ác quỷ Kitsune
function AutoBuyDevilFruit()
    local player = game:GetService("Players").LocalPlayer
    local shop = game:GetService("Workspace").Shop  -- Thay thế bằng đường dẫn thực tế đến shop
    local fruit = "Kitsune"  -- Tên trái ác quỷ Kitsune trong shop

    if shop:FindFirstChild(fruit) then
        local fruitItem = shop[fruit]
        if player:WaitForChild("leaderstats").Money.Value >= fruitItem.Price.Value then
            local args = {
                [1] = fruitItem.Name
            }
            game:GetService("ReplicatedStorage").ShopEvents.BuyItem:InvokeServer(unpack(args))
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
