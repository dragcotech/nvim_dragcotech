# Install
-   Neovim
-   Windows -> clang
-   Markdown -> :call mkdp#util#install()
-   Prettier -> npm install -g prettier , prettier --version

# Command
- :MarkdownPreview
- :ToggleTerm 1 size=60 direction=vertical
- :lua vim.diagnostic.setloclist() #check all diagnostic in project

# Keyboard Shortcuts

## Clipboard
| Keyboard    | Description |
| ----------- | ----------- |
| space + y   | copy        |
| space + p   | paste       |

## Split
| Keyboard    | Description |
| ----------- | ----------- |
| space + sh  | horizontal  |
| space + sv  | vertical    |

## Bufferline
| Keyboard    | Description |
| ----------- | ----------- |
| tab         | next        |
| shift + tab | previous    |
| space + bd  | close ht    |
| space + bc  | pick close  |
| space + bb  | pick choose |

## Tree
| Keyboard    | Description |
| ----------- | ----------- |
| space + e   | open        |
| q           | close       |
| a           | new file    |

## Telescope
| Keyboard    | Description |
| ----------- | ----------- |
| space + ff  | open        |

## Terminal
| Keyboard    | Description |
| ----------- | ----------- |
| ctrl + t    | toggle      |

## LSP
| Keyboard    | Description |
| ----------- | ----------- |
| space + ca    | show choose     |
| \ca or ,ca    | show choose     |
