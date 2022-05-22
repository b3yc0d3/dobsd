<h1>
<img alt="Discord on BSD Logo" height="80px" src="graphics/dobsd_logo-text_white.svg#gh-dark-mode-only">
<img alt="Discord on BSD Logo" height="80px" src="graphics/dobsd_logo-text_black.svg#gh-light-mode-only">
</h1>

<!-- # Discord on BSD -->
Since the Discord Developers seems to not care, let's try it our self's.<br>
Inspired by the articel [FreeBSD Support for Discord App](https://support.discord.com/hc/en-us/community/posts/360068878251-FreeBSD-Support-for-Discord-App) in the Discord Support Forum.

## Status
Currently DoBSD is *not* working at all,<br>
we have *some* buggs.

## Test Rsults
| Distrubution | Version | Rsult | Bugs |
|--------------|---------|-------|------|
| FreeBSD | 13.1-RELEASE | Failed | Error in some file `typeerror: cannot read 'on' of undefined` |

## Directorys
```yaml
../
├─ build/          # Build process will be done in here.
├─ desktops/       # Containing '.desktop' files.
├─ graphics/       # Graphics like the DoBSD logo.
├─ modules/        # Files that needed to be Injected in to Discord so it runs on BSDs.
├─ butcher.sh      # Installer script that does everything that is necessary
```

## How to
To be able to modify your discord, you need following tools:
- node & npm
- asar (is a npm package: `npm i asar`)
- tar
- electron (needed from the ports)
- your favorite editor

### Use the Installer Script
**TODO: add how to > use the installer script**
<!--After you have installed all the necessary tools,<br>
you can the execute `butcher.sh`, follow the instructions and done.<bR>
*( you may need to run `chmod +x butcher.sh` befor )*-->

### Do it by your self
**TODO: add how to > do it your self**

<br>

---
### **This project is *not* affiliated with Discord in any way**