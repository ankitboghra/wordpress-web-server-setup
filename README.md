# wordpress-web-server-setup
Set up a WordPress server from scratch

1. Check if PHP, Mysql & Nginx are installed. If not present, install the missing packages
2. Ask the user for a domain name(“example.com”)
4. Create a /etc/hosts entry for example.com pointing to localhost
5. Create an nginx config file for example.com
6. Download the latest WordPress version and unzip it locally in example.com document root
7. Create a new Mysql database for WordPress with name “example.com_db”
8. Create a wp-config.php with proper DB configuration
9. Fix any file permissions, clean up temporary files and restart/reload Nginx config
10. Prompt the user to open example.com in a browser if all goes well
