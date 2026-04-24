local function getOutputFrom(cmd)
    local command = io.popen(cmd, "r")
    if not command then return nil end

    local result = command:read("*a"):gsub("%s+$", "")
    command:close()

    if result == "" then return nil end
    return result
end

local function encloseColor(text, colorCode)
    return string.format("%%F{%s}%s%%f", colorCode, text)
end

local function getGitBranch()
    local branch = getOutputFrom(
        "git rev-parse --abbrev-ref HEAD 2> /dev/null")

    if branch then
        return string.format("%s%s",
            encloseColor("git:", "#57A0D3"),
            encloseColor(branch, "#E5395A"))
    end
end

local dir = "%2~"
local branch = getGitBranch()
local prompt = encloseColor(" ", "#6C757D")

print(string.format(
    "%s%s\n%s",
    dir,
    branch and ' ' .. branch or '',
    prompt
))
