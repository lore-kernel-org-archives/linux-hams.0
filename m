From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: installing Predict on a RedHat 7.3 box , no go :^(
Date: Mon, 16 Dec 2002 12:26:30 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021216102630.GR32122@mea-ext.zmailer.org>
References: <200212151628.02870.n7bfs@qwest.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200212151628.02870.n7bfs@qwest.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Douglas Cole <n7bfs@qwest.net>
Cc: linux-hams@vger.kernel.org

On Sun, Dec 15, 2002 at 04:28:02PM -0800, Douglas Cole wrote:
...
> BUT , it will not even begin to install :^(
> here is what I get when I try to run ./configure on the RedHat box...
> 
> [root@n7bfs predict-2.2.1]# ./configure
> One moment please... installer.c:16:20: curses.h: No such file or directory
> Compilation failed.  Are you sure you have a C compiler (gcc) installed?
> [root@n7bfs predict-2.2.1]#

  You do need   ncurses-devel  package.

...
> tia for any input!
> -- 
> Douglas Cole   N7BFS

73 de Matti Aarnio, OH1MQK
