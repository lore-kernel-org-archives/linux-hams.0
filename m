From: <Morgan.Wemanis@mark.se>
Subject: Design problem in convers daemon.
Date: Wed, 27 Aug 2003 22:50:52 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <15F2A301AB74C44A995781A937567A7C010A6DCE@markadmex01.adm.mark.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Design problem in conversd software that can trigger buffer overflows.

appendstring() function call seems preventing to exploit these overflows,
so worst case is DoS (no fun), when the convers daemon crashes.

----
conversd.c: main()
{
char buffer[2048]; // read() buffer is 2048 bytes
....

size = read(cp->fd, buffer, sizeof(buffer)); // Lets read some input
....

// cp->ibuf is 2048. it's a null-terminated string. read not more than 2047 characters
for (i = 0; i < size; i++)
....

}
----

Well, we can't trigger any buffer overflow here.

Lets se whats happening into "/Query" function for a example.

----
user.c: query_command()
{
char buffer[2048]; // Okay, we have only 2048 bytes to play with here to..
....

toname = getarg(0, 0); // Get our argument to /Query cmd that is 2043 bytes.
....

// We have no such user to query, so notify user about that.
sprintf(buffer, "*** (%s) No such user: %s.\n", ts2(currtime), toname);
....

/*

 Lets see..

 - "toname" is 2043 bytes
 - sprintf text is 25 bytes.
 - "buffer" can hold maximum 2048 bytes
 -  2043 + 25 = 2068 bytes

 Eh? What? Thats a overflow of the buffer with 20 bytes!
 
*/

}
----

Example output from gdb.

Program received signal SIGSEGV, Segmentation fault.
0x8049a9b in appendstring (cp=0x8000a2e, string=0xbfffdf08 "*** (23:47) No such user: ", 'b' <repeats 174 times>...)
    at conversd.c:284
284             if (cp->type != CT_HOST && strncmp(string, "/\377\200", 3)) {
(gdb) bt 
#0  0x8049a9b in appendstring (cp=0x8000a2e, string=0xbfffdf08 "*** (23:47) No such user: ", 'b' <repeats 174 times>...)
    at conversd.c:284
#1  0x805c3fe in query_command (cp=0x8000a2e) at user.c:2471
#2  0x62626262 in ?? ()
Cannot access memory at address 0x62626262
(gdb) 


73 de Morgan, sm6tky

