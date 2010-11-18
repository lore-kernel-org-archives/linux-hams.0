From: Dave Platt <dplatt@radagast.org>
Subject: Re: two way radio
Date: Thu, 18 Nov 2010 08:19:43 -0800
Message-ID: <B89F3374-BA80-4CA0-AB0F-9FEC1B7008E8@radagast.org>
References: <AANLkTin-zRtubZg+UvmAm0hqT=T+95o00+ToG6oLJH+9@mail.gmail.com> <4CE5350A.7040509@complete.org>
Mime-Version: 1.0 (iPad Mail 7B405)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CE5350A.7040509@complete.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Goerzen <jgoerzen@complete.org>
Cc: Eduardo <erocha.ssa@gmail.com>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>


>> I have a pretty basic question. Is it possible to connect a two way
>> radio (like https://cobra.com/detail/microtalk-cxr925-35-mile-radio.cfm
>> ) to a Linux box? Does anyone know a good reference explaining how to
>> make this connection?
> 
> You'll need:
> 
> 1) A way to get sound from the computer to the radio
> 2) A way to get sound from the radio to the computer
> 3) A way to key PTT from the computer.
> 
> #1 and #2 may be solved easily if it has headphone and mic jacks.  #3 may be more complicated, though you may be able to use VOX.  The precise circuits needed vary by radio.

Here in the U.S. you have to be careful in what you do along these
lines due to the FCC regulations which govern FRS radio use.

-  You may not make any internal mofifications of the radio at all.
-  You may not interconnect to the telephone network
-  Voice use only, with very limited exceptions for very specific forms of
   data transmission
-  Two-way person to person communications only, again with limited
   exceptions.  No one-way (broadcasting) allowed.
 
Within those limitations, though, is is as you say.  A radio prewired with a
jack or jacks for an external speaker-mike with PTT switch or VOX would
be a good choice, as it would not require internal modifications to be
hooked up to a PC sound interface via e.g. a Buxcomm RASCAL or
similar devicr (isolation transformers, pad resistors, and a PTT drive
circuit, all easy to homebrew).

