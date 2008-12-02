From: Bent <bbagger@gmail.com>
Subject: Re: standard_window_size.
Date: Tue, 2 Dec 2008 22:50:58 +0100
Message-ID: <2e19719f0812021350y2855cd0fh4eec6280b8b4f1a8@mail.gmail.com>
References: <90EE0427-2E1B-4C07-9966-B2D79D3F399B@gmail.com>
	 <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=QgQJwUy8tnXrv++d6OG4Gcuysr+vO6/17mBhDAixhbw=;
        b=R/ZKKkznVKPSNmfP6+DyZwbvhCYvJDml5gVeetI1bf6HhHseb0hM9YDyckn6g1Sw31
         DPs/hHLIOiSMZ04E3aBX1tHpHiYF3YahVSfKbaAPBWhXa/c0x1y4sS3zbSqzvVBDFftd
         Wu7ekEGZ99HR86rfl066502yz8pNZJWu5+ruk=
In-Reply-To: <BC4729C5-6006-40C4-83BC-3858C71E2EE0@tssg.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Ronan <jronan@tssg.org>
Cc: John Ronan <jpronans@gmail.com>, Linux-Hams <linux-hams@vger.kernel.org>

Hi John

I decided to take a closer look at your trace, and I interpret it this way:

   EI7IG            EI7IG-8

I  ->  N(R) = 3
                      N(S) = 3  <-  I
                      N(S) = 4  <-  I
RR ->  N(R) = 5
                      N(S) = 5  <-  I
                      N(S) = 5  <-  I
REJ ->  N(R) = 6

In words: EI7IG sends a frame that tells that the next frame expected
is no. 3. EI7IG-8 sends frames no. 3 and 4 and they are acked by
EI7IG. EI7IG-8 now sends frame no. 5 and 3 seconds later it resends it
for reasons unknown. This second no. 5 frame is rejected by EI7IG
which expect frame no. 6. having received the first frame no.5.

As far as I can see this does not have much to do with window size.
Why the second frame 5 is not received - and acked - by EI7IG should
probably be answered first.

Please tell if you agree with my interpretation of the exchange.

Best 73 de Bent/OZ6BL
