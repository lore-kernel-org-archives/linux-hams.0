From: Tim Neu <tim@tneu.visi.com>
Subject: Re: axspawn and security on the air
Date: Wed, 28 May 2003 10:15:49 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030528151549.GB19391@leo.tneu.visi.com>
References: <3ED4C9DA.6070108@lightningflash.net> <20030528150112.GA19391@leo.tneu.visi.com> <3ED4D137.4020404@lightningflash.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3ED4D137.4020404@lightningflash.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Lance Cotton" <joe@lightningflash.net>
Cc: Tim Neu <tim@tneu.visi.com>, linux-hams@vger.kernel.org

On Wed, May 28, 2003 at 10:09:43AM -0500, J. Lance Cotton wrote:
> I am not serious enough to worry about the SecurID solution. I guess it's 
> not a big deal, since I don't plan on remote adminstering too often.
> 
> I would bet my ham license on being able to use encryption for 
> authentication. I think the FCC looks more at the spirit of the rules than 
> the exact (and ambiguous at times) letter of the rules. So long as you can 
> show that whatever you are encrypting (password) carries no information if 
> asked. The problem would just be possible abuse (I swear that 16k encrypted 
> chunk of data is my password, not an order for 2000 widgets for my 
> company!).
> 
> I just recalled using the s/key one-time-password system at school once, so 
> I will look into that. It seems to be a good solution: secure and 
> low-bandwidth.

The only problem is that with a one-time authentication event, it could be fairly easy to hijack a control session in
mid-stream.   (however remote the possibility may be)

One neat solution might be digitally signing each command that requires authentication - but that is out of my
league! 

Good luck!  73s.   

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
______         _ __                          Military Intelligence
  /           ' )  )        -KC0LQL-         Honest Politician
 / o ______    /  / _  . .                   Intellectual Property  
/ <_/ / / <   /  (_</_(_/_  -- tneu@visi.com / http://www.visi.com/~tneu --
