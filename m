From: Chuck Hast <wchast@gmail.com>
Subject: Interesting problem.
Date: Sat, 16 Oct 2004 21:26:32 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <620c90570410162126741e8b5e@mail.gmail.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fpac@f6fbb.org, Linux-hams List <linux-hams@vger.kernel.org>

This is a problem that I have not seen in some time, and the last time I saw
it, it was due to a bad KISS image in a eprom.

I am testing the Linux AX25 piece and all appears to go well until I connect
to a station via a fpac switch using the normal direct connect format of:
call via switch,address.

Say I connect to the node app using a speed call, the call goes right
through, and all goes just fine but if I connect to the same node using
the C Node v switch, address
at first all looks good until I give the first command, then it sets there
and appears to send back and forth, if I monitor the data using listen
I see that the node is responding with the same frame counter number
as the number of the frame being sent ( should be incremented by 1)
If I do the same connect using a regular TNC all works just fine, it is when
I use the ax25 in linus that I see this one.

Has anyone seen it?

-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
