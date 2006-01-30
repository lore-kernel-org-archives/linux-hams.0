From: Douglas Cole <doug.n7bfs@gmail.com>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 15:26:09 -0800
Message-ID: <9923fd660601301526p1a06b4dbibd21d6ac94aca7b@mail.gmail.com>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>
	 <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com>
	 <9923fd660601301248r49d34f64g76dc09246dbad341@mail.gmail.com>
	 <200601302237.05868.Oliver.Hohlfeld@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200601302237.05868.Oliver.Hohlfeld@web.de>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oliver Hohlfeld <Oliver.Hohlfeld@web.de>
Cc: linux-hams@vger.kernel.org

On 1/30/06, Oliver Hohlfeld <Oliver.Hohlfeld@web.de> wrote:
> Hi,
>
> > Ok, I still don't know what the character values mean
>
> These are specific KISS Mode commands which are interpreted by the TNC.
> You can try to look them up in a KISS related document such as [1].
> Basically, the decimal value 192 stands for the end of a frame. The
> next one, 255, is the most important value to achieve your goal - this
> one exists the KISS mode. The repeated usage of Frame End at the end
> of the sequence is just a little workaround for some TNCs, as they
> 'wait too long' before interpreting the frame.
>
> Cheers,
> Oliver
>
> [1] http://people.qualcomm.com/karn/papers/kiss.html
>
> --
> Oliver Hohlfeld | DO1FDK | http://www.ohohlfeld.com
> http://dk0td.afthd.tu-darmstadt.de/~do1fdk/ | www.ohohlfeld.com/gpgkey.txt
>                  - long long ago; /* in a galaxy far far away */ -
>                   - I am not a bug I am a undocumented feature -
>
:)
Thanks Oliver, very informative thread, now I just need to go read,
and let it sink into my spongy head, I love this group!

Doug
N7BFS
