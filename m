From: "Juraj Buliscak" <buliscakj@eurotel.sk>
Subject: Re: netrom problem?
Date: Mon, 20 May 2002 08:29:59 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <OF09F0774B.6AB114A8-ONC1256BBF.00237D00@eurotel.sk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tpm@prkele.tky.hut.fi, linux-hams@vger.kernel.org


Hi Tomi,

could you tell me, has 2.4.19-pre2 kernel also fix for non blocking
libax25io from Vreeken Jeroen included ?

TNX.

Juraj OM8ACE



                                                                                                                                            
                      Tomi Manninen                                                                                                         
                      <tpm@prkele.tky.hut.f                                                                                                 
                      i>                                                                                                                To: 
                      Sent by:                                                                                                              
                      linux-hams-owner@vger              root <root@hamgate.crb.org.br>                                                     
                      .kernel.org                                                                                                           
                                                                                                                                            
                                                                                                                                            
                      17.05.2002 21:12                                                                                                  cc: 
                      Please respond to tpm                                                                                                 
                                                         <linux-hams@vger.kernel.org>, <radio-lnx@crb.org.br>                               
                                                                                                                                            
                                                                                                                                            
                                                                                                                                            
                                                                                                                                            
                                                                                                                                            
                                                                                                                                            
                                                                                                                                   Subject: 
                                                                                                                                            
                                                         Re: netrom problem?                                                                
                                                                                                                                            
                                                                                                                                            




On Fri, 17 May 2002, root wrote:

> unregister_netdevice: waiting for ax0 become free [245]
>
> This happens only when the system had netrom running, otherwise the
> shutdown or halt is fine.

This is a known problem with the netrom code.

> libax25-0.0.7, ax25-tools-0.0.8 e ax25-apps-0.0.6, kernel 2.4.18-6mdk

You will need to upgrade your kernel. The first kernel that has a fix for
this problem is 2.4.19-pre2.

--
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



