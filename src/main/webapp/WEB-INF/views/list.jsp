<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Board Form</title>
    <link rel="stylesheet" href="/css/base.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>

<div class="container">
    <div class="page-header">
        <h1>게시글 목록</h1>
    </div>
    <div class="pull-right" style="width:100px;margin:10px 0;">
        <a href="/board" class="btn btn-primary btn-block">등록</a>
    </div>
    <br/><br/><br/>
    <div id="mainHide">
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="col-md-1">#</th>
                <th class="col-md-2">서비스 분류</th>
                <th class="col-md-5">제목</th>
                <th class="col-md-2">작성 날짜</th>
                <th class="col-md-2">수정 날짜</th>
            </tr>
            </thead>
            <tbody>
            <tr each="board : ${boardList}">
                <td text="${board.idx}"></td>
                <td text="${board.boardType.value}"></td>
                <td><a href="'/board?idx='+${board.idx}" text="${board.title}"></a></td>
                <td text="${board.createdDate} ? ${temporals.format(board.createdDate,'yyyy-MM-dd HH:mm')} : ${board.createdDate}"></td>
                <td text="${board.updatedDate} ? ${temporals.format(board.updatedDate,'yyyy-MM-dd HH:mm')} : ${board.updatedDate}"></td>
            </tr>
            </tbody>
        </table>
    </div>
    <br/>
    <!-- Pagination
    <nav aria-label="Page navigation" style="text-align:center;">
        <ul class="pagination" with="startNumber=${T(Math).floor(boardList.number/10)}*10+1, endNumber=(${boardList.totalPages} > ${startNumber}+9) ? ${startNumber}+9 : ${boardList.totalPages}">
            <li><a aria-label="Previous" href="/board/list?page=1">&laquo;</a></li>
            <li style="${boardList.first} 'display:none'">
                <a href="@{/board/list(page=${boardList.number})}">&lsaquo;</a>
            </li>

            <li each="page :${numbers.sequence(startNumber, endNumber)}" class="(${page} == ${boardList.number}+1) ? 'active'">
                <a href="@{/board/list(page=${page})}" text="${page}"><span class="sr-only"></span></a>
            </li>

            <li style="${boardList.last} 'display:none'">
                <a href="@{/board/list(page=${boardList.number}+2)}">&rsaquo;</a>
            </li>
            <li><a aria-label="Next" href="@{/board/list(page=${boardList.totalPages})}">&raquo;</a></li>
        </ul>
    </nav>
 /Pagination -->
</body>
</html>