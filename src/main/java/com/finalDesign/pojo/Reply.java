package com.finalDesign.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {

    private int replyId;
    private String replyDisplayName;
    private Timestamp replyDate;
    private String replyForWho;
    private String replyText;
    private String replyForComment;
    private String replyEssay;
}
