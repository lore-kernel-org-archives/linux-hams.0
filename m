From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] node and libax25io nonblocking
Date: Tue, 18 Feb 2003 00:14:00 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030218001400.I801@jeroen.pe1rxq.ampr.org>
References: <20030217215608.A801@jeroen.pe1rxq.ampr.org> <Pine.LNX.4.44.0302180001290.1481-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0302180001290.1481-100000@oh2bns.ampr.org>; from tpm@prkele.tky.hut.fi on Mon, Feb 17, 2003 at 23:13:48 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 2003.02.17 23:13:48 +0100 Tomi Manninen wrote:
> On Mon, 17 Feb 2003, Jeroen Vreeken wrote:
> 
> > The libax25 patch is basicly the same I posted a while back with the
> buffer
> > check added and a few changes to axio_puts(), axio_gets() and
> > axio_getline().
> 
> Question: is this different from the patch I sent you and Craig a few 
> months back? The version that should be in the CVS now (I haven't checked
> 
> the CVS).

Not much, I took your check for the buffer length during init but haven't
taken in the other stuff (mostly IAC rewrite). The big difference is
axio_puts(), axio_gets() and axio_getline() these weren't done yet.

	Jeroen

