package com.finalDesign.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Essay {
        //文章id
        private int essayId;
        //文章名字
        private String essayName;

        //文章内容
        private String essayText;
        //文章作者
        private String essayUserDisplayName;
        //文章分类
        private String essayCategory;

//        @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//        @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
        private Timestamp essayCreateTime;

}
