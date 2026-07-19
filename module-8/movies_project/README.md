# Module 8 Movie Database Project - Command Line Development

A web-based application built as a dynamic Java web project to display a curated list of films directed by Quentin Tarantino. This particular setup leverages bash scripts to enable compilation and running from the command line, without the need for an IDE.

-- 7/19 Update --
Added a new page that combines adding new records and editing existing ones.
-----------------

## Prerequisites
- **Java JDK**: 25 (installed)
- **Tomcat**: 11.0.22 (installed via Homebrew)
- **MySQL Database**: Ensure local MySQL server is running and database `CSD430` exists.

## Scripts Overview

All scripts are located in the project root (`module-7/movies_project`). Make sure they are executable (`chmod +x *.sh`).

### 1. Compile Java Source: `./build.sh`
This script compiles Java beans (`database.DbBean` and `configBean.ConfigProject`) to the standard `WEB-INF/classes` directory. It uses Tomcat's `servlet-api.jar` and local `mysql-connector-j-8.2.0.jar` for the classpath.

### 2. Start Application: `./run.sh`
This script:
- Compiles the project.
- Configures a local `tomcat-base` workspace directory within this folder.
- Deploys the web application in Tomcat.
- Starts Tomcat server in the foreground.

### 3. Stop Application: `./stop.sh`
This script stops the local Tomcat Web server instance.

---

## Testing / Running the Web App

1. Ensure the scripts are executable:
   ```bash
   chmod +x *.sh
   ```
2. Start the server:
   ```bash
   ./run.sh
   ```
3. Open your browser and go to:
   [http://localhost:8080/movies_project/](http://localhost:8080/movies_project/)

4. Stop the server by pressing `Ctrl + C` in the terminal where it is running, or execute:
   ```bash
   ./stop.sh
   ```
