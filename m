From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: suggestions to ax25rtd, ax25d and axspawn
Date: Wed, 19 Jun 2002 21:38:48 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020619193848.GA21764@x-berg.in-berlin.de>
Reply-To: thomas@x-berg.in-berlin.de
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

hi,

i'd like to announce / diskuss some issues i found with the ax25-tools
and -apps over the years.

I. ax25rtd
----------
ax25rtd in newer versions does not learn ip routes / arp / mode

there's a -only in the README.ax25rtd mentioned- quite new option:
"ip-encaps-dev".
when ax25rtd has a new route, it checks if "ip-encaps-dev" is set to one
of your ax25-interfaces. if not, it will drop the route / arp / mode.

as default, ip-encaps-dev is initialized to "", which means that it
will never find an appropriete interface, and thus will learn no routes
at all.

it's not clear to me what's the idea behind the ip-encaps-dev option,
but i think there may be some thinkable configurations where it's useful that
every route that is learned will be mapped to that specaial interface,
regardless where it has been learned from.

the problem with this extension (which is a configuration variable in the
global section) is, that if you even set it to one of your interfaces,
actually only _one_ of your ax25 devices could learn new routes.

my solution to this problem is this little change in ax25rtd/listener.c:
568c568
<               if ((config = dev_get_config(ip_encaps_dev)) == NULL)
---
>               if (*ip_encaps_dev && (config = dev_get_config(ip_encaps_dev)) == NULL)

thanks to lutz <dl9cu> for his help to track down this problem.


II. axspawn.c:
--------------
- axspawn has problems when sending tons of data to the user (yes, i really
  uuencoded /vmlinuz for my tests ;) because it writes the data to the
  ax25-socket without checking the return value of the write to the socket
  (length of data successfully written), which is quite often smaller than
  expected (the kernel-space buffers become full).
  btw, kernel 2.4.x seems to make more usage of ret = -1 (errno -EAGAIN).
- if you like the //comp standard for ax25 text compression, you will like
  this version too. thanks to thomas <dg1rtf> for doing the initial port.
- axspawn adds -when account generation is on- new users to the passwd file
  with a "+" as password in the password field.
  i do admit that this is a good (secure) default for a standard-user home
  installation where his pc is also connected to the internet.
  on the other hand, if you have axspawn on your radio-only linux digi,
  you might want not only ax25 login for your users, but also provide
  telnet access, pop3/imap services (which are password authenticated),
  etc..
  our axspawn now uses useradd(8) for account generation and has an
  option for creating accounts with empty passwords. it's configurable
  in axspawn.conf without recompile.
  default is still the old (secure) behaviour.


III. ax25d
----------
you use linux in an ampr-IP environment? if your users or neighbour-digi's
take advantage of ax25.ip.tcp modeVC, your may have seen the following
problems:
- the ax25 SABM will trigger a (senseless) unix shell login for the
  connecting call
- your PID=text login message may trigger a shell login on the remote side ->
    - the shells may have much fun in exchanging their error-messages
    - the remote site may prompt for a password, and will disconnect the
      ax25 link layer after 60s login timeout. for the next IP modeVC frame,
      the same story will begin from new
    - the link is filled with more traffic than needed
- you may disable ax25-login for some well known users / hosts by adding
  their calls to ax25d.conf ->
    - for every ax25 connection an axspawn process will be started (which
      at least idles and consumes memory)
    - it's unix - isn't it better if the system is smart enough to
      auto-learn the appropriate action?

my patch brings some new parameters to ax25d.conf, starting with
"parameters_extAX25". [i'm not really happy with the names]
you may configure ax25d to react on some common situations:
  - you want ax25d to wait for an intitial line before spawning axspawn,
    like NOS did?
      -> VC-wait-login
  - you dislike "*** link failure with XXX" ax25-PID=TEXT messages to
    cause a unix login?
      -> VC-disc-on-linkfailure-msg
  - you don't like modeVC at all? -> VC-reject-login
      - you want to send the reason for the active disconnect (helps
        debuging the situation on the remote site)?
	  -> VJ-send-failure-msg
  - you like to log ax25d's actions? -> VC-log-connections


my ax25d determines if a connecting ax25-user is more likely
a modeVC-user than a shell-user by checking the ax25rtd-database,
if a mode-VC entry for this call+ssid exists.
if not, the normal process (usually axspawn) will be started.
this determination is done by executing ax25rtctl. this could be better
done by talking directly to ax25rtctl via it's unix socket. but due
to the fact that ax25d is in another package than ax25rtd, and because
there exist many ideas where in the linux FHS his socket is located,
it was sufficient for me to do it this way.


the described changes could be found in my browsable CVS:
http://x-berg.in-berlin.de/cgi-bin/viewcvs.cgi/ampr/patches/linux-ax25/

73,
	- thomas <dl9sau>   db0tud team
