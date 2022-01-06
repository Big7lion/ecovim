vim.filetype.add({
	  extension = {
	    rake = "ruby",
	  },
	  filename = {
	    [".foorc"] = "foorc",
	  },
	  pattern = {
	    [".*/etc/foo/.*%.conf"] = "foorc",
	  },
	})
