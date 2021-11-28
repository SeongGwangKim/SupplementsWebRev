package SupplementsWeb.com.biz;

import SupplementsWeb.com.dao.BoardDaoImpl;
import SupplementsWeb.com.domain.Board;
import SupplementsWeb.com.dto.BoardDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BoardBiz {

    private final BoardDaoImpl boardDaoImpl;

    public BoardBiz(BoardDaoImpl boardRepository) {
        this.boardDaoImpl = boardRepository;
    }

    public Page<Board> findBoardList(Pageable pageable) {
        pageable = PageRequest.of(pageable.getPageNumber() <= 0 ? 0 : pageable.getPageNumber() - 1, pageable.getPageSize());
        return boardDaoImpl.findAll(pageable);
    }

    public Board findBoardByIdx(Long idx) {
        return boardDaoImpl.findById(idx).orElse(new Board());
    }

    @Transactional(rollbackOn = Exception.class) // exception 발생 시 rollback
    public List<BoardDto> getBoardList(){
        List<Board> boards = boardDaoImpl.findAll();
        List<BoardDto> boardDtoList = new ArrayList<>();

        for(Board board : boards){
            BoardDto dto = BoardDto.builder()
                    .idx(board.getIdx())
                    .boardType(board.getBoardType())
                    .title(board.getTitle())
                    .createdDate(board.getCreatedDate())
                    .updatedDate(board.getUpdatedDate())
                    .build();

            boardDtoList.add(dto);
        }
        return boardDtoList;

    }
    @Transactional(rollbackOn = Exception.class)
    public void insertBoard(BoardDto boardDto){
        boardDaoImpl.save(boardDto.toEntity()).getIdx();
    }

    @Transactional(rollbackOn = Exception.class)
    public BoardDto getBoard(Long idx){
        Optional<Board> boardWrapper = boardDaoImpl.findById(idx);
        if(boardWrapper.isPresent()){
            Board board = boardWrapper.get();

            BoardDto boardDto = BoardDto.builder()
                    .idx(board.getIdx())
                    .boardType(board.getBoardType())
                    .title(board.getTitle())
                    .subTitle(board.getSubTitle())
                    .content(board.getContent())
                    .createdDate(board.getCreatedDate())
                    .updatedDate(board.getUpdatedDate())
                    .user(board.getUser())
                    .build();

            return boardDto;
        }
        return null;
    }

    @Transactional(rollbackOn = Exception.class)
    public void deleteBoard(Long idx){
        Optional<Board> optBoard = boardDaoImpl.findById(idx);
        if(optBoard.isPresent()){
            Board board = optBoard.get();
            boardDaoImpl.deleteById(idx);
        }
    }


}
