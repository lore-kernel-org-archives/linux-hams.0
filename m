From: Braddock Gaskill <braddock@braddock.com>
Subject: Re: APRS library?
Date: Wed, 10 Mar 2004 18:18:55 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040311001855.GA20040@braddock.com>
References: <20040310023947.GA14019@braddock.com> <Pine.SUN.4.58.0403100901380.25481@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.SUN.4.58.0403100901380.25481@eskimo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <archer@eskimo.com>
Cc: linux-hams@vger.kernel.org

On Wed, Mar 10, 2004 at 09:04:18AM -0800, Curt, WE7U wrote:
> Curt.  One of the Xastir guys.

After doing a bit more digging and asking around, it seems like your
Xastir (107k lines of code), and Ian Wades perl parser (~55 pages of
code), are the ONLY open source APRS parser implementations, and that
creating a fresh one will be a massive job.  It's a shame to see so
much good non-commercial software is close-sourced in the HAM
community.

Do you have any recommendations on perhaps a good place to hook into
Xastir to get the APRS data in a parsed standardized format?  I was
thinking I could pretty easilly externalize the DataRow structure via
a documented TCP port interface so that people could realistically
write new APRS clients.  I could write a little client library to
remotely retrieve parts of the DataRow structure via TCP, and allows
the application programmer to register "data update" callbacks when an
entry is changed.

Any suggestions would be welcome.  I'm hoping to do this in the next
two days before a local HAM weather balloon launch.

	-braddock

