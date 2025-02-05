local function isValidDiscordURL(url)
    return url:match("^https://discord%.gg/[%w-]+$") ~= nil
end

local function setClipboardLink(link)
    if setclipboard then
        setclipboard(link)
        print("Discord invite copied to clipboard: " .. link)
    else
        notify("Clipboard functionality not available.")
    end
end

local function notify(message)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Discord Auto-Join",
        Text = message,
        Duration = 10
    })
end

local function handleError(errorMessage)
    notify("Error: " .. errorMessage)
end

local function main()
    if not getgenv().InviteURL then
        handleError("No InviteURL found.")
        return
    end
    local url = getgenv().InviteURL
    if not isValidDiscordURL(url) then
        handleError("Invalid Discord URL.")
        return
    end
    setClipboardLink(url)
end

pcall(function() main() end)
