From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 11:10:23 -0400
Message-ID: <620c90570703150810u49ab154fkedbc6227b0a2da75@mail.gmail.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
	 <45F8566D.10206@wa7v.com>
	 <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
	 <1173962835.1770.27.camel@CO>
	 <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
	 <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
	 <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
	 <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
	 <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=boTjtltAmxk80q1CJrM8A2iDWyn/Q/pS1MRJ5eDeKBraIU205pSEwnPt1uiENK8BOrjclc6H7Wu/+WpSaUMmt6IJ6KHF6RNHRtZoaep17I5GS6RTdwvaCrsLDZhAAfwAHuWohPuSdZVqp9a9TLyeOz6e9hAtN+hnrjsCvSjuQTk=
In-Reply-To: <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: Stephen Brown Jr <stephen.brown75@gmail.com>, linux-hams@vger.kernel.org

On 3/15/07, Curt, WE7U <archer@eskimo.com> wrote:
> On Thu, 15 Mar 2007, Chuck Hast wrote:
>
> > I was looking at Xastir docs and it appears that it will work with the ax25
> > stack.
>
> Yes.  It'll work with the AX.25 stack -or- with the "soundmodem"
> driver set up as a serial KISS TNC -or- with a KISS TNC on a direct
> serial port -or- with a non-KISS TNC on a direct serial port.
>
> Of course the only way to share TNC's with other apps is to use the
> AX.25 stack.
>
> Xastir has a "View->Incoming Data" dialog so you can see whether
> packets are coming in at all once you set up an AX.25 interface in
> Xastir and enable it.
>
> You'll also have to do "chmod 4755 /usr/local/bin/xastir" as root in
> order to give Xastir the proper privileges to open an AX.25
> networking port.  Xastir drops privileges to normal user level
> unless it's messing with ports where it needs root privilege.
>
Ahh, I knew that if I waited long enough I would get the info on how to set
up a Xastir port on a Linux FPAC switch so we can add that function to
our switch stack.....



-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
