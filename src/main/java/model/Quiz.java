package model;

import javax.persistence.*;

@Entity
@Table(name = "quiz_questions")
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "question")
    private String question;

    @Column(name = "option_a")
    private String optionA;

    @Column(name = "option_b")
    private String optionB;

    @Column(name = "option_c")
    private String optionC;

    @Column(name = "option_d")
    private String optionD;

    @Column(name = "correct_option")
    private String correctOption;
    private String Quiz;

    public Quiz() {}
    
    public Quiz(String quiz) {
        this.Quiz = quiz;
    }

    // Getters and Setters
    public int getId() { return id; }
//    public void setId(int id) { this.id = id; }

    public String getQuestion() { return question; }
//    public void setQuestion(String question) { this.question = question; }

    public String getOptionA() { return optionA; }
//    public void setOptionA(String optionA) { this.optionA = optionA; }

    public String getOptionB() { return optionB; }
//    public void setOptionB(String optionB) { this.optionB = optionB; }

    public String getOptionC() { return optionC; }
//    public void setOptionC(String optionC) { this.optionC = optionC; }

    public String getOptionD() { return optionD; }
//    public void setOptionD(String optionD) { this.optionD = optionD; }

    public String getCorrectOption() { return correctOption; }
//    public void setCorrectOption(String correctOption) { this.correctOption = correctOption; }
}
