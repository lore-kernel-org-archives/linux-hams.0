From: John Ronan <jpronans@gmail.com>
Subject: Re: standard_window_size.
Date: Wed, 3 Dec 2008 21:06:15 +0000
Message-ID: <50DA4EB2-D38C-4512-B382-F2F5903B3310@gmail.com>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com> <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org> <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com> <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:mime-version:in-reply-to
         :references:content-type:message-id:content-transfer-encoding:from
         :subject:date:to:x-mailer;
        bh=FwmcWJXFaNCO95Q8J0k/AcPO5SvwLmhRoAcBEDNhObQ=;
        b=xrm37HzCP4m7TMF1ZOhOOaZauiohX5dsrTtCIBLg57SaGwZUL2pUKeIq66N6NdwxGf
         PdXQ8IOqBUT5EALwXHUiJ1QhRXpKJCuRO6hD+omaXVRzGtSviKXAL+83vHvXGD5hXoNP
         YywJTV3KpG66VAUshiuzVi5LevBJMQVTuf+gs=
In-Reply-To: <B445944EF6334806BCD4A50D81BC7CFC@arkalmus.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>


On 2 Dec 2008, at 23:12, Bob Donnell wrote:

> A suggestion too for troubleshooting this, is to have a 3rd station/ 
> TNC
> monitoring the activity, and logging that information.  That will  
> show the
> sequence of actual on-air transmissions.
>
Good idea, hadn't though of that.

> One of the generalized problems with using KISS and/or queues that are
> isolated from knowing that multi-frame transmissions are occuring  
> is that
> the station receiving the I frames usually generates an ack for  
> that single
> I frame, and puts it in the transmit queue - without waiting to see  
> if an
> additional I frame (or more) in the same sequence that the information
> sending station is sending is following.  So when the I frame  
> receiving
> station is finally granted access to the channel, all of the  
> individual
> queued ack packets (acking one I frame at a time) are transmitted.   
> The I
> frame sending station gets the first ack, notes that it's only  
> acking the
> first I frame of a multi-frame window.  It's not any more clever  
> than the
> receiving station, and doesn't wait to see if more ack packets are  
> coming,
> so it immediately queues up a replacement 2nd (and perhaps more) I  
> frame.
> There's no way to flush that queue, so using a larger window size -  
> which
> can make things a lot more efficient, has the behavior of a lot of
> duplicated frames.
>
Ok, but if the window is set to 7, shouldn't it wait until it sees 7  
frames  or  N Frames + T2

> This whole layer 2 acknowledgement problem is one of the reasons  
> that when
> we had a very active IP network in the Seattle area, we used  
> datagram mode,
> with UI frames at the AX.25 level, almost exclusively.  This moved  
> the retry
> timing up to the IP level, where the timing is adaptive, and fairly  
> quickly
> the sender learns enough about the channel to not expect ack packets
> instantly for each frame.
>
> The real root of the problem is that the AX.25 driver is (in most air
> interfaces) too decoupled from the activity on the RF channel.  One  
> of the
> ideas I had for trying to address this in the AX.25 stack was to  
> make the
> AX.25 driver aware of the channel speed, so that it could adopt  
> sensible
> timers for retries and generating ack packets.  That approach could  
> work in
> the absence of any information on whether the channel is busy.
>
ok...

> As a more advanced option for serial-port-interfaced TNC's is that  
> I know
> that some TNC's can be configured to provide CD information,  
> usually on the
> CD line.  That information could be used by the AX.25 driver to pause
> timers, as an alternate AX.25 driver attachment option.
>
> This is one of the areas where the 6PACK interface choice shines -  
> almost
> all of the intellegence is removed from the TNC, even more so than  
> KISS, and
> made a function of the AX.25 driver, providing tight coupling.  The  
> same
> should be true of the AX.25 HDLC card driver, but I if I remember  
> right it
> too has been decoupled from the AX.25 stack, so it doesn't perform  
> much
> better in AX.25 connected mode than a KISS TNC.
>
> Assuming that the AX.25 driver has actually been modified to ignore
> window_size, this decoupled operation might be why a driver  
> maintainer might
> have made that choice.
>
> Some of my observations date back to when I was running an W0RLI/ 
> G8BPQ BBS
> in the early '90's, and discovered that on a very busy channel, I  
> had to set
> AX.25 frame acknowledgement timers to as long as 40 seconds,  
> otherwise the
> scenario I described would happen, just moving the data from the  
> PBBS to the
> NET/ROM node - and it would be a cascading problem, as more packets  
> got
> queued up in the TNC for transmission.  If I was present, the whole  
> thing
> could be "fixed" temporarily by rebooting the TNC, so it dropped  
> all of the
> packets it had queued.
>
> I hope what I've suggested and explained makes sense.
>
Yes, very educational (though I'm sure I'll have to read it a few  
times to fully understand it all).

Now, I did some more testing

Node 1 (EI7IG-8) (either in Kiss or with minicom in converse mode)  
can connect to Node 2 (EI7IG funny one) and when I ask for a long  
file, I get the full 7 packets before node 1 sends the   ack.

I'm beginning to think its a kernel issue as EI7IG is running an  
older kernel, EI7IG-8 is running a fairly new kernel.  I've been slow  
to upgrade EI7IG because I've been unable to get my serial ports (pci  
card) working right on the newer kernels. I guess now is time to do it!

John

