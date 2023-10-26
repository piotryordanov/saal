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
