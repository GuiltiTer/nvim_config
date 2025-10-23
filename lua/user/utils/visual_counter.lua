local M = {}
M.get_word_count = function() return vim.fn.wordcount() end
M.get_buffer_line_count = function() return vim.fn.line "$" end
M.get_visual_line_count = function()
  local starts, ends = vim.fn.line "v", vim.fn.line "."
  local lines = (starts <= ends and ends - starts or starts - ends) + 1
  return lines
end
M.summary = function()
  local wc = M.get_word_count()
  local visual_lines = M.get_visual_line_count()
  local buff_lines = M.get_buffer_line_count()
  return tostring(visual_lines)
    .. ":"
    .. tostring(wc["visual_words"])
    .. ":"
    .. tostring(wc["visual_chars"])
    .. "/"
    .. tostring(buff_lines)
    .. ":"
    .. tostring(wc["words"])
    .. ":"
    .. tostring(wc["chars"])
end


return M
