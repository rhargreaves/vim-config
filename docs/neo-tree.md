# Neo-tree Cheat Sheet

Run these keys while the Neo-tree window is focused.

## Open and Navigate

| Key or command | Action |
| --- | --- |
| `<F2>` | Toggle Neo-tree |
| `<Leader>e` (`Space`, then `e`) | Reveal the current file in Neo-tree |
| `j` / `k` | Select the next or previous node |
| `{count}j` / `{count}k` | Move several rows, for example `5j` |
| `<Enter>` | Open the selected file or directory |
| `<Space>` | Expand or collapse a directory |
| `/` | Find a file or directory by name |
| `q` | Close Neo-tree |

## Change the Root

| Key or command | Action |
| --- | --- |
| `.` | Make the selected directory the root |
| `<BS>` | Move the root to its parent directory |
| `:Neotree filesystem dir=.` | Reset the root to Neovim's working directory |
| `:Neotree filesystem dir=..` | Set the root to the parent directory |

## Key Notation

| Notation | Your key |
| --- | --- |
| `<Leader>` | Space |
| `<LocalLeader>` | Backslash (`\\`) |
| `<BS>` | Backspace |
| `<Enter>` | Enter or Return |

The leader key starts custom keyboard shortcuts. For example, `<Leader>e`
means press Space and then `e`, not both keys at the same time.

## Tree Operations

| Key | Action |
| --- | --- |
| `z` | Collapse all directories |
| `H` | Show or hide hidden files |
| `R` | Refresh the tree |
| `a` | Add a file |
| `A` | Add a directory |
| `r` | Rename the selected node |
| `d` | Delete the selected node |
| `y` | Copy the selected node |
| `x` | Cut the selected node |
| `p` | Paste a copied or cut node |
| `?` | Show Neo-tree help |

## Current File Tracking

Neo-tree is configured to select the current buffer's file automatically:

```lua
filesystem = {
  follow_current_file = {
    enabled = true,
  },
}
```

Use `:Neotree reveal` to reveal the current file manually.
