From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: gMFSK:Cannot open PTT device
Date: Fri, 4 Nov 2005 08:52:26 +1100
Message-ID: <20051103215226.GB12651@cloud.net.au>
References: <200511032149.49891.on4hso@amsat.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200511032149.49891.on4hso@amsat.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

On Thu, Nov 03, 2005 at 09:49:49PM +0100, Henk Oegema wrote:
> How can I activate the the PTT device in gMFSK ? (COM1)
> I have given commands:
> # chmod ug+rw /dev/ttyS0
> 
> The serial port is normally owned by group "uucp"
> 
> I've added myself to this group:
> # groupmod -A username uucp
> 
> However: When I open gMFSK I still get:
> "Cannot open PTT device '/dev/ttyS0' : permission denied.

Did you logout after adding yourself to the group?
Group changes don't take effect until next login.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
