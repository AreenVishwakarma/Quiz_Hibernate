/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.persistence.*;
@Entity
@Table(name = "users_ans")
public class Users_Ans {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String question;
    private String selected_ans;

    // Getters and setters

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getSelected_ans() {
        return selected_ans;
    }

    public void setSelected_ans(String selected_ans) {
        this.selected_ans = selected_ans;
    }
}

