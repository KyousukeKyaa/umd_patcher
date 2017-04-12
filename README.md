# UMD Patcher (v0.1b)

This program is released under GPLv3 license, check the [LICENSE](https://github.com/KyousukeKyaa/umd_patcher/blob/master/LICENSE) file for details.

![screenshot.png](https://i.imgur.com/uXz1YRK.png)

UMD Patcher (v0.1b) is a CLI-based program made to patch ISO-formatted UMD rips.
The idea started when I tried to create a patch for SAO Infinity Moment to convert the game files to the fan-translated version *(by exorcizamus)* and around the same time I found an active [translation project](https://gbatemp.net/threads/sword-art-online-infinity-moment-psp.342727/) so I decited to contribute. The CLI program is hardcoded with all values needed to patch this game, you only need the dependencies, which I've uploaded here for now:

### -> **[Download](https://www.sendspace.com/file/lrlfkq)**

What it does:
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

As momentary solution for last steps:
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
Remember to remove the old INSTALL.DAT from PPSSPP memstick directory before starting the game:
```
...\ppsspp\memstick\PSP\SAVEDATA\NPJH50701INSTALL\INSTALL.DAT
```
You have to install it again from SAO Infinity Moment's main menu.

# **TODO**
**Tools** - This repository has no 3rd party tools attached but it still requires dependencies to run, some are open source and free and others are freeware, these need to be replaced with a working alternative, for example UMDGen.exe is a discontinued project, but I haven't found any alternatives. If you know any tool that could be used, you can open an issue or contact me on the gbatemp forum here: [my account](https://gbatemp.net/members/nasiin.419446/).
Other than that, all is left is to find the necessary license file of the respective tools and add them to future archives.

**Patcher** - The patcher is a CLI program, there's no GUI for now, it doesn't really need one but I plan to make something like an old-school loader in the future, midi song included.

**For Translators** - I'm working on a separate program to make it easier for translators to generate xdelta patches that will be used with UMD Patcher in the future. I plan to merge this other program together with UMD Patcher when everything is ready.

**Beta Testing** - The program needs thorough testing on different versions of Windows, I've tested on Windows 7 64-bit and can confirm it works at least on this.

**GNU/Linux Ports** - Most of the dependencies already have versions that run on GNU/Linux, tools like UMDGen can be used with Wine too. Mainly only the batch file needs to be ported. At this moment I've no GNU/Linux installations, any contribution would help a lot.

# **Dependencies**

*du.exe* [(v1.6)](https://technet.microsoft.com/en-us/sysinternals/du.aspx) - MD5: 7c06b3789a4712a475c7cfccaa50ad1a

*tar.exe* [(v1.21.07)](http://geoffair.net/unix/tar-01.htm) - MD5: 46b3c995a373bf2a17d0adc66bdeeee3

*xdelta.exe* [(v3.0u)](http://www.romhacking.net/reviews/1345/) - MD5: 6498032fde8bc1fa275ddfc639bd2957

*quickbms.exe* [(v0.8.0)](http://aluigi.altervista.org/quickbms.htm) - MD5: 12769aafff3df2442e5c383c3e2c6912

*pgdecrypt.exe* [(no ver)](https://gbatemp.net/threads/pgd-encrypter.432029/) - MD5: 27897c5e451bd384770fd713eb070b73

*7-zip.exe* [(v9.22)](https://sourceforge.net/projects/sevenzip/files/7-Zip/9.22/) - MD5: a1efcedc97c76b356f7ffa7cf909d733

*cpkmakec.exe* [(v1.36.00)](https://duckduckgo.com/html/?q=cpkmakec.exe%201.36.00) - MD5: b06a7eb5fee15170da156c162bc805ae

*UMDGen.exe* [(v4.00)](http://www.romhacking.net/utilities/1218/) - MD5: 6d86553f6bd7cf0940695bd2891baad1

*.xdelta patch file* (you can [make it](https://gbatemp.net/threads/sword-art-online-infinity-moment-psp.342727/page-86#post-7232590) on your own if you're a translator, or use the test patch already included at the download link in the beginning of this article).

**Note** - Some of the programs listed above have newer versions but I haven't tested them. These versions are confirmed working.
