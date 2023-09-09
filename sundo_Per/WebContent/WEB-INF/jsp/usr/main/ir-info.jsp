<%@page import="business.com.user.service.IrinfoVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="app"    uri="/WEB-INF/tld/app.tld" %>
<%@ taglib prefix="f"      uri="/WEB-INF/tld/f.tld" %>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec"    uri="http://www.springframework.org/security/tags" %>
<%
	if(request.getAttribute("irinfo") == null){
		response.sendRedirect("/usr/main/diagsearch.do");
	}else{
		IrinfoVO vo = (IrinfoVO)request.getAttribute("irinfo");
		%>
		<c:set var="irinfo" value="<%=vo %>" />
		<%
	}

%>

<section class="contents">
	<div class="contents-wrap">
		<div class="app-wrap">
			<div class="simple-info-wrap">
				<div class="ir-imgbox">
				경영체 등록 사진<br/>
				(기업CI/회사사진/대표상품사진)
				</div>
				<div class="simple-ir-info">
					<p class="ir-name"><c:out value="${irinfo.ent_nm}"></c:out></p>
					<div>
						<c:if test="${not empty irinfo.induty_cd}" >
							<c:forEach var="indstCode" items="${indstlst}">
								<c:if test="${irinfo.induty_cd == indstCode.induty_cd}">
									<span class="ir-industry ir-cate"><c:out value="${indstCode.induty_nm}"></c:out></span>
								</c:if>
							</c:forEach>
						</c:if>
						<c:forEach var="invt" items="${invtinfoLst}">
							<c:forEach var="invtCode" items="${invtlst}">
								<c:if test="${invt.invt_rlm_cd == invtCode.invt_rlm_cd}">
									<span class="ir-invest ir-cate">
										<c:out value="${invtCode.invt_rlm_nm}"></c:out>
									</span>
								</c:if>
							</c:forEach>
							<div>
								<c:if test="${not empty invtinfo.invt_amount}">
									<p class="invt-amount">
										투자 희망 금액 
										<c:if test="${fn:length((invtinfo.invt_amount).toString()) < 6}">
											<c:out value="${invtinfo.invt_amount / 1000 }"></c:out>백만
										</c:if>
										<c:if test="${fn:length((invtinfo.invt_amount).toString()) >= 6}">
											<c:out value="${invtinfo.invt_amount / 100000 }"></c:out>억
										</c:if>
									</p>
								</c:if>
							</div>
						</c:forEach> 
					</div>
					<div class="eventbtn-wrap">
						<button class="bookmarkBtn eventBtn" value="off">북마크하기</button>
						<button class="meetingBtn eventBtn">미팅신청</button>
					</div>
				</div>
			</div>
			<div class="main-info-wrap">
				<div class="irListBtn-wrap">
					<button class="irListBtn">목 록</button>
				</div>
				<div class="dashboard">
					<div class="basic-info-wrap">
						<button class="printBtn">보고서 인쇄 ></button>
						<span class="basic-info">기본정보</span>
						<table>
							<tr>
								<td class="tablecate">회사명</td><td><c:out value="${testApi.company_nm}"></c:out></td><td class="tablecate">사업자번호</td><td><c:out value="${testApi.brno}"></c:out></td>
							</tr>
							<tr>
								<td class="tablecate">기업형태</td>
								<td>
									<c:if test="${testApi.biz_shape == 'BT1'.toString()}"><c:out value="개인기업"></c:out></c:if>
									<c:if test="${testApi.biz_shape == 'BT2'.toString()}"><c:out value="주식회사"></c:out></c:if>
									<c:if test="${testApi.biz_shape == 'BT3'.toString()}"><c:out value="합명회사"></c:out></c:if>
									<c:if test="${testApi.biz_shape == 'BT4'.toString()}"><c:out value="합자회사"></c:out></c:if>
									<c:if test="${testApi.biz_shape == 'BT5'.toString()}"><c:out value="유한회사"></c:out></c:if>
									<c:if test="${testApi.biz_shape == 'BT6'.toString()}"><c:out value="공기업"></c:out></c:if>
								</td>
								<td class="tablecate">기업유형</td>
								<td>
									<c:if test="${testApi.biz_rlm == '10'.toString()}"><c:out value="농림수산식품 경영체"></c:out></c:if>
									<c:if test="${testApi.biz_rlm == '20'.toString()}"><c:out value="투자자"></c:out></c:if>
									<c:if test="${testApi.biz_rlm == '30'.toString()}"><c:out value="유관기관"></c:out></c:if>
									<c:if test="${testApi.biz_rlm == '90'.toString()}"><c:out value="일반회원"></c:out></c:if>
								</td>
							</tr>
							<tr>
								<td class="tablecate">설립일</td><td><c:out value="${testApi.est_date}"></c:out></td><td class="tablecate">기업규모</td>
								<td>
									<c:if test="${testApi.biz_scale == '01'.toString()}"><c:out value="중소기업"></c:out></c:if>
									<c:if test="${testApi.biz_scale == '02'.toString()}"><c:out value="중견기업"></c:out></c:if>
									<c:if test="${testApi.biz_scale == '03'.toString()}"><c:out value="대기업"></c:out></c:if>
								</td>
							</tr>
							<tr>
								<td class="tablecate">업종</td><td><c:out value="${testApi.company_type}"></c:out></td><td class="tablecate">홈페이지</td><td><c:out value="${testApi.hmpg_url}"></c:out></td>
							</tr>
							<tr>
								<td class="tablecate">대표자</td><td><c:out value="${testApi.company_nm}"></c:out></td><td class="tablecate">이메일</td><td><c:out value="${testApi.eml_addr}"></c:out></td>
							</tr>
							<tr>
								<td class="tablecate">소재지</td><td><c:out value="${testApi.addr}"></c:out></td><td class="tablecate">TEL/FAX</td><td><c:out value="${testApi.tel}/${testApi.fax}"></c:out></td>
							</tr>
							<tr>
								<td class="tablecate" name="mainbz">주요사업 <a class="editBtn"><i class="fa fa-pencil" aria-hidden="true"></i></a></td><td colspan="3"><c:out value="${irinfo.main_biz_cn}"></c:out></td>
							</tr>
							<tr>
								<td class="tablecate" name="coreitem">핵심아이템<a class="editBtn"><i class="fa fa-pencil" aria-hidden="true"></i></a></td><td colspan="3"><c:out value="${irinfo.core_itm_cn}"></c:out></td>
							</tr>
							<tr>
								<td class="tablecate" name="bizcn">사업내용<a class="editBtn"><i class="fa fa-pencil" aria-hidden="true"></i></a></td><td colspan="3"><c:out value="${irinfo.biz_cn}"></c:out></td>
							</tr>
							<tr>
								<td class="tablecate" name="picnm">담당자<a class="editBtn"><i class="fa fa-pencil" aria-hidden="true"></i></a></td><td><c:out value="${irinfo.pic_nm}"></c:out></td><td class="tablecate" name="pictelno">담당자연락처<a class="editBtn"><i class="fa fa-pencil" aria-hidden="true"></i></a></td><td><c:out value="${irinfo.pic_telno}"></c:out></td>
							</tr>
						</table>
					</div>
					<div class="ir-patent-wrap">
						<span class="ir-patent">특허 및 상표권 보유현황</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-wrap">
		<div class="modal-mainbz modal-cont modalin">
			<div class="modal-form">
				<span class="modalin">주요사업</span>
				<input class="modalin mainbz" type="text" value="${irinfo.main_biz_cn}" />
			</div>
			<input type="button" class="modal-btn modalin" value="저 장"/>
		</div>
		<div class="modal-coreitem modal-cont modalin">
			<div class="modal-form">
				<span class="modalin">핵심아이템</span>
			<input class="modalin coreitem" type="text" value="${irinfo.core_itm_cn}" />
			</div>
			<input type="button" class="modal-btn modalin" value="저 장"/>
		</div>
		<div class="modal-bizcn modal-cont modalin">
			<div class="modal-form">
				<span class="modalin">사업내용</span>
			<input class="modalin bizcn" type="text" value="${irinfo.biz_cn}" />
			</div>
			<input type="button" class="modal-btn modalin" value="저 장"/>
		</div>
		<div class="modal-picnm modal-cont modalin" >
			<div class="modal-form">
				<span class="modalin">담당자</span>
			<input class="modalin picnm" type="text" value="${irinfo.pic_nm}" />
			</div>
			<input type="button" class="modal-btn modalin" value="저 장"/>
		</div>
		<div class="modal-pictelno modal-cont modalin">
			<div class="modal-form">
				<span class="modalin">담당자번호</span>
			<input class="modalin pictelno" type="text" value="${irinfo.pic_telno}" />
			</div>
			<input type="button" class="modal-btn modalin" value="저 장"/>

		</div>  
	</div>
