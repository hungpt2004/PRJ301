package model;

import java.time.LocalDate;
import java.util.Random;

public class Student {
    private int number;
    private String name;
    private boolean gender;
    private LocalDate dob;

    public Student(int number, String name, boolean gender, LocalDate dob) {
        this.number = number;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
    }

    public Student() {
        super();
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }
    public void infor(){
        
        
        int length = 10;
        Random random = new Random();
        int uppercaseStart = 65;
        int uppercaseEnd = 90;
        int lowercaseStart = 97;
        int lowercaseEnd = 122;
        StringBuilder randomString = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            boolean isUppercase = random.nextBoolean();
            int randomChar = isUppercase ?
                    uppercaseStart + random.nextInt(uppercaseEnd - uppercaseStart + 1) :
                    lowercaseStart + random.nextInt(lowercaseEnd - lowercaseStart + 1);
            randomString.append((char) randomChar);
        }
        
        name = randomString.toString();
        
        int a = random.nextInt(2);
        if(a == 1){
            gender =  true;
        }else{
            gender = false;
        }
        
        int randomYear = 1900 + random.nextInt(124);

        // Lấy ra tháng ngẫu nhiên trong khoảng từ 1 đến 12
        int randomMonth = 1 + random.nextInt(12);

        // Lấy ra ngày ngẫu nhiên trong khoảng từ 1 đến 28 (hoặc bất kỳ giới hạn nào phù hợp với logic ứng dụng của bạn)
        int randomDay = 1 + random.nextInt(28);

        // Tạo đối tượng LocalDate với ngày, tháng và năm ngẫu nhiên
        dob = LocalDate.of(randomYear, randomMonth, randomDay);
    }

    @Override
    public String toString() {
        return "number=" + number + ", name=" + name + ", gender=" + gender + ", dob=" + dob + '}';
    }
    
}
