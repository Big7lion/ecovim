require("filetype").setup({
  overrides = {
    extensions = {
       -- Set the filetype of *.rake files to ruby
       rake = "ruby",
       cr = "crystal"
    },
  }
})

-- documentation: https://github.com/nathom/filetype.nvim
