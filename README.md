# Inception (school 42 project)

## Description

This project is designed to help you learn and master Docker and Docker Compose by setting up a comprehensive environment featuring a variety of interconnected services.

## Contents

- [Project Overview](#project-overview)
- [Installation](#installation)
- [Usage](#usage)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Project Overview
The Inception project demonstrates the power and flexibility of Docker by using Docker Compose to orchestrate multiple services within a single environment. This project includes the following services:

- WordPress + PHP: A popular content management system (CMS) paired with PHP for dynamic content management.
- Nginx: A high-performance web server that also functions as a reverse proxy to manage traffic.
- MariaDB: A robust, open-source relational database management system (RDBMS) for storing data.
- Grafana: An open-source platform for monitoring and observability, used for visualizing metrics.
- HTTP Server: A generic HTTP server that can be configured to serve various web content.
- FTP (vsftpd): A secure and fast FTP server for file transfers.
- Adminer: A database management tool to interact with MariaDB through a web interface.
- Redis Cache: An in-memory data structure store used as a cache to improve application performance.

## Installation

1. **Clone the git :**
   ```bash
   git clone git@github.com:Kernicterus/inception_42.git
   ```

2. **Install docker and docker-compose :**
   https://docs.docker.com/compose/install/

3. **Set up a .env file :**
   with the following variables and put it at the srcs/ directory:  

   DOMAIN_NAME=localhost  
   GLOBAL_USER=  

   #Wordpress config  
   PATH_WORDPRESS='/var/www/wordpress'  
   WP_URL=localhost  
   WP_TITLE=   
   WP_ADMIN=  
   WP_ADMIN_PWD=  
   WP_ADMIN_EMAIL=  
   WP_USER_PASSWORD=  

   #Mariadb config
   SQL_DATABASE=  
   SQL_USER=  
   SQL_PASSWORD=  
   SQL_ROOT_PASSWORD=  

   #vsftpd config  
   PASV_MIN_PORT=21000  
   PASV_MAX_PORT=21010  
   PASV_ADDRESS=127.0.0.1  
   FTP_USER=  
   FTP_PASS=  

4. **Add user to docker group :**
   ```bash
   sudo usermod -aG docker $USER
   ```

## Usage

5. **Run the program :**
   ```bash
   service docker start && make #without sudo
   ```
   You can then access to the different services :
   - Wordpress :  https://localhost
   - Adminer :    https://localhost/adminer
   - Grafana :    https://localhost/grafana
   - Static Web : https://localhost/static_web
   - FTP :        By using a FTP client (e.g. Filezilla)

6. **Stop the containers :**
   ```bash
   make down
   ```

## Aknowledgments
- **Docker**: For providing a powerful containerization platform that enables us to package and run applications seamlessly. [Docker Documentation](https://docs.docker.com/)
- **Docker Compose**: For simplifying the management of multi-container Docker applications. [Docker Compose Documentation](https://docs.docker.com/compose/)

## License
This project is licensed under the MIT License. See the [LICENSE file](LICENSE.md) for more details.