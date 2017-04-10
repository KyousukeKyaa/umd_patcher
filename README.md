# UMD Patcher (v0.1b)

This program is released under GPLv3 license, check the [LICENSE](https://github.com/KyousukeKyaa/umd_patcher/blob/master/LICENSE) file for details.

UMD Patcher (v0.1b) is a CLI-based program made to patch ISO-formatted UMD rips.
The idea started when I wanted to create a patch for SAO Infinity Moment to convert the game files to the fan-translated version, the CLI program is hardcoded with all values needed to patch this game, you only need the dependencies, which I've uploaded here for now:

### -> **[Download](https://www.sendspace.com/file/ez45rb)**

Project status:
- [x] extract "INSTALL.DAT" from "SAO.iso" with "7-zip.exe"
- [x] rename "INSTALL.DAT" to "data.bin"
- [x] decrypt "data.bin" with "pgdecrypt.exe"
- [x] rename "data.bin.decrypted" to "install-jp.dat"
- [x] unpack "install-jp.dat" with "quickbms.exe" to "install-jp" folder
- [x] put "install-jp" folder in reproductible archive named "install-jp.tar" using "tar.exe"
- [x] patch the archive to "install-en.tar" using "xdelta.exe"
- [x] extract "install-en.tar" archive with "7-zip.exe" to "install-en" folder
- [x] pack "install-en" folder to "INSTALL.cpk" using "cpkmakec.exe"
- [x] rename "INSTALL.cpk" to "INSTALL.DAT"
- [x] make backup of "SAO.iso" to "Backup" folder
- [ ] copy "INSTALL.DAT" in "SAO.iso" using "UMDGen.exe" or any working alternative
- [ ] finalize "SAO.iso" for usage on PSP

As temporary solution:
First run the patch, then when everything is completed open your Japanese ISO in UMDGen.exe and go to:
```
--->PSP_GAME
------>INSDIR
```

Drag and drop INSTALL.DAT here (click Yes when asked to replace), then open the File menu (top-left in UMDGen):
```
--->File
------>Save As
--------->Uncompressed (*iso)
```
Select the destination folder and click Save, then wait for UMDGen to finish the process.
Congrats, you now have an English (BETA) version of SAO Infinity Moment.
It works in emulator but probably not on PSP (EBOOT.BIN needs a fix). Stay tuned because there will be updates later.

# **TODO**
**Tools** - This repository has no 3rd party tools attached, many of the tools used in the program are open source and free, some are freeware, these need to be replaced with a working alternative, for example UMDGen.exe is a discontinued project, but I haven't found any alternatives. If you know any tool that could be used, you can open an issue or contact me on the gbatemp forum here: [my account](https://gbatemp.net/members/nasiin.419446/).
Other than that, all is left is to find the necessary license file of the respective tools and add them to future archives.

**Patcher** - The patcher is a CLI program, there's no GUI for now, it doesn't really need one but I plan to make something like an old-school loader in the future, midi song included.

**For Translators** - I'm working on a separate program to make it easier for translators to generate xdelta patches that will be used with UMD Patcher in the future. I plan to merge this other program together with UMD Patcher when everything is ready.
