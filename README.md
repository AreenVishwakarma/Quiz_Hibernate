# Java Quiz Web Application (Maven + Hibernate + JSP/Servlet)

## 📋 Project Overview

This is a Java-based web application built with Maven, JSP/Servlets, and Hibernate ORM.  
The application allows a user to:

1. Enter their **Name and Email**
2. Be redirected to a **Quiz Page**
3. Submit answers to multiple questions fetched dynamically from the **database**
4. View their **score/result on a result page**
5. Receive their **quiz result via email**

---

## 🧰 Technologies Used

- Java (Servlets, JSP)
- Maven
- Hibernate ORM
- MySQL
- Apache Tomcat (Servlet Container)
- JavaMail API (for sending emails)

---

## 📌 Project Flow

### 1. Student Entry Page
- The user first enters their **name** and **email**.
- This data is saved into the `student_detail` table via Hibernate.

### 2. Quiz Page
- The user is shown a list of questions and options.
- All quiz data is fetched from the `quiz` table using Hibernate.

### 3. Answer Submission
- The user submits answers.
- Their selected answers are stored.
- A score is calculated by comparing with the correct options in the database.

### 4. Result Page & Email
- The score is displayed to the user.
- The result is also emailed to the email address the user entered.

---

## 🗃️ Database Tables

### `student_detail`
| Column | Type     |
|--------|----------|
| id     | INT (PK) |
| name   | VARCHAR  |
| email  | VARCHAR  |

### `quiz`
| Column       | Type     |
|--------------|----------|
| id           | INT (PK) |
| question     | TEXT     |
| optionA      | VARCHAR  |
| optionB      | VARCHAR  |
| optionC      | VARCHAR  |
| optionD      | VARCHAR  |
| correctOption| VARCHAR (A/B/C/D) |

### `users_ans` (optional, if storing user responses)
| Column     | Type     |
|------------|----------|
| id         | INT (PK) |
| question   | TEXT     |
| selected_ans | VARCHAR |

---

## 🚀 How to Run

1. **Clone the project** or import into NetBeans/Eclipse as a Maven project.
2. Set up your MySQL database and update `hibernate.cfg.xml` with DB credentials.
3. Run the SQL script to create tables (`student_detail`, `quiz`).
4. Add quiz data to the `quiz` table manually or using an admin interface.
5. Configure your Gmail or SMTP settings in your JavaMail code (use app password if needed).
6. Deploy the app on Apache Tomcat.
7. Open the browser and go to: `http://localhost:8080/YourAppName/`

---

## 📧 Email Configuration (JavaMail)

Use an App Password if you're using Gmail:
```java
final String fromEmail = "your-email@gmail.com";
final String password = "your-app-password";
