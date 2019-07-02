# bashscripts
Collection of bash-scripts to make things a little bit easier.

The scripts were written for our own internal use, but we thought we should put them here if anyone found them useful. If we make more scripts that may be useful to others, we will put them here as well.

Scripts found on this page:
1. syncdns
2. digit
3. digit-file

#### 1. syncdns
Simple bash script that performs a manual `rndc retransfer` followed by a `rndc reload`. Useful for speeding up the synchronization of domain names from a master DNS server to a BIND slave DNS server.

Script should be run on slave DNS server running BIND.

###### Installation
To install, simply put the **syncdns** file in your bin folder and make it executable by issuing the command:
`chmod u+x syncdns`

###### Usage
`syncdns domain1.com domain2.com domain3.com`

###### Tips
If you need to add more than 10 domain names at a time, change the last argument in the for statement:
`for i in ${@:1:10};`

#### 2. digit
Simple bash script that uses the **dig** command to lookup multiple DNS records for one or more domain names at a time. 

Requires **dig** to already be installed on the machine.

###### Installation
To install, simply put the **digit** file in your bin folder and make it executable by issuing the command:
`chmod u+x digit`

###### Usage:
`digit domain1.com domain2.com domain3.com`

In addition to the domain name, you can add a set of hostnames that you want to check. Insert any extra hostnames between the parantheses on this line:
`HOSTNAMES=();`

Multiple hostnames should be separated using a space, like this:
`HOSTNAMES=(mail webmail mysql dev);`

(Will lookup A and AAAA records for mail.domain.com, webmail.domain.com and so forth, in addition to domain.com).

###### Tips
If you need to add more than 10 domain names at a time, change the last argument in the for statement:
`for i in ${@:1:10};`

If you want to add more record types or change their order, you can do it adjusting this line:

`dig +noall +answer $i A $i AAAA $i NS $i MX $i TXT $i SOA;`

For example, to add DNSKEY, simply add $i (representing the domain name) followed by the record type DNSKEY:

`dig +noall +answer $i A $i AAAA $i NS $i MX $i TXT $i SOA $i DNSKEY;`

#### 2. digit-file
Works the same way as digit, but uses a text file as input instead of command line arguments.

Domain names you would like to check should be added in a separate file, with one domain name per line, like this:
`domain1.com`
`domain2.com`
`domain3.com`

Use the name of the file containing the list of domain names as argument. For example:
`digit-file domains.txt`

Add any additional hostnames (domain prefixes) to lookup on this line:
`HOSTNAMES=();`

Multiple hostnames should be separated using a space, like this:
`HOSTNAMES=(mail webmail mysql dev);`

###### Installation
To install, simply put the **digit-file** file in your bin folder and make it executable by issuing the command:
`chmod u+x digit`

You should also add a text file containing the domain names to check. The name of the text file should be used as an argument to the digit-file command.

###### Usage:
`digit-file domains.txt`

### License
Unlicense (http://unlicense.org/)

_This is free and unencumbered software released into the public domain.

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

For more information, please refer to <http://unlicense.org>_
