From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: Status of AX.25 in 2.5 / 2.6
Date: Sat, 27 Jul 2002 12:10:14 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <001401c2355e$2ef96750$e239832c@jrws2>
References: <20020727030700.A32364@dea.linux-mips.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020727030700.A32364@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Ralf Baechle DO1GRB' <ralf@uni-koblenz.de>, linux-hams@vger.kernel.org

Hi Ralf & all,


There is one item on my Wishlist which I've mentioned a couple of times
in the group;

This is the addition of a 'visible' (accessible) total retries counter
for each port.

The count of total frames transmitted is already stored and is visible
via ifconfig.
Having the total retries for the port in addition to this would allow
monitoring of links, and it gives an early warning of antenna or radio
degredation.

This is the one feature that Dos BPQ had that I miss with the Linux
software.


From looking through the kernel AX25 code, the retry count is only
incremented in three places. If a 'total errors' counter could be
incremented at the same time, this would do the job.

The ifconfig display includes a TX errors count, which seems to be
unused on my particular setup, but so far I've not had the time to work
through the sources & find where it's stored.

Also, while it's not used with my configuration (using only KISS tncs),
I don't know if it's used with any other interfaces (SCC cards etc) so
it may need to be configurable in the appropriate header file.


Regards,

Robert Jenkins, G8TBF / G0WTK.

mailto:g8tbf@nndg.org




