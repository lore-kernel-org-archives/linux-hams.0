From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: Status of AX.25 in 2.5 / 2.6
Date: Mon, 29 Jul 2002 15:49:28 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000001c2370f$242f6c40$e239832c@jrws2>
References: <20020726134216.A4126@dea.linux-mips.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020726134216.A4126@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Ralf Baechle' <ralf@uni-koblenz.de>, linux-hams@vger.kernel.org

Hi,

Another couple of points with the present AX25 which I (and I believe
others) find annoying:-

1: The insistance on a separate call+ssid for each port.

Every port is allocated a unique name in axports anyway, so why the need
for the unique call as well???

(This is WAY more annoying to me than the requirement for an IP address
- at least it will accept the same IP on multiple ports!)


It certainly does not seem to be a requirement for AX25, as the Dos BPQ
node works fine with one call for the whole system. Being able to use
the same callsign/ssid for multiple ports would greatly simplify some
more comnplex configs.

As far as I know, the callsigns / aliases that the AX25 code uses for
incoming connects are the ones set in ax25d.conf and have no connection
to the 'axports' callsigns; these are used for outgoing connects only.



2: The apparent requirement for two or more Netrom ports / aliases for
the Netrom system to work correctly? Most of the docs on setting up
netrom say separate ports are needed for incoming and outgoing connects.
Why???
Again, it's not a fundamental requirement for Netrom, it's an oddity in
the Linux implementation.





One other request to anyone doing updates; please keep adding comments &
useage notes to the sources! 

Some functions do have brief descriptions, others have 'to do' notes or
nothing at all. It makes it hard to do anything productive with the code
when you can only spend short periods of time on it, and spend most of
that time just trying to refresh your memory of what does what.


Regards,

Robert Jenkins.



