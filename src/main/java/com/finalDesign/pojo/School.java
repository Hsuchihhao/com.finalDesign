package com.finalDesign.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class School {

    private int schoolId;
    private String schoolName;
    private String schoolPic;
    private String schoolProfile;
    private String schoolNumber;
}
