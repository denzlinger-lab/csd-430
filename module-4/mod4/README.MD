# Movie Catalog Web Application

A Java-based web application that displays a curated list of films. This project demonstrates the use of JavaBeans, JSP (JavaServer Pages), and proper MVC-like architecture for managing and displaying data.

## Features
- **JavaBean Data Model**: Uses serializable classes (`Movie`, `MovieCatalogBean`) to manage data.
- **Dynamic Display**: Uses JSP scriptlets to render data into an HTML table.
- **Data Attributes**: Each movie entry includes 5 distinct fields (Title, Year, Studio, Director, Genre).
- **Documentation**: Fully documented Java code using Javadoc standards.

## Project Structure
- `src/main/java/movieList/`: Contains the Java source files (`Movie.java`, `MovieCatalogBean.java`).
- `src/main/webapp/`: Contains the presentation layer (`display.jsp`).
- `WEB-INF/`: Web application configuration.

## Requirements
- **Java Development Kit (JDK) 11 or higher**
- **Apache Tomcat 9.0+**
- **Eclipse IDE for Enterprise Java and Web Developers**

## Setup Instructions
1.  **Clone/Import the project** into Eclipse as a "Dynamic Web Project".
2.  **Ensure Server Runtime** is configured to point to your local Apache Tomcat installation.
3.  **Build**: Clean and Build the project using `Project > Clean` in Eclipse to ensure all Java classes are compiled correctly into `WEB-INF/classes`.
4.  **Run**: Right-click `display.jsp` and select `Run As > Run on Server`.
5.  **Access**: Navigate to `http://localhost:8080/[YourProjectName]/display.jsp` in your browser.

## Troubleshooting
- **500 Internal Server Error**: Ensure the `class` attribute in your `<jsp:useBean>` tag exactly matches the package name defined in your Java files (`movieList.MovieCatalogBean`).
- **404 Not Found**: Ensure your URL is pointing to the JSP file in the `webapp` folder, not a source code file.