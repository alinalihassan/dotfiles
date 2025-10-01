local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

-- Configuration
local config = {
  fd = "/opt/homebrew/bin/fd",
  rootPath = "/Users/alinalihassan/Developer",
  cacheFile = os.getenv("HOME") .. "/.cache/wezterm-sessionizer.json",
  maxDepth = 6,
  cacheExpiry = 60 * 60, -- 1 hour
  ignorePatterns = {
    "node_modules",
    ".git",
    ".vscode",
    ".idea",
    "dist",
    "build",
    "target",
    ".next",
    ".nuxt",
    "coverage",
    ".nyc_output",
    "tmp",
    "temp",
    ".DS_Store",
    "*.log",
    "*.lock",
    "package-lock.json",
    "yarn.lock",
    "pnpm-lock.yaml",
    ".env*",
    "*.min.js",
    "*.min.css",
  }
}

-- Cache management
local cache = {}
local cacheLoaded = false

-- Sessionizer state
local sessionizerOpen = false

local function loadCache()
  if cacheLoaded then return end

  local file = io.open(config.cacheFile, "r")
  if file then
    local content = file:read("*all")
    file:close()

    local success, data = pcall(wezterm.json_parse, content)
    if success and data then
      cache = data
      wezterm.log_info("Loaded sessionizer cache with " .. (data.projects and #data.projects or 0) .. " projects")
    end
  end
  cacheLoaded = true
end

local function saveCache()
  local file = io.open(config.cacheFile, "w")
  if file then
    file:write(wezterm.json_encode(cache))
    file:close()
  end
end

-- Project type detection and emoji mapping
local function detectProjectType(path)
  local projectFiles = {
    -- Package managers
    ["package.json"] = { type = "node", emoji = "📦", name = "Node.js" },
    ["yarn.lock"] = { type = "node", emoji = "📦", name = "Yarn" },
    ["pnpm-lock.yaml"] = { type = "node", emoji = "📦", name = "PNPM" },
    ["Cargo.toml"] = { type = "rust", emoji = "🦀", name = "Rust" },
    ["go.mod"] = { type = "go", emoji = "🐹", name = "Go" },
    ["composer.json"] = { type = "php", emoji = "🐘", name = "PHP" },
    ["requirements.txt"] = { type = "python", emoji = "🐍", name = "Python" },
    ["pyproject.toml"] = { type = "python", emoji = "🐍", name = "Python" },
    ["Gemfile"] = { type = "ruby", emoji = "💎", name = "Ruby" },
    ["pom.xml"] = { type = "java", emoji = "☕", name = "Java" },
    ["build.gradle"] = { type = "java", emoji = "☕", name = "Java" },
    ["pubspec.yaml"] = { type = "dart", emoji = "🎯", name = "Dart/Flutter" },

    -- Frameworks
    ["next.config.js"] = { type = "nextjs", emoji = "⚛️", name = "Next.js" },
    ["next.config.ts"] = { type = "nextjs", emoji = "⚛️", name = "Next.js" },
    ["nuxt.config.js"] = { type = "nuxt", emoji = "💚", name = "Nuxt.js" },
    ["nuxt.config.ts"] = { type = "nuxt", emoji = "💚", name = "Nuxt.js" },
    ["vue.config.js"] = { type = "vue", emoji = "💚", name = "Vue.js" },
    ["angular.json"] = { type = "angular", emoji = "🅰️", name = "Angular" },
    ["svelte.config.js"] = { type = "svelte", emoji = "🧡", name = "Svelte" },
    ["svelte.config.ts"] = { type = "svelte", emoji = "🧡", name = "Svelte" },
    ["remix.config.js"] = { type = "remix", emoji = "🎸", name = "Remix" },
    ["astro.config.mjs"] = { type = "astro", emoji = "🚀", name = "Astro" },
    ["vite.config.js"] = { type = "vite", emoji = "⚡", name = "Vite" },
    ["vite.config.ts"] = { type = "vite", emoji = "⚡", name = "Vite" },
    ["webpack.config.js"] = { type = "webpack", emoji = "📦", name = "Webpack" },
    ["rollup.config.js"] = { type = "rollup", emoji = "📦", name = "Rollup" },

    -- Mobile
    ["android/app/build.gradle"] = { type = "android", emoji = "🤖", name = "Android" },
    ["ios/Podfile"] = { type = "ios", emoji = "🍎", name = "iOS" },
    ["app.json"] = { type = "react-native", emoji = "📱", name = "React Native" },
    ["expo.json"] = { type = "expo", emoji = "📱", name = "Expo" },

    -- Backend frameworks
    ["Dockerfile"] = { type = "docker", emoji = "🐳", name = "Docker" },
    ["docker-compose.yml"] = { type = "docker", emoji = "🐳", name = "Docker Compose" },
    ["Dockerfile"] = { type = "docker", emoji = "🐳", name = "Docker" },
    ["docker-compose.yaml"] = { type = "docker", emoji = "🐳", name = "Docker Compose" },
    ["k8s.yaml"] = { type = "kubernetes", emoji = "☸️", name = "Kubernetes" },
    ["k8s.yml"] = { type = "kubernetes", emoji = "☸️", name = "Kubernetes" },
    ["serverless.yml"] = { type = "serverless", emoji = "⚡", name = "Serverless" },
    ["serverless.yaml"] = { type = "serverless", emoji = "⚡", name = "Serverless" },

    -- Databases
    ["schema.prisma"] = { type = "prisma", emoji = "🗄️", name = "Prisma" },
    ["migrations"] = { type = "database", emoji = "🗄️", name = "Database" },
    [".env.example"] = { type = "config", emoji = "⚙️", name = "Configuration" },

    -- Documentation
    ["README.md"] = { type = "docs", emoji = "📚", name = "Documentation" },
    ["docs/"] = { type = "docs", emoji = "📚", name = "Documentation" },
    ["wiki/"] = { type = "wiki", emoji = "📖", name = "Wiki" },

    -- Testing
    ["jest.config.js"] = { type = "jest", emoji = "🧪", name = "Jest" },
    ["vitest.config.ts"] = { type = "vitest", emoji = "🧪", name = "Vitest" },
    ["cypress.config.js"] = { type = "cypress", emoji = "🧪", name = "Cypress" },
    ["playwright.config.ts"] = { type = "playwright", emoji = "🎭", name = "Playwright" },

    -- Other
    [".gitignore"] = { type = "git", emoji = "🔧", name = "Git Project" },
    ["Makefile"] = { type = "make", emoji = "🔨", name = "Make" },
    ["CMakeLists.txt"] = { type = "cmake", emoji = "🔨", name = "CMake" },
    ["meson.build"] = { type = "meson", emoji = "🔨", name = "Meson" },
  }

  -- Check for project files
  for file, info in pairs(projectFiles) do
    local filePath = path .. "/" .. file
    local fileHandle = io.open(filePath, "r")
    if fileHandle then
      fileHandle:close()
      return info
    end
  end

  -- Check for common directories
  local dirs = {
    ["src/"] = { type = "source", emoji = "📁", name = "Source Code" },
    ["lib/"] = { type = "library", emoji = "📚", name = "Library" },
    ["app/"] = { type = "app", emoji = "📱", name = "Application" },
    ["components/"] = { type = "components", emoji = "🧩", name = "Components" },
    ["pages/"] = { type = "pages", emoji = "📄", name = "Pages" },
    ["api/"] = { type = "api", emoji = "🔌", name = "API" },
    ["public/"] = { type = "public", emoji = "🌐", name = "Public Assets" },
    ["assets/"] = { type = "assets", emoji = "🎨", name = "Assets" },
    ["styles/"] = { type = "styles", emoji = "🎨", name = "Styles" },
    ["scripts/"] = { type = "scripts", emoji = "📜", name = "Scripts" },
    ["tests/"] = { type = "tests", emoji = "🧪", name = "Tests" },
    ["test/"] = { type = "tests", emoji = "🧪", name = "Tests" },
    ["__tests__/"] = { type = "tests", emoji = "🧪", name = "Tests" },
  }

  for dir, info in pairs(dirs) do
    local dirPath = path .. "/" .. dir
    local handle = io.popen("test -d '" .. dirPath .. "' && echo 'exists' 2>/dev/null")
    if handle then
      local result = handle:read("*all")
      handle:close()
      if result and result:match("exists") then
        return info
      end
    end
  end

  -- Default fallback
  return { type = "unknown", emoji = "📂", name = "Project" }
end

local function formatTime(lastModified)
  local timeStr = ""
  if lastModified > 0 then
    local now = os.time()
    local diff = now - lastModified
    if diff < 3600 then -- Less than 1 hour
      timeStr = " " .. math.floor(diff / 60) .. "m ago"
    elseif diff < 86400 then -- Less than 1 day
      timeStr = " " .. math.floor(diff / 3600) .. "h ago"
    elseif diff < 4 * 604800 then -- Less than 4 weeks
      timeStr = " " .. math.floor(diff / 86400) .. "d ago"
    elseif diff < 365 * 86400 then -- Less than 1 year
      timeStr = " " .. math.floor(diff / (30 * 86400)) .. "mo ago"
    else
      timeStr = " " .. os.date("%d/%m/%y", lastModified)
    end
  end
  return timeStr
end

local function getProjectMetadata(path)
  local metadata = {
    name = path:match("([^/]+)$") or path,
    path = path,
    lastModified = 0,
    size = 0,
    type = detectProjectType(path)
  }

  -- Get file stats
  local success, result = pcall(function()
    local handle = io.popen("stat -f '%m %z' '" .. path .. "' 2>/dev/null")
    if handle then
      local output = handle:read("*all")
      handle:close()
      if output and output ~= "" then
        local timestamp, size = output:match("(%d+) (%d+)")
        if timestamp and size then
          metadata.lastModified = tonumber(timestamp)
          metadata.size = tonumber(size)
        end
      end
    end
  end)

  return metadata
end

local function formatProjectLabel(metadata)
  local name = metadata.name
  local emoji = metadata.type.emoji
  local typeName = metadata.type.name
  local path = metadata.path
  local timeStr = formatTime(metadata.lastModified)

  -- Create the formatted label
  local label = wezterm.format({
    { Foreground = { AnsiColor = "Blue" } },
    { Text = emoji .. " " },
    { Foreground = { AnsiColor = "White" } },
    { Attribute = { Intensity = "Bold" } },
    { Text = name },
    { Attribute = { Intensity = "Normal" } },
    { Foreground = { AnsiColor = "Green" } },
    { Text = timeStr },
    { Foreground = { AnsiColor = "Green" } },
    { Text = "\n  " .. path },
  })

  return label
end

local function workspaceFormatter(label)
  -- Get workspace metadata for time info
  local metadata = getProjectMetadata(label)
  local timeStr = formatTime(metadata.lastModified)
  local folderName = label:match("([^/]+)$") or label

  return wezterm.format({
    { Foreground = { AnsiColor = "Blue" } },
    { Text = "🔗 " },
    { Foreground = { AnsiColor = "White" } },
    { Attribute = { Intensity = "Bold" } },
    { Text = folderName },
    { Attribute = { Intensity = "Normal" } },
    { Foreground = { AnsiColor = "Blue" } },
    { Text = timeStr },
    { Foreground = { AnsiColor = "Green" } },
    { Text = " (active)" },
  })
end

local function isCacheValid()
  if not cache.timestamp then return false end
  return os.time() - cache.timestamp < config.cacheExpiry
end

local function buildIgnoreArgs()
  local args = {}
  for _, pattern in ipairs(config.ignorePatterns) do
    table.insert(args, "--ignore")
    table.insert(args, pattern)
  end
  return args
end

local function discoverProjects()
  loadCache()

  -- Return cached results if valid
  if isCacheValid() and cache.projects then
    wezterm.log_info("Using cached projects (" .. #cache.projects .. " found)")
    return cache.projects
  end

  wezterm.log_info("Discovering projects...")
  local projects = {}
  local workspaceSet = {}

  -- Add active workspaces
  for _, workspace in ipairs(wezterm.mux.get_workspace_names()) do
    table.insert(projects, {
      id = workspace,
      label = workspaceFormatter(workspace)
    })
    workspaceSet[workspace] = true
  end

  -- Build fd command with ignore patterns
  local fdArgs = { config.fd, "-HI", "-td", "^.git$", "--max-depth=" .. config.maxDepth, "--prune" }
  local ignoreArgs = buildIgnoreArgs()
  for _, arg in ipairs(ignoreArgs) do
    table.insert(fdArgs, arg)
  end
  table.insert(fdArgs, config.rootPath)

  local success, stdout, stderr = wezterm.run_child_process(fdArgs)

  if not success then
    wezterm.log_error("Failed to run fd: " .. stderr)
    return projects
  end

  -- Process discovered projects
  for line in stdout:gmatch("([^\n]*)\n?") do
    local path = line:gsub("/.git/$", "")

    if not workspaceSet[path] then
      local metadata = getProjectMetadata(path)
      table.insert(projects, {
        id = path,
        label = formatProjectLabel(metadata)
      })
      workspaceSet[path] = true
    end
  end

  -- Sort projects with priority: current workspace > default > rest by last modified
  table.sort(projects, function(a, b)
    -- Get current workspace name
    local currentWorkspace = wezterm.mux.get_active_workspace()

    -- Put current workspace first
    if a.id == currentWorkspace then return true end
    if b.id == currentWorkspace then return false end

    -- Put default workspace second
    if a.id == "default" then return true end
    if b.id == "default" then return false end

    -- Rest sorted by last modified
    local aMetadata = getProjectMetadata(a.id)
    local bMetadata = getProjectMetadata(b.id)
    return (aMetadata.lastModified or 0) > (bMetadata.lastModified or 0)
  end)

  -- Update cache
  cache = {
    timestamp = os.time(),
    projects = projects
  }
  saveCache()

  wezterm.log_info("Discovered " .. #projects .. " projects")
  return projects
end

M.toggle = function(window, pane)
  -- If sessionizer is already open, close it by sending Escape
  if sessionizerOpen then
    sessionizerOpen = false
    window:perform_action(act.SendKey({ key = "Escape" }), pane)
    return
  end

  local projects = discoverProjects()

  if #projects == 0 then
    wezterm.log_info("No projects found")
    return
  end

  sessionizerOpen = true

  window:perform_action(
    act.InputSelector({
      action = wezterm.action_callback(function(win, _, id, label)
        sessionizerOpen = false
        if not id and not label then
          wezterm.log_info("Cancelled")
        else
          wezterm.log_info("Selected project: " .. (id or "unknown"))
          win:perform_action(
            act.SwitchToWorkspace({ name = id, spawn = { cwd = id } }),
            pane
          )
        end
      end),
      fuzzy = true,
      fuzzy_description = "🔍 Search projects: ",
      choices = projects,
    }),
    pane
  )
end

-- Utility function to clear cache
M.clearCache = function()
  cache = {}
  cacheLoaded = false
  os.remove(config.cacheFile)
  wezterm.log_info("Sessionizer cache cleared")
end

-- Utility function to refresh projects
M.refresh = function(window, pane)
  M.clearCache()
  M.toggle(window, pane)
end

return M
