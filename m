From: "Gary L. Grebus" <glg@grebus.com>
Subject: Re: 4 port serial card.
Date: Sun, 12 Jan 2003 18:04:49 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E21F491.5010407@grebus.com>
References: <3E20FF68.000003.11949@gizmo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E20FF68.000003.11949@gizmo>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ray Wells <mvc@dodo.com.au>
Cc: linux-hams@vger.kernel.org

Does the documentation describe how to determine which UART is 
interrupting when the card is in single IRQ mode?  If so, you can put it 
in that mode, and use the set_multiport option to setserial.  It might 
be worth trying it as a clone of an AST Fourport card, as that was a 
fairly common multiport board with the features your describe.

	/gary
	K8LT

