From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: AX.25, NETROM and ROSE changes in 2.6.17
Date: Sun, 21 May 2006 23:51:38 +0200
Message-ID: <4470E0EA.70104@ccr.jussieu.fr>
References: <20060506223800.GA4419@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060506223800.GA4419@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Ralf Baechle DL5RB wrote :

> For those who haven't read my recent patches I'd like to point out that
> in the next kernel release, 2.6.17 the units for the AX.25 timers T1,
> T2 and T3 will change to use ms for all platforms away from the
> previous chaos of version, architecture, platform and configuration
> dependentant chaos.  I've tried to explain things on
> 
>   http://www.linux-ax25.org/wiki/Run_time_configurable_parameters
>   http://de.linux-ax25.org/wiki/Laufzeiteinstellungen
> 
>   (1st page in English, 2nd in German)
> 
> This matters to any sysadmin that is modiyfing the values from their
> defaults.
> 
>   Ralf
> -

I have just installed kernel 2.6.16.17 and patched it with your postings.
I compiled the kernel with the 1000 Hz timing option.

I wanted to compare my runtime AX25 parameters with your tables in
http://www.linux-ax25.org/wiki/Run_time_configurable_parameters

Here is what is listed when printing /proc/sys/net/ax25/ax0

  ll /proc/sys/net/ax25/ax0/
total 0
-rw-r--r--  1 root root 0 mai 21 23:25 ax25_default_mode
-rw-r--r--  1 root root 0 mai 21 23:25 backoff_type
-rw-r--r--  1 root root 0 mai 21 23:25 connect_mode
-rw-r--r--  1 root root 0 mai 21 23:25 dama_slave_timeout
-rw-r--r--  1 root root 0 mai 21 23:25 extended_window_size
-rw-r--r--  1 root root 0 mai 21 23:25 idle_timeout
-rw-r--r--  1 root root 0 mai 21 23:25 ip_default_mode
-rw-r--r--  1 root root 0 mai 21 23:25 maximum_packet_length
-rw-r--r--  1 root root 0 mai 21 23:25 maximum_retry_count
-rw-r--r--  1 root root 0 mai 21 23:25 protocol
-rw-r--r--  1 root root 0 mai 21 23:25 standard_window_size
-rw-r--r--  1 root root 0 mai 21 23:25 t1_timeout
-rw-r--r--  1 root root 0 mai 21 23:25 t2_timeout
-rw-r--r--  1 root root 0 mai 21 23:25 t3_timeout

It appears that dama_slave_timeout and protocol parameters are not in 
the AX25 table.

  ll /proc/sys/net/netrom/
total 0
-rw-r--r--  1 root root 0 mai 21 23:36 default_path_quality
-rw-r--r--  1 root root 0 mai 21 23:36 link_fails_count
-rw-r--r--  1 root root 0 mai 21 23:36 network_ttl_initialiser
-rw-r--r--  1 root root 0 mai 21 23:36 obsolescence_count_initialiser
-rw-r--r--  1 root root 0 mai 21 23:36 reset
-rw-r--r--  1 root root 0 mai 21 23:36 routing_control
-rw-r--r--  1 root root 0 mai 21 23:36 transport_acknowledge_delay
-rw-r--r--  1 root root 0 mai 21 23:36 transport_busy_delay
-rw-r--r--  1 root root 0 mai 21 23:36 transport_maximum_tries
-rw-r--r--  1 root root 0 mai 21 23:36 transport_no_activity_timeout
-rw-r--r--  1 root root 0 mai 21 23:36 transport_requested_window_size
-rw-r--r--  1 root root 0 mai 21 23:36 transport_timeout

reset parameter is not listed. Not ajustable ?


Here is the listing of ROSE parameters :

  ll /proc/sys/net/rose/
total 0
-rw-r--r--  1 root root 0 mai 21 23:33 acknowledge_hold_back_timeout
-rw-r--r--  1 root root 0 mai 21 23:33 call_request_timeout
-rw-r--r--  1 root root 0 mai 21 23:33 clear_request_timeout
-rw-r--r--  1 root root 0 mai 21 23:33 link_fail_timeout
-rw-r--r--  1 root root 0 mai 21 23:33 maximum_virtual_circuits
-rw-r--r--  1 root root 0 mai 21 23:33 no_activity_timeout
-rw-r--r--  1 root root 0 mai 21 23:33 reset_request_timeout
-rw-r--r--  1 root root 0 mai 21 23:33 restart_request_timeout
-rw-r--r--  1 root root 0 mai 21 23:33 routing_control
-rw-r--r--  1 root root 0 mai 21 23:33 window_size

Again, parameter no_activity_timeout is not in the ROSE table.

Any explanations ?

73 de Bernard, f6bvp

http://f6bvp.org
http://rose.fpac.free.fr/MINI-HOWTO/
http://rose.fpac.free.fr/MINI-HOWTO-FR/

