From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Quesion: AX.25 socket data corruption
Date: Sun, 15 Mar 2020 10:29:41 -0700
Message-ID: <bcee9062-8e2c-5c64-112f-e8ce3c3e2129@trinnet.net>
References: <CAJ4MR4Z=DQQ=cZoKb=7vS+5nx0u9AhTxjeApsmKW2K2WRx-bhw@mail.gmail.com>
 <CAJ4MR4bWV4FyiyyUmRLVgn84fq_uTyJRchwHYx2=rmBzL1KhDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAJ4MR4bWV4FyiyyUmRLVgn84fq_uTyJRchwHYx2=rmBzL1KhDQ@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Ivan,

Thank you for posting this video and bug report at=20
https://github.com/ve7fet/linuxax25/issues/9#issuecomment-599236879 . =20
With this easier to reproduce scenario, maybe we can find a kernel=20
developer to help us debug and fix this issue.  Finding this resource to=20
fix this has been a serious challenge so far.

--David
KI6ZHD


On 03/15/2020 09:42 AM, Ivan Savitsky wrote:
> Now I ran out of ideas while debugging my proxy.c.
> It really looks like indeed there is a system buffer corruption during
> the write() into SOCK_SEQPACKET socket.
>
> Today I did what I had to do in the first place before anything else =E2=
=80=94
> tried something that worked before for years.
> I log in into the remote system via AX.25 SVC  by using the 'call'
> utility and see if the in/out data is consistent.
> What I found: there is a data corruption there as well. I recorded a
> short video where hexdump output misalignment
> is shown. Here is the YouTube link if anyone interested:
> https://youtu.be/K4vhCXLK1b0
>
> With best regards,
> Ivan


