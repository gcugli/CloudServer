#!/usr/bin/php
<?php
require('fake-smtp/fakeSMTP.php');
$hp = new fakeSMTP;
$hp->serverHello = 'mail.cugli.life ESMTP Postfix'; // Server identity (optional)
$hp->logFile = '/tmp/mailexec-emails.log'; // Log the transaction files (optional)
$hp->receive();
if (!$hp->mail['rawEmail']) {
    exit; // Script failed to receive a complete transaction
}
/* The script returns all the mail parts which you can process
in $hp->mail(array) - read source for all details */


