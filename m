From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Process UID changes while running
Date: Tue, 22 Nov 2005 10:41:38 +0000
Message-ID: <20051122104138.GA2706@linux-mips.org>
References: <437FF759.9040705@wa7v.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <437FF759.9040705@wa7v.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Mueller <wa7v@wa7v.com>
Cc: linux-hams@vger.kernel.org

On Sat, Nov 19, 2005 at 08:11:05PM -0800, Brett Mueller wrote:

> After some variable period of TNOS uptime, the ownership of the TNOS
> process running on my box changes (it appears to decrement) while the
> process is actually running.  The program normally runs as root (I know,
> this is less than ideal).  After the change occurs, the output of ps
> shows TNOS running with a UID of 65535.  TNOS is able to continue
> reading and writing to files that are always open (such as log files),
> but is unable to write to any others (such as mail files).  After TNOS
> restarts, everything works fine until the next occurrence.  This problem
> started happening much more frequently a couple of months ago -- often
> once every 1 to 3 days.  I've encountered it with both 2.4.24 and 2.4.31
> kernels, both of which I compiled with 9A4GL patches (the 2.4.24 kernel
> I did almost 2 years ago).  None of the other processes running on this
> box (including LinuxNode, (X)Net, LinFBB, etc.) ever have this happen
> that I have noticed.  I've searched log files for clues, but find
> nothing that catches my attention.

UID 65535 is frequently being used for the UID of nobody which is a special
unpriviledged user ID.  A priviledged process can changed it's user ID
to another user ID temporarily or permanently and that would be visible
in the USER column.

> Here's two examples of ps output that I captured from it a couple of
> weeks ago.  Note that they are the same PID, one ps listing performed
> less than 4 hours after the other:
> 
> wa7v@alw:~> ps auxw | grep TNOS
> root      9693  0.2  0.5  3088 2672 ?        S    06:59   0:33
> - -TNOS2.40/U (Not Registered) - UP: 0:04:18:11
> 
> wa7v@alw:~> ps auxw | grep TNOS
> #65535    9693  0.1  0.5  3116 2708 ?        S    06:59   0:50
> - -TNOS2.40/U (Not Registered) - UP: 0:08:02:53
> 
> Here's the full listing of the binary:
> - -rwxr-xr-x    1 root     root      4896530 Jan 24  2004 tnos*
> 
> Anyone have any ideas what could be causing this?  Other places that I
> could look for clues?  Some method of changing a running process's UID
> back to where it belongs?  Other information that I can provide?

The process itself should juggle with it's own UID as needed.

  Ralf
