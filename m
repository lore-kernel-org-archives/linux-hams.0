From: Jonathan Naylor <jonathan@mechserv.demon.co.uk>
Subject: Re: ANN: UKW Tools 0.3.2 released
Date: Wed, 10 Mar 2004 17:50:53 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Hh0gETA9V1TAFwRU@mechserv.demon.co.uk>
References: <dFemtxAWHhTAFwRT@mechserv.demon.co.uk> <404F5371.4070704@scs.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <404F5371.4070704@scs.ch>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Thomas Sailer <sailer@scs.ch>
Cc: linux-hams@vger.kernel.org

Hi Thomas

I hope things are well with you.

>Soft decision decoding of block codes is hard to do efficiently. In 
>fact I don't
>know any algorithm that does it efficiently. That's why normally a 
>convolutional code
>is used as inner code 8-)

I agree entirely, that would be my choice also. Concatenated codes is a 
much nicer way to do it BUT I am trying to clone JT65 and Joe Taylor 
used a soft decision RS decoder to gain 2dB advantage over a standard RS 
decoder, he didn't use a Convolution code as a front end. Unfortunately 
he signed a NDA to get the code from someone so I can't just use what he 
uses. I am not very happy about it.

I'm not too worried about efficiency since the decoding will not be done 
in real-time so if it takes many seconds to decode a message, then so be 
it. So if you have access to an inefficient soft decision RS decoder, I 
would still be interested :-)

I could use a standard RS decoder but I would lose 2dB which would make 
my decoder somewhat ineffective on an EME path compared to his.

>Tom

Jonathan
