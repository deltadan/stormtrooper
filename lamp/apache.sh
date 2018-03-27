#!/bin/bash
###########################################################################################
# Stormtrooper Project 
# MIT License - https://github.com/deltadan/stormtrooper
# Copyright (c) 2018 Dan Patrick - @deltadan
#
#Script Purpose
# - install a LAMP
# - create a Sample PHP app
###########################################################################################

apt-get update
apt-get -y install apache2 php7.0 libapache2-mod-php7.0
apt-get -y install php-mysql
sudo a2enmod php7.0

echo \<center\>\<h1\>Lamp Demo PHP App running on `hostname` \</h1\>\<br/\>\</center\> | tee -a /var/www/html/demoapp.php
echo \<\?php | tee -a /var/www/html/demoapp.php
echo \$servername \= \"mysql\"\;  | tee -a /var/www/html/demoapp.php
echo \$username \= \"root\"\;  | tee -a /var/www/html/demoapp.php
echo \$password \= \"mySQLPassw0rd\"\;  | tee -a /var/www/html/demoapp.php
echo try \{  | tee -a /var/www/html/demoapp.php
echo     \$conn \= new PDO\(\"mysql\:host\=\$servername\;dbname\=myDB\"\, \$username\, \$password\)\;  | tee -a /var/www/html/demoapp.php
echo     \$conn\-\>setAttribute\(PDO\:\:ATTR_ERRMODE\, PDO\:\:ERRMODE_EXCEPTION\)\;  | tee -a /var/www/html/demoapp.php
echo    "echo \"Connected successfully\";"  | tee -a /var/www/html/demoapp.php
echo    "echo \"<br/><br/>\";"  | tee -a /var/www/html/demoapp.php
echo    "if(isset(\$_POST['txtMinutes']))"  | tee -a /var/www/html/demoapp.php
echo    \{  | tee -a /var/www/html/demoapp.php
echo        shell_exec\(\'cat \/dev\/urandom \> \/dev\/null\'\)\;  | tee -a /var/www/html/demoapp.php
echo    \}  | tee -a /var/www/html/demoapp.php
echo     \}  | tee -a /var/www/html/demoapp.php
echo catch\(PDOException \$e\)  | tee -a /var/www/html/demoapp.php
echo     \{  | tee -a /var/www/html/demoapp.php
echo     "echo \"Connection failed: \" . \$e->getMessage();"  | tee -a /var/www/html/demoapp.php
echo     \}  | tee -a /var/www/html/demoapp.php
echo \?\>  | tee -a /var/www/html/demoapp.php
echo \<html\>  | tee -a /var/www/html/demoapp.php
echo \<head\>\<\/head\>  | tee -a /var/www/html/demoapp.php
echo \<body\>  | tee -a /var/www/html/demoapp.php
echo \<br\/\>\<br\/\>  | tee -a /var/www/html/demoapp.php
echo \<form name\=\"frmCPU\" Method\=\"POST\" ACTION\=\"demoapp.php\"\>  | tee -a /var/www/html/demoapp.php
echo \<input type\=\"Hidden\" Name\=\"txtMinutes\" value=\"5\"\>\<\/input\>  | tee -a /var/www/html/demoapp.php
echo \<br\/\>\<br\/\>  | tee -a /var/www/html/demoapp.php
echo \<input type\=\"Submit\" Name\=\"btnSpike\"  value\=\"Spike CPU\" onclick\=\"alert\(\'The CPU will be spiked - Do Not Close Your Browser for at least 6 minutes\\r\\nYou should receive an email triggered by the spike.\'\)\;\" \/\>  | tee -a /var/www/html/demoapp.php
echo \<br\/\>\<br\/\>\<br\/\>  | tee -a /var/www/html/demoapp.php
echo \<\/form\>  | tee -a /var/www/html/demoapp.php
echo \<\/body\>  | tee -a /var/www/html/demoapp.php
echo \<\/html\>  | tee -a /var/www/html/demoapp.php

# restart Apache

apachectl restart
