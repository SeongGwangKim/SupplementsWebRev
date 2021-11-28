package SupplementsWeb.com.controller;


import SupplementsWeb.com.biz.BoardBiz;
import SupplementsWeb.com.dto.BoardDto;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class BoardController {

    private final BoardBiz boardBiz;

    public BoardController(BoardBiz boardBiz) {
        this.boardBiz = boardBiz;
    }

    @GetMapping("/list")
    public String list(@PageableDefault Pageable pageable, Model model){
        List<BoardDto> boardDtoList = boardBiz.getBoardList();
        model.addAttribute("boardList", boardBiz.findBoardList(pageable));
        model.addAttribute("boardList", boardDtoList);
        return "list";
    }

    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String boardWrite(@RequestParam(value = "idx", defaultValue = "0") Long idx, Model model) {
        model.addAttribute("board", boardBiz.findBoardByIdx(idx));
        return "form";
    }

    @PostMapping(value = "/write")
    public String boardWrite(BoardDto boardDto){

        return "redirect:/list";
    }

    @GetMapping("/list/{no}")
    public String detail(@PathVariable("no")Long idx, Model model){
        BoardDto boardDto = boardBiz.getBoard(idx);
        model.addAttribute("boardDto", boardDto);
        return "detailView";
    }


    @PostMapping("/delete")
    public String deleteBoard(Long idx){
        boardBiz.deleteBoard(idx);
        return "redirect:/list";
    }

    @GetMapping("/list/edit/{no}")
    public String updateBoard(@PathVariable("no")Long idx, Model model){
        BoardDto boardDto = boardBiz.getBoard(idx);
        model.addAttribute("boardDto", boardDto);
        return "list/edit";
    }

    @PostMapping("/list/edit")
    public String upadteBoard(BoardDto boardDto){
        boardBiz.insertBoard(boardDto);
        return "redirect:/list/"+boardDto.getIdx();
    }


    @GetMapping("/bbs2")
    public String bbs2() {
        return "bbs2";
    }

}
