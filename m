From: David Wilson <david@wwns.com>
Subject: Re: 4 port serial card. (fwd)
Date: Sun, 12 Jan 2003 18:32:48 -0600 (CST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301130032.SAA17068@wwns.wwns.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> Does the documentation describe how to determine which UART is 
> interrupting when the card is in single IRQ mode?  If so, you can put it 
> in that mode, and use the set_multiport option to setserial.  It might 
> be worth trying it as a clone of an AST Fourport card, as that was a 
> fairly common multiport board with the features your describe.

I believe that was part of the serial driver routine.  It had to handle 
the possibility of more than one chip having data being buffered in the 
serial chips at one time.

Dave


-- 
David R. Wilson  WB4LHO
World Wide Network Services
Nashville, Tennessee USA	Need QSL cards?
david@wwns.com			http://store.wwns.com/lz1jz


