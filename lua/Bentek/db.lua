-- SQL Server Database Access Module
-- This module provides functions to query SQL Server databases via sqlcmd

local M = {}

-- Configuration
-- You can set these via environment variables or directly in this file
M.config = {
  server = os.getenv("DB_SERVER") or "localhost",
  database = os.getenv("DB_DATABASE") or "",
  username = os.getenv("DB_USERNAME") or "",
  password = os.getenv("DB_PASSWORD") or "",
  use_windows_auth = os.getenv("DB_USE_WINDOWS_AUTH") == "true" or true, -- Default to Windows Auth
  timeout = 30, -- Query timeout in seconds
}

-- Execute a SQL query and return results as a string
-- @param query: SQL query string to execute
-- @param opts: Optional table with server, database, username, password overrides
-- @return: Query results as string, or nil and error message
function M.execute_query(query, opts)
  opts = opts or {}
  
  local server = opts.server or M.config.server
  local database = opts.database or M.config.database
  local username = opts.username or M.config.username
  local password = opts.password or M.config.password
  local use_windows_auth = opts.use_windows_auth ~= nil and opts.use_windows_auth or M.config.use_windows_auth
  local timeout = opts.timeout or M.config.timeout
  
  -- Build sqlcmd command
  local cmd = string.format('sqlcmd -S "%s" -d "%s" -t %d -W -s "|" -m 1',
    server, database, timeout)
  
  -- Add authentication
  if use_windows_auth then
    cmd = cmd .. " -E" -- Use Windows Authentication
  else
    cmd = cmd .. string.format(' -U "%s" -P "%s"', username, password)
  end
  
  -- Add query
  cmd = cmd .. string.format(' -Q "%s"', query:gsub('"', '""'))
  
  -- Execute command and capture output
  local handle = io.popen(cmd .. " 2>&1")
  if not handle then
    return nil, "Failed to execute sqlcmd command"
  end
  
  local result = handle:read("*a")
  local success = handle:close()
  
  if not success then
    return nil, "Query execution failed: " .. result
  end
  
  return result
end

-- Execute a SQL query and display results in a new buffer
-- @param query: SQL query string to execute
-- @param opts: Optional table with server, database, username, password overrides
function M.execute_and_show(query, opts)
  local result, err = M.execute_query(query, opts)
  
  if not result then
    vim.notify("SQL Error: " .. (err or "Unknown error"), vim.log.levels.ERROR)
    return
  end
  
  -- Create a new buffer with the results
  local buf = vim.api.nvim_create_buf(false, true)
  local lines = vim.split(result, "\n")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "filetype", "sql")
  
  -- Open buffer in a new split
  vim.cmd("split")
  vim.api.nvim_win_set_buf(0, buf)
end

-- Set database configuration
-- @param opts: Table with server, database, username, password, use_windows_auth
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

-- Get schema information for a table
-- @param table_name: Name of the table
-- @param opts: Optional connection options
function M.describe_table(table_name, opts)
  local query = string.format([[
    SELECT 
      COLUMN_NAME,
      DATA_TYPE,
      CHARACTER_MAXIMUM_LENGTH,
      IS_NULLABLE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = '%s'
    ORDER BY ORDINAL_POSITION
  ]], table_name)
  
  return M.execute_and_show(query, opts)
end

-- List all tables in the database
-- @param opts: Optional connection options
function M.list_tables(opts)
  local query = [[
    SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE = 'BASE TABLE'
    ORDER BY TABLE_SCHEMA, TABLE_NAME
  ]]
  
  return M.execute_and_show(query, opts)
end

return M
