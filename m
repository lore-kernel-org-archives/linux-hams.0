From: John Ackermann N8UR <jra@febo.com>
Subject: Re: Slightly OT: Perl question
Date: Sat, 15 Mar 2003 17:54:18 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <34100000.1047768858@[192.168.1.1]>
References: <28850000.1047756287@[192.168.1.1]>
 <20030315224604.GA18830@silly.cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030315224604.GA18830@silly.cloud.net.au>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: linux-hams@vger.kernel.org

Thanks, Hamish.  I don't know why it didn't work when I tried something 
similar to that before.  I'll give it another go.

73,
John

--On Sunday, March 16, 2003 09:46:04 +1100 Hamish Moffatt 
<hamish@cloud.net.au> wrote:

> On Sat, Mar 15, 2003 at 02:24:47PM -0500, John Ackermann N8UR wrote:
>> I need to:
>>
>> (a) test whether one bit of a byte is set or not (e..g, is bit 5 of
>> $myvar  a 1 or a 0);
>>
>> and
>>
>> (b) do a binary AND of two bytes (in other words, apply a bitmask).
>
> Binary AND is the "&" operator as in C. So
>
> $c = $a & $b;
> $y = $x & 0xFF;
>
> etc achieves (b), and similarly for (a),
>
> if ($myvar & 0x20) {
>     ....
> }
>
> or perhaps more readably:
>
> if ($myvar & (1 << 5)) {
>     ....
> }
>
>
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
>
>


