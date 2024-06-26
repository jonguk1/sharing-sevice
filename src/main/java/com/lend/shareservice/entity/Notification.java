package com.lend.shareservice.entity;

import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class Notification {

    // 알림 번호 (ID)
    @NotNull
    private Integer notiId;

    // 유저 아이디 (FK)
    @NotNull
    private String userId;

    // 내용
    @NotNull
    private String content;

    // 읽음 여부 (default = false)
    @NotNull
    private Boolean isRead;

    // 생성일자 (default = sysdate)
    @NotNull
    private LocalDateTime notiRegDate;

    // 글번호
    @NotNull
    private Integer boardId;

    public Notification(String userId, String content, Boolean isRead, Integer boardId) {
        this.userId = userId;
        this.content = content;
        this.isRead = isRead;
        this.boardId = boardId;
    }
}
