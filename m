From: Richard Stearn <richard@rns-stearn.co.uk>
Subject: Re: Wireshark ax25 dissector
Date: Wed, 02 Mar 2022 20:03:47 +0000
Message-ID: <621FCDA3.9030908@rns-stearn.co.uk>
References: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu> <621F8677.3000008@rns-stearn.co.uk> <ad99bc17-9a89-9524-b7d8-81a4582e0380@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <ad99bc17-9a89-9524-b7d8-81a4582e0380@trinnet.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

David Ranch wrote:
> 
> Hello Richard,
> 
> Ah... I think I understand now and this more of an AX-IP filter and not 
> a standard AX.25 callsign filter.  I guess the more appropriate filter 
> name should be "ax25.srcmac"?

It is applying the filter to the ax25.src fields but the callsign parser that 
should convert an ax25 callsign to the bit pattern for comparison is incomplete
so only a hexadecimal comparison field can be used.

in epan/ftypes/ftype-bytes.c the following function in incomplete:

static gboolean
ax25_from_unparsed(fvalue_t *fv, const char *s, gboolean allow_partial_value, 
LogFunc logfunc)
{
         /*
          * Don't log a message if this fails; we'll try looking it
          * up as another way if it does, and if that fails,
          * we'll log a message.
          */
         if (bytes_from_unparsed(fv, s, TRUE, NULL)) {
                 if (fv->value.bytes->len > FT_AX25_ADDR_LEN) {
                         logfunc("\"%s\" contains too many bytes to be a valid 
AX.25 address.",
                             s);
                         return FALSE;
                 }
                 else if (fv->value.bytes->len < FT_AX25_ADDR_LEN && 
!allow_partial_value) {
                         logfunc("\"%s\" contains too few bytes to be a valid 
AX.25 address.",
                             s);
                         return FALSE;
                 }

                 return TRUE;
         }

         /*
          * XXX - what needs to be done here is something such as:
          *
          * Look for a "-" in the string.
          *
          * If we find it, make sure that there are 1-6 alphanumeric
          * ASCII characters before it, and that there are 2 decimal
          * digits after it, from 00 to 15; if we don't find it, make
          * sure that there are 1-6 alphanumeric ASCII characters
          * in the string.
          *
          * If so, make the first 6 octets of the address the ASCII
          * characters, with lower-case letters mapped to upper-case
          * letters, shifted left by 1 bit, padded to 6 octets with
          * spaces, also shifted left by 1 bit, and, if we found a
          * "-", convert what's after it to a number and make the 7th
          * octet the number, shifted left by 1 bit, otherwise make the
          * 7th octet zero.
          *
          * We should also change all the comparison functions for
          * AX.25 addresses check the upper 7 bits of all but the last
          * octet of the address, ignoring the "end of address" bit,
          * and compare only the 4 bits above the low-order bit for
          * the last octet, ignoring the "end of address" bit and
          * various reserved bits and bits used for other purposes.
          *
          * See section 3.12 "Address-Field Encoding" of the AX.25
          * spec and
          *
          * 
http://www.itu.int/ITU-R/terrestrial/docs/fixedmobile/fxm-art19-sec3.pdf
          */
         logfunc("\"%s\" is not a valid AX.25 address.", s);
         return FALSE;
}


-- 
Regards
	Richard
