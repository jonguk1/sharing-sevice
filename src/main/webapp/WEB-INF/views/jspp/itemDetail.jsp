        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


        <!DOCTYPE html>
        <html lang="en">
        <head>
            <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=k495h0yzln"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="/css/bootstrap.min.css">

            <meta charset="UTF-8">
            <title>Title</title>
        </head>

        <body>
            <div class="container bg-green text-center">
                <div class="row">
                    <div class="col" style="border-radius: 10px; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                        <nav class="navbar navbar-expand-lg bg-green" data-bs-theme="light">
                            <a class="navbar-brand" href="#" style="color: black;">썸띵랜드</a>
                        </nav>
                    </div>
                    <div class="col" style="border-radius: 10px; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                        <form class="d-flex">
                            <div class="input-group mt-3"> <!-- 여기에 mt-3 클래스 추가 -->
                                <input class="form-control me-2" type="search" placeholder="빌리고 싶은 물건을 입력하세요">
                                <button class="btn btn-secondary" type="submit">Search</button>
                            </div>
                        </form>
                    </div>
                    <div class="col" style="border-radius: 10px; box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);">
                        <nav class="navbar navbar-expand-lg bg-green">
                            <div class="container-fluid">
                                <div class="collapse navbar-collapse justify-content-end" id="navbarColor03">
                                    <ul class="navbar-nav">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" style="color: black;">알림</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" style="color: black;">로그아웃</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" style="color: black;">채팅</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" style="color: black;">메시지</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>




            <div class="container d-flex justify-content-center">
                <nav class="navbar navbar-expand-lg" data-bs-theme="light">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item dropdown text-center">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="color: black;">빌려주세요</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown text-center">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="color: black;">빌려드려요</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">도서</a>
                                <a class="dropdown-item" href="#">생활용품</a>
                                <a class="dropdown-item" href="#">의류</a>

                            </div>
                        </li>

                        <li class="nav-item dropdown text-center">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="color: black;">경매</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>


            <br>
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8 text-center">
                        <span>
                            ${postById.isAuction}
                        </span>
                        <span>
                            ${postById.title}
                        </span>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 d-flex justify-content-center">
                        <img src="/images/ppp.jpeg" alt="대체_텍스트" style="height: 300px;">

                    </div>
                    <div class="col-md-2"></div>
                </div>

                <br>
                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">

                            <span>
                                 <img src="/images/people.png" alt="대체_텍스트" style="width: 50px;">
                            </span>

                                <span>${postById.writer}</span>

                            <span>
                                <button type="button" class="btn btn-primary">채팅</button>
                            </span>
                            <span>
                                <button type="button" class="btn btn-primary">경매</button>
                            </span>

                            <span>
                                <img src="/images/ban.png" alt="대체" style="width: 50px; height:20px;">
                            </span>

                            <span>
                                <img src="/images/singo.png" alt="대체" style="width: 50px; height:20px;">
                            </span>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <span>2024/04/20</span>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <span>서울특별시 종로구 혜화</span>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-12">
                                <hr>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <p> ${postById.content}</p>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <span>관심 ${postById.interestCnt}</span>
                        <span>채팅 12</span>
                        <span>조회 ${postById.hits}</span>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                    <hr>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-4">
                                <span>같은 물건 다른 글</span>
                            </div>
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-4 text-end">
                                <a href="#"><span>전체글</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>

                <br>

                <div class="row">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card border-light mb-3" style="max-width: 20rem;">
                                        <h5 class="card-header">
                                            <span>공학수학 떨이요</span>
                                        </h5>
                                        <div class="card-body">
                                            <p class="card-text">
                                                <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            <p>2,500원</p>
                                            <p>강원도 영월군 구포읍</p>
                                            <span>관심 32</span>
                                            <span>채팅 41</span>
                                            <span>조회 312</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card">
                                        <h5 class="card-header">
                                            <span>공학수학 떨이요</span>
                                        </h5>
                                        <div class="card-body">
                                            <p class="card-text">
                                                <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            Card footer
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card">
                                        <h5 class="card-header">
                                            <span>공학수학 떨이요</span>
                                        </h5>
                                        <div class="card-body">
                                            <p class="card-text">
                                                <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                            </p>
                                        </div>
                                        <div class="card-footer">
                                            Card footer
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>

                <br>

                <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="card">
                                                <h5 class="card-header">
                                                    <span>공학수학 떨이요</span>
                                                </h5>
                                                <div class="card-body">
                                                    <p class="card-text">
                                                        <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                    </p>
                                                </div>
                                                <div class="card-footer">
                                                    <p>2,500원</p>
                                                    <p>강원도 영월군 구포읍</p>
                                                    <span>관심 32</span>
                                                    <span>채팅 41</span>
                                                    <span>조회 312</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card">
                                                <h5 class="card-header">
                                                    <span>공학수학 떨이요</span>
                                                </h5>
                                                <div class="card-body">
                                                    <p class="card-text">
                                                        <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                    </p>
                                                </div>
                                                <div class="card-footer">
                                                    Card footer
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card">
                                                <h5 class="card-header">
                                                    <span>공학수학 떨이요</span>
                                                </h5>
                                                <div class="card-body">
                                                    <p class="card-text">
                                                        <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                    </p>
                                                </div>
                                                <div class="card-footer">
                                                    Card footer
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>



                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <hr>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-4">
                                <span>인기글</span>
                            </div>
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-4 text-end">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <br>


                <br>

                <div class="row">
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <h5 class="card-header">
                                                            <span>공학수학 떨이요</span>
                                                        </h5>
                                                        <div class="card-body">
                                                            <p class="card-text">
                                                                <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                            </p>
                                                        </div>
                                                        <div class="card-footer">
                                                            <p>2,500원</p>
                                                            <p>강원도 영월군 구포읍</p>
                                                            <span>관심 32</span>
                                                            <span>채팅 41</span>
                                                            <span>조회 312</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <h5 class="card-header">
                                                            <span>공학수학 떨이요</span>
                                                        </h5>
                                                        <div class="card-body">
                                                            <p class="card-text">
                                                                <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                            </p>
                                                        </div>
                                                        <div class="card-footer">
                                                            Card footer
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="card">
                                                        <h5 class="card-header">
                                                            <span>공학수학 떨이요</span>
                                                        </h5>
                                                        <div class="card-body">
                                                            <p class="card-text">
                                                                <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                            </p>
                                                        </div>
                                                        <div class="card-footer">
                                                            Card footer
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                    </div>


                                    <br>
                                    <div class="row">
                                                            <div class="col-md-2">
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <div class="card">
                                                                            <h5 class="card-header">
                                                                                <span>공학수학 떨이요</span>
                                                                            </h5>
                                                                            <div class="card-body">
                                                                                <p class="card-text">
                                                                                    <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                                                </p>
                                                                            </div>
                                                                            <div class="card-footer">
                                                                                <p>2,500원</p>
                                                                                <p>강원도 영월군 구포읍</p>
                                                                                <span>관심 32</span>
                                                                                <span>채팅 41</span>
                                                                                <span>조회 312</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="card">
                                                                            <h5 class="card-header">
                                                                                <span>공학수학 떨이요</span>
                                                                            </h5>
                                                                            <div class="card-body">
                                                                                <p class="card-text">
                                                                                    <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                                                </p>
                                                                            </div>
                                                                            <div class="card-footer">
                                                                                Card footer
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <div class="card">
                                                                            <h5 class="card-header">
                                                                                <span>공학수학 떨이요</span>
                                                                            </h5>
                                                                            <div class="card-body">
                                                                                <p class="card-text">
                                                                                    <img src="/images/math.jpeg" alt="대체_텍스트" style="width: 180px; height: 250px;">
                                                                                </p>
                                                                            </div>
                                                                            <div class="card-footer">
                                                                                Card footer
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2">
                                                            </div>
                                                        </div>

                        <br><br>
                        <input type="hidden" name="latitude" id="latitude" value="${postById.latitude}">
                        <input type="hidden" name="longitude" id="longitude" value="${postById.longitude}">

            </div>


            <script>
                $(document).ready(function() {
                    // 서버에서 데이터를 가져오는 AJAX 요청
                    $.ajax({
                        url: "/board/board-category",
                        type: "GET",
                        dataType: "json",
                        success: function(response) {
                            console.log(response);

                            $.each(response, function(index, value) {
                                $("#lendServe").append("<a class='dropdown-item' href='/board?boardCategoryId=1&itemCategoryId=" + value.itemCategoryId + "'>" + value.itemCategoryName + "</a>");
                                $("#lendServed").append("<a class='dropdown-item' href='/board?boardCategoryId=2&itemCategoryId=" + value.itemCategoryId + "'>" + value.itemCategoryName + "</a>");
                                $("#itemCategoryId").append("<option value='" + value.itemCategoryId + "'>" + value.itemCategoryName + "</option>")
                            });
                        }
                    });

                    var latitude = document.getElementById("latitude").value;
                    var longitude = document.getElementById("longitude").value;

                    var data = {
                        latitude: latitude,
                        longitude: longitude
                    };

                    $.ajax({
                        url: "/address",
                        type: "GET",
                        data: data,
                        dataType: "json",
                        success: function(response) {
                            console.log(response);
                        },
                        error: function(xhr, status, error) {
                            console.error(xhr.responseText);
                        }
                    });
                });
            </script>

        </body>