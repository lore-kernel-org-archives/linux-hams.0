From: Miroslav Skoric <skoric@eunet.rs>
Subject: compile errors with ax25-apps-0.0.8-rc2.patched_f6bvp
Date: Thu, 16 Feb 2012 23:15:43 +0100
Message-ID: <4F3D800F.9090104@eunet.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all,

According to the instructions from FPAC MINI HOWTO, I compiled=20
libax25-0.0.12-rc2.patched_f6bvp and ax25-tools-0.0.10-rc2.patched_f6bv=
p=20
in Debian 6.0.4 and got the following errors with the apps:

root@localhost:/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp# m=
ake
make  all-recursive
make[1]: Entering directory=20
`/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp'
Making all in ax25ipd
make[2]: Entering directory=20
`/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/ax25ipd'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory=20
`/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/ax25ipd'
Making all in ax25rtd
make[2]: Entering directory=20
`/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/ax25rtd'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory=20
`/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/ax25rtd'
Making all in call
make[2]: Entering directory=20
`/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/call'
gcc -DHAVE_CONFIG_H -I. -I..     -g -O2 -Wall -pthread -MT call.o -MD=20
-MP -MF .deps/call.Tpo -c -o call.o call.c
call.c:38:20: error: curses.h: No such file or directory
In file included from call.c:55:
menu.h:15: error: expected specifier-qualifier-list before =91WINDOW=92
menu.h:22: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 or =91=
__attribute__=92=20
before =91*=92 token
menu.h:24: error: expected =91)=92 before =91*=92 token
menu.h:26: error: expected =91)=92 before =91*=92 token
call.c:98: error: expected specifier-qualifier-list before =91WINDOW=92
call.c:116: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 or =91=
__attribute__=92=20
before =91*=92 token
call.c: In function =91statline=92:
call.c:405: warning: implicit declaration of function =91move=92
call.c:406: warning: implicit declaration of function =91attron=92
call.c:406: error: =91A_REVERSE=92 undeclared (first use in this functi=
on)
call.c:406: error: (Each undeclared identifier is reported only once
call.c:406: error: for each function it appears in.)
call.c:408: warning: implicit declaration of function =91addch=92
call.c:410: warning: implicit declaration of function =91attroff=92
call.c:411: warning: implicit declaration of function =91refresh=92
call.c:426: warning: implicit declaration of function =91addstr=92
call.c: At top level:
call.c:438: error: expected =91=3D=92, =91,=92, =91;=92, =91asm=92 or =91=
__attribute__=92=20
before =91*=92 token
call.c:456: error: expected =91)=92 before =91*=92 token
call.c:471: error: expected =91)=92 before =91*=92 token
call.c:519: error: expected declaration specifiers or =91...=92 before =
=91WINDOW=92
call.c: In function =91start_ab_download=92:
call.c:583: error: =91swin=92 undeclared (first use in this function)
call.c:584: warning: implicit declaration of function =91opnstatw=92
call.c:587: warning: implicit declaration of function =91wrdstatw=92
call.c:635: warning: implicit declaration of function =91dupdstatw=92
call.c: At top level:
call.c:673: error: expected declaration specifiers or =91...=92 before =
=91WINDOW=92
call.c: In function =91ab_down=92:
call.c:685: warning: implicit declaration of function =91delwin=92
call.c:685: error: =91swin=92 undeclared (first use in this function)
call.c: In function =91start_screen=92:
call.c:757: error: =91win=92 undeclared (first use in this function)
call.c:757: warning: implicit declaration of function =91initscr=92
call.c:760: error: =91A_REVERSE=92 undeclared (first use in this functi=
on)
call.c:763: error: =91ACS_VLINE=92 undeclared (first use in this functi=
on)
call.c:770: warning: implicit declaration of function =91noecho=92
call.c:771: warning: implicit declaration of function =91raw=92
call.c:772: warning: implicit declaration of function =91nodelay=92
call.c:773: warning: implicit declaration of function =91keypad=92
call.c: In function =91start_slave_mode=92:
call.c:781: error: =91t_win=92 has no member named =91max_y=92
call.c:781: error: =91LINES=92 undeclared (first use in this function)
call.c:782: error: =91t_win=92 has no member named =91max_x=92
call.c:782: error: =91COLS=92 undeclared (first use in this function)
call.c:783: error: =91t_win=92 has no member named =91ptr=92
call.c:784: warning: implicit declaration of function =91winopen=92
call.c:784: error: =91t_win=92 has no member named =91max_y=92
call.c:784: error: =91t_win=92 has no member named =91max_x=92
call.c:785: error: =91t_win=92 has no member named =91ptr=92
call.c:785: error: =91t_win=92 has no member named =91ptr=92
call.c:787: warning: implicit declaration of function =91scrollok=92
call.c:787: error: =91t_win=92 has no member named =91ptr=92
call.c:789: warning: implicit declaration of function =91wclear=92
call.c:789: error: =91t_win=92 has no member named =91ptr=92
call.c:790: warning: implicit declaration of function =91wrefresh=92
call.c:790: error: =91t_win=92 has no member named =91ptr=92
call.c:792: error: =91t_win=92 has no member named =91bytes=92
call.c:793: error: =91t_win=92 has no member named =91curs_pos=92
call.c:794: error: =91t_win=92 has no member named =91bytes=92
call.c:795: error: =91t_win=92 has no member named =91curs_pos=92
call.c: In function =91start_talk_mode=92:
call.c:803: error: =91WINDOW=92 undeclared (first use in this function)
call.c:803: error: =91win=92 undeclared (first use in this function)
call.c:805: error: =91t_win=92 has no member named =91max_y=92
call.c:806: error: =91t_win=92 has no member named =91max_x=92
call.c:806: error: =91COLS=92 undeclared (first use in this function)
call.c:807: error: =91t_win=92 has no member named =91max_y=92
call.c:807: error: =91LINES=92 undeclared (first use in this function)
call.c:807: error: =91t_win=92 has no member named =91max_y=92
call.c:808: error: =91t_win=92 has no member named =91max_x=92
call.c:810: error: =91t_win=92 has no member named =91ptr=92
call.c:811: error: =91t_win=92 has no member named =91max_y=92
call.c:811: error: =91t_win=92 has no member named =91max_x=92
call.c:812: error: =91t_win=92 has no member named =91max_y=92
call.c:813: error: =91t_win=92 has no member named =91ptr=92
call.c:814: error: =91t_win=92 has no member named =91max_y=92
call.c:814: error: =91t_win=92 has no member named =91max_x=92
call.c:816: error: =91t_win=92 has no member named =91max_x=92
call.c:816: error: =91t_win=92 has no member named =91max_y=92
call.c:820: warning: implicit declaration of function =91waddch=92
call.c:823: error: =91t_win=92 has no member named =91ptr=92
call.c:824: error: =91t_win=92 has no member named =91ptr=92
call.c:826: error: =91t_win=92 has no member named =91ptr=92
call.c:827: error: =91t_win=92 has no member named =91ptr=92
call.c:828: error: =91t_win=92 has no member named =91ptr=92
call.c:829: error: =91t_win=92 has no member named =91ptr=92
call.c:831: error: =91t_win=92 has no member named =91bytes=92
call.c:832: error: =91t_win=92 has no member named =91curs_pos=92
call.c:833: error: =91t_win=92 has no member named =91bytes=92
call.c:834: error: =91t_win=92 has no member named =91curs_pos=92
call.c: In function =91change_mode=92:
call.c:856: error: =91t_win=92 has no member named =91ptr=92
call.c:857: error: =91t_win=92 has no member named =91ptr=92
call.c:858: error: =91t_win=92 has no member named =91ptr=92
call.c:859: error: =91t_win=92 has no member named =91ptr=92
call.c:860: error: =91wint=92 has no member named =91next=92
call.c:861: warning: implicit declaration of function =91endwin=92
call.c:864: error: =91t_win=92 has no member named =91ptr=92
call.c:865: error: =91t_win=92 has no member named =91ptr=92
call.c:866: error: =91wint=92 has no member named =91next=92
call.c:873: error: =91t_win=92 has no member named =91ptr=92
call.c:874: error: =91t_win=92 has no member named =91ptr=92
call.c:875: error: =91wint=92 has no member named =91next=92
call.c:879: error: =91t_win=92 has no member named =91ptr=92
call.c:880: error: =91wint=92 has no member named =91next=92
call.c: In function =91writeincom=92:
call.c:901: error: =91t_win=92 has no member named =91ptr=92
call.c:901: error: =91ACS_ULCORNER=92 undeclared (first use in this fun=
ction)
call.c:905: error: =91t_win=92 has no member named =91ptr=92
call.c:905: error: =91ACS_URCORNER=92 undeclared (first use in this fun=
ction)
call.c:909: error: =91t_win=92 has no member named =91ptr=92
call.c:909: error: =91ACS_LLCORNER=92 undeclared (first use in this fun=
ction)
call.c:913: error: =91t_win=92 has no member named =91ptr=92
call.c:913: error: =91ACS_LRCORNER=92 undeclared (first use in this fun=
ction)
call.c:917: error: =91t_win=92 has no member named =91ptr=92
call.c:917: error: =91ACS_LTEE=92 undeclared (first use in this functio=
n)
call.c:921: error: =91t_win=92 has no member named =91ptr=92
call.c:921: error: =91ACS_RTEE=92 undeclared (first use in this functio=
n)
call.c:925: error: =91t_win=92 has no member named =91ptr=92
call.c:925: error: =91ACS_TTEE=92 undeclared (first use in this functio=
n)
call.c:929: error: =91t_win=92 has no member named =91ptr=92
call.c:929: error: =91ACS_BTEE=92 undeclared (first use in this functio=
n)
call.c:933: error: =91t_win=92 has no member named =91ptr=92
call.c:933: error: =91ACS_HLINE=92 undeclared (first use in this functi=
on)
call.c:937: error: =91t_win=92 has no member named =91ptr=92
call.c:937: error: =91ACS_VLINE=92 undeclared (first use in this functi=
on)
call.c:940: error: =91t_win=92 has no member named =91ptr=92
call.c:943: error: =91t_win=92 has no member named =91ptr=92
call.c:946: error: =91t_win=92 has no member named =91ptr=92
call.c:949: error: =91t_win=92 has no member named =91ptr=92
call.c:952: error: =91t_win=92 has no member named =91ptr=92
call.c:955: error: =91t_win=92 has no member named =91ptr=92
call.c:958: error: =91t_win=92 has no member named =91ptr=92
call.c:963: error: =91t_win=92 has no member named =91ptr=92
call.c:965: error: =91t_win=92 has no member named =91ptr=92
call.c:971: error: =91t_win=92 has no member named =91ptr=92
call.c: In function =91getstring=92:
call.c:982: error: =91WINDOW=92 undeclared (first use in this function)
call.c:982: error: =91win=92 undeclared (first use in this function)
call.c:982: error: =91COLS=92 undeclared (first use in this function)
call.c:984: warning: implicit declaration of function =91wmove=92
call.c:985: warning: implicit declaration of function =91waddstr=92
call.c:989: warning: implicit declaration of function =91getch=92
call.c:990: error: =91ERR=92 undeclared (first use in this function)
call.c:992: error: =91KEY_BACKSPACE=92 undeclared (first use in this fu=
nction)
call.c:995: warning: implicit declaration of function =91getyx=92
call.c:1006: error: =91KEY_ENTER=92 undeclared (first use in this funct=
ion)
call.c: In function =91readoutg=92:
call.c:1038: error: =91ERR=92 undeclared (first use in this function)
call.c:1106: error: =91t_win=92 has no member named =91ptr=92
call.c:1110: error: =91KEY_BACKSPACE=92 undeclared (first use in this f=
unction)
call.c:1113: error: =91t_win=92 has no member named =91ptr=92
call.c:1114: error: =91t_win=92 has no member named =91bytes=92
call.c:1115: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1115: error: =91t_win=92 has no member named =91bytes=92
call.c:1116: warning: implicit declaration of function =91mvwaddnstr=92
call.c:1116: error: =91t_win=92 has no member named =91ptr=92
call.c:1119: error: =91t_win=92 has no member named =91string=92
call.c:1120: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1121: error: =91t_win=92 has no member named =91bytes=92
call.c:1122: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1123: error: =91t_win=92 has no member named =91ptr=92
call.c:1125: error: =91t_win=92 has no member named =91string=92
call.c:1125: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1127: error: =91t_win=92 has no member named =91string=92
call.c:1128: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1129: error: =91t_win=92 has no member named =91bytes=92
call.c:1130: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1132: warning: implicit declaration of function =91mvwaddch=92
call.c:1132: error: =91t_win=92 has no member named =91ptr=92
call.c:1135: error: =91t_win=92 has no member named =91ptr=92
call.c:1136: error: =91t_win=92 has no member named =91bytes=92
call.c:1137: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1141: error: =91KEY_LEFT=92 undeclared (first use in this functi=
on)
call.c:1142: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1143: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1144: error: =91t_win=92 has no member named =91ptr=92
call.c:1145: error: =91t_win=92 has no member named =91ptr=92
call.c:1148: error: =91KEY_RIGHT=92 undeclared (first use in this funct=
ion)
call.c:1149: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1149: error: =91t_win=92 has no member named =91bytes=92
call.c:1150: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1151: error: =91t_win=92 has no member named =91ptr=92
call.c:1152: error: =91t_win=92 has no member named =91ptr=92
call.c:1155: error: =91KEY_ENTER=92 undeclared (first use in this funct=
ion)
call.c:1159: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1159: error: =91t_win=92 has no member named =91bytes=92
call.c:1160: error: =91t_win=92 has no member named =91ptr=92
call.c:1161: error: =91t_win=92 has no member named =91ptr=92
call.c:1162: error: =91t_win=92 has no member named =91bytes=92
call.c:1163: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1165: error: =91t_win=92 has no member named =91ptr=92
call.c:1166: error: =91t_win=92 has no member named =91string=92
call.c:1166: error: =91t_win=92 has no member named =91bytes=92
call.c:1167: error: =91t_win=92 has no member named =91ptr=92
call.c:1168: error: =91t_win=92 has no member named =91string=92
call.c:1168: error: =91t_win=92 has no member named =91bytes=92
call.c:1169: error: =91t_win=92 has no member named =91ptr=92
call.c:1170: error: =91t_win=92 has no member named =91bytes=92
call.c:1171: error: =91t_win=92 has no member named =91bytes=92
call.c:1172: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1178: error: =91t_win=92 has no member named =91ptr=92
call.c:1179: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1179: error: =91t_win=92 has no member named =91bytes=92
call.c:1180: error: =91t_win=92 has no member named =91ptr=92
call.c:1181: warning: implicit declaration of function =91waddnstr=92
call.c:1181: error: =91t_win=92 has no member named =91ptr=92
call.c:1182: error: =91t_win=92 has no member named =91string=92
call.c:1183: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1184: error: =91t_win=92 has no member named =91bytes=92
call.c:1185: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1187: error: =91t_win=92 has no member named =91string=92
call.c:1187: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1188: error: =91t_win=92 has no member named =91string=92
call.c:1189: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1190: error: =91t_win=92 has no member named =91bytes=92
call.c:1191: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1192: error: =91t_win=92 has no member named =91string=92
call.c:1192: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1194: error: =91t_win=92 has no member named =91ptr=92
call.c:1196: error: =91t_win=92 has no member named =91string=92
call.c:1196: error: =91t_win=92 has no member named =91bytes=92
call.c:1198: error: =91t_win=92 has no member named =91bytes=92
call.c:1199: error: =91t_win=92 has no member named =91curs_pos=92
call.c:1202: error: =91t_win=92 has no member named =91ptr=92
call.c: At top level:
call.c:1365: error: expected declaration specifiers or =91...=92 before=
 =91WINDOW=92
