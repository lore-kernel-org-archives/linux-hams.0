From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Status of the stuck sockets bugs.
Date: Fri, 23 Jul 2021 12:09:19 -0700
Message-ID: <cb10d2d4-d997-fe01-3c55-8cb0eaf4f759@trinnet.net>
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <b435d3b3-b632-de9f-2f14-5a94e718f7a8@trinnet.net>
 <YPp6b2WSki7pZOoE@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <YPp6b2WSki7pZOoE@linux-mips.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org


Hello Ralf,

This is reproducible on my systems:

    - Use a modern kernel say from Ubuntu 20.04 (kernel: 5.8.0-59-generic):
    - Use a multi-core CPU with SMP enabled
    - Use a KISS-based TNC using the
    - Have a remote station make an incoming connected AX.25 session to 
your station
    - Have that station then gracefully or ungracefully disconnect


Below is a script I wrote back in 2015 that I used to force-clear these 
dead sessions and also includes comments about what is seen.

--David
KI6ZHD


--
#!/bin/bash

# Clear stranded AX.25 connection
# 11/27/15

#Part of the HamPacket documentation
#dranch@trinnet.net

# 11/27/15 - Added setup agnostic clearing of AX25 sessions
# 03/22/15 - Added clearing sessions in "DISC SENT" state
# 05/07/13 - Original version

DEBUG=1

NETSTAT="/bin/netstat"

NR_CALL="ki6zhd-5"

# 
----------------------------------------------------------------------------------------

function SHOW_SESSIONS {
    #Session to be cleared
    echo -e "Current AX.25 Sessions: "
    echo -e "-------"
    $NETSTAT -A ax25

    echo -e "\nCurrent Netrom Sessions: "
    echo -e "--------"
    $NETSTAT -A netrom
}

if [ $UID -ne 0 ]; then
    echo -e "\nError: you must be root.  \n\nAborting\n"
    exit 1
fi

if [ -z $1 ]; then
    echo -e "\nUsage: you must specify a remotely connected callsign 
WITHOUT an SSID\n"
    SHOW_SESSIONS
    echo -e "\nAborting\n"
    exit 1
fi

RCALLSIGN=$1

# Per dranch packet folder : email subject: "bugs and kernel panics"
#
# There seems to be a bug in the Linux AX.25 stack.  As I understand, 
AX.25 is a Layer-2
#  protocol and Netrom is a Layer-3 protocol.  I assume that if you kill 
the L2 connection,
#  the L3 should come down too.  Bad assumption?  If you create a netrom 
connection with
#  the following assuming your system is full setup and has an interface 
called "netrom"
#  in the /etc/ax25/nrports file:
#
#     #netrom_call - netrom device - remote netrom call (or alias)
#     call netrom wbay
#
#  Then issue the command:
#  program - ax25 interface - remote ax25 call - local ax25 call - kill 
the socket
#  "axctl d710 n6zx-5 ki6zhd-5 kill", I see:
#
#         d710: fm KI6ZHD-5 to N6ZX-5 ctl DISC+
#         d710: fm N6ZX-5 to KI6ZHD-5 ctl UA-
#
#  the ax.25 session is now gone :
#         # netstat -A ax25
#         Active AX.25 sockets
#         Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
#         *          KI6ZHD-2   ax0     LISTENING    000/000  0       0
#         *          KI6ZHD-1   ax0     LISTENING    000/000  0       0
#         *          KI6ZHD-0   ax0     LISTENING    000/000  0       0
#         *          SCLARA-0   ax0     LISTENING    000/000  0       0
#         *          KI6ZHD-5   ax0     LISTENING    000/000  0       0
#
# but the netrom connection persists:
#         netstat -A netrom
#          Active NET/ROM sockets
#          User       Dest       Source     Device  State        Vr/Vs 
  Send-Q  Recv-Q
#          KI6ZHD-0   N6ZX-5     KI6ZHD-5   nr0     ESTABLISHED  006/003 
  0       0
#          *          *          KI6ZHD-5   nr0     LISTENING    000/000 
  0       0
#
#  If I send traffic on the netrom connection, the AX.25 stack 
automatically re-establishes
#  a L2 AX.25 connection.  Why?  Is this expected?
#
#      d710: fm KI6ZHD-5 to N6ZX-5 ctl SABM+
#      d710: fm N6ZX-5 to KI6ZHD-5 ctl UA-



