# bashscripts
Collection of bash-scripts to make things a little bit easier.

The scripts were written for our own internal use, but we thought we should put them here if anyone found them useful. If we make more scripts that may be useful to others, we will put them here as well.

Scripts found on this page:
1. syncdns
2. digit

#### 1. syncdns
Simple bash script that performs a manual `rndc retransfer` followed by a `rndc reload`. Useful for speeding up the synchronization of domain names from a master DNS server to a BIND slave DNS server.

Script should be run on slave DNS server running BIND.

###### Installation
To install, simply put the **syncdns** file in your bin folder and make it executable by issuing the command:
`chmod u+x syncdns`

###### Usage
`syncdns _domain1.com domain2.com domain3.com_`

###### Tips
If you need to add more than 10 domain names at a time, change the last argument in the for statement on line 29:
`for i in ${@:1:10};`

#### 2. digit
Simple bash script that uses the dig command to lookup multiple DNS records for one or more domain names at a time. 

Requires dig to already be installed on the machine.

###### Installation
To install, simply put the **digit** file in your bin folder and make it executable by issuing the command:
`chmod u+x digit`

###### Usage:
`digit _domain1.com domain2.com domain3.com_`

###### Tips
If you need to add more than 10 domain names at a time, change the last argument in the for statement on line 25:
`for i in ${@:1:10};`

If you want to add more record types or change their order, you can do it adjusting this line:

`dig +noall +answer $i A $i AAAA $i NS $i MX $i TXT $i SOA;`

For example, to add DNSKEY, simply add $i (representing the domain name) followed by the record type DNSKEY:

`dig +noall +answer $i A $i AAAA $i NS $i MX $i TXT $i SOA **$i DNSKEY**;`

### License
Unlicense (http://unlicense.org/)

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>