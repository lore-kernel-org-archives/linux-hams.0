From: don <don_reid@comcast.net>
Subject: Re: Soundmodem - suppresing initial xmit
Date: Sat, 17 Nov 2007 19:59:58 -0800
Message-ID: <20071118035958.GA17161@reid1.localdomain>
References: <20071116163231.GA9559@reid1.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20071116163231.GA9559@reid1.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Thanks for the replies on my soundmodem question.  However I don't think
they covered what is happening.

Here is what comes out whenever I start soundmodem:

-----------------------------------------------------------------------
Tx: fm W7DMR-0 to QST-0 UI  pid=CC
E..~..@....r.............j..............._services._dns-sd._udp.local............_workstation._tcp.#.4...........reidmob1 [].4

Tx: fm W7DMR-0 to QST-0 UI  pid=CC
E.....@....................9.............reidmob1 []._workstation._tcp.local......reidmob1.*.....1.0.0.10.in-addr.arpa......5.......x.......D.......x...5.5.
.....x...I686.LINUX...!.....x.........5.............

Tx: fm W7DMR-0 to QST-0 UI  pid=CC
E.....@....................9.............reidmob1 []._workstation._tcp.local......reidmob1.*.....1.0.0.10.in-addr.arpa......5.......x.......D.......x...5.5.
.....x...I686.LINUX...!.....x.........5.............

Tx: fm W7DMR-0 to QST-0 UI  pid=CC
E.....@....1.............................reidmob1 []._workstation._tcp.local.............reidmob1.*.......x.......1.0.0.10.in-addr.arpa........x...<.<.
.....x...I686.LINUX...!.....x.........<

Tx: fm W7DMR-0 to QST-0 UI  pid=CC
E..~..@....r.............j..............._services._dns-sd._udp.local............_workstation._tcp.#.4...........reidmob1 [].4

Tx: fm W7DMR-0 to QST-0 UI  pid=CC
E.....@....1.............................reidmob1 []._workstation._tcp.local.............reidmob1.*.......x.......1.0.0.10.in-addr.arpa........x...<.<.
.....x...I686.LINUX...!.....x.........<

Tx: fm W7DMR-0 to QST-0 UI  pid=CC
E.....@....8...............]............._services._dns-sd._udp.local............_workstation._tcp.#.4...........reidmob1 [].4.T............T.!.....x.........reidmob1.#.........x......

Tx: fm W7DMR-0 to QST-0 UI  pid=CC
E.....@....1.............................reidmob1 []._workstation._tcp.local.............reidmob1.*.......x.......1.0.0.10.in-addr.arpa........x...<.<.
.....x...I686.LINUX...!.....x.........<

Tx: fm W7DMR-0 to QST-0 UI  pid=CC
F..(..@................."...............
-----------------------------------------------------------------------

This mostly looks like some sort of networking stuff.

Don - W7DMR


On Fri, Nov 16, 2007 at 08:32:31AM -0800, don wrote:
> When I start soundmodem, it sends out several transmissions.
> They are addressed to "QST-0" and identify my workstation.
> 
> Is there a simple way to suppres these?  They are fairly long
> and sometimes I just want to listen to packets (like on an APRS freq).
> 
> Don - W7DMR
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
