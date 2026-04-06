-- Keymaps for database operations
local db = require("Bentek.db")

-- Multi-environment configuration
-- Set these environment variables for each environment:
-- QA Environment:
--   $env:DB_QA_SERVER = "db-qa.ggbt.local"
--   $env:DB_QA_USERNAME = "your-username"
--   $env:DB_QA_PASSWORD = "your-password"
-- BETA Environment:
--   $env:DB_BETA_SERVER = "db-beta.ggbt.local"
--   $env:DB_BETA_USERNAME = "your-username"
--   $env:DB_BETA_PASSWORD = "your-password"
-- DEV Environment:
--   $env:DB_DEV_SERVER = "db-dev.ggbt.local"
--   $env:DB_DEV_USERNAME = "your-username"
--   $env:DB_DEV_PASSWORD = "your-password"
-- PROD Environment (optional):
--   $env:DB_PROD_SERVER = "db-prod.ggbt.local"
--   $env:DB_PROD_USERNAME = "prod-username"
--   $env:DB_PROD_PASSWORD = "prod-password"

-- Default environment (can be overridden)
-- $env:DB_DEFAULT_ENV = "QA"
-- $env:DB_DEFAULT_DATABASE = "BentekCommon"

local default_env = os.getenv("DB_DEFAULT_ENV") or "QA"
local default_database = os.getenv("DB_DEFAULT_DATABASE") or "Bentek-prod-demo"

-- Setup with default environment
db.setup({
  server = os.getenv("DB_" .. default_env .. "_SERVER") or "db-qa.ggbt.local",
  database = default_database,
  use_windows_auth = false,
  username = os.getenv("DB_USERNAME") or "",
  password = os.getenv("DB_LOWER_PASSWORD") or "",
})

-- Execute SQL query under cursor or in visual selection
vim.keymap.set("n", "<leader>dq", function()
  local query = vim.fn.input("SQL Query: ")
  if query ~= "" then
    db.execute_and_show(query)
  end
end, { desc = "Execute SQL Query (prompt)" })

-- Execute SQL from visual selection
vim.keymap.set("x", "<leader>dq", function()
  -- Get visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  
  if type(lines) == "string" then
    lines = { lines }
  end
  
  -- Handle partial line selections
  if #lines > 0 then
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
    lines[1] = string.sub(lines[1], start_pos[3])
  end
  
  local query = table.concat(lines, "\n")
  db.execute_and_show(query)
end, { desc = "Execute SQL Query (visual selection)" })

-- List all tables in database
vim.keymap.set("n", "<leader>dt", function()
  db.list_tables()
end, { desc = "List Database Tables" })

-- Describe table schema (prompt for table name)
vim.keymap.set("n", "<leader>ds", function()
  local table_name = vim.fn.input("Table Name: ")
  if table_name ~= "" then
    db.describe_table(table_name)
  end
end, { desc = "Describe Table Schema" })

-- Send query to AI assistant (for your sidekick.cli integration)
vim.keymap.set("x", "<leader>aq", function()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  
  if type(lines) == "string" then
    lines = { lines }
  end
  
  if #lines > 0 then
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
    lines[1] = string.sub(lines[1], start_pos[3])
  end
  
  local query = table.concat(lines, "\n")
  
  -- Execute query and send results to AI
  local result, err = db.execute_query(query)
  if result then
    require("sidekick.cli").send({ 
      msg = string.format("SQL Query Results:\n\nQuery:\n%s\n\nResults:\n%s", query, result)
    })
  else
    vim.notify("SQL Error: " .. (err or "Unknown error"), vim.log.levels.ERROR)
  end
end, { desc = "Execute SQL & Send to AI" })
