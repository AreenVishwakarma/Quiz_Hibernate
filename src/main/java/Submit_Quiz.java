/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
//package servlet;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import dao.QuizDao;
import model.Users_Ans;
import model.Student_Details;
import java.util.List;
import model.Quiz;

/**
 *
 * @author hp
 */
@WebServlet("/Submit_Quiz")
public class Submit_Quiz extends HttpServlet {
    private QuizDao quizz = new QuizDao();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Submit_Quiz</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Submit_Quiz at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Quiz> questions = quizz.getAllQuizs();
        List<Student_Details> details = quizz.getAllStudents();

        int score = 0;
        String studentEmail = "";
        String studentDetails = "";

        // Assuming only one student is logged in — get their details
        for (Student_Details sd : details) {
            String emailParam = request.getParameter("details" + sd.getEmail());
            System.out.print("Email=" +emailParam);
            if (emailParam != null) {
                studentEmail = sd.getEmail();
                
            }
        }

        // Calculate score and save answers
        for (Quiz q : questions) {
            String userAnswer = request.getParameter("q" + q.getId());

            if (userAnswer != null) {
                // Save user's answer
                Users_Ans ua = new Users_Ans();
                ua.setQuestion(q.getQuestion());
                ua.setSelected_ans(userAnswer);
                quizz.saveQuiz(ua);

                // Compare with correct answer
                String correctAnswer = "";
                switch (q.getCorrectOption()) {
                    case "A": correctAnswer = q.getOptionA(); break;
                    case "B": correctAnswer = q.getOptionB(); break;
                    case "C": correctAnswer = q.getOptionC(); break;
                    case "D": correctAnswer = q.getOptionD(); break;
                }

                if (userAnswer.equalsIgnoreCase(correctAnswer)) {
                    score++;
                }
            System.out.println("Q" + q.getId() + ": userAnswer = [" + userAnswer + "], correctAnswer = [" + correctAnswer + "], Email=[" + studentEmail + "]");
            }
        }

        // Email setup
        final String fromEmail = " ";
        final String password = " ";

        final String toEmail = studentEmail;

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Quiz Result");

            String emailContent = "Hello,\n\n" +
                    "Student Details: " + studentDetails + "\n" +
                    "You scored " + score + " out of " + questions.size() + ".\n\n" +
                    "Thank you!";

            message.setText(emailContent);
            Transport.send(message);

            System.out.println("Result Email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        // Redirect to result page
        request.setAttribute("score", score);
        request.setAttribute("total", questions.size());
        request.getRequestDispatcher("result.jsp").forward(request, response);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
