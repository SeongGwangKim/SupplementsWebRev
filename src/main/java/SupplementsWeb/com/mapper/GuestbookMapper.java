package SupplementsWeb.com.mapper;

import SupplementsWeb.com.domain.Board;
import SupplementsWeb.com.domain.Guestbook;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GuestbookMapper {

    int guestbookCount();

    List<Guestbook> getList();

    Board getGuestbook(Long idx);

    void uploadGuestbook(Guestbook guestbook);

    void updateGuestbook(Guestbook guestbook);

    void deleteGuestbook(Long idx);
}


