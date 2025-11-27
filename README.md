https://www.notion.so/ASSIGNMENTS-NOTES-2b407375cc7e80a1a16cc4c112cdf7dc?source=copy_link




<VirtualHost *:8080>
    ServerName metexam1.com
    DocumentRoot /home/metexam1.com/public_html
    <Directory /home/metexam1.com/public_html>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

<VirtualHost *:8080>
    ServerName metexam1.org
    DocumentRoot /home/metexam1.org/public_html
    <Directory /home/metexam1.org/public_html>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>