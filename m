From: "Richard Pyne" <rpyne@kinfolk.org>
Subject: Re: Storage size of fdset unknown
Date: Tue, 12 Apr 2005 21:35:51 -0600
Message-ID: <425C3F37.24585.7D5C115@localhost>
References: <425BD975.29343.64841DE@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <425BD975.29343.64841DE@localhost>
Content-description: Mail message body
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Well, I found and fixed it. change the line "struct fd_set 
fdset;" to "fd_set fdset;".

--Richard

On 12 Apr 2005 at 14:21, Richard Pyne wrote:

> I am trying to compile axconv.c on a linux-2.6.11 box and 
> keep getting an error of Storage size of 'fdset' is unknown.
> 
> The offending line in axconv.c is:
>   struct fd_set fdset;
> 
> fd_set is defined in /usr/include/sys/select.h
> 
> >From the gcc preprocessor output, it looks like:
> 
> typedef struct
>   {
>     __fd_mask __fds_bits[1024 / (8 * sizeof (__fd_mask))];
>   } fd_set;
> 
> Any insights at fixing this will be greatly appreciated. i am 
> under the gun to get this whole thing up and running quickly for 
> an emergency exercise on thursday.
> 
> Thanks.
> 
> --Richard
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


