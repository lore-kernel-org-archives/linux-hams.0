From: "Jeff Laughlin" <jeff.laughlin@gmail.com>
Subject: Re: APRS Parser
Date: Mon, 19 Jun 2006 21:29:16 -0700
Message-ID: <8ea83f40606192129t28c742y94299329b8548076@mail.gmail.com>
References: <620c90570606191918h7605ecbax20325ecffe1546e2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570606191918h7605ecbax20325ecffe1546e2@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chuck Hast <wchast@gmail.com>
Cc: linux-hams@vger.kernel.org

I started on an APRS parser written in perl. It handles most of the
major bits of the standard and I used it to dump APRS data into
postgresql and it kept up with the global APRS internet feeds no
problem, in fact I was suprised at how fast it was. It turned out that
PostgreSQL consumed vastly more system resources than the parser and
that was mostly disk IO, CPU load was relatively light. It could
certainly still use some work but it's functional and well documented
and I included example code. You can get it from
http://sourceforge.net/projects/ham-aprs-parser/


On 6/19/06, Chuck Hast <wchast@gmail.com> wrote:
> Folks,
> Was poking around trying to find something to parse aprs data and poke it
> into mysql, thought that I had found something from aprsworld but when I
> went to look at it, it looked like it was only the pieces needed to get the data
> out of the database and into shape files...
>
> I see a lot of comments about such code but the links are dead. Any rec-
> omendations?
>
> --
> Chuck Hast  -- KP4DJT --
> To paraphrase my flight instructor;
> "the only dumb question is the one you DID NOT ask resulting in my going
> out and having to identify your bits and pieces in the midst of torn
> and twisted metal."
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
73 de n1ywb
