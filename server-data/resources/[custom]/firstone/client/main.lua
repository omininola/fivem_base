local markerDistance = 15.0
local hintDistance = 1.5
local waitTime = 1000

local function ShowHelpText(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

CreateThread(function()
    while true do
        for title, location in pairs(Config.Locations) do
            local entrance = location.Coords.Entrance
            local exit = location.Coords.Exit

            local myPed = PlayerPedId()
            local myCoords = GetEntityCoords(myPed)

            local entranceDist = #(myCoords - entrance.Point)
            local exitDist = #(myCoords - exit.Point)

            if entranceDist < markerDistance then
                waitTime = 0
                DrawMarker(2, entrance.Point.x, entrance.Point.y, entrance.Point.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 0, 50, false, true, 2, false, nil, nil, false)

                if entranceDist <= hintDistance then
                    ShowHelpText('Press ~INPUT_CONTEXT~ to enter the ' .. title)
                    if IsControlJustPressed(0, 38) then
                        SetEntityCoords(myPed, entrance.Landing.x, entrance.Landing.y, entrance.Landing.z, true, false, false, false)
                        SetEntityHeading(myPed, entrance.Landing.w)
                    end
                end
            end

            if exitDist < markerDistance then
                waitTime = 0
                DrawMarker(2, exit.Point.x, exit.Point.y, exit.Point.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 0, 50, false, true, 2, false, nil, nil, false)

                if exitDist <= hintDistance then
                    ShowHelpText('Press ~INPUT_CONTEXT~ to exit the ' .. title)
                    if IsControlJustPressed(0, 38) then
                        SetEntityCoords(myPed, exit.Landing.x, exit.Landing.y, exit.Landing.z, true, false, false, false)
                        SetEntityHeading(myPed, exit.Landing.w)
                    end
                end
            end
        end

        Wait(waitTime)
    end
end)