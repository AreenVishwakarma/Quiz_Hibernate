<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Quiz Result</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
      }

      .container {
        max-width: 600px;
        margin: auto;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        text-align: center;
      }

      h2 {
        color: #28a745;
        font-size: 28px;
        margin-bottom: 20px;
      }

      p {
        font-size: 18px;
        margin: 10px 0;
      }

      .score {
        font-size: 22px;
        font-weight: bold;
        color: #333;
      }

      .email-note {
        font-style: italic;
        color: #666;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Quiz Result</h2>
      <p class="score">You scored <%= request.getAttribute("score") %> out of <%= request.getAttribute("total") %>.</p>
      <p class="email-note">The result has been sent to your registered email address.</p>
    </div>
  </body>
</html>
