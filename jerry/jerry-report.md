# Jerry

This is a pretty quick one.

![](screenshots/nmap-tcp.png)

There's a default Apache Tomcat 7.0.88 installation. We can bruteforce the login with Metasploit.

![](screenshots/mgr-login1.png)

![](screenshots/mgr-login2.png)

Using these credentials, we can upload a jsp reverse shell to the tomcat manager.

![](screenshots/mgr-upload.png)

Although the response from getuid looks weird (since we are in a java-based meterpreter session), we actually already have system privileges. We can find the flags in a folder in the administrator's desktop.

![](screenshots/flags.png)