From: Joop Stakenborg <pa3aba@debian.org>
Subject: Re: Abt gmfsk last version.
Date: Tue, 13 May 2003 16:35:46 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3EC102C2.2000105@debian.org>
References: <3EC0F1C8.6020005@vizzavi.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3EC0F1C8.6020005@vizzavi.pt>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ana Maria Grilo Moreira <ct1drb@vizzavi.pt>
Cc: linux-hams@vger.kernel.org

Ana Maria Grilo Moreira wrote:

> /usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
> undefined reference to `FT_Seek_Stream'
> /usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
> undefined reference to `FT_Get_Short'
> /usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
> undefined reference to `FT_Forget_Frame'
> /usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
> undefined reference to `FT_Access_Frame'
> /usr/lib/gcc-lib/i486-suse-linux/3.2/../../../libpangoft2-1.0.so: 
> undefined reference to `FT_Get_Long'
> collect2: ld returned 1 exit status
> make[3]: *** [gmfsk] Error 1
> make[3]: Leaving directory `/home/ct1drb/gmfsk-0.5/src'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory `/home/ct1drb/gmfsk-0.5/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/ct1drb/gmfsk-0.5'
> make: *** [all] Error 2
> 
> 
> Can anyone help me????

What is your output of freetype-config --cflags ?

> Best 73 to all, till next email
> 
> CT1DRB
> David Quental
> 

Joop PA4TU

