local status_ok, outline = pcall(require, 'aerial')

if not status_ok then
  vim.notify('aerial not found')
  return
end

outline.setup({})
