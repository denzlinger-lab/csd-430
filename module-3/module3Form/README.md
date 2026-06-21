# **Stadium Attendance Survey Project**

## **Project Overview**

This project consists of two JSP files (`index.jsp` and `results.jsp`) designed to capture and display user feedback regarding stadium experiences. It demonstrates the use of HTML forms and Java Scriptlets to process and display user-inputted data in a structured table.

## **File Descriptions**

* **index.jsp**: The user interface containing the input form with various input types (date, text, number, email, dropdown, and textarea).  
* **results.jsp**: The backend processing page that receives form data via `POST` requests, stores it in variables using Java Scriptlets, and renders the output in an HTML table.

## **Features**

* **Data Capture**: Collects 7 specific data points from the user.  
* **Data Processing**: Utilizes Java Scriptlets (`<% ... %>`) to handle and retrieve form parameters.  
* **Responsive Display**: Presents the submitted data in a clean, professional HTML table format.

## **How to Run**

1. Ensure you have a Java-compliant server configured (e.g., Apache Tomcat).  
2. Place `index.jsp` and `results.jsp` in your web application's root directory.  
3. Deploy the application and navigate to `http://localhost:8080/index.jsp`.  
4. Fill out the form and click "Submit" to view the captured data.