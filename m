From: Erik Jakobsen <erik_ja@mail.tele.dk>
Subject: Re: gMFSK ?
Date: Wed, 09 Jul 2008 07:40:26 +0200
Message-ID: <48744F4A.60705@mail.tele.dk>
References: <4873C64E.2000105@mail.tele.dk> <20080708213400.GN8136@n0nb.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080708213400.GN8136@n0nb.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Nate Bargmann wrote:
> This is actually two rigctl commands, i: get_split_freq  () and 
> f: get_freq        ()  and should not be confused with the IF; command
> sent to the radio.  When you enter a ? at the Rig command: prompt, you
> will see a list of commands rigctl accepts.  
>
>   
Ok about the ?. I have seen it.
>> TX 3 bytes
>> 0000     49 46 3b       IF;
>> RX 38 characters
>> 0000     49 46 30 30 30 31 34 30 38 30 37 38 30 20 20 20         
>> IF00014080780
>> 0010     20 20 20 30 30 39 30 30 30 20 39 30 30 32 30 30            
>> 009000 900200
>> 0020     30 30 30 38 20 3b                                      0008 ;
>> TX 4 bytes
>> 0000     46 52 30 3b    FR0;
>> TX 4 bytes
>> 0000     46 54 30 3b    FT0;
>> Tx frequency: 14080780
>>
>> TX 3 bytes
>> 0000     49 46 3b       IF;
>> RX 38 characters
>> 0000     49 46 30 30 30 31 34 30 38 30 37 38 30 20 20 20         
>> IF00014080780
>> 0010     20 20 20 30 30 39 30 30 30 20 39 30 30 32 30 30            
>> 009000 900200
>> 0020     30 30 30 38 20 3b                                      0008 ;
>> Rig command: Frequency: 14080780
>>
>> Rig command:                                       
>>
>> In the gMFSK hamlib setup I have this:
>>
>> Kenwood TS570D
>> Port /dev/ttyS0
>> Speed 9600
>>
>> What more shal I have in here to get that part to work ?.
>>     
>
> It has been a long time since I used gMFSK that I've forgotten how it
> is configured.
>
>   
Ok np.
>> When I start up gMFSK it complains abot the port settings
>>     
>
> You did exit rigctl before starting gMFSK, right?
>
>   
Yes I did.
>> Hamlib init: rig_open failed: IO error
>>
>> What to do here ?
>>     
>
> Perhaps you may wish to try Fldigi?  It is actively developed and seems
> to be the successor to gMFSK.  See http://www.w1hkj.com
>
> 73, de Nate >>
>
>   

Maybe I do Nate. I installed it an it's running.
I have downloaded the TS570.xml file and have saved it into the 
/home/.fldigi folder.
I entered the values to match what I prefer:
<PORT>
        <DEVICE>/dev/ttyS0</DEVICE>
        <BAUD>9600</BAUD>
        <STOPBITS>1</STOPBITS>
        <ECHO>false</ECHO>
        <RETRIES>4</RETRIES>
        <TIMEOUT>200</TIMEOUT>
        <WAIT>0</WAIT>
        <DTRINIT>-12</DTRINIT>
        <DTRPTT>false</DTRPTT>
        <RTSINIT>-12</RTSINIT>
        <RTSPTT>false</RTSPTT>
        <RTSCTS>true</RTSCTS>
</PORT>

I f I try to use RigCat, and check the ptt none, as I use a Signalink 
SL1+, the Rig at the bottom of the
fldigi screen is greyed.

Trying to use Hamlib, the Rig opens the RigControl, but I cannot control 
the tranceivers frequencies.

As mentioned, I can get connected with rigctrl's commands.

What am I missing ?

73 de Erik OZ4KK

