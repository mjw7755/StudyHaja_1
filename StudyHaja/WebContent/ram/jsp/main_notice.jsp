<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!-- <link rel="stylesheet" type="text/css" href="css/main_notice.css" /> -->
<!-- <script src="js/scroll.js"></script> -->
<!DOCTYPE html>
<html> 
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="ram/css/main_notice2.css">
<title> </title>
<style type="text/css">
 #swiper{
    	width:600px;
    	height: 300px;
    }
    .swiper-container {
        width: 100%;
        height: 100%;
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        
        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
</style>
</head>
<body>
<div id="main">
<table id="notice">
	<tr>
		<td colspan="2"><h2>NOTICE</h2></td>
		<td><a href="notice_list.do"><h5>+더보기</h5></a></td>
	</tr>
		<c:forEach var="list"  items="${list}" end='4'> 
	<tr>
		<td id="icon">&nbsp;▶</td>
		<td id="subject"><a href="content.do?num=${list.num }&pageNum=${ currentPage }&result=just">
					${ list.subject }</a></td>
		<td>${list.reg_date}</td>
	</tr>
	</c:forEach>
</table>



 <div id="swiper">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">            
            	<figure class="snip1384">
  					<img src="ram/images/main_1.jpg" alt="sample83" />
				  <figcaption>
				    <h3>TEAMPLACE(팀플레이스) - 서울 마포구</h3>
				    <p>카페형식으로 홀과 룸으로 나눠져 있으며, 총 8개의 룸이 있습니다.<br>
				              면접스터디, 팀플, 발표연습, 사교모임 등에 최적화되어 있습니다</p>
				    <i class="ion-ios-arrow-right"></i>
				  </figcaption>
 					<a href="Room2.do?num=52&pageNum=3"></a>
				</figure>
					</div>
					
            <div class="swiper-slide">
            <figure class="snip1384">
  				<img src="ram/images/main_2.jpg" alt="sample83" />
				  <figcaption>
				    <h3>P&TSQUARE(피앤티스퀘어) - 서울 종로구</h3>
				    <p>3인에서 6인까지 이용할 수 있습니다<br>
					글라스 보드와 모니터가 있어 과외 또는 스터디, 팀플, 대외활동 등을 하기에 <br>적합한 공간 입니다 </p>
				    <i class="ion-ios-arrow-right"></i>
				  </figcaption>
 					<a href="Room2.do?num=49&pageNum=3"></a>
				</figure>
			</div>
            
            <div class="swiper-slide">
               <figure class="snip1384">
  				<img src="ram/images/main_3.jpg" alt="sample83" />
				  <figcaption>
				    <h3>MOIM모임 - 인천 부평구</h3>
				    <p>2인에서 6인까지 이용할 수 있는 9개의 룸이 있습니다.<br>
					거울이 있어 면접 스터디 및 발표연습등을 하기 좋고, 화이트보드와 빔 프로젝트등이 <br>구비되어있습니다. </p>
				    <i class="ion-ios-arrow-right"></i>
				  </figcaption>
 					<a href="Room2.do?num=48&pageNum=3"></a>
				</figure>
            </div>
            
            <div class="swiper-slide">
               <figure class="snip1384">
  				<img src="ram/images/main_4.jpg" alt="sample83" />
				  <figcaption>
				    <h3>스터디빈(Study Bean) - 서울 동대문구</h3>
				    <p>4~6인용 , 4~8인용 공간이 있습니다<br>
					4~8인 공간은 노트북과 연결가능한 모니터, 그리고 화이트보드가 구비되어 있어<br>
						과외 또는 스터디, 팀플, 대외활동 등 하기에 적합한 공간입니다 </p>
				    <i class="ion-ios-arrow-right"></i>
				  </figcaption>
 					<a href="Room2.do?num=101&pageNum=1"></a>
				</figure>
            </div>
            
            <div class="swiper-slide">
               <figure class="snip1384">
  				<img src="ram/images/main_5.jpg" alt="sample83" />
				  <figcaption>
				    <h3>THE 꿈 - 경기 분당구</h3>
				    <p>내가 원하는 미래, 내가 간절히 원하는 일들이
				    <br>나만의 공간, 우리들의 공간을 통해 이룰 수 있다는 희망을 담고 있습니다. 
				    <br>과외/그룹 스터디/독서토론회/그룹 세미나등 다양한 모임공간을 제공합니다</p>
				    <i class="ion-ios-arrow-right"></i>
				  </figcaption>
 					<a href="Room2.do?num=53&pageNum=2"></a>
				</figure>
            </div>

        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
	</div>
</div>

<div>
<figure class="snip1132">
  <img src="ram/images/1.jpg" alt="sample" />
  <figcaption>
    <div class="heading">
      <h3><span>Study Together</span></h3>
    </div>
    <div class="caption">
      <p>가나다라</p>
    </div>
  </figcaption>
  <a href="#"></a>
</figure>

 <figure class="snip1132">
  <img src="ram/images/4.jpg" alt="sample2" />
  <figcaption>
    <div class="heading">
      <h3><span>Study Search</span></h3>
    </div>
    <div class="caption">
      <p>가나다라</p>
    </div>
  </figcaption>
  <a href="#"></a>
</figure>
<figure class="snip1132">
  <img src="ram/images/3.jpg" alt="sample3" />
  <figcaption>
    <div class="heading">
      <h3><span>Study Room</span></h3>
    </div>
    
    <div class="caption">
      <p>가나다라</p>
    </div>
  </figcaption>
  <a href="#"></a>
</figure> 
</div>

   <!-- Swiper JS -->
    <script src="ram/js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        slidesPerView: 1,
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 3000,
        autoplayDisableOnInteraction: false,
        loop: true
    });
    </script>

</body>
</html>