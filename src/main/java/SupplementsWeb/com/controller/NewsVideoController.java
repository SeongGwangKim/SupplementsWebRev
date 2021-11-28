package SupplementsWeb.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NewsVideoController {

    @GetMapping("/newsVideo")
    public String newsVideo() {
        return "newsVideo";
    }

    @GetMapping("/childNews")
    public String childNews() {
        return "childNews";
    }

    @GetMapping("/childVideo")
    public String childVideo() {
        return "childVideo";
    }

}
