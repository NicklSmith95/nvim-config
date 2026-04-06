-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\NICKSM~1.GGB\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\share\\lua\\5.1\\?.lua;C:\\Users\\NICKSM~1.GGB\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\NICKSM~1.GGB\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\NICKSM~1.GGB\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\NICKSM~1.GGB\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["CopilotChat.nvim"] = {
    config = { "\27LJ\2\n®\6\0\0\6\0 \0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\19\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\19\0'\3\23\0'\4\24\0005\5\25\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\19\0'\3\26\0'\4\27\0005\5\28\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\19\0'\3\29\0'\4\30\0005\5\31\0B\0\5\1K\0\1\0\1\0\1\tdesc\23Optimize selection\29:CopilotChatOptimize<CR>\15<leader>co\1\0\1\tdesc\19Generate tests\26:CopilotChatTests<CR>\15<leader>ct\1\0\1\tdesc\18Fix selection\24:CopilotChatFix<CR>\15<leader>cf\1\0\1\tdesc\22Explain selection\28:CopilotChatExplain<CR>\15<leader>ce\6v\1\0\1\tdesc\25Select Copilot Model\27:CopilotChatModels<CR>\15<leader>cm\1\0\1\tdesc\22Reset CopilotChat\26:CopilotChatReset<CR>\15<leader>cr\1\0\1\tdesc\23Toggle CopilotChat\27:CopilotChatToggle<CR>\15<leader>cc\6n\bset\vkeymap\bvim\vwindow\1\0\2\vlayout\rvertical\nwidth\4š³æÌ\t™³æþ\3\1\0\3\21auto_insert_mode\2\vwindow\0\nmodel\fgpt-4.1\nsetup\16CopilotChat\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\CopilotChat.nvim",
    url = "https://github.com/CopilotC-Nvim/CopilotChat.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["copilot.vim"] = {
    config = { "\27LJ\2\nŸ\1\0\0\6\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\2\texpr\2\21replace_keycodes\1\31copilot#Accept(\"\\<S-Tab>\")\f<S-Tab>\6i\bset\vkeymap\23copilot_no_tab_map\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  harpoon = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  template_vault = {
    config = { "\27LJ\2\nq\0\0\3\0\5\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\nsetup\19template_vault\frequire\0" },
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\template_vault",
    url = "https://github.com/nicklsmith95/template_vault"
  },
  undotree = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\nick.smith.ggbt\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: CopilotChat.nvim
time([[Config for CopilotChat.nvim]], true)
try_loadstring("\27LJ\2\n®\6\0\0\6\0 \0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\19\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\19\0'\3\23\0'\4\24\0005\5\25\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\19\0'\3\26\0'\4\27\0005\5\28\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\19\0'\3\29\0'\4\30\0005\5\31\0B\0\5\1K\0\1\0\1\0\1\tdesc\23Optimize selection\29:CopilotChatOptimize<CR>\15<leader>co\1\0\1\tdesc\19Generate tests\26:CopilotChatTests<CR>\15<leader>ct\1\0\1\tdesc\18Fix selection\24:CopilotChatFix<CR>\15<leader>cf\1\0\1\tdesc\22Explain selection\28:CopilotChatExplain<CR>\15<leader>ce\6v\1\0\1\tdesc\25Select Copilot Model\27:CopilotChatModels<CR>\15<leader>cm\1\0\1\tdesc\22Reset CopilotChat\26:CopilotChatReset<CR>\15<leader>cr\1\0\1\tdesc\23Toggle CopilotChat\27:CopilotChatToggle<CR>\15<leader>cc\6n\bset\vkeymap\bvim\vwindow\1\0\2\vlayout\rvertical\nwidth\4š³æÌ\t™³æþ\3\1\0\3\21auto_insert_mode\2\vwindow\0\nmodel\fgpt-4.1\nsetup\16CopilotChat\frequire\0", "config", "CopilotChat.nvim")
time([[Config for CopilotChat.nvim]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\nŸ\1\0\0\6\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0'\3\6\0'\4\a\0005\5\b\0B\0\5\1K\0\1\0\1\0\2\texpr\2\21replace_keycodes\1\31copilot#Accept(\"\\<S-Tab>\")\f<S-Tab>\6i\bset\vkeymap\23copilot_no_tab_map\6g\bvim\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: template_vault
time([[Config for template_vault]], true)
try_loadstring("\27LJ\2\nq\0\0\3\0\5\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\nsetup\19template_vault\frequire\0", "config", "template_vault")
time([[Config for template_vault]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
