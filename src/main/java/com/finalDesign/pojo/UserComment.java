package com.finalDesign.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserComment {

    private int commentId;

    private String commentDisplayName;

    private Timestamp commentDate;

    private String commentText;

    private String commentEssay;

}
