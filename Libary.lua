local function isValidDiscordURL(url)
    return url:match("^https://discord%.gg/[%w-]+$") ~= nil
end

local function setClipboardLink(link)
    if setclipboard then
        setclipboard(link)
        print("Discord invite copied to clipboard: " .. link)
    else
        warn("Clipboard functionality not available.")
    end
end

local function handleError(errorMessage)
    warn("Error: " .. errorMessage)
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
