# Testing development of a Brew install of RipRod's DeskThing for MacOS (Intel/Apple Silicon)

Currently utilizing the dev branch located here [TestThing](https://github.com/ItsRiprod/TestThing)

# How to Run

Copy the following lines into Terminal
```
brew reinstall Space-Naught/DeskThing/testthingmac
rm -rf /Applications/DeskThing.app
mv /opt/homebrew/opt/testthingmac/DeskThing.app /Applications
open /Applications/DeskThing.app
```

If all else fails, try this first,

```
brew reinstall --build-from-source --force-bottle --debug --verbose Space-Naught/DeskThing/testthingmac
```
If that still fails, just download it from [DeskThing.app](https://deskthing.app)
