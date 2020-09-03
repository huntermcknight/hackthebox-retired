# OpenAdmin

## Summary

**Vulnerability Exploited:** OpenNetAdmin 18.1.1 RCE

**Privilege Escalation Vulnerability:** Low-privilege user can sudo nano

## Summary

### Initial Foothold

We can begin enumerating with nmap and gobuster, but we initially do not find much that is particularly compelling.

![](screenshots/nmap-tcp.png)

![](screenshots/gobuster.png)

The we directories found by gobuster appear to be website templates by Colorlib with little original content. There's nothing to do but start investigating them manually.

![](screenshots/music.png)

Clicking Login on the music template redirects us to /ona, an OpenNetAdmin installation.

![](screenshots/ona.png)

There is a publicly available exploit to get a webshell through this version of OpenNetAdmin.

![](screenshots/searchsploit-opennetadmin.png)

We can use this exploit to upload our trusty php reverse webshell.

![](screenshots/ona-exploit.png)

![](screenshots/www-proof.png)

### User Flag

Poking around the ONA installation internally, we find that the local database config file contains a plaintext password.

![](screenshots/ona-local-database-config.png)

We can use this password to log in as jimmy through SSH.

![](screenshots/jimmy-proof.png)

Jimmy has permission to access /var/www/internal. Investigating the index.php and main.php files in this directory, we find that we can access joanna's ssh key .

![](screenshots/internal-index-php.png)

![](screenshots/internal-main-php.png)

Crackstation.net finds the password hashed in index.php is "Revealed".

![](screenshots/crackstation.png)

It appears the internal webserver runs on port 52846.

![](screenshots/internal-port.png)

We can create an ssh tunnel to access the internal directory from our local browser.

![](screenshots/tunnel.png)

![](screenshots/internal-login.png)

![](screenshots/key.png)

The key is passphrase protected, but we can crack it with John the Ripper.

![](screenshots/john.png)

With this, we can log in as joanna and snag the user flag.

![](screenshots/joanna-proof.png)

### Root Flag

We find that joanna can sudo nano.

![](screenshots/sudo-l.png)

Like most terminal-based text editors, nano can be used to spawn a shell, so we can use sudo nano to spawn a shell, as documented on [GTFOBins](https://gtfobins.github.io/gtfobins/nano/).

![](screenshots/root-proof.png)