</section>
<script>
$(document).ready(function(){
	let bookmark = $('.bookmarkBtn').val();
	if(bookmark == "off"){
		$('.bookmarkBtn').css({'color':'#2E68FF','background':'none'})
	}
})

$('.bookmarkBtn').click(function(){
	let bookmark = $('.bookmarkBtn').val();
	if(bookmark == "off"){
		$('.bookmarkBtn').css({'color':'white','background':'#2E68FF'})
		$('.bookmarkBtn').val('on');
	}else if(bookmark == "on"){
		$('.bookmarkBtn').css({'color':'#2E68FF','background':'none'})
		$('.bookmarkBtn').val('off');
	}
})

function modalHidden(){
	$('.modal-wrap').css({'display':'none'});
	$('.modal-cont').css({'display':'none'});
	$('.modalin input[type=text]').val('');
}

$('.modal-wrap').click(function(e){
	if($(e.target).hasClass('modalin')== false){
		modalHidden();
	}
})

$('.editBtn').click(function(){
	let modalName = $(this).parent().attr('name');
	$('.modal-wrap').css({'display':'block'});
	$('.modal-'+modalName).css({'display':'flex'});
})

$('.modal-btn').click(function(){
	console.log($(this).parent().hasClass('modal-mainbz'));
	let data;
	let entNum = '${irinfo.ent_no}';
	
	if($(this).parent().hasClass('modal-mainbz')== true){
		data = "mainb"+$('.mainbz').val();
	}else if($(this).parent().hasClass('modal-coreitem')== true){
		data = "corit"+$('.coreitem').val();
	}else if($(this).parent().hasClass('modal-bizcn')== true){
		data = "bizcn"+$('.bizcn').val();
	}else if($(this).parent().hasClass('modal-picnm')== true){
		data = "picnm"+$('.picnm').val();
	}else if($(this).parent().hasClass('modal-pictelno')== true){
		data = "pictn"+$('.pictelno').val();
	}
	
	
	$.ajax({
		url:"/usr/main/irinfoUpdate.do",
		data:{"data":data, "entNum":entNum},
		type:"post",
		dataType:"JSON",
		success:function(e){
			modalHidden();
			location.reload();
		}
	})
})
</script>