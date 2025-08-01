/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.persistence.*;
    
@Entity
@Table(name = "student_detail")
public class Student_Details {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;
    
//    private String name;
//    private String email;
    
    public String getName()
        { return name; }
    public void setName(String name)
        { this.name = name; }
    
    public String getEmail()
        { return email; }
    public void setEmail(String email)
        { this.email = email; }
}
