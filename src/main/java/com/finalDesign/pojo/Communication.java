package com.finalDesign.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Communication {

    private int communicationId;
    private String communicationSendName;
    private String communicationText;
    private Timestamp communicationTime;
    private String communicationReceiverName;
}
