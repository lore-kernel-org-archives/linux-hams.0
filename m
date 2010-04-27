From: Bernard Pidoux <bpidoux@free.fr>
Subject: Re: node software for Linux
Date: Tue, 27 Apr 2010 16:35:28 +0200
Message-ID: <4BD6F630.1070001@free.fr>
References: <4BD55F8F.3050608@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4BD55F8F.3050608@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi Jim,

I forgot to mention that in addition to what I illustrated before,
FPAC nodes can be locally linked to a Flexnet application node and
it can also connect NetRom nodes as illustrated below.

  
F6BVP-10 (Commands = ?) : c f6ggy-8
Trying (fpac wp) F6GGY-8 @ 2080,847501... Type <RETURN> to abort
*** Connected to F6GGY-8 @ 2080,847501 (Escape: ~. )
} /var/ax25/fpac/loggedin: No such file or directory
FPAC-Node v 3.27 (F6FBB - Mar  5 2006) for LINUX (help = h)

F6GGY-8 (Commands = ?) : ne

NetRom Nodes:
BVPN10:F6BVP-14 (90 )   BVPN8:F6BVP-12 (90 )   CIT03:K4GBB-14 (90 )
  CLW01:KD4YAL-5 (90 )   DJT14:KP4DJT-14(90 )   FEBBS:FE6BVP-1 (90 )
  HAS14:TI2HAS-14(90 )    INDY:VK2XB-14 (90 )   KEMPC:VK2TV-14 (90 )
NODP43:P43L-11  (90 )  VRANOD:VE5VRA-14(90 )   AKH14:W4AKH-14 (89 )
BBSBGH:W4BGH    (89 )  BBSJOA:N4JOA-1  (89 )  BBSMPF:VE1MPF   (89 )
BBSP43:P43L-2   (89 )  BBSPJ2:PJ2A-2   (89 )   BGH14:W4BGH-14 (89 )
BICOIS:VE2RXY-4 (89 )   BILMT:N7YHE-5  (89 )  BVPBBS:F6BVP-1  (89 )
  BVPDX:F6BVP-2  (89 )    CHAT:VE9MPF-2 (89 )  CHTMPF:VE9MPF-11(89 )
CIPBBS:GB7CIP   (89 )  CKNBBS:VE2RXY-1 (89 )  CRCHAT:GB7CIP-5 (89 )
CRNOD1:GB7CR-1  (89 )  CRNODE:GB7CR    (89 )  DABBBS:N4ZKF-4  (89 )
DABDXC:N4ZKF-2  (89 )  DABFLA:N4ZKF-5  (89 )    DXAR:N9PMO-6  (89 )
    DXC:VE9SC    (89 )    DXCC:N9PMO-4  (89 )   DXZKF:N4ZKF    (89 )
ELGBBS:AC4ZR-5  (89 )  FBBYAL:KD4YAL-4 (89 )  GASBBS:KD4GCA   (89 )
GBBBBS:K4GBB    (89 )  GVCITY:KG6BAJ-2 (89 )  JOABBS:N4JOA    (89 )
JOABPQ:N4JOA-3  (89 )  JOACHT:N4JOA-11 (89 )   MOBRA:KB0WSA-6 (89 )
MPFMTN:VE9MPF-7 (89 )   NCGAS:KD4GCA-5 (89 )  PJ2NOD:PJ2A-14  (89 )
PMOBBS:N9PMO-1  (89 )  PMOCHT:N9PMO-11 (89 )     RMS:VE9SC-10 (89 )
    RMS:N9PMO-10 (89 )  RMSP43:P43L-10  (89 )  RMSPJ2:PJ2BR-10 (89 )
RXYBBS:VE2RXY   (89 )  RXYCHT:VE2RXY-11(89 )  STHGAS:KD4GCA-4 (89 )
VRABBS:VE5VRA   (89 )   WIBBS:N9PMO    (89 )   WIRAC:N9PMO-2  (89 )
WSABBS:KB0WSA-4 (89 )  WSACHT:KB0WSA-3 (89 )  WSARMS:KB0WSA-5 (89 )
PAQNOD:TI0PAQ-2 (88 )  WETNOD:VK2WET-14(70 )  BBSGGY:F6GGY-1  (0  )
DXCGGY:F6GGY-3  (0  )  NODGGY:F6GGY    (0  )

