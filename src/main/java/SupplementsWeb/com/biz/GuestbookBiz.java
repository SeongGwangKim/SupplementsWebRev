package SupplementsWeb.com.biz;

import SupplementsWeb.com.domain.Board;
import SupplementsWeb.com.domain.Guestbook;
import SupplementsWeb.com.mapper.GuestbookMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class GuestbookBiz {

    private final GuestbookMapper guestbookMapper;

    public int guestbookCount(){
        return guestbookMapper.guestbookCount();
    }

    public List<Guestbook> guestbookList(){
        return guestbookMapper.getList();
    }

    public Board getGuestbook(Long idx) {
        return guestbookMapper.getGuestbook(idx);
    }

    @Transactional
    public void uploadGuestbook(Guestbook guestbook) {
        guestbookMapper.uploadGuestbook(guestbook);
    }

    @Transactional
    public void updateGuestbook(Guestbook guestbook) {
        guestbookMapper.updateGuestbook(guestbook);
    }

    @Transactional
    public void deleteGuestbook(Long idx) {
        guestbookMapper.deleteGuestbook(idx);
    }

}
