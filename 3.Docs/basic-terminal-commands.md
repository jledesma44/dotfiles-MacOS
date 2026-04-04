# Basic Terminal commands

## Coping files and directories

### Coping files and directories from remote servers to local machine

The command to execute when copying a file or folder from a remote machine to the local machine is:

File:

scp jaimeledesma@geesmini-m4pro:/path/to/remote/file /path/to/local/directory

Directory:

scp -r jaimeledesma@geesmini-m4pro:/path/to/remote/directory /path/to/local/directory/

Same is true if you want to copy a file or folder from your local machine to a remote server/machine.

scp /path/to/local/file jaimeledesma@geesmini-m4pro:/path/to/remote/directory/

scp -r /path/to/local/directory/ jaimeledesma@geesmini-m4pro:/path/to/remote/directory/

## Text manipulation

### Adding words to Spell check - Commands

In Neovim, use
zg in Normal mode to add the word under the cursor to your personal spellfile, marking it as a "good" word. Other useful spelling keybinds include zw to mark a word as wrong/bad, zug to undo adding a word, and z= to see spelling suggestions.
Key Spell Check Commands

    zg: Add word under cursor as good.
    zG: Add word under cursor to internal word list (temporary).
    zw: Mark word under cursor as wrong (adds to spellfile).
    zW: Mark word under cursor as wrong (internal list).
    zug: Undo zg (remove word from spellfile).
    zuw: Undo zw (remove word from spellfile).
    z=: Suggest correct spellings for the word under the cursor.
    ]s: Move to the next misspelled word.

Setting up Spell Check
Ensure spell check is enabled by adding set spell to your init.vim or vim.opt.spell = true to your init.lua. To ensure words are saved properly, you may need to define a spellfile, for example:
set spellfile=~/.config/nvim/spell/en.utf-8.add
