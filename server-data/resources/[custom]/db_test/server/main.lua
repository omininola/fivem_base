local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterCommand("dbtest", function(source)

    local user_id = vRP.getUserId({source})
    print(vRP.hasPermission({user_id, "admin.tickets"}))

    if vRP.hasPermission({user_id, "admin.tickets"}) then

        -- The vRP way to query (this works regardless of which driver you have)
        vRP.query("SELECT COUNT(*) as count FROM vrp_users", {}, function(rows, affected)
            if rows then
                print("Found " .. rows[1].count .. " users.")
                vRPclient.notify(source, {"Success! Found " .. rows[1].count .. " users."})
            else
                print("DB Error! Check console.")
                vRPclient.notify(source, {"~r~Database error! Check console."})
            end
        end)
    end
end, false)