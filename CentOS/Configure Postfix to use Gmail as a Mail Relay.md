Configure Postfix to use Gmail as a Mail Relay
=================

If you have a Gmail account, you can configure your MTA to relay outgoing mail through Gmail. This gives you the benefit of Gmail's reliability and robust infrastructure, and provides you with a simple means of sending email from the command line.

In this tutorial, we will use Postfix as our MTA. Postfix is a free, open-source, actively maintained, and highly secure mail transfer agent.

Install Required Software
------------------------

We will also install mailutils/mailx so that we can send a test email. Where necessary, we will install supplemental SASL libraries.

```bash
yum update && yum install postfix mailx cyrus-sasl cyrus-sasl-plain
```

Configure Gmail Authentication
------------------------------

Create or modify a password file which will be used by Postfix to establish authentication with Gmail. In the authentication information below, replace username with your Gmail username and password with your Gmail password. If you are using a custom Gmail Apps domain name, you may replace gmail.com with your Google Apps domain.

The password file will reside in the Postfix configuration directory. The file can be named whatever you like, but the recommended filename is sasl_passwd.

Postfix configuration files reside in the directory /etc/postfix. Create or edit the password file:

```bash
cat > /etc/postfix/sasl_passwd <<EOF
[smtp.gmail.com]:587    username@gmail.com:password
EOF
```

Save and close the file. Your Gmail password is stored as plaintext, so make the file accessible only by root:

```bash
chmod 600 /etc/postfix/sasl_passwd
```

Configure Postfix
--------------------

There are six parameters which must be set in the Postfix configuration file main.cf. The parameters are:

relayhost, which specifies the mail relay host and port number. The host name will be enclosed in brackets to specify that no MX lookup is required.

`smtp_sasl_security_options`, which in the following configuration will be set to empty, to ensure that no Gmail-incompatible security options are used.

`smtp_sasl_password_maps`, which specifies the password file to use. This file will be compiled and hashed by postmap in a later step.

`smtp___tls___CAfile`, which specifies the list of certificate authorities to use when verifying server identity.

Edit the main Postfix configuration file:
```bash
vi /etc/postfix/main.cf
```
Add or modify the following values:
```
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_security_options =
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt
```
Save and close the file.

Process Password File
---------------------

Use postmap to compile and hash the contents of sasl___passwd. The results will be stored in your Postfix configuration directory in the file sasl_passwd.db.
```bash
postmap /etc/postfix/sasl_passwd
```

Restart Postfix
----------------

Restart the Postfix service, putting your changes into effect.
```bash
systemctl restart postfix.service
```

Enable "Less Secure Apps" In Gmail
--------------------------------
By default, only the most secure sign-ins, such as logging in to Gmail on the web, are allowed for your Gmail account. To permit relay requests, log in to your Gmail account and turn on Allow less secure apps.

For more information, review the Google Support document "Allowing less secure apps to access your account."

Send A Test Email
------------------

Test your new configuration by sending an email using the mail command. Run:
```bash
mail -s "Test subject" recipient@domain.com
```
You will be presented with a blank line (or a CC: field, which you can bypass by pressing Enter). Type the body of your message, pressing Enter for new lines. When you are finished composing the email, type CTRL-D to send it. To cancel the email, press CTRL-C twice.

To send a precomposed email, use the command:
```bash
mail -s "Subject Here" recipient@domain.com < textfile
```
Where textfile is the name of a file containing the text to be sent.

Troubleshooting
------------------
If it's not working, check the logs for any Postfix errors:

```bash
journalctl
```

If you receive authentication errors from Gmail, verify that Allow Less Secure Apps is turned on in your Gmail account settings, as specified in Step 6.

Verify that the password file sasl_passwd exists, and that its contents are formatted correctly, as specified in Step 2. If you make any changes to the password file, make sure to repeat Steps 4 and 5 to hash the new password file and restart Postfix.

If you see any TLS errors, double check the configuration in main.cf as specified in Step 3. If you make any configuration changes, restart Postfix as specified in Step 5.


Adding Users and Aliases
-------------------------
```bash
echo "root:  youraccount@gmail.com" | sudo tee -a /etc/aliases
sudo newaliases
sudo systemctl restart postfix.service
```


[Source](https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/)