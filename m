From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH] Masking bug in 6pack driver?
Date: Thu, 23 Nov 2006 18:43:27 +0000
Message-ID: <20061123184327.GA6926@linux-mips.org>
References: <20061123185810.f86d7225.khali@linux-fr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20061123185810.f86d7225.khali@linux-fr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: Andreas Koensgen <ajk@iehk.rwth-aachen.de>, linux-hams@vger.kernel.org

On Thu, Nov 23, 2006 at 06:58:10PM +0100, Jean Delvare wrote:

> Looks like a broken masking to me, binary not is used where bitwise not
> was intended.

Amazing ...

Forwarded to upstream; with a bit of luck your fix will still make it
into 2.6.19.

   Ralf
