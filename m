From: Miroslav Skoric <skoric@uns.ac.rs>
Subject: Re: [Linux-ham] netrom
Date: Sun, 3 Apr 2016 13:13:29 +0200
Message-ID: <5700FAD9.2000204@uns.ac.rs>
References: <20160401184009.GB25136@belle.intranet.vanheusden.com>
 <56FECDF1.5090701@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <56FECDF1.5090701@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

On 04/01/2016 09:37 PM, David Ranch wrote:

>
>
>> and /etc/ax25/axports contains:
>> ax0    FH2LOR-1    115200    254    1    AX.25 over LoRa
>
> Don't use a name like "ax0" as this device name will be used and shown
> in the output of "ifconfig -a".  In the axports file, I recommend to
> name it say "vhfdrop" or "d710".  Anything will do really.
>

David, in the past I used 'non-ifconfig'-like names (as you suggest) in 
axports and elsewhere. But for the simplicity, some few years ago I 
switched to using the names Folkert uses. And I did not notice any 
functional difference ... Both approaches work for me. Is there any 
requirement or constraint in the kernel, related to that?

Misko

