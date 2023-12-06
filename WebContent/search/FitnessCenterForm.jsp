<!-- 
헬스장 등록 페이지 폼
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="commonFrame.jsp" %>
<%@ include file="IsLoggedIn.jsp" %>
<%
MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
System.out.println("현재 사용자분류: "+mvo.getMem_class());
String check = mvo.getMem_class();
if(!check.equals("b")){
%>
<script>
alert("트레이너 회원만 이용하실 수 있습니다.");
location.href="memberUpdate.jsp";
</script>
<%
}
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GYMGGUN 헬스장 등록하기</title>
    <style>
      *{
        margin:0; padding:0;
      }
      /* Chrome, Safari용 스크롤 바 */
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}

      #wrap{
        width:100%;
        overflow: hidden;
      }
        #fc_registration_aside{
          float:left;
          width:250px;
        }
        #fc_registration_aside > dl > dt > a{
          float:left;
          width:250px;
          display:block;
          padding: 10px;
          font-size: 20px;
          margin-left:30px;
        }
        #fc_registration_aside > dl > dt > a:hover{
        	color:red;
        }
        .content{
          margin-right: 2px;
          font-size: 17px;
          float:left;
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
        /* 운영 시간 */
        .opening_time{
          padding-right:50px;
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
        .centerTrainer-wrap > h2{
        	display:inline;
        }
        .centerTrainer-wrap > h2 + input{
        	display:block;
        	margin: 10px 0;
        }
		.asterisk{
          font-size:14px; color:gray
        }
    </style>

    <script>
    /* 무슨 기능인지 잘 모름 원래 있던 거 */
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
        if(form.fc_name.value == ""){
          alert("센터 이름을 입력하세요.");
          form.fc_name.focus();
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
        
        else if(form.opening_time[0].value == ""){
          alert("평일 운영 시간을 입력하세요.");
          form.opening_time[0].focus();
          return false;
        }
        else if(form.opening_time[1].value == ""){
            alert("토요일의 운영 시간을 입력하세요.");
            form.opening_time[1].focus();
            return false;
          }
        else if(form.opening_time[2].value == ""){
            alert("일요일 및 공휴일의 운영 시간을 입력하세요.");
            form.opening_time[2].focus();
            return false;
          }
        else if(form.image.value == ""){
          alert("이미지를 1개 이상 첨부해주세요.");
          form.image.focus();
          return false;
        }
        
        else if(form.introduce.value == ""){
          alert("소개 글을 입력하세요.");
          form.introduce.focus();
          return false;
        }
        else{
        	alert("헬스장 등록을 완료했습니다.");
        	return true;
        }
      }
    </script>

</head>

<body>
    <div id="wrap">
        <aside id="fc_registration_aside">
            <dl>
                <a href="#"></a>
                <dt><a href="memberUpdate.jsp" id="selected">내 정보 수정</a></dt>
                <dt><a href="FitnessCenterForm.jsp">헬스장 정보 관리</a></dt>
                <dt><a href="TrainerForm.jsp">트레이너 정보 관리</a></dt>
                <!-- <dt><a href="#">즐겨찾기</a></dt>
                <dt><a href="#">작성게시물</a></dt> -->
                <dt><a href="deleteMemberForm.jsp">회원탈퇴</a></dt>
            </dl>
        </aside>
    
        <div class="content">
          <form class="main" action="RegistFitnessCenter.jsp" method="post" enctype="multipart/form-data"
          onsubmit="return validateForm(this)" name="fcRegistrateForm">
            <br>
            <span class="asterisk">* 표시는 필수 입력 사항입니다.</span><br><br>
            <div class="centerName-wrap">
              <h2>센터 이름<sup>*</sup></h2>
              <input style="width: 150px;" placeholder="센터 이름" type="text" class="centerName" name="fc_name" />
            </div>
            <br><br>
            
            <div class="centerAddress-wrap">
              <h2>센터 주소<sup>*</sup></h2>
              <input type="text" class="address" placeholder="우편번호" style="width: 100px;" name="addr">
              <button type="button" name="button" id="postcode_btn" onclick="" >주소 찾기</button><br>
              <input type="text" class="address" placeholder="주소" style="width: 400px;" name="addr"><br>
              <input type="text" class="address" placeholder="상세 주소" style="width: 400px;" name="addr"><br>
            </div>
            <br><br>
            
            <div class="tel-wrap">
              <h2 class="join_title"><label for="phoneNo">전화번호<sup>*</sup></label></h2>
              <input style="width: 40px;" type="text" class="tel" name="tel" maxlength="3" /> -
              <input style="width: 50px;" type="text" class="tel" name="tel" maxlength="4" /> -
              <input style="width: 50px;" type="text" class="tel" name="tel" maxlength="4" />
            </div>
            <br><br>
            <!--
            <div class="tel-wrap">
              <h2>사업자번호</h2>
              <input style="width: 30px;" type="text" class="business_num" name="business_num" maxlength="3" /> -
              <input style="width: 30px;" type="text" class="business_num" name="business_num" maxlength="3" /> -
              <input style="width: 100px;" type="text" class="business_num" name="business_num" maxlength="7" />
            </div>
            <br><br>
    -->
            <div class="runningTime-wrap">
              <h2>운영 시간<sup>*</sup></h2>
              <!--<input type="time" name="startTime"> ~ <input type="time" name="endTime">-->
              평일: <input class="opening_time" type="text" name="opening_time" id=""> <br><br>
              토요일: <input class="opening_time" type="text" name="opening_time" id=""> <br><br>
              일요일 및 공휴일: <input class="opening_time" type="text" name="opening_time" id="">
            </div>
            <br><br>
            
    <!--
            <div class="facilities-wrap">
              <h2>시설 및 서비스</h2>
              <div class="check-box">
                <input type='checkbox' name='facilities' value='HammerStrength' />운동복
                <input type='checkbox' name='facilities' value='Nautilus' />수건
                <input type='checkbox' name='facilities' value='Cybex' />샤워 시설
                <input type='checkbox' name='facilities' value='LifeFitness' />개인 사물함
                <input type='checkbox' name='facilities' value='etc' /> 주차장 <br><br>
                무료 주차시간 <br>
                <input type='text' name='facilities' placeholder="무료시간" style="width: 60px;" maxlength="2"/>
              </div>
            </div>
            <br><br>
    -->
            <div class="centerImage-wrap">
              <h2>센터 이미지<sup>*</sup></h2>
              <input type="file" id="image" name="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
              <div id="image_container"></div>
            </div>
            <br><br>
    <!--
            <div class="centerMachin-wrap">
              <h2>기구 등록</h2>
              <div class="check-box">
                메이커<br>
                <input type='checkbox' name='maker' value='HammerStrength' />Hammer Strength
                <input type='checkbox' name='maker' value='Nautilus' />Nautilus
                <input type='checkbox' name='maker' value='Cybex' />Cybex
                <input type='checkbox' name='maker' value='LifeFitness' />Life Fitness
                <input type='checkbox' name='maker' value='etc' /> 기타
                <br><br>
                구분<br>
                <input type='checkbox' name='part' value='chest' />가슴운동
                <input type='checkbox' name='part' value='back' />등운동
                <input type='checkbox' name='part' value='shoulder' />어깨운동
                <input type='checkbox' name='part' value='legs' />하체운동
                <input type='checkbox' name='part' value='arms' />팔운동
                <input type='checkbox' name='part' value='abs' />복근운동 <br>
                <input type='checkbox' name='part' value='powerlack' />파워랙
                <input type='checkbox' name='part' value='smitchmachine' />스미스 머신
                <br><br>
                갯수<br>
                <input type='text' name='amount' style="width: 60px;"/>
                <br><br>
                <button type="submit" name="button">등록</button>
    
                <div id="machine_container"></div>
              </div>
            </div>
            <br><br>
    
            <div class="centerTrainer-wrap">
                <h2>소속 트레이너</h2>
                <input type="file">
                
                 이건 샘플 
                <div class="card" style="width: 18rem; border: 2px solid #E6E6E6;">
                  <img class="card-img-top" src="images/황철순.jpg" alt="Card image cap">
                  <div class="card-body">
                    <h3 class="card-title">안덕현</h3>
                    <p class="card-text">010 - 1234 - 5678</p>
                    <a href="#" class="btn btn-primary" style="color: blue;">프로필 보기</a>
                  </div>
                </div>
    
                 이건 쓸거 
                <div class="card" style="width: 18rem; border: 2px solid #E6E6E6;">
                  <a href="#"><img class="card-img-top" src="images/plus.png" alt="Card image cap"></a>
                  <div class="card-body">
                    <h3 class="card-title">이 름</h3>
                    <p class="card-text">전 화 번 호</p>
                    <a href="#" class="btn btn-primary" style="color: blue;">추가</a>
                  </div>
                </div>
            </div>
            <br><br>
    
            <div class="homepageAddress-wrap">
              <h2>홈페이지 주소</h2>
              <div class="hompage">
                <img src="images/homepage.png" alt="" class="linkImg">
                <input type="text" name="url_addr" placeholder="homepageAddress">
              </div>
              <div class="instagram">
                <img src="images/instagram.svg" alt="" class="linkImg">
                <input type="text" name="blog_addr" placeholder="instgramAddress">
              </div>
              <div class="naver">
                <img src="images/naver_blog.svg" alt="" class="linkImg">
                <input type="text" name="insta_addr" placeholder="naverAddress">
              </div>
            </div>
            <br><br>
    -->
            <div class="introduce-wrap">
              <h2>소개<sup>*</sup></h2>
              <textarea name="introduce" id="intro"></textarea>
            </div>
            <br><br>
                <button type="submit" style="background-color:black; color: white; border-radius: 10px;" name="button" id="finalCheck"> 확인 </button>
            <br><br>
    
          </form>
        </div>
    </div>
</body>
</html>
