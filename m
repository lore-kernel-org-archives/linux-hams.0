From: Jim Bayer <kc9aop@gmail.com>
Subject: Re: Newbie: how to write a program to exchange files with HF modem?
Date: Thu, 20 Oct 2005 09:42:28 -0500
Message-ID: <e524c5320510200742l259104cei82ff5b3ec88be563@mail.gmail.com>
References: <140.105.16.64.1168608606.1129813058@webmail.katamail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <140.105.16.64.1168608606.1129813058@webmail.katamail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "liva@katamail.com" <liva@katamail.com>
Cc: linux-hams@vger.kernel.org

Marco,

I have not written a program like this for a while, but here are a few
suggestions:

Have the receiver read the modem buffer first and just throw it away. 
This may clear the modem buffer and get rid of the problem with bad
data.

You could implement a handshake protocol between the sender and
receiver.  I remember using net-bios in the past as the protocol.  At
any rate, the sender should send data, and listen for the reciever to
answer that it has it.  I know this will slow things down, and maybe
theres a better way to implement this, but this is what needs to be
done logically.


'73 - Jim KC9AOP



On 10/20/05, liva@katamail.com <liva@katamail.com> wrote:
> I'm trying to write in C a linux program to exchange files via hf radio using hal dsp4100 modems, just to learn to do something like that. The modems use the Clover protocol. I don't know how this programs are usually done. In a few words, in my program the sender split the file to be sent in packets and send them to the modem, the receiver collects them from the modem and merge them in one file. The problem is that I'm not able to synchronize the receiver with the sender, so almost always the receiver start to read the data from the modem too soon, reading the old data in the modem buffer instead of the data to come. If I wait too long, the modem buffer becomes full and I loose data. Of course there is some simple way to solve these problems, but I hasn't been able to find it. Thank you for your help,
> Marco Liva
>
> ________________________________________________________________________
> Offro&Cerco: CASA, LAVORO, VACANZE, ELETTRONICA, INCONTRI. Tutti gli
> annunci sono online su Kataweb all'indirizzo http://www.offroecerco.it
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
