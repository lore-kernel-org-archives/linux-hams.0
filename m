From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: aprsd setup
Date: Sun, 7 Nov 2004 12:44:58 +1100
Message-ID: <20041107014458.GA3069@cloud.net.au>
References: <001301c4c469$d56f7c40$6402a8c0@laptop>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001301c4c469$d56f7c40$6402a8c0@laptop>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Nov 07, 2004 at 02:33:49AM +0100, Thomas - OZ2AFO wrote:
> I'm trying to setup an aprs station, supporting both digipeating and 
> i-gate. So far I have found that there is two packages : aprsdigi, and 
> aprsd. Each does one of the wanted things, but not the other. Am I correct?
> 
> How would one do the right setup of both aprsdigi AND aprsd on the same PC? 
> (If that's needed to do both my jobs)

You can run both just fine. Just run them. This requires that you are
using the linux kernel's AX.25 with an appropriate device such as a TNC
in KISS mode etc. (aprsdigi always requires that, while aprsd can use
kernel AX.25 or drive the TNC (NOT in KISS mode) directly.)

> I sort of having aprsd up and running already, but it just sits there. It 
> is connected to the network (have connection to second.aprs.net, and 
> another local i-gate here in Denmark). And I can see in history.txt that it 
> recieves things. But if I try to use a program like ui-view to connect to 
> the server I don't get a thing, other than the position of the server 
> itself. What am I doing vrong?

Are you connecting to it on the right port?

Does the web status page say anything interesting? You can access it at
http://[your server]:14501/


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
