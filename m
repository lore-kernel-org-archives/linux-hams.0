From: Douglas Cole <doug.n7bfs@gmail.com>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 12:48:13 -0800
Message-ID: <9923fd660601301248r49d34f64g76dc09246dbad341@mail.gmail.com>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>
	 <d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>
	 <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org>
	 <1138629532.7628.2.camel@CO> <43DE5851.33E01B71@free.fr>
	 <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?G=E9rard_/_F6FGZ?= <f6fgz@free.fr>
Cc: linux-hams@vger.kernel.org

On 1/30/06, Douglas Cole <doug.n7bfs@gmail.com> wrote:
> I have been following this thread with much interest and really
> appreciate you folks sharing what you have so far, it has been very
> educational, but I am missing something in the below posting which I
> hope someone can clear up...
>
> On 1/30/06, G=E9rard / F6FGZ <f6fgz@free.fr> wrote:
> > "Wilson G. Hein" wrote :
> >
> > > Easiest way is to use minicom (terminal program) to make the chan=
ges in
> > > the tnc. There maybe ways to do this using echo to send data to t=
he
> > > serial line (/dev/ttyS0), I find it just as easy to use minicom.
> >
> > (1) To exit:
> >
> > echo "Exiting KISS mode on port COM1"
> > echo -e "\300\377\300\r" >/dev/ttyS0
>
> I am not sure what the "\300\377\300\r" is doing for me, I know the
> numbers are equivelants to something, but they aren't decimal
> equivelants to ASCII characters, so what are they and where can I fin=
d
> a chart that can give me a listing of this type of thing?
> I have found a listing of "normal" ASCII character codes but they
> don't show 300 or 377 ...

Ok, I still don't know what the character values mean, but I read the
man page for "echo" and figured that you must be using octal and know
that 300 is octal for 192 decimal and 377 is octal for 255 decimal...

But the ASCII charts I have don't explain what 192 and 255 are ,
anyone can point me to a chart that does ?

tia for any input :)

Doug
N7BFS
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
