From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: Jnos and Areas
Date: Sun, 22 Sep 2002 00:26:14 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200209220026.14683.vk3bvp@qsl.net>
References: <200209210111.01336.eb5esx@eb5esx.ampr.org>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200209210111.01336.eb5esx@eb5esx.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Saturday 21 September 2002 09:11, Ruben Navarro Huedo wrote:
> Hello all:
> We are trying to configure nos.ea5rke.ampr.org
> it runs ok, but we have problems with areas
> How can we put bulletins/mails in public areas?
> Our local FBB BBS is sending @ea bulletins to jnos, but they don't go in
> the ea area. Jnos try to return the mail.
>
> This is our rewrite:
>
> *@ea ea
> *@local local

Same as I do.
>
> This is oue alias:
>
> ea ea
> local local

Same.

>
> and this is our areas:
>
> users   Mensajeria Privada
> ea      Mensajeria EA
> linux   Mensajeria sobre Linux
> local   Mensajeria Local
> intnet  Mensajeria sobre la Red

I use UPPERCASE which, if anything, should be worse. Like -
USERS   Mensajeria Privada

>
> Please...could you help us with this?
>
> A lot of thank's.

Maybe it's a problem with your autoexec.nos or paths used.

Does it work if you send from the JNOS BBS prompt ?
Are they getting to spool/mqueue ?
If so, have you started smtp ?
Does smtp work for p mail?
How about a look at your autoexec.nos.

More questions than answers :-(

-- 
Shane Deering   vk3bvp@qsl.net 	vk3bvp@vk3bvp.#sev.vic.aus.oc
http://www.qsl.net/vk3bvp/
Sent with KMail v1.4.1 on Sun Sep 22 00:04:50 EST 

