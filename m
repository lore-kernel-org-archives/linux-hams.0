From: Jack Zielke <jack@takeovertheworld.org>
Subject: Re: FTP with wncrypted password.
Date: Fri, 09 May 2003 11:13:06 -0400 (EDT)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.33.0305091108160.15079-100000@diablo.takeovertheworld.org>
References: <20030509145648.35959.qmail@web9605.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <20030509145648.35959.qmail@web9605.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: ariel mastracchio <ari197516@yahoo.com>
Cc: linux-hams@vger.kernel.org

>    I'm looking for a ftp server that support encrypted
> password (not SSH or SSL, too much overhead for 1k2

I believe what you want is 'skey'  You should be able to find an ftp
server that has skey support via a web search.  If you have problems
locating the software let me know.

Skey is a one time password implementation.  Each time you log in, your
password becomes useless and you have to use a different one to log in the
next time.  Perfect for 'over the air' as the passwords are not
encrypted because they do not need to be.

Slackware has prebuilt packages for logging in with this system in the
contrib/ham directory.

Jack

-- 
  v,i,j,k,l,s,a[99]; main()   {
for(scanf("%d",&s);*a-s;v=a[j*=v]-a[i],k=i<s,j+=(v=j<s&&(!k&&!!printf(2+"\n\n%c"
-(!l<<!j),"#Q"[l^v?(l^j)&1:2])&&++l||a[i]<s&&v&&v-i+j&&v+i-j))&&!(l%=s),v||(i==j
?a[i+=k]=0:++a[i])>=s*k&&++a[--i]);}    /* Osovlanski and Nissenbaum */

shamelessly stolen from: http://home.wxs.nl/~faase009/Signindex.html