F6GGY-8 (Commands = ?) : d
FlexNet Destinations:
7M3TJZ  7-7      7  9A0BBS  0-0     34  9A0DXC  0-0     34  9A0TCP  0-0     34
9A0TCP  3-3     34  9A0TCP  5-5      3  9A0TKN  0-0      6  9A0TSI  0-15     3
CX2SA   0-0     43  CX2SA   5-5     15  DA5UDI  0-0    277  DB0AX   0-15   271
DB0BI   0-15   245  DB0BM   0-8    384  DB0BOH  0-12  1225  DB0BON  0-12   940
DB0BQ   0-0    255  DB0BQ   1-15   271  DB0DSP  0-10   280  DB0DUS  0-15   226
DB0DUS  15-15  221  DB0DY   0-11   290  DB0EA   0-0    268  DB0EAM  0-3    363
DB0ERF  0-12     4  DB0ERF  13-15    3  DB0FBB  0-14   241  DB0GE   0-15   219
DB0GHH  0-12   401  DB0GVW  0-0    796  DB0HGW  0-0     95  DB0HGW  5-5      4
DB0HGW  6-6     40  DB0HGW  8-8     40  DB0HOL  0-11   408  DB0II   0-12   371
DB0II   13-13  381  DB0ILM  0-15   250  DB0IUZ  0-3    230  DB0IUZ  4-15   226
DB0KLL  0-10   227  DB0KOE  0-14   226  DB0LIP  0-0    472  DB0LJ   0-15   219
DB0LN   0-9    245  DB0LN   10-14  250  DB0MSC  0-2    226  DB0MSC  3-15   221
DB0MYK  0-15   220  DB0MZG  0-0    250  DB0NDK  0-15   226  DB0NOR  0-15   620
DB0NOS  0-13   250  DB0NOS  14-15  255  DB0OE   0-15   280  DB0OSN  0-0    221
DB0OVN  0-0    226  DB0OVN  5-5    374  DB0OVN  6-6    374  DB0OVN  7-7    374
DB0OVN  8-8    374  DB0OVN  10-10  374  DB0OVN  12-12  374  DB0OVN  13-13  374
DB0OVN  14-14  374  DB0PKE  0-12   953  DB0PKE  15-15 1148  DB0PRA  0-15   447
DB0RDX  0-15   245  DB0RES  0-9      2  DB0RES  10-10    1  DB0RHB  0-15   328
DB0RIE  0-15   221  DB0RPL  0-15   231  DB0RTV  0-10   241  DB0RWI  0-15   245
DB0SAB  0-7    196  DB0SDA  0-13  1009  DB0SHG  0-0   2405  DB0SHL  0-15   472
DB0SM   0-0    328  DB0SM   8-8    437  DB0SR   0-15   219  DB0THA  0-4    280
DB0UHC  0-15   489  DB0UT   0-0    220  DB0VFK  0-3    463  DB0VI   0-10   219
DB0VL   0-10   273  DB0WAL  0-6    241  DB0WAL  7-12   245  DB0WST  0-9    221
DB0WST  10-15  226  DB0WTS  0-15   307  DB0ZWI  4-15     4  DF1VW   1-1     29
DG3YHE  7-13  1283  DH4LAR  1-1      4  DK0SB   8-8    367  DK0WUE  0-14     2
DL3AMI  0-0    287  DL3AMI  10-10  287  DL3AMI  15-15  287  DO0YA   7-7     29
DO7VLR  4-15     3  EA7URC  5-5     31  EA7URC  8-8      3  ED7ZAB  5-5     31
F1DWO   7-7    470  F1DWO   8-8    506  F1FPP   0-0      2  F1FPP   1-1     26
F1FPP   3-3     26  F1FPP   5-5     26  F1ZNR   0-8      8  F1ZYS   0-8     55
F1ZZD   0-8     11  F1ZZD   9-15     9  F4DUR   3-3     50  F4DUR   7-7   1947
F4DUR   8-8     55  F5GI    0-7      9  F5GI    8-8     50  F5LBL   0-7      9
F5TQH   0-7     10  F6FGZ   2-2      2  F6GGY   1-1     20  F6GGY   2-2     20
F6GGY   3-3     20  F6GGY   8-8     20  F6GGY   10-10   20  F6IQF   5-5    956
F6IQF   7-7      6  F6IQF   8-8     44  F6KAT   0-0     29  F6KBK   0-0      4
F6KBK   1-1     34  F6KBK   3-3     30  F6KBK   7-7     30  F6KBK   8-8      3
F6KBS   0-8    367  F6KFT   0-15   230  F6KIF   8-9    498  F6KKR   0-0    227
F6KKR   1-1    285  F6KKR   2-2    890  F6KKR   5-5    166  F6KKR   8-8    239
F8KGK   1-1     23  F8KGK   3-3     23  F8KGK   9-9      1  F8KHI   3-3     55
F8KHI   8-11    20  HA5OB   0-0     35  HA5OB   5-5      4  HB9ON   8-8     31
HB9ON   9-9     31  HB9ON   10-10    3  HB9ON   14-14    4  HG0PLA  0-0      4
HG5OB   1-1      6  HG5PBD  0-9     73  HG5PBD  10-10  107  HG6PGA  0-0     60
HG8IT   0-0     37  HG8LXL  0-0     33  HG8PKU  0-0     26  HG8PRC  0-0     33
HG8PSV  0-0      4  HG8PSZ  0-0      4  HG8PSZ  4-4     37  HG8PSZ  5-5     37
HG8PXL  0-0      3  HG8PXL  5-5     33  HP2AT   3-9     10  HS0ZER  11-11    4
I0OJJ   3-3      5  I0OJJ   8-8     39  I3XTY   1-1     39  I3XTY   3-3      6
I3XTY   8-8     39  I4UKI   0-0     35  I4UKI   1-1     35  I4UKI   8-8     35
I5NOD   7-7     19  IGATE   0-15     4  IGATEB  0-15     4  IK1YPH  0-14   410
IK1ZNW  9-9     31  IK1ZNW  10-10   31  IK2DUW  6-6     44  IK2DUW  8-8     44
IK2QCA  12-15   23  IK2XDE  2-2     34  IK2XDE  6-6     34  IK2XDE  8-8     34
IK4ADE  0-14    67  IK5PWJ  6-6     31  IK6IHL  6-6     44  IK6IHL  8-8     44
IK6ZDE  3-3      4  IK6ZDE  6-6     39  IQ2LB   0-14     7  IQ3GO   3-3     19
IQ4BQ   11-11   31  IR1AR   0-15   462  IR1BA   0-15    26  IR1GE   0-15   139
IR1TO   0-0      3  IR1UAW  0-6      8  IR1UAW  7-12     6  IR1UBC  0-15   510
IR1UBF  8-8    164  IR1UDF  0-15    64  IR2BSV  0-0     44  IR2UBX  0-3      4
IR2UBX  4-6      4  IR2UBX  8-8     39  IR2UBX  10-10    3  IR2UBX  14-14    4
IR2UCN  0-15    83  IR2VLS  0-12    25  IR3LSV  2-2      6  IR3SDP  6-6     44
IR3TN   0-15   134  IR3VEN  3-3     41  IR4FA   0-0     35  IR4LAM  0-0     35
IR4MO   0-0     35  IR4SP   0-15     4  IR4VJ   0-0     35  IR4X    6-6     31
IR4X    12-12   31  IR4X    14-14    3  IR5PIT  0-0     31  IR5PIT  7-7      3
IR5PWJ  6-6     27  IR5UAP  0-0     31  IR5UN   7-7      3  IR5UU   0-0    113
IR6AD   0-0     44  IR6AQS  0-0     44  IR6UAG  0-0     35  IR6UAG  10-10   35
IR6UAH  0-0     44  IR7BAT  0-0     50  IR7BLT  0-14     7  IR7BTA  0-0     50
IR7BTT  0-0     50  IR7UT   0-0     50  IR7UX   0-0     50  IR8AVR  0-0     50
IW2JKS  0-12    20  IW2OHX  0-12    25  IW2OHX  13-13    6  IW5DAM  0-0     27
IW5DAM  7-7      2  IW6NDX  0-14     6  IW7BNO  1-1     50  IW7BNO  2-2     50
IZ3LSV  1-1     44  IZ3LSV  2-2      4  IZ3LSV  3-3     40  IZ3LSV  8-8     40
IZ3LSV  13-13   41  IZ5CCS  0-0      3  IZ5FSA  1-1     35  IZ5FSA  6-6     35
IZ7BOJ  0-14     7  JK1ZRW  7-8      6  K2CAN   2-2     21  K2CAN   3-3     45
K7EK    8-8      4  KB2FAF  4-4     37  KB2FAF  10-10   45  KB2FAF  12-12   45
KB2VZS  0-4      8  KB2VZS  12-12   11  KB2VZS  13-13   11  KC2HFQ  0-0    876
KD4YAL  1-1     37  KD4YAL  8-8     37  KD4YAL  14-14    4  LX0IST  0-10     3
LX0IST  14-14    2  LX0NET  0-10   278  LX0PAC  0-11   268  LX0PAR  0-10   388
LX0PRG  0-0    413  N1RCW   6-6      6  N1UAN   3-3      5  N1UAN   5-5     39
N1UAN   6-6     39  N1XTB   7-7      6  N2JWW   7-7      6  OE6XAD  0-15     2
OK0ND   0-10   806  OK0NHD  12-12 2851  OK0NP   0-0      5  OK2PEN  11-11    8
ON0AN   0-0     34  ON0AN   10-10    4  ON0AN   11-11    6  ON0ANR  10-10    6
ON0AR   0-0     39  ON0AR   7-7     39  ON0AR   10-10    3  ON0CK   0-0      8
ON0CK   8-8    799  ON0CPP  0-0     22  ON0DXK  0-0     31  ON0DXK  5-5     31
ON0DXK  8-8      3  ON4HU   4-4      4  ON4HU   8-8     39  OZ5BBS  0-7      6
P43L    2-2    575  P43L    3-3    575  P43L    10-10  511  P43L    12-12  110
PA0KDV  8-8   1191  PC5W    8-8     30  PE1MVX  3-3     49  PE1MVX  15-15    6
PE1NAT  0-0   1196  PE1NAT  10-10  806  PE1OEZ  10-10  807  PE1PBA  12-12  805
PI1CDR  0-0    802  PI1DAZ  10-10    2  PI1DXC  15-15    5  PI1FWD  10-10  806
PI1HGL  0-15    19  PI1RWD  0-0    786  PI4CC   0-0     34  PI4CC   7-7     34
PI4CC   10-10    4  PI4TUE  0-0      3  PI4TUE  1-1      2  PI5EHV  0-0     30
PI5EHV  8-8     30  PI8CDR  0-0   1087  PI8CDR  7-7   1087  PI8CDR  9-9   1087
PI8DAZ  0-0     29  PI8DAZ  7-7     29  PI8DXC  0-0     44  PI8DXF  7-7   1191
PI8HGL  0-0     70  PI8HGL  4-4     70  PI8HGL  10-10   70  PI8RWD  0-0   1131
PI8RWD  7-7   1131  PI8RWD  9-9   1131  PI8RWD  10-10  805  PJ2A    2-2     50
PJ2A    8-8     50  PJ2A    12-12    8  PJ2BR   10-10   50  RZ6HXA  0-10     8
SP7MGD  11-12    6  SR1BSZ  5-5     39  SR1BSZ  8-8     39  SR1DSZ  0-0      4
SR2DBY  0-15     4  SR3BBS  6-15  1518  SR4BBX  0-0     46  SR4DON  1-9      7
SR4DXC  0-0     46  SR4DXC  1-1     46  SR6DBA  0-4      7  SR6DBA  11-11    4
SR6DWC  0-10   215  SR6DWC  11-11    3  SR6DWH  11-11    4  SR7DWI  0-8      4
UT1NWA  0-0     24  VA3BAL  2-2     57  VA3BAL  5-5     57  VA3BAL  7-7     57
VA3BAL  8-8      7  VA3BAL  9-9     57  VA3BAL  10-10   57  VA3NLD  2-2     44
VA3TOK  5-5     44  VA3TOK  7-7     44  VA3TOK  8-8      6  VA3TOK  9-9     44
VA3TOK  10-10   44  VE2HAR  6-6      4  VE2PKT  3-3      5  VE3CGR  5-5     44
VE3CGR  8-8      6  VE3KR   1-1     64  VE3LSR  2-2     44  VE3LSR  5-5     44
VE3LSR  7-7     44  VE3LSR  8-8      6  VE3LSR  9-9     44  VE3LSR  10-10   44
VE3MCH  5-5     39  VE3MCH  7-7     39  VE3MCH  8-8      5  VE3MCH  9-9     39
VE3MCH  10-10   39  VE3MUS  3-3     64  VE3MUS  5-5     64  VE3MUS  7-7     64
VE3MUS  8-8     12  VE3MUS  9-9     64  VE3MUS  10-10   64  VE3OSR  0-0     44
VE3OSR  7-7     44  VE3OSR  8-8      6  VE3OSR  9-9     44  VE3OSR  10-10   44
VE3TOK  1-1     39  VE3TOK  2-2     39  VK3AC   5-5     10  VK3APC  5-5     12
VK3ATM  5-5     10  VK3AYM  5-5      8  W4AC    1-1     37  WA7V    0-0     29
WA7V    2-2      3  WA7V    4-4     29  WA7V    8-8     29  YO2BT   5-7      3
YO2BT   8-8     35  YO6KNE  8-8     35  YO6KTR  0-2      4  YO6PLB  5-5      4
YO6PLB  6-6     34  YO6PLB  8-8     34  YO6PLB  9-9     34  YO6PLB  12-12   34
YO7JYL  1-1     34  YO7JYL  5-5      3  YO7JYL  10-10   34  YO7KYN  2-2     34
ZL2ARN  5-8     10

F6GGY-8 (Commands = ?) : b
*** 0000 - Remote Station cleared connection
*** Reconnected to F6BVP-10

73 de Bernard, F6BVP