call.c: In function =91sevenplname=92:
call.c:1423: error: =91swin=92 undeclared (first use in this function)
call.c: In function =91statbits=92:
call.c:1461: error: =91A_REVERSE=92 undeclared (first use in this funct=
ion)
call.c: In function =91cmd_call=92:
call.c:1535: error: =91WINDOW=92 undeclared (first use in this function=
)
call.c:1535: error: =91swin=92 undeclared (first use in this function)
call.c:1547: error: =91wint=92 has no member named =91next=92
call.c:1616: warning: passing argument 3 of =91ab_down=92 from incompat=
ible=20
pointer type
call.c:673: note: expected =91char *=92 but argument is of type =91stru=
ct wint *=92
call.c:1616: warning: passing argument 4 of =91ab_down=92 from incompat=
ible=20
pointer type
call.c:673: note: expected =91int *=92 but argument is of type =91char =
*=92
call.c:1616: warning: passing argument 5 of =91ab_down=92 from incompat=
ible=20
pointer type
call.c:673: note: expected =91struct t_gp *=92 but argument is of type =
=91int *=92
call.c:1616: error: too many arguments to function =91ab_down=92
call.c:1686: warning: passing argument 3 of =91start_ab_download=92 fro=
m=20
incompatible pointer type
call.c:519: note: expected =91char *=92 but argument is of type =91stru=
ct wint *=92
call.c:1686: warning: passing argument 4 of =91start_ab_download=92 mak=
es=20
integer from pointer without a cast
call.c:519: note: expected =91int=92 but argument is of type =91char *=92
call.c:1686: warning: passing argument 5 of =91start_ab_download=92 mak=
es=20
pointer from integer without a cast
call.c:519: note: expected =91char *=92 but argument is of type =91int=92
call.c:1686: warning: passing argument 6 of =91start_ab_download=92 mak=
es=20
integer from pointer without a cast
call.c:519: note: expected =91int=92 but argument is of type =91char *=92
call.c:1686: warning: passing argument 7 of =91start_ab_download=92 mak=
es=20
pointer from integer without a cast
call.c:519: note: expected =91struct t_gp *=92 but argument is of type =
=91int=92
call.c:1686: warning: passing argument 8 of =91start_ab_download=92 fro=
m=20
incompatible pointer type
call.c:519: note: expected =91char **=92 but argument is of type =91str=
uct t_gp *=92
call.c:1686: error: too many arguments to function =91start_ab_download=
=92
call.c:1702: warning: passing argument 3 of =91sevenplname=92 from=20
incompatible pointer type
call.c:1365: note: expected =91int *=92 but argument is of type =91stru=
ct wint *=92
call.c:1702: warning: passing argument 5 of =91sevenplname=92 from=20
incompatible pointer type
call.c:1365: note: expected =91char *=92 but argument is of type =91int=
 *=92
call.c:1702: warning: passing argument 6 of =91sevenplname=92 makes int=
eger=20
from pointer without a cast
call.c:1365: note: expected =91int=92 but argument is of type =91char *=
=92
call.c:1702: warning: passing argument 7 of =91sevenplname=92 makes poi=
nter=20
from integer without a cast
call.c:1365: note: expected =91char *=92 but argument is of type =91int=
=92
call.c:1702: warning: passing argument 8 of =91sevenplname=92 makes int=
eger=20
from pointer without a cast
call.c:1365: note: expected =91int=92 but argument is of type =91char *=
=92
call.c:1702: error: too many arguments to function =91sevenplname=92
call.c:1749: error: =91t_win=92 has no member named =91ptr=92
call.c:1750: error: =91t_win=92 has no member named =91ptr=92
call.c:1751: error: =91t_win=92 has no member named =91ptr=92
call.c:1752: error: =91t_win=92 has no member named =91ptr=92
make[2]: *** [call.o] Error 1
make[2]: Leaving directory=20
`/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/call'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory=20
`/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp'
make: *** [all] Error 2
root@localhost:/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp#


Any idea how to solve that?

Misko
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
