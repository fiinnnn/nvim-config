# nvim-config

This repo contains my neovim config written in [Fennel](https://fennel-lang.org/)
using [Tangerine](https://github.com/udayvir-singh/tangerine.nvim) and
[Hibiscus](https://github.com/udayvir-singh/hibiscus.nvim).

Based on [Nyoom.nvim](https://github.com/shaunsingh/nyoom.nvim).

BLazINg FAsT (~40ms startup time)

## Why
I wanted to be able to say I configured my editor with Fennel, Tangerine and
Hibiscus just to confuse people.

That's seriously the main reason I chose Fennel, getting a working editor is a
nice side effect I guess...

Also I've never used a lisp before so I wanted to see why people like them so
much and honestly I have to say, I'm not disappointed.

## How
I don't know ask someone who actually knows Fennel.

Now here's my rough idea of how this works:

All the acual configuration is in the `fnl/` dir, Hibiscus then compiles
these files to lua which end up in the `lua/` dir.
Neovim then loads those files *I think*.

Look... in case it's not clear by now.

**I have no idea what I'm doing.**

Don't actually use this and expect a working editor.

The file structure is roughly like this:
- `core/`
    - `init.fnl` loads all core files
    - `colors.fnl` colorscheme
    - `keymaps.fnl` keymap config
    - `optimize-builtins.fnl` no idea but it looked useful
    - `options.fnl` nvim options (not plugins)
- `pack/`
    - `init.fnl` packer setup, list of packages to install
    - `<plugin_name>.fnl` individual plugin config

## Install

1. Don't
2. Put the contents of this repo in `~/.config/nvim`
3. Start neovim, you should see messages that things are being installed
4. Neovim will throw a bunch of errors at you. This is fine, ignore them
5. Restart neovim and run `:PackerSync`
6. Everything should work now but restart nvim again just in case

If this doesn't work I most likely won't know how to help you but feel free
to try and we might learn something while trying to fix it.

## Editing
Hah... good luck

If you want to see if things work you can use `:FnlPeak` to see a preview of
the compiled lua code.

To apply the new configuration just restart nvim, Tangerine is set up to
recompile on init.
You can also recompile using `:FnlCompile`.

If you added or removed plugins you'll need to run `:PackerSync` after
restarting.

When in doubt, just restart over and over until the compilation messages go away,
that usually seems to work.
