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

2. **Install docker and docker-compose :**
   https://docs.docker.com/compose/install/

## Usage

4. **Run the program :**
   ```bash
    make

5. **Stop the containers :**
   ```bash
    make down

## Aknowledgments
- **Docker**: For providing a powerful containerization platform that enables us to package and run applications seamlessly. [Docker Documentation](https://docs.docker.com/)
- **Docker Compose**: For simplifying the management of multi-container Docker applications. [Docker Compose Documentation](https://docs.docker.com/compose/)

## License
This project is licensed under the MIT License. See the [LICENSE file](LICENSE.md) for more details.