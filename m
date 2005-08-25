From: Chuck Hast <wchast@gmail.com>
Subject: Re: Announcing Trackulator, free open source web based APRS client
Date: Thu, 25 Aug 2005 09:28:09 -0400
Message-ID: <620c90570508250628300db46d@mail.gmail.com>
References: <8ea83f4050824192570f0905a@mail.gmail.com>
	 <20050824203803.6af39d62.washer@trlp.com>
	 <8ea83f405082505471872e625@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <8ea83f405082505471872e625@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Laughlin <jeff.laughlin@gmail.com>
Cc: James Washer <washer@trlp.com>, Linux-Hams@vger.kernel.org

On 8/25/05, Jeff Laughlin <jeff.laughlin@gmail.com> wrote:
> Hi Jim,
> 
> It's still in alpha, there's a lot of work yet to be done and a lot
> functionality still missing. Eventually I hope it becomes at least as
> good as, if not better than findu.com. I operate under the credo of
> "release early, release often".
> 
> I went with PostgreSQL because
> 1) It's an extremely reliable and feature rich heavyweight multiuser
> RDBMS system that takes care of problems like concurrency for me so I
> don't have to and offers room for future growth.
> 2) SQL in general will give us a lot of flexability in the types of
> queries we can perform against the database.
> 3) PostgreSQL has the PostGIS extension which adds data types, index
> functions, and operators for complex geometric and geographic
> operations. For example, with PostGIS it would be trivial to get a set
> of all APRS stations within any polygon such as a range report, NWS
> watchbox, or any other geographic area that can be described as a
> polygon with any number of points.
> 4) Why NOT use SQL? It's the standard database query language. If
> PostgreSQL is too onerous you could try to make it go with SQLite or
> something.
> 
> On 8/24/05, James Washer <washer@trlp.com> wrote:
> > When I went to your website and entered a call, I got a simple map of the current location. Perhaps I'm missing something, or there's more funcionality to be added later.. but why all the trouble of an SQL database, if we are only going to look at the last posit?

I do not know about this, I hope to start trying to soon as it is the sort of
thing I do at work.

I do RF coverage studies and we have developed our own software to do
such work, it has evolved to where all transactions go through the db, even
if I just want to run a quick test on a single point the data gathering piece
talks to the db and then I can look at the data with ANY tool I want and not
have to worry about the rf tool and the data manipulation tool talking to each
other, the db becomes the 'dmark' between the rf tool and the data manipulation
tools, and besides you get a history just in case you need it later for whatever
reason, and believe me you always find a reason to have to go back and look
at it.

Now if we can just get our ham radios to put out RSSI and other environmental
data in a common format, then I can run me a amateur radio on a amateur
channel while gathering stats on commercial stuff and gather a bit of data on
ham networks... Of course given the grand way in which the manufacturers
work together that will happen when hell freezes over... B-b;;;;,,,...
-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
