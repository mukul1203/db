
---

# Database Learning Project

This repository is designed for learning and experimenting with databases using Docker. Follow the steps below to get started quickly.

## Getting Started

### Prerequisites

- A GitHub account
- GitHub Codespaces access
- Basic knowledge of SQL and Docker

### Steps to Set Up the Database Environment

1. **Install Database Client Extension**
   - Open your Codespace.
   - Install `Database clients` extension from the Extensions Marketplace.

2. **Launch the Database Server**
   - Execute the following script to launch a Docker container with the database server:

     ```bash
     ./server/sql/run.sh
     ```

   - The port used by the database server will be specified in the `.sh` file.

3. **Create a Connection**
   - Click on the database extension icon in the toolbar.
   - Click on "Create Connection."
   - Fill in the required details and press "Connect." If successful, you are now connected to your database server!

4. **Create a Database in SQL Server**
   To create a database, you need to access the Docker container, sync the test database repository, and then create the database from it.

   #### Access the Container
   ```bash
   docker ps
   docker exec -it <CONTAINER_ID> /bin/bash
   ```

   #### Install Git (if needed)
   Depending on the base image of your Docker container, you might need to install Git:
   - For Debian/Ubuntu:
     ```bash
     apt-get update
     apt-get install git
     ```
   - For Oracle Linux (in case of Codespace):
     ```bash
     yum install -y git  # or dnf install -y git
     ```
   - If neither is found, you may first need to install `dnf`:
     ```bash
     microdnf install dnf
     ```
     dnf is what finally worked for me in codespaces.

   #### Clone the Repository
   ```bash
   git clone https://github.com/datacharmer/test_db.git
   cd test_db
   ```

   #### Connect to MySQL
   ```bash
   mysql -u root -p
   ```

   #### Run the SQL Script to Create the Database
   Inside the MySQL prompt, run:
   ```sql
   source /path/to/test_db/employees.sql;
   ```

   Replace `/path/to/test_db` with the actual path where the `test_db` repository is cloned.

5. **Verify the Database**
   To see the databases you've created, run:
   ```sql
   SHOW DATABASES;
   ```

   Alternatively, check the database tables in the extension panel by refreshing the running server, which should now display the `employees` database. Take some time to explore the database tables.

6. **Execute SQL Queries**
   Now you can start issuing SQL queries against your newly created database.

7. **Managing the Docker Container**
   - To stop the container, run:
     ```bash
     ./stop.sh
     ```

   - To start it again (even across sessions), run:
     ```bash
     ./start.sh
     ```

## Conclusion

You're now set up to experiment with SQL databases using Docker in your Codespace. If you encounter any issues, please feel free to raise an issue in this repository.

---