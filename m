From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: Packet Problem
Date: Wed, 17 Sep 2003 09:32:11 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200309170932.12058.w.knol@niwa.co.nz>
References: <20030916012317.GA9420@leo.tneu.visi.com> <5520000.1063675764@flob> <20030916013740.GA9468@leo.tneu.visi.com>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030916013740.GA9468@leo.tneu.visi.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Neu <tim@tneu.visi.com>, linux-hams@vger.kernel.org

Is your TNC is a TNC-2 (or clone) running TAPR firmware?

If so, and you reset it, beware that the TNC defaults to AWLEN=7 
(7 data-bits).  This may account for the fact KISSATTACH won't talk to 
the unit...

Wilbert, ZL2BSJ
