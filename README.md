# Installation
Make sure you have [wine]() installed
+ [Here](https://phoenixnap.com/kb/how-to-install-wine-on-ubuntu)'s a tutorial for ubuntu.
+ In Arch linux you can simply do `sudo pacman -S wine`

Then make sure to run the installation script. It will make sure that:
1. Python is installed inside wine
2. important packages such as MT5, pandas, numpy etc... are also installed


# Usage
Start by running the following:
```python
wine python main.py
```

It will do the following:
1. Connect to a demo account on AMP futures.
2. Fetch the latest data from ME

# Running
You might need to make sure to run wine once in the current directory for this to work.
```bash
wine ./mt5/terminal.exe
```

The key is to make sure that wine picks up this exe as it already is setup with what's needed (Like for example allowing EA trading)
