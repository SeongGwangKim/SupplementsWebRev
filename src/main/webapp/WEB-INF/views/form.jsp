<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%> <!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="/css/base.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>

<div class="container">
    <div class="page-header">
        <h1>게시글 등록</h1>
    </div>
    <br/>
    <input id="board_idx" type="hidden" value="board.idx"/>
    <input id="board_create_date" type="hidden" value="board.createdDate"/>
    <table class="table">
        <div>
            <div class = "board" style="padding:13px 0 0 15px;"/> 게시판 선택 </div>
            <td>
                <div class="pull-left">
                    <select class="form-control input-sm" id="board_type">
                        <option>--분류--</option>
                        <option value="notice" selected="${board.boardType.name() == 'notice'}">공지사항</option>
                        <option value="free" selected="${board.boardType.name() == 'free'}">자유게시판</option>
                    </select>
                </div>
            </td>
        </tr>
        <tr>
            <th style="padding:13px 0 0 15px;">생성날짜</th>
            <td><input type="text" class="col-md-1 form-control input-sm" readonly="readonly" value="${board.createdDate} ? ${temporals.format(board.createdDate,'yyyy-MM-dd HH:mm')} : ${board.createdDate}"/></td>
        </tr>
        <tr>
            <th style="padding:13px 0 0 15px;">제목</th>
            <td><input id="board_title" type="text" class="col-md-1 form-control input-sm" value="${board.title}"/></td>
        </tr>
        <tr>
            <th style="padding:13px 0 0 15px;">부제목</th>
            <td><input id="board_sub_title" type="text" class="col-md-1 form-control input-sm" value="${board.subTitle}"/></td>
        </tr>
        <tr>
            <th style="padding:13px 0 0 15px;">내용</th>
            <td><textarea id="board_content" class="col-md-1 form-control input-sm" maxlength="140" rows="7" style="height: 200px;"
                          text="${board.content}"></textarea><span class="help-block"></span>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
    </table>
    <div class="pull-left">
        <a href="/board/list" class="btn btn-default">목록으로</a>
    </div>
    <div class="pull-right">
        <button if="!${board.idx}" type="button" class="btn btn-primary" id="insert">저장</button>
        <button if="${board.idx}" type="button" class="btn btn-info" id="update">수정</button>
        <button if="${board.idx}" type="button" class="btn btn-danger" id="delete">삭제</button>
    </div>
</div>

<div replace="layout/footer::footer"></div>

<script src="@{/js/jquery.min.js}"></script>
<script if="!${board.idx}">
    $('#insert').click(function () {
        var jsonData = JSON.stringify({
            title: $('#board_title').val(),
            subTitle: $('#board_sub_title').val(),
            content: $('#board_content').val(),
            boardType: $('#board_type option:selected').val()
        });
        $.ajax({
            url: "http://localhost:8383/boards",
            type: "POST",
            data: jsonData,
            contentType: "application/json",
            headers: {
                "Authorization": "Basic " + btoa("havi" + ":" + "test")
            },
            dataType: "json",
            success: function () {
                alert('저장 성공!');
                location.href = '/board/list';
            },
            error: function () {
                alert('저장 실패!');
            }
        });
    });
</script>
<script if="${board.idx}">
    $('#update').click(function () {
        var jsonData = JSON.stringify({
            title: $('#board_title').val(),
            subTitle: $('#board_sub_title').val(),
            content: $('#board_content').val(),
            boardType: $('#board_type option:selected').val(),
            createdDate: $('#board_create_date').val()
        });
        $.ajax({
            url: "http://localhost:8383/boards/" + $('#board_idx').val(),
            type: "PUT",
            data: jsonData,
            contentType: "application/json",
            dataType: "json",
            success: function () {
                alert('수정 성공!');
                location.href = '/board/list';
            },
            error: function () {
                alert('수정 실패!');
            }
        });
    });
    $('#delete').click(function () {
        $.ajax({
            url: "http://localhost:8383/api/boards/" + $('#board_idx').val(),
            type: "DELETE",
            success: function () {
                alert('삭제 성공!');
                location.href = '/board/list';
            },
            error: function () {
                alert('삭제 실패!');
            }
        });
    });
</script>
</body>
</html>