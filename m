From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: KPC 9612+ and kissattach
Date: Tue, 3 Sep 2002 03:29:49 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020903032949.A17023@pull.privacy.nb.ca>
References: <00d201c252d4$c16dd420$0100a8c0@dell>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00d201c252d4$c16dd420$0100a8c0@dell>; from ian@platinum.net on Mon, Sep 02, 2002 at 04:01:58PM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian McLaughlin <ian@platinum.net>
Cc: linux-hams@vger.kernel.org

On Mon, Sep 02, 2002 at 04:01:58PM -0700, Ian McLaughlin wrote:
> Hello All,
>   I have searched the archives, but cannot find a solution to my problem.
> 
> 2 machines trying to talk to each other.  One seems to work, one doesn't.
> 
> Software config the same on each one - RedHat 7.3 with the ax25 libs and
> utils installed.  Kernel recompiled to support ax25 and kiss devices.
> 
> The machine that works is using a Kenwood D7A radio at 9600 baud in kiss
> mode.  kissattach seems to work, and if I ping the other end of the radio
> link, I get the radio going in to transmit mode in sync with the ping
> packets.
> 
> The other end, however is a different story.  It's a Kantronics KPC 9612+,
> with no radio on the first port, and a 9600 baud radio on the second port.
> Minicom works fine, and I can connect to the tnc and send and receive data
> on the TNC.  My problem appears to be with mkiss.  Am I correct in assuming
> that I need to run mkiss because the KPC 9612 is a dual-port TNC?  I am
> running the foillowing commands:
> 
> mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 /dev/ptyq1
> kissattach /dev/ttyq1 RADIO 172.16.0.2
> 
> The commands are accepted, and a network device is create, but if I ping, I
> get no radio traffic at all.

Check the AX25-HOWTO section 6.1.1.1 ("Configuring for Dual Port TNC's")
<http://www.tldp.org/HOWTO/AX25-HOWTO/x495.html>

(the short form:)

# /usr/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 /dev/ptyq1
# /usr/sbin/kissattach /dev/ttyq0 port1 44.135.96.242
# /usr/sbin/kissattach /dev/ttyq1 port2 44.135.96.242

-ve1mct
