package SupplementsWeb.com.controller;

import SupplementsWeb.com.domain.User;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class JoinController {


    @GetMapping("/login")
    public String login() {
        return "login.jsp";
    }

    @GetMapping(path="/logout")
    public String login(@NotNull HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }
    @RequestMapping(value = "LoginConfirm" ,method = {RequestMethod.POST})
    public String login(@RequestParam String userID, @RequestParam User userPassword,
                        Model model, HttpSession session) {
        System.out.println("userID = " + userID);
        System.out.println("userPassword = " + userPassword);
        return "login";
    }
    @GetMapping("/join")
    public String join() {
        return "join";
    }

    @GetMapping("/myPage")
    public String myPage() {
        return "myPage";
    }
}