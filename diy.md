# Do it your self
## 1. Tools
To be able to modify your discord, you need following tools:
- node & npm
- asar (is a npm package: `npm i asar`)
- tar
- electron13 (needed from the ports)
- your favorite editor

## 2. Discord
### 2.1 Copying binaries
The following files __must__ be replaced with files from `/usr/local/share/electron13`.
```yaml
├── chrome_100_percent.pak
├── chrome_200_percent.pak
├── Discord
├── icudtl.dat
├── libEGL.so
├── libffmpeg.so
├── libGLESv2.so
├── libvk_swiftshader.so
├── snapshot_blob.bin
├── swiftshader
│   ├── libEGL.so
│   └── libGLESv2.so
└── v8_context_snapshot.bin
```
( *Files that are not listed here, doesn't need to be replaced.* )

### 2.2 Modifying `app.asar`
The following paths are in the unpacked `app.asar`:
```yaml
├── app_bootstrap
│   ├── autoStart
│   │   └── freebsd.js       # is a copy of 'linux.js' (which is in the same directory)
│   ├── firstStart
│   │   └── freebsd.js       # is a copy of 'linux.js' (which is in the same directory)
│   ├── startupMenu
│   │   └── freebsd.js       # is a copy of 'linux.js' (which is in the same directory)
│   └── hostUpdater.js       # copy the 'linux' case, from the switch case at the bottom
│                            # of file.
├── common
│   └── moduleUpdater.js     # insert Code Block 1, in switch case above of
                             # function 'cleanDownloadedModules'
```
**Code Block 1**
```javascript
    case 'freebsd':
      setFeedURL(`${endpoint}/updates/${buildInfo.releaseChannel}?platform=linux&version=${buildInfo.version}`);
      remoteQuery.platform = 'freebsd';
      break;
```
## 3. Modifying `discord_desktop_core/core.asar`
**Work in progress**
<!--The following paths are in the unpacked `core.asar`:
```yaml
├── app
│   ├── applicationMenu
│   │   └── freebsd.js       # is a copy of 'linux.js' (which is in the same directory)
│   └── images
│       └── systemtray
│           └── freebsd      # is copy of folder 'linux' (which is in the same directory)
├── common
│   └── moduleUpdater.js     # insert Code Block 1, in switch case above of
                             # function 'cleanDownloadedModules'
```

**Code Block 1**
```javascript
    case 'freebsd':
      setFeedURL(`${endpoint}/updates/${buildInfo.releaseChannel}?platform=linux&version=${buildInfo.version}`);
      remoteQuery.platform = 'freebsd';
      break;
```-->
