package SupplementsWeb.com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoController {

    @RequestMapping(value = "/infoENS", method = RequestMethod.GET)
    public String infoENS() {
        System.out.println("infoENS");
        return "infoENS";
    }

    @GetMapping("/infoCNS")
    public String infoCNS() {
        return "infoCNS";
    }

    @GetMapping("/infoNGNS")
    public String infoNGNS() {
        return "infoNGNS";
    }

}
