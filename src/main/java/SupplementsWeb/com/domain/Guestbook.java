package SupplementsWeb.com.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Guestbook {

    private Long boardId;
    private String content;
    private String name;
    private LocalDateTime createDate;
    private int read;
    private Long memberId;
    private Date regdate;
    private Date updatedate;

}
