function JoinMarine()
    local player = game:GetService("Players").LocalPlayer
    local marineTeam = "Marine"  -- Tên team Hải quân
    local teams = game:GetService("Teams")
    
    if teams[marineTeam] then
        player.Team = teams[marineTeam]
    else
        print("Không tìm thấy team Hải quân!")
    end
end

function AutoBuyDevilFruit()
    local player = game:GetService("Players").LocalPlayer
    local shop = game:GetService("Workspace").FruitShop
    local fruit = "Kitsune"

    if shop:FindFirstChild(fruit) then
        local fruitItem = shop[fruit]
        if player.leaderstats.Beli.Value >= fruitItem.Cost.Value then
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

JoinMarine()
AutoBuyDevilFruit()
