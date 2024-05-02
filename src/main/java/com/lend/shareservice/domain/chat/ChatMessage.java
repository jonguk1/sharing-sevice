package com.lend.shareservice.domain.chat;

import lombok.Getter;
import lombok.Setter;

// 채팅 메시지를 주고받기 위한 DTO 만들기
// chatMessageDAO

@Getter
@Setter
public class ChatMessage {
    // 메시지 타입: 입장, 채팅
    public enum MessageType
    {
        ENTER, TALK
    }

    private MessageType type; // 메시지 타입
    private String roomId; // 방 번호
    private String sender; // 메시지 보낸 사람
    private String message; // 메시지
}
