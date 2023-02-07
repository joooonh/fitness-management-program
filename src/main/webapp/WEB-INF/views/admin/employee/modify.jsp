<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
<link rel="stylesheet" href="../../../resources/css/employee.css">
<title>중앙피트니스</title>
</head>
<body>

<!------------------------------------ 헤더 navbar 영역 ---------------------------------------->
<%@ include file="../../common/header.jsp" %>
<div class="container-fluid mt-4">
	<div class="row">
		<div class="col-md-2 sidebar">
			<!---------------------------------- 사이드 바 영역  ----------------------------------------->
			<%@ include file="../../common/sidebar.jsp" %>
		</div>
		<div class="col-md-10 ps-4 pt-5">
			<!--------------------------------- Content 영역 ------------------------------------------->
			<div class="row">
				<div class="col-12">
					<h1>내정보</h1>
				</div>
			</div>
			
			<form method="post" action="modify" id="updateEmployee" enctype="multipart/form-data">
				<div class="row">
					<div class="col-4">
						<div class="profile">
							<img src="../../../resources/images/${employee.photo }" id="img-profile" class="rounded-circle" alt="직원 프로필 사진">
							<label for="file-profile" class="form-label"><i class="bi bi-camera-fill"></i></label>
							<input class="form-control" type="file" id="file-profile" name="upfile">
						</div>
					</div>
					
					<div class="col-8">
							<input type="hidden" name="fitnessNo" value="${employee.fitnessNo }" />
							<table class="table table-bordered">
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								 <tr>
								 	<th class="table-secondary">이름</th>
								 	<td><input type="text" class="form-control form-control-sm" name="name" value="${employee.name }"></td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">아이디</th>
								 	<td><input type="text" class="form-control form-control-sm" name="id" value="${employee.id }" readonly></td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">비밀번호</th>
								 	<td><input type="password" class="form-control form-control-sm" name="passwrod"></td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">비밀번호 확인</th>
								 	<td><input type="password" class="form-control form-control-sm" name="passwordConfirm"></td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">전화번호</th>
								 	<td><input type="text" class="form-control form-control-sm" name="tel" value="${employee.tel }"></td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">이메일</th>
								 	<td><input type="text" class="form-control form-control-sm" name="email" value="${employee.email }" readonly></td>
								 </tr>
								 <tr>
								 	<th class="form-label table-secondary">우편번호</th>
								    <td class="d-flex justify-content-start">
								      <input type="text" class="form-control w-25 me-3" name="zipcode" value="${employee.zipcode }" readonly="readonly"/>
								      <button type="button" class="btn btn-outline-secondary btn-sm" id="btn-search-zipcode">우편번호검색</button>
								    </td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">주소</th>
								 	<td>
								 		<input type="text" class="form-control form-control-sm" name="basicAddress" value="${employee.basicAddress }">
								 	</td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">상세주소</th>
								 	<td><input type="text" class="form-control form-control-sm" name="detailAddress" value="${employee.detailAddress }"></td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">등록일</th>
								 	<td><input type="text" class="form-control form-control-sm" value="<fmt:formatDate value="${employee.createdDate }" pattern="yyyy-MM-dd"/>"></td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">재직상태</th>
								 	<td>
								 		<select class="form-select" name="status">
								 			<option value="재직" ${employee.status eq '재직' ? 'selected' : '' }>재직</option>
								 			<option value="퇴사" ${employee.status eq '퇴사' ? 'selected' : '' }>퇴사</option>
								 			<option value="휴직" ${employee.status eq '휴직' ? 'selected' : '' }>휴직</option>
								 		</select>
								 	</td>
								 </tr>
								 <tr>
								 	<th class="table-secondary">권한</th>
								 	<td>
								 		<c:forEach var="role" items="${employee.employeeRole }">
								 			<c:choose>
								 				<c:when test="${role.roleName eq 'ROLE_ADMIN' }"><span class="badge text-bg-primary py-1">관리자</span> </c:when>
						 				<c:when test="${role.roleName eq 'ROLE_EMP' }"><span class="badge text-bg-success py-1">강사</span> </c:when>
						 				<c:when test="${role.roleName eq 'ROLE_USER' }"><span class="badge text-bg-warning py-1">유저</span> </c:when>
								 			</c:choose>
								 		</c:forEach>
							 		</td>
								 </tr>
							</table>
							
							<div class="text-end">
								<a href="mypage?empId=${employee.id }" class="btn btn-secondary">취소</a>
								<button type="submit" class="btn btn-primary">저장</a>
							</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	// 주소검색
	$("#btn-search-zipcode").click(function() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      // 기본주소 정보를 대입하는 변수를 선언한다.
	      let address;
	      // 사용자가 도로명 주소를 선택했을 때 data.userSelectedType은 R이다.
	      if (data.userSelectedType === 'R') {
	        address = data.roadAddress;
	      } else {
	        address = data.jibunAddress;
	      }
					
	      // 우편번호 입력필드와 기본주소 입력필드에 값을 입력한다.
	      $(":input[name=zipcode]").val(data.zonecode);
	      $(":input[name=basicAddress]").val(address);
				
	      // 상세주소 입력필드에 값을 지우고 포커스를 위치시킨다.
	      $(":input[name=detailAddress]").val("").focus();
	    }
	  }).open();
	});
	
	// 프로필사진 미리보기
	let imgProfile = document.querySelector("#img-profile");
	let fileProfile = document.querySelector("#file-profile");
	
	fileProfile.addEventListener("change", function(event) {
		let reader = new FileReader();
		reader.readAsDataURL(event.target.files[0]);
		reader.onload = function() {
			imgProfile.src = reader.result;
		}
	});
	
})
</script>
</body>
</html>