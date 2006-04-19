From: John Ronan <jronan@tssg.org>
Subject: Re: Broadcasting unwanted UDP messages
Date: Wed, 19 Apr 2006 09:29:20 +0100
Message-ID: <0BEBA6C7-D164-4F4C-AEE9-EE7BF24C9741@tssg.org>
References: <4445B27F.5050206@irock.com.au> <Pine.LNX.4.58.0604182049520.18174@wapiti.we7u.net>
Mime-Version: 1.0 (Apple Message framework v749.3)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0604182049520.18174@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Linux-Hams <linux-hams@vger.kernel.org>

In the Configuration file there is a line "Interfaces"

i.e.

[snip]
# Date: 2003-11-04
[global]
         workgroup = TASMANIA
         Netbios Name = spirit
#       Netbios Aliases = jukebox
         os level = 65
         log level = 3
         security = share
         time server = Yes
         passdb backend = tdbsam guest

    obey pam restrictions = yes

         unix extensions = Yes
         encrypt passwords = Yes
         guest account = Nobody
         map to guest = Bad User
         printing = CUPS
         printcap name = CUPS
         socket options = SO_KEEPALIVE IPTOS_LOWDELAY TCP_NODELAY
#       wins support = No
         veto files = /*.eml/*.nws/riched20.dll/*.{*}/
         hosts allow = 10.0.4.
         wins support = yes
         local master = yes
         preferred master = yes
         domain master = yes
         interfaces = 10.0.4.162
         ^^^^^^^^^^^^^^^^^^^^
[snip]

Try that.

Regards
John

On 19 Apr 2006, at 04:50, Curt Mills wrote:

> On Wed, 19 Apr 2006, Ken Moore wrote:
>
>> G'day Folk,
>>
>> My ax25 system (Debian system with Linpac and Soundcard modem) is  
>> broadcasting
>> network Samba and Netbios UDP messages.
>> Being almost illiterate with Linux could someone point me in the  
>> right
>> direction to stop this.
>> I have checked the files in /etc/ax25/ but nothing seems to relate.
>>
>> Where should I start looking?
>
> www.samba.org perhaps.  There's a Samba config file setting that
> tells it not to broadcast on certain ports.  I can't remember what
> it is, sorry, but a Google search should find it.  It's a common
> problem with AX.25 interfaces.
>
> -- 
> Curt, WE7U.				archer at eskimo dot com
> http://www.eskimo.com/~archer
>   Lotto:  A tax on people who are bad at math. - unknown
> Windows:  Microsoft's tax on computer illiterates. - WE7U.
> The world DOES revolve around me:  I picked the coordinate system!"
> -
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



