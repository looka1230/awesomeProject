<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="commonFrame.jsp" %>
<%@ include file="IsLoggedIn.jsp" %>
<%
MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
System.out.println("현재 사용자분류: "+mvo.getMem_class());
String check = mvo.getMem_class();
if(!check.equals("t")){
%>
<script>
alert("트레이너 회원만 이용하실 수 있습니다.");
location.href="memberUpdate.jsp";
</script>
<%
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GYMGGUN 트레이너 등록</title>
    <style>
            /* Chrome, Safari용 스크롤 바 */
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}


        * {
          margin:0; padding:0;
        }

        html,body{
          height: 100%;
          
        }
        #wrap{
        width:100%;
        overflow: hidden;
      }
      #t_registration_aside{
          float:left;
          width:250px;
      }
      #t_registration_aside > dl > dt > a{
          float:left;
          width:250px;
          display:block;
          padding: 10px;
          font-size: 20px;
          margin-left:30px;
        }
        #t_registration_aside > dl > dt > a:hover{
        	color:red;
        }
        .content{
          float:left;
          margin-right: 2px;
          font-size: 17px;
        }

        .content h2{
          padding: 0px;
          margin:0px;
          margin-bottom: 5px;
        }

        .content input[type=text]{
          height: 20px;
          font-size: 17px;
        }

        .content button{
          height: 25px;
          font-size: 15px;
        }

        .check-box{
          margin-right: 7px;
          padding: 7px;
          background-color: #E6E6E6;
          width: 480px;
        }

        #intro{
          width: 700px;
          height: 300px;
          overflow-y: scroll;
        }

        .linkImg{
          width:70px;
          vertical-align: bottom;
        }

        #finalCheck{
          display: block;
          height: 30px;
          font-size: 25px;
          margin-left: auto;
          margin-right: auto;
        }

        .card{
          display: inline-block;
          text-align: center;
        }

        .card h3{
          margin: 0px;

        }

        .card-img-top{
          width: 100%;
          height: 300px;
        }
		.asterisk{
          font-size:14px; color:gray
        }
    </style>

    <script>
      function setThumbnail(event) {
        for (var image of event.target.files) {
          var reader = new FileReader();

          reader.onload = function(event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            document.querySelector("div#image_container").appendChild(img);
          };

          console.log(image);
          reader.readAsDataURL(image);
        }
      }
      /* 입력창 미 입력시 */
      function validateForm(form){
    	  
          
        if(form.name.value == ""){
          alert("트레이너 이름을 입력하세요.");
          form.name.focus();
          return false;
        }
        else if(form.addr[0].value == ""){
	            alert("우편번호를 입력하세요.");
	            form.addr[0].focus();
	            return false;
		  }
        else if(form.addr[1].value == ""){
            alert("주소를 입력하세요.");
            form.addr[1].focus();
            return false;
	  	}
        else if(form.addr[2].value == ""){
            alert("상세 주소를 입력하세요.");
            form.addr[2].focus();
            return false;
	  	}
        
        else if(form.image.value == ""){
            alert("이미지를 1개 이상 첨부해주세요.");
            form.image.focus();
            return false;
          }
        
        else if(form.awards.value == ""){
          alert("경력을 입력하세요.");
          form.awards.focus();
          return false;
        }
        else if(form.tel[0].value == ""){
            alert("전화번호를 입력하세요.");
            form.tel[0].focus();
            return false;
		}
        else if(form.tel[1].value == ""){
            alert("전화번호를 입력하세요.");
            form.tel[1].focus();
            return false;
		}
        else if(form.tel[2].value == ""){
            alert("전화번호를 입력하세요.");
            form.tel[2].focus();
            return false;
		}
        else if(form.introduce.value == ""){
          alert("소개 글을 입력하세요.");
          form.introduce.focus();
          return false;
        }
        else{
        	alert("트레이너 등록을 완료했습니다");
        	return true;
        }
      }
    </script>

</head>

