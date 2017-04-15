# UMD Patcher (v0.2b)

This program is released under GPLv3 license, check the [LICENSE](https://github.com/KyousukeKyaa/umd_patcher/blob/master/LICENSE) file for details.

![screenshot.png](https://i.imgur.com/2EUwnDf.png)

UMD Patcher (v0.2b) is a CLI-based program made to patch ISO-formatted UMD rips.
The idea started when I tried to create a patch for SAO Infinity Moment to convert the game files to the fan-translated version *(by exorcizamus)* and around the same time I found an active [translation project](https://gbatemp.net/threads/sword-art-online-infinity-moment-psp.342727/) so I decided to contribute. The CLI program is hardcoded with all values needed to patch this game, you only need the dependencies, which I've uploaded here for now:

### -> **[Download](https://www.sendspace.com/file/iia4z7)**

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
- [x] extract "EBOOT.BIN" from "SAO.iso" with "7-zip.exe"
- [x] decrypt "EBOOT.BIN" and create "EBOOT.BIN.dec" with "deceboot.exe"
- [x] patch "EBOOT.BIN.dec" to psp-compatible "EBOOT.BIN" using "xdelta.exe"
- [x] make backup of "SAO.iso" to "Backup" folder
- [x] autoreplace "INSTALL.DAT" and "EBOOT.BIN" in "SAO.iso" using "WQSG_UMD.exe" or give the choice replace the files manually with "UMDGen.exe" (recommended)

How to manually replace the files with UMDGen:
First run the patch and select Manual, then when everything is completed open your Japanese ISO in UMDGen.exe and go to:
```
--->PSP_GAME
------>INSDIR
```

Drag and drop INSTALL.DAT here (click Yes when asked to replace). Then, always in UMDGen.exe go to:
```
--->PSP_GAME
------>SYSDIR
```

Drag and drop EBOOT.BIN here (click Yes again when asked to replace). After that, open the File menu (top-left in UMDGen):
```
--->File
------>Save As
--------->Uncompressed (*iso)
```

Select the destination folder and click Save, wait for UMDGen to finish the process. That's all, the ISO is ready to be used.

**Q**: Why is the manual replacement recommended?
**A**: because the autoreplace with "WQSG_UMD.exe" causes the ISO to expand in size, thus the final result is a 2GB and more ISO file. If you don't care about occupied space, then you can use the autoreplace if you want.

Either ways, congrats! You now have an English (BETA) version of SAO Infinity Moment. Stay tuned because there will be updates later.

**Notes for PPSSPP users:**
Before using the new patched ISO, there are a few things you should do to in order to be able to continue playing from where you left in the Japanese version without losing any progress.
- First, run the Japanese version as usual and load your most recent save state;
- Walk Kirito to a save point (changing areas = auto save, e.g. just enter the town);
- Don't move and quit PPSSPP (any progress you do from here will be lost);
- Delete the old INSTALL.DAT from "...\ppsspp\memstick\PSP\SAVEDATA\NPJH50701INSTALL\INSTALL.DAT"
- Make a backup of "...\ppsspp\memstick\PSP" just in case you messed something up and need to restore your save states later;
- Now run the patched (English) ISO that you just made and select "DATA INSTALL" in SAO main menu (it will freeze for a minute or two, the time needed to extract INSTALL.DAT from the ISO to the PPSSPP memstick)
- Go to the main menu again and click "CONTINUE"
- Enjoy.

I recommend to not use your old save states, because they can crash the game (it happened to me). The pre-patch save states will still be in Japanese, at least all the game content of the areas you have explored will still be in Japanese because that's how PPSSPP cached them. Your future save states will obviously be all in English (as far as the patch goes with the translation), if you resumed playing as I explained above and if you didn't load from pre-patch save state.

# **TODO**
**Tools** - This repository has no 3rd party tools attached but it still requires dependencies to run, some are open source and free and others are freeware, these need to be replaced with a working alternative, for example UMDGen.exe is a discontinued project, but I haven't found any alternatives. If you know any tool that could be used, you can open an [issue](https://github.com/KyousukeKyaa/umd_patcher/issues) or contact me on the gbatemp forum here: [my account](https://gbatemp.net/members/nasiin.419446/).
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

*deceboot.exe* [(v0.3)](http://www.romhacking.net/utilities/1225/) - MD5: f65c95bf646562df7225bf344ebaabe2

*WQSG_UMD.exe* [(r53)](https://github.com/KyousukeKyaa/WQSG_UMD_kkMod/tree/master/Debug) - MD5: 8eab066b3e29129ddaea1aa41955aca4

*.xdelta patch file* (you can [make it](https://gbatemp.net/threads/sword-art-online-infinity-moment-psp.342727/page-86#post-7232590) on your own if you're a translator, or use the test patch already included at the download link in the beginning of this article).

**Note** - Some of the programs listed above have newer versions but I haven't tested them. These versions are confirmed working (except WQSG_UMD.exe which is buggy and doesn't run well on Win10).
