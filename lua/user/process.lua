---@param opts {cmd: string, args: string[], on_exit: fun(code: number, signal: number) , silent: boolean}
local function spawn(opts)
  local handle, pid

  if not opts.on_exit then
    opts.on_exit = function(code, _)
      if not opts.silent then print("Exit code: " .. code) end
      if handle then handle:close() end
    end
  end

  handle, pid = vim.loop.spawn(opts.cmd, {
    args = opts.args,
    stdio = { nil, vim.loop.new_pipe(false), vim.loop.new_pipe(false) },
  }, opts.on_exit)
  return handle, pid
end

return {
  spawn = spawn,
}
