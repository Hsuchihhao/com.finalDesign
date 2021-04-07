package com.finalDesign.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Follow {
    private int followId;
    private String followEssay;
    private String followName;
    private String followCategory;

}
