# Configurations (Neo)VIM

Linux:
```bash
ln -s ./init.vim <nvim-dir>/init.vim
ln -s ./lua <nvim-dir>/lua
```

nvim-dir = `~/.config/nvim`

---

Windows Powershell: 
```powershell
New-Item -ItemType SymbolicLink -Path "<nvim-dir>\init.vim" -Target "<my-dir>\init.vim"
New-Item -ItemType SymbolicLink -Path "<nvim-dir>\lua" -Target "<my-dir>\lua"
```

my-dir = doit être un chemin complet
nvim-dir = `C:\Users\<user>\AppData\Local\nvim`
