From: "Stuart Longland (VK4MSL)" <me@vk4msl.yi.org>
Subject: Re: [PATCH 1/2] kissattach: Add support for pty symlinking
Date: Wed, 15 Jul 2015 06:04:47 +1000
Message-ID: <55A56B5F.5010904@vk4msl.yi.org>
References: <1435460682-27595-1-git-send-email-me@vk4msl.yi.org> <1435460682-27595-2-git-send-email-me@vk4msl.yi.org> <55A4D39A.6000200@bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <55A4D39A.6000200@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wharms@bfs.de
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Stuart Longland <stuartl@longlandclan.yi.org>

Hi Walter,
On 14/07/15 19:17, walter harms wrote:
> Am 28.06.2015 05:04, schrieb me@vk4msl.yi.org:
>> From: Stuart Longland <stuartl@longlandclan.yi.org>
>> -	fprintf(stderr, "usage: %s [-b] [-l] [-m mtu] [-v] tty port [inetaddr]\n", progname);
>> +	fprintf(stderr, "usage: %s [-b] [-l] [-m mtu] [-v] [-o user:group] [-p mode] tty port [inetaddr]\n",
>> +			progname);
> hi Stuart,
> what was the model for you cli ? i was looking at 'install' and it uses
> -g group
> -o owner
> -m mode

Well, -m was already taken with MTU and I didn't want to break backward
compatibility, so I was thinking along the lines of "permissions" and
"ownership", hence -p and -o.

I could split ownership into -u (user) and -g (group) however people are
probably used to chown specifying ownership as user:group.

>> +		/* Are we being asked to chown? */
>> +		if (pty_owner_user) {
>> +			/* Look up the user */
>> +			struct passwd user;
>> +			struct passwd* user_ptr = NULL;
>> +			struct group grp;
>> +			struct group* grp_ptr = NULL;
>> +			char buffer[512];
>> +			int err = getpwnam_r(pty_owner_user, &user,
>> +				buffer, sizeof(buffer)-1, &user_ptr);
> 
> why _r ? any need to make it thread safe ?
> 
> just my 2 cents,
> re,
>  wh

Call it paranoia, or an allergy to the non-threadsafe versions of the
function. :-)

I have a similar allergy to `int` and `unsigned int` for what it's
worth, preferring to use stdint.h or as a fallback, `char`, `short`,
`long` and `long long` since those are at least guaranteed to be a
certain size. (That said: I have seen a system where char was two bytes.)
-- 
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.
