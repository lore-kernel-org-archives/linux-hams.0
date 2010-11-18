From: "Robert Eliassen" <robel@vktv.no>
Subject: RE: two way radio
Date: Thu, 18 Nov 2010 21:41:54 +0100
Message-ID: <006d01cb8761$0950d160$1bf27420$@no>
References: <AANLkTin-zRtubZg+UvmAm0hqT=T+95o00+ToG6oLJH+9@mail.gmail.com>	<20101118121549.GW2394@n0nb.us>	<AANLkTin9MdSCs86ZAaGpJ0pzVCfVwnbxeUGfPA7dUTo2@mail.gmail.com>	<003b01cb873e$a8e96020$fabc2060$@no> <AANLkTinp_qLfaWZHv+ZpdSBkHXTF4OGuTMW68Ugmy2b3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <AANLkTinp_qLfaWZHv+ZpdSBkHXTF4OGuTMW68Ugmy2b3@mail.gmail.com>
Content-Language: no
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Eduardo' <erocha.ssa@gmail.com>
Cc: linux-hams@vger.kernel.org

Ah, so you're like going to telnet into a Linux box via radio!=20

Ok, so the clue here is "I want to control my Linux box 20 miles away, =
and
there is no other way but via radio".=20

The good news is that dual-mode GMRS/FRS equipment is approved in Brazi=
l
according to http://en.wikipedia.org/wiki/Family_Radio_Service

When it comes to legal modifications and the legal use of data communic=
ation
you should Google (in you language) for answers.

Assuming it's legal, the rest is pretty straight forward. You can check=
 out
http://www.faqs.org/docs/Linux-HOWTO/AX25-HOWTO.html although it's pret=
ty
old.=20

73
Bob, LA6GHA

-----Original Message-----
=46rom: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Eduardo
Sent: 18. november 2010 18:31
To: Robert Eliassen
Cc: linux-hams@vger.kernel.org
Subject: Re: two way radio

Hello Robert,

I want to send commands (and receive status) to a Linux box. I am not
quite sure what band I can use. I am in Brazil and I think (I'm not
completely sure) that I can use CB here for that.

Regards,
Eduardo

On Thu, Nov 18, 2010 at 2:35 PM, Robert Eliassen <robel@vktv.no> wrote:
> Eduardo,
>
> You still have to explain what your intentions are. Are you going to =
use
the
> FRS/GMRS-radio to transmit and receive data?
>
> PTT (Push To Talk) would be the trickiest part I guess. You may have =
to
> modify the unit.
>
> Regards
> Bob, LA6GHA
>
> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Eduardo
> Sent: 18. november 2010 15:51
> To: linux-hams@vger.kernel.org
> Subject: Re: two way radio
>
> Hi Nate / John,
>
> Thanks for your replay.
>
> What (cheap) radio would you recommend to transmit data? Could you
> also point a place where I can find the circuit needed to connect thi=
s
> radio to a Linux box?
>
> Best regards,
> Eduardo
>
> On Thu, Nov 18, 2010 at 10:15 AM, Nate Bargmann <n0nb@n0nb.us> wrote:
>> * On 2010 18 Nov 05:09 -0600, Eduardo wrote:
>>> Hi,
>>>
>>> I have a pretty basic question. Is it possible to connect a two way
>>> radio (like https://cobra.com/detail/microtalk-cxr925-35-mile-radio=
=2Ecfm
>>> ) to a Linux box? Does anyone know a good reference explaining how =
to
>>> make this connection?
>>
>> To do what? =A0As it is an FRS radio I doubt that anything but voice=
 is
>> allowed, at least in the USA. =A0Outside the USA you may be able to =
use
>> data of some sort, depending on your local regulations. =A0To do tha=
t you
>> would likely connect the speaker/mic jack to the audio connections o=
n a
>> sound card. =A0Looking at the specs I doubt there is any way to conn=
ect
>> the radio for frequency/channel selection.
>>
>> 73, de Nate >>
>>
>> --
>>
>> "The optimist proclaims that we live in the best of all
>> possible worlds. =A0The pessimist fears this is true."
>>
>> Ham radio, Linux, bikes, and more: http://n0nb.us/index.html
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