#We need to find and clear any netrom based sessions FIRST if any
# Test to see if we are Netrom enabled

$NETSTAT -A netrom -r > /dev/null 2>&1
if [ $? -eq 0 ]; then
    #  Expand any used netrom aliases
    REMOTE_NR_RELATED_CALL="`$NETSTAT -A netrom -r | grep -i 
$RCALLSIGN** | awk '{print $1}'`"
    LOCAL_NR_RELATED_CALL="`$NETSTAT -A netrom | grep -i 
$REMOTE_NR_RELATED_CALL | awk '{print $3}'`"

    if [ -n "$LOCAL_NR_RELATED_CALL" ]; then
       #Crafty workaround to find netrom related session
       NR_RELATED_SOCKET="`cat /proc/net/nr | grep -i 
$REMOTE_NR_RELATED_CALL | grep -i $NR_CALL | awk '{print $19}'`"
       NR_RELATED_PROCESS_NAME="`lsof -nP | grep -i $NR_RELATED_SOCKET | 
awk '{print $1}'`"
       NR_RELATED_PROCESS_PID="`lsof -nP | grep -i $NR_RELATED_SOCKET | 
awk '{print $2}'`"
    fi

    if [ $DEBUG -eq 1 ]; then
       #echo -e "\nDEBUG: command: netstat -A netrom -r | grep -i 
$RCALLSIGN** | awk '{print $1}'"
       echo -e "DEBUG: Show any aliased netrom call for $RCALLSIGN** : 
$REMOTE_NR_RELATED_CALL"
       echo -e "DEBUG: NR_RELATED_SOCKET inode is $NR_RELATED_SOCKET"
       echo -e "DEBUG: NR_RELATED_SOCKET process name is 
$NR_RELATED_PROCESS_NAME"
       echo -e "DEBUG: NR_RELATED_SOCKET process PID is 
$NR_RELATED_PROCESS_PID"
       echo -e " "
    fi

    if [ -n "$NR_RELATED_PROCESS_PID" ]; then
       echo -e "Killing netrom related process: $NR_RELATED_PROCESS_PID"
       kill $NR_RELATED_PROCESS_PID
      else
       echo "No netrom processes found"
    fi
   else
    echo -e "\nSystem not Netrom enabled.. skipping"
fi

if [ $DEBUG -eq 1 ]; then
    echo -e "DEBUG: Show any calls for RCALLSIGN $RCALLSIGN : 
$REMOTE_NR_RELATED_CALL"
    echo -e " "
fi

echo -e "\nKilling AX.25 processes: "
LOCAL_AX_RELATED_CALL="`$NETSTAT -A ax25 | grep -i $RCALLSIGN  | awk 
'{print $2}'`"
if [ -z $LOCAL_AX_RELATED_CALL ]; then
    echo -e "\nNo session associated with $RCALLSIGN found. Exiting\n"
    exit 1
fi
LOCAL_AX_INT="`grep -i $LOCAL_AX_RELATED_CALL /etc/ax25/axports | awk 
'{print $1}'`"
$NETSTAT -an | grep -i -e $RCALLSIGN** | grep -e "ESTABLISHED" -e "DISC 
SENT"
$NETSTAT -an | grep -i -e $RCALLSIGN** | grep -e "ESTABLISHED" -e "DISC 
SENT" -e "RECOVERY" | awk '{ system ("/usr/sbin/axctl '$LOCAL_AX_INT' 
"$1" "$2" kill") }'
#$NETSTAT -an | grep -i -e $RCALLSIGN** -e $REMOTE_NR_RELATED_CALL | 
grep -e "ESTABLISHED" -e "DISC SENT" -e "RECOVERY" | awk '{ system 
("/usr/sbin/axctl d710 "$1" "$2" kill") }'

echo -e "\ndone\n"
--



On 07/23/2021 01:14 AM, Ralf Baechle wrote:
> On Thu, Jul 22, 2021 at 04:22:48PM -0700, David Ranch wrote:
>
>> This issue is still present in all current Linux kernels.  I believe Ralf
>> Baechle (current AX.25 kernel module maintainer) has been aware of this
>> issue for some time.
>
> I've never been able to reproduce the issue which made it really hard to
> debug.  On my own system I've never observed the issue even once.
>
>   Ralf
>
