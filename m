From: Bob Snyder <rsnyder@toontown.erial.nj.us>
Subject: Re: Compiling last node version.
Date: Sat, 06 Mar 2004 15:07:00 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <404A2F64.3030700@toontown.erial.nj.us>
References: <200403050009.02359@www.cabodesantapola.org> <20040305002912.GA6825@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040305002912.GA6825@cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hamish Moffatt wrote:
> On Fri, Mar 05, 2004 at 12:09:01AM +0100, Ruben Navarro Huedo wrote:
> 
>>dpkg-checkbuilddeps: Unmet build dependencies: debhelper (>=4)
[...]
> Install the missing build dependencies ie debhelper >= 4.

Or even simpler: "apt-get build-dep libax25" which will install the 
build dependencies for libax25, assuming they can be met with the 
package sources you have defined.

Or live in the fast and mildly dangerous lane by running debian 
unstable, or less risky, debian testing. :-)

Bob N2KGO

