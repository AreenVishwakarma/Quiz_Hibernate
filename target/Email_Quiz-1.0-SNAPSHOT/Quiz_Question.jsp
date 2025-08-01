<%-- 
    Document   : index
    Created on : 28 Jul 2025, 5:30:47 pm
    Author     : hp
--%>
<%@page import="model.Student_Details"%>
<%@page import="java.util.List"%>
<%@page import="model.Quiz"%>
<%@page import="model.Users_Ans"%>
<%@page import="dao.QuizDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    QuizDao dao = new QuizDao();
    List<Quiz> quizs = dao.getAllQuizs(); // make sure this method returns List<Quiz>
    List<Student_Details> student = dao.getAllStudents(); // make sure this method returns List<Student_Details>
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            form {
                max-width: 800px;
                margin: auto;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .question {
                margin-bottom: 25px;
                padding-bottom: 10px;
                border-bottom: 1px solid #ddd;
            }

            .question p {
                font-size: 18px;
                font-weight: bold;
            }

            label {
                display: block;
                margin: 5px 0;
                font-size: 16px;
            }

            button {
                display: block;
                width: 100%;
                padding: 12px;
                background-color: #28a745;
                color: white;
                font-size: 18px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
            }

            button:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <h1>Online Quiz</h1>
        <form action="Submit_Quiz" method="post">
            <%    
                for (Student_Details sd : student){
            %>
                <input type="hidden" name="details<%= sd.getEmail() %>" />
            <%
                }
            %>
            
            <%
                for (Quiz s : quizs) {
            %>
                <div class="question">
                    <p><%= s.getId() %>. <%= s.getQuestion() %></p>

                    <!-- Hidden fields -->
                    <input type="hidden" name="questionId" value="<%= s.getId() %>" />
                    <input type="hidden" name="questionText_<%= s.getId() %>" value="<%= s.getQuestion() %>" />
                    <input type="hidden" name="correct<%= s.getId() %>" value="<%= s.getCorrectOption() %>" />

                    <label><input type="radio" name="q<%= s.getId() %>" value="<%= s.getOptionA() %>"> A) <%= s.getOptionA() %></label>
                    <label><input type="radio" name="q<%= s.getId() %>" value="<%= s.getOptionB() %>"> B) <%= s.getOptionB() %></label>
                    <label><input type="radio" name="q<%= s.getId() %>" value="<%= s.getOptionC() %>"> C) <%= s.getOptionC() %></label>
                    <label><input type="radio" name="q<%= s.getId() %>" value="<%= s.getOptionD() %>"> D) <%= s.getOptionD() %></label>
                </div>
            <%
                }
            %>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
