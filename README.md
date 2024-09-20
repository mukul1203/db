# db
learning databases


## 1. Install Database Client extension.
## 2. Execute the script server/sql/run.sh. This launches a container with a db server running inside. The port will be as mentioned in .sh file.
## 3. Now go to the extension icon on the tool bar and click 'create connection'. Fill in the details and press connect. Success!
## 4. Create a database in sql server.
    For this, you need to get into the docker, sync the git repo https://github.com/datacharmer/test_db.git, and create db out of it.
# 1. Access the container
docker ps
docker exec -it <CONTAINER_ID> /bin/bash

# 2. Install git (if needed)
apt-get update
apt-get install git  # Or appropriate package manager for your image
#for oracle linux server in case of vs codespace, yum will be used
#yum install -y git OR dnf install -y git
#if neither is found, first install dnf (as the container image is minimal)
#microdnf install dnf

# 3. Clone the repository
git clone https://github.com/datacharmer/test_db.git
cd test_db

# 4. Connect to MySQL
mysql -u root -p

# 5. Inside MySQL, run the SQL script to create the database
source /path/to/test_db/employees.sql; #in this case, path is simply employees.sql

# 6. Verify the database
SHOW DATABASES;
#OR

## 5. Check the database tables in the extension panel.
You could just go to the database extension tab and refresh the running server, which will now start showing the employees database.
Study the db tables for a while.

## 6. Issue sql query.
