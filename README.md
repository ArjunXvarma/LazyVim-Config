# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## ⌨️ Keymaps

Leader key: `<Space>`

### Core Vim / Neovim Motions

These are foundational Vim commands worth knowing on top of the custom mappings below.

**Navigation & Files**
| Key | Action |
|---|---|
| `nvim [filename]` | Open a file in Neovim |
| `:q` | Quit Neovim |
| `h` `j` `k` `l` | Move left / down / up / right |

**Search & Replace**
| Key | Action |
|---|---|
| `*` | Search for the word under the cursor |
| `n` / `N` | Next / previous search match |
| `ciw` | Change inner word (delete word, enter insert mode) |
| `.` | Repeat the last change |
| `:%s/find/replace/g` | Find and replace all matches in the file |
| `:%s/find/replace/gc` | Find and replace with confirmation per match |

**Visual Mode & Copy/Paste**
| Key | Action |
|---|---|
| `viw` | Visually select the current word |
| `y` | Yank (copy) selection |
| `p` | Paste after cursor |

**Registers**
| Key | Action |
|---|---|
| `:reg` | Show all registers and their contents |
| `"[n]p` | Paste from register `n` |
| `"[n]y` | Yank into register `n` |
| `"+` / `"*` | System clipboard registers |
| `"%` | Register holding the current filename |

**Macros**
| Key | Action |
|---|---|
| `q[register]` | Start recording a macro into `[register]` |
| `q` | Stop recording |
| `@[register]` | Play back a macro |
| `[n]@[register]` | Play back a macro `n` times |

---

### Custom Keymaps (`lua/config/keymaps.lua`)

**General**
| Key | Mode | Action |
|---|---|---|
| `<C-s>` | Normal / Insert | Save file |
| `<leader>q` | Normal | Quit all |
| `<Esc>` | Normal | Clear search highlight |
| `J` | Normal | Join lines, keep cursor position |
| `<C-d>` / `<C-u>` | Normal | Scroll down/up, keep cursor centered |
| `n` / `N` | Normal | Next/previous search match, keep centered |

**Window Navigation**
| Key | Mode | Action |
|---|---|---|
| `<C-Up>` / `<C-Down>` | Normal | Increase/decrease window height |
| `<C-Left>` / `<C-Right>` | Normal | Decrease/increase window width |

> Note: `<C-h/j/k/l>` window-focus movement is intentionally left to `vim-tmux-navigator` (commented out) so it works seamlessly across tmux panes.

**Splits**
| Key | Action |
|---|---|
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<leader>sc` | Close split |
| `<leader>se` | Equalize split sizes |
| `<leader>fv` | Find files (open in split with `Ctrl-v`) |

**Buffers**
| Key | Action |
|---|---|
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<leader>bd` | Delete buffer |

**Tabs**
| Key | Action |
|---|---|
| `<leader>tn` | New tab |
| `<leader>tc` | Close tab |
| `<Tab>` / `<S-Tab>` | Next / previous tab |
| `<leader>1`–`<leader>9` | Jump to tab 1–9 |
| `<leader>t,` / `<leader>t.` | Move tab left / right |

**Editing**
| Key | Mode | Action |
|---|---|---|
| `<A-j>` / `<A-k>` | Normal / Insert / Visual | Move line(s) down / up |
| `<` / `>` | Visual | Indent left / right (repeatable) |
| `<leader>p` | Visual (x) | Paste without overwriting the unnamed register |

**Clipboard**
| Key | Mode | Action |
|---|---|---|
| `<leader>y` | Normal / Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `<leader>d` | Normal / Visual | Delete without yanking |

**Diagnostics**
| Key | Action |
|---|---|
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>cd` | Show line diagnostics (floating window) |

**Quickfix**
| Key | Action |
|---|---|
| `<C-n>` | Next quickfix item (centered) |
| `<C-p>` | Previous quickfix item (centered) |

**Terminal**
| Key | Action |
|---|---|
| `<Esc><Esc>` | Exit terminal mode |

**File Explorer**
| Key | Action |
|---|---|
| `<leader>e` | Toggle Neo-tree (reveal current file) |

**Telescope**
| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fh` | Help tags |

**Git**
| Key | Action |
|---|---|
| `<leader>gg` | Open LazyGit |

**AI**
| Key | Action |
|---|---|
| `<leader>ac` | Open Copilot Chat |

**Utilities**
| Key | Action |
|---|---|
| `<leader>x` | Make current file executable (`chmod +x`) |
| `<leader>ob` | Open current file in default macOS app |

**Mouse**
| Behavior | Note |
|---|---|
| Horizontal scroll wheel | Inverted in Normal, Visual, and Insert modes |

---

### Default LazyVim Keymaps

This config layers on top of LazyVim's own defaults (leader-key menus, LSP mappings, formatting, etc.). See the full reference here: [LazyVim default keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua).
