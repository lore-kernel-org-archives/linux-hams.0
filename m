From: "Richard Pyne" <rpyne@kinfolk.org>
Subject: Storage size of fdset unknown
Date: Tue, 12 Apr 2005 14:21:41 -0600
Message-ID: <425BD975.29343.64841DE@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-description: Mail message body
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I am trying to compile axconv.c on a linux-2.6.11 box and 
keep getting an error of Storage size of 'fdset' is unknown.

The offending line in axconv.c is:
  struct fd_set fdset;

fd_set is defined in /usr/include/sys/select.h

From the gcc preprocessor output, it looks like:

typedef struct
  {
    __fd_mask __fds_bits[1024 / (8 * sizeof (__fd_mask))];
  } fd_set;

Any insights at fixing this will be greatly appreciated. i am 
under the gun to get this whole thing up and running quickly for 
an emergency exercise on thursday.

Thanks.

--Richard

