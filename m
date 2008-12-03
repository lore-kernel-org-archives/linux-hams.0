From: John Ronan <jronan@tssg.org>
Subject: Re: standard_window_size.
Date: Wed, 3 Dec 2008 22:33:16 +0000
Message-ID: <F5C50AA2-F675-4280-B079-0662CAAA8349@tssg.org>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com> <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>

Ok,

Now I'm even more baffled, and I think digging in the code is going  
to have to be the answer here.

Kernel updated to be the same on both (2.6.24.3), my serial ports are  
working. Now, both ends are behaving the same protocol wise. That is  
after the data source sends two packets, the sink sends a RR.

both sides have standard_window_size set to 7, and in axports &  
ax25d.conf, the window is set to 7

However the behaviour is different on both ends, let me try and explain
NodeA  sends the RR1 after 2 packets, RR2 after next 2, RR3 after  
next 2 and RR4 after next 2 (looking at axlisten -t -a on the host)

Node B sees RR1 & RR4

NodeB sends RR1 after 2 packets, transmitting over NodeA, etc as I've  
already described (even though the TNC isn't in full-duplex mode as  
far as I can tell).

Thoughts appreciated. Tomorrow I'll rebuild the kernel on one side  
with the default window size set to 7 to see what happens.

Cheers
de John
EI7IG

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



