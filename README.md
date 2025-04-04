# Graphite Picker

A simple Telescope picker to checkout to a Graphite branch. 

## Installation

Install Telescope and this extension, for example with lazy.nvim: 

```lua
{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    ...
    "pfdzm/graphite-picker",
  },
  config = function()
    require("telescope").load_extension("graphite")
  end
}
```

## Usage
You can use the picker with the following command:

```lua
require("telescope").extensions.graphite_picker.graphite_picker()
```
or bind it to a keymap:

```lua
vim.keymap.set("n", "<leader>gt", require("telescope").extensions.graphite_picker.graphite_picker , { desc = "Graphite Picker" })
```

or use the command directly in Neovim:

```vim
:Telescope graphite_picker
```
