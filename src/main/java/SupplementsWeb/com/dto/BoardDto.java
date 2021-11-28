package SupplementsWeb.com.dto;

import SupplementsWeb.com.domain.Board;
import SupplementsWeb.com.domain.User;
import SupplementsWeb.com.domain.enums.BoardType;
import lombok.*;


import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class BoardDto {

    private Long idx;
    private String title;
    private String subTitle;
    private String content;
    private BoardType boardType;
    private LocalDateTime createdDate;
    private LocalDateTime updatedDate;
    private User user;

    public Board toEntity(){
        Board build = Board.builder()
                .idx(idx)
                .title(title)
                .subTitle(subTitle)
                .content(content)
                .boardType(boardType)
                .user(user)
                .build();
        return build;
    }

    @Builder
    public BoardDto(Long idx, String title, String subTitle, String content, BoardType boardType, LocalDateTime createdDate, LocalDateTime updatedDate, User user) {
        this.idx = idx;
        this.title = title;
        this.subTitle = subTitle;
        this.content = content;
        this.boardType = boardType;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.user = user;
    }
}
