package SupplementsWeb.com.controller;

import SupplementsWeb.com.biz.GuestbookBiz;
import SupplementsWeb.com.domain.Guestbook;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/guestbook/*")
@RequiredArgsConstructor
public class GuestbookController {

    private final GuestbookBiz guestbookBiz;

    @GetMapping("/hello")
    public String Hello() {
        return "/guestbook/hello";
    }

    @GetMapping("/test")
    public String test(Model model) {
        model.addAttribute("cnt", guestbookBiz.guestbookCount());
        model.addAttribute("test", guestbookBiz.guestbookList());

        return "/boards/hello";
    }

    @GetMapping("/main")
    public String main(Model model) {
        model.addAttribute("list", guestbookBiz.guestbookList());
        return "/guestbook/main";
    }

    @GetMapping("/upload")
    public String uploadGuestbookForm() {
        return "/guestbook/upload";
    }

    @PostMapping("/upload")
    public String uploadGuestbook(Guestbook guestbook) {
        guestbookBiz.uploadGuestbook(guestbook);
        return "redirect:/guestbook/main";
    }

    @GetMapping("/view")
    public String viewGuestbook(Model model, Long boardId) {
        model.addAttribute("view", guestbookBiz.getGuestbook(boardId));
        return "/guestbook/view";
    }

    @PutMapping("/update")
    public String updateGuestbook(Guestbook guestbook) {
        guestbookBiz.updateGuestbook(guestbook);
        return "redirect:/guestbook/main";
    }

    @DeleteMapping("/delete")
    public String deleteBoard(Long idx) {
        guestbookBiz.deleteGuestbook(idx);
        return "redirect:/guestbook/main";
    }
}