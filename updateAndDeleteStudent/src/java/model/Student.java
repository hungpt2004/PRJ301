package model;


public class Student {
     private String ID;
    private String name;
    private String gender;

    public Student(String ID, String name,String gender) {
        this.ID = ID;
        this.name = name;
        this.gender = gender;
    }

    public Student() {
        super();
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "Student{" + "ID=" + ID + ", name=" + name + ", gender=" + gender + '}';
    }
    
}