<body>
    <div id="wrap">
        <aside id="t_registration_aside">
            <dl>
                <a href="#"></a>
                <dt><a href="memberUpdate.jsp" id="selected">내 정보 수정</a></dt>
                <dt><a href="FitnessCenterForm.jsp">헬스장 정보 관리</a></dt>
                <dt><a href="TrainerForm.jsp">트레이너 정보 관리</a></dt>
                <!--<dt><a href="#">즐겨찾기</a></dt>
                <dt><a href="#">작성게시물</a></dt>-->
                <dt><a href="deleteMemberForm.jsp">회원탈퇴</a></dt>
            </dl>
        </aside>
    
        
        <div class="content">
          <form class="main" action="RegistTrainer.jsp" method="post" enctype="multipart/form-data"
          onsubmit="return validateForm(this)" name="tRegistrateForm">
            <br>
            <span class="asterisk">* 표시는 필수 입력 사항입니다.</span><br><br>
            <div class="trainerName-wrap">
              <h2>트레이너 이름<sup>*</sup></h2>
              <input style="width: 150px;" placeholder="트레이너 이름" type="text" class="trainerName" name="name"></input>
            </div>
            <br><br>
            
            <div class="centerAddress-wrap">
              <h2>센터 주소<sup>*</sup></h2>
              <input type="text" class="address" placeholder="우편번호" style="width: 100px;" name="addr">
              <button type="button" name="button" id="postcode_btn" onclick="">주소 찾기</button><br>
              <input type="text" class="address" placeholder="주소" style="width: 400px;" name="addr"><br>
              <input type="text" class="address" placeholder="상세 주소" style="width: 400px;" name="addr"><br>
            </div>
            <br><br>

            <div class="centerImage-wrap">
              <h2>프로필 사진<sup>*</sup></h2>
              <input type="file" id="image" name="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
              <div id="image_container"></div>
            </div>
            <br><br>
    
            <div class="years-wrap">
              <h2>경력<sup>*</sup></h2>
              <input style="width: 50px;" name="awards" placeholder="ex.3년" type="text" class="awards"></input>
            </div>
            <br><br>
    <!--
            <div class="career-wrap">
              <h2 style="display: inline-block;">수상 이력</h2>
              <a href="#"><img src="images/plus.png" alt="" style="width:28px; vertical-align: top;"></a><br>
              <input style="width: 150px;" placeholder="ex.2021 wnbf 3위" type="text" class="centerName"></input>
            </div>
            <br><br>
    
            <div class="license">
              <h2 style="display: inline-block;">자격증</h2>
              <a href="#"><img src="images/plus.png" alt="" style="width:28px; vertical-align: top;"></a><br>
              <input style="width: 200px;" placeholder="ex.생활체육지도사 2급" type="text" class="centerName"></input>
            </div>
            <br><br>
    
            <div class="beforeAfter-wrap">
              <h2>회원 비포 애프터</h2>
              <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
              <div id="image_container"></div>
            </div>
            <br><br>
    -->
            <div class="tel-wrap">
                <h2 class="join_title"><label for="phoneNo">전화번호<sup>*</sup></label></h2>
                <input style="width: 40px;" type="text" class="tel" name="tel" maxlength="3" /> -
                <input style="width: 50px;" type="text" class="tel" name="tel" maxlength="4" /> -
                <input style="width: 50px;" type="text" class="tel" name="tel" maxlength="4" />
            </div>
            <br><br>
    <!--
            <div class="homepageAddress-wrap">
              <h2>홈페이지 주소</h2>
              <div class="hompage">
                <img src="images/homepage.png" alt="" class="linkImg">
                <input type="text" name="homepageAddress" placeholder="homepageAddress">
              </div>
              <div class="instagram">
                <img src="images/instagram.svg" alt="" class="linkImg">
                <input type="text" name="instgramAddress" placeholder="instgramAddress">
              </div>
              <div class="naver">
                <img src="images/naver_blog.svg" alt="" class="linkImg">
                <input type="text" name="naverAddress" placeholder="naverAddress">
              </div>
            </div>
            <br><br>
    -->
            <div class="introduce-wrap">
              <h2>소개<sup>*</sup></h2>
              <textarea id="intro" name="introduce"></textarea>
            </div>
            <br><br>
    <!--
            <div class="registeredGym-wrap">
                <h2>소속 헬스장</h2>
                 이건 쓸거 
                <div class="card" style="width: 18rem; border: 2px solid #E6E6E6;">
                  <a href="#"><img class="card-img-top" src="images/plus.png" alt="Card image cap"></a>
                  <div class="card-body">
                    <h3 class="card-title">센터이름</h3>
                    <p class="card-text">주 소</p>
                    <p class="card-text">전 화 번 호</p>
                    <a href="#" class="btn btn-primary" style="color: blue;">더 보기</a>
                  </div>
                </div>
            </div>
            <br><br>
    -->
            <button type="submit" style="background-color:black; color: white; border-radius: 10px;" name="button" id="finalCheck"> 확인 </button>
            <br><br>
    
          </form>
        </div>
    </div>
    


</body>
</html>
