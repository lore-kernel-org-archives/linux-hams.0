From: richard <richard.bown@blueyonder.co.uk>
Subject: Re: gmfsk
Date: Mon, 30 Oct 2006 17:31:12 +0000
Message-ID: <454636E0.6090009@blueyonder.co.uk>
References: <4544D1A7.3010103@blueyonder.co.uk> <20061029213157.GA25286@cloud.net.au> <45452E68.9060601@blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <45452E68.9060601@blueyonder.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

<Humungus snip>

I'm gradually getting hold of whats happening, I have managed to decode 
bpsk31, rtty looks garbidge still, and cw is much the same.
What is giving me a real problem is that if I go to TX I get the box up 
with:-
"sound_open_for_write:opensnd: /dev/dsp: Deviceor resource busy"
If I then click on the RX box the waterfall display speed increases 2 to 
3 times faster than the previous working RX session, and the
RX window gets gradually filled with random letters.
The only way to get back to a working RX session is to shutdown GMFSK 
and restart it.
I've checked to see if and other processes are usingh /dev/dsp and its 
permissions are :-
 ls -la /dev/dsp
crw-rw---- 1 richard-g8jvm audio 14, 3 Oct 30 09:29 /dev/dsp


Any ideas 
??????????????????????????????????????????????????????????????????????????????????

TIA
Richard g8jvm

