From: Arno Verhoeven <pe1icq@sharon.esrac.ele.tue.nl>
Subject: Re: Which tone comes first?
Date: Sun, 11 Jun 2006 21:41:30 +0200
Message-ID: <448C71EA.60007@sharon.esrac.ele.tue.nl>
References: <448C6D95.2080007@sharon.esrac.ele.tue.nl> <courier.448C6F3D.0000325B@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <courier.448C6F3D.0000325B@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Platt <dplatt@radagast.org>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On 2006-06-11 21:30, Dave Platt wrote:
>> With 1200bd AFSK NRZI a logical 1 is transmitted as a constant tone, and 
>> a logical 0 as a change in tone.
>> I'm wondering which tone comes first when we start a sequence. Should it 
>> start with 1200 Hz or start with 2200 Hz? Or doesn't it make any difference?
>>     
>
> It really doesn't matter.  Use whichever you wish, or switch
> deterministically or randomly on each individual packet transmssion.
> At the receiving end, all "knowledge" of the actual tone being
> transmitted is wiped out by the first stage of the NRZI detector,
> which simply compares current-tone to previous-tone via an XOR
> arrangement.
>   
Thanks. That's what I thought. But I'm having some problems with a 
particular setup using a PIC to genrate the tones. I will have to play 
with it some more...

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org 

