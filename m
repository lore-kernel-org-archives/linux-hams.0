From: Gordon JC Pearc e <gordonjcp@gjcp.net>
Subject: Re: Node.js and it's future in debian
Date: Thu, 03 May 2012 20:48:24 +0100
Message-ID: <4FA2E108.2060806@gjcp.net>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com>
	<20120501205524.GI30521@flying-gecko.net>
	<20120501215305.GA1250@burratino>
	<20120501221659.GA11430@flying-gecko.net>
	<20120502065003.GB2410@burratino>
	<20120502165031.GC7390@flying-gecko.net>
	<20120502171349.GA23806@burratino>
	<20120502200426.GF7390@flying-gecko.net>
	<4FA2A557.1080103@trinnet.net>
	<20120503170521.GD19468@flying-gecko.net>
	<20120503185129.GA18768@burratino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <pkg-javascript-devel-bounces+glddj-pkg-javascript-devel=m.gmane.org@lists.alioth.debian.org>
In-Reply-To: <20120503185129.GA18768@burratino>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <http://lists.alioth.debian.org/cgi-bin/mailman/options/pkg-javascript-devel>,
	<mailto:pkg-javascript-devel-request@lists.alioth.debian.org?subject=unsubscribe>
List-Archive: <http://lists.alioth.debian.org/pipermail/pkg-javascript-devel>
List-Post: <mailto:pkg-javascript-devel@lists.alioth.debian.org>
List-Help: <mailto:pkg-javascript-devel-request@lists.alioth.debian.org?subject=help>
List-Subscribe: <http://lists.alioth.debian.org/cgi-bin/mailman/listinfo/pkg-javascript-devel>,
	<mailto:pkg-javascript-devel-request@lists.alioth.debian.org?subject=subscribe>
Sender: pkg-javascript-devel-bounces+glddj-pkg-javascript-devel=m.gmane.org@lists.alioth.debian.org
Errors-To: pkg-javascript-devel-bounces+glddj-pkg-javascript-devel=m.gmane.org@lists.alioth.debian.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: debian-hams@lists.debian.org, node@packages.debian.org, nodejs@packages.debian.org

On 03/05/12 19:51, Jonathan Nieder wrote:
. Which package should use the name "node" in the long term?  What
 >      can we do to ensure that happens eventually?
 >
 >      (My answer is that I hope that neither uses the name "node" in
 >      the long term.)

Exactly.  It's a stupidly common term, probably only slightly better 
than calling it "program".

I don't buy into this idea that changing it will break all sorts of 
legacy scripts.  If they are that fragile and undocumented, *get rid of 
them*!  Undocumented fragile code is a liability.  Kill it now, under 
"known" circumstances, and fix it up properly.

-- 
Gordonjcp MM0YEQ
