<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

<div class="container d-flex mt-4">
        <div class="list-group ms-2 mt-4">
            <a href="/company/info" class="list-group-item" style="width: 150px;">회사 정보</a>
            <a href="/company/posts" class="list-group-item">공고 관리</a>
            <a href="/company/getResume" class="list-group-item hs_list_effect">받은 이력서</a>
            <a href="/company/scrap" class="list-group-item ">스크랩한 유저</a>
        </div>

        <div class="ms-2 p-4">
            <div class="border border-tertiary w-100 p-5 rounded">
                <h1 class="hs_line">${resumeDetail.title}</h1>
                <hr>
                <div class="d-flex justify-content-center">
                    <div style="width: 85%;">
                        <div class="jh_resume_flexbox mt-3">
                            <img src="${resumeDetail.profile == null ? '/images/profile1.jpg' : resumeDetail.profile}" style="width: 188px; height: 226px;">
                            <table class="jh_resume_table">
                                <tr>
                                    <td>이름</td>
                                    <td>${personDetail.name}</td>
                                </tr>
                                <tr>
                                    <td>생년월일</td>
                                    <td>${personDetail.birthday}</td>
                                </tr>
                                <tr>
                                    <td>연락처</td>
                                    <td>${personDetail.phone}</td>
                                </tr>
                                <tr>
                                    <td>주소</td>
                                    <td>${personDetail.address}</td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td>${principal.email}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="mt-5">
                            <h4>포트폴리오 주소</h4>
                            <input type="url" class="form-control mt-2" id="floatingInput"
                                placeholder="git 또는 blog 주소를 입력해주세요" style="display: block;"
                                value="${resumeDetail.portfolio}" readOnly>
                        </div>
                        <div class="mt-5 jh_resume_skill">
                            <h4>기술스택</h4>
                            <div>
                                <ul>
                                <c:forEach items="${skillDetail}" var="skill">
                                    <li>${skill}</li>
                                </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="mt-5">
                            <h4>자기소개</h4>
                            <textarea name="resume_content" cols="109" rows="10" readOnly>${resumeDetail.selfIntro}
                               </textarea>
                       </div>
						    <div class="d-flex mt-4 justify-content-center">
                            <div class="px-2">
                                <button type="button" class="btn btn-light" onclick="updateProposal(${})">합격</button>
                            </div>
                            <div class="px-2">
                                <button type="button" class="btn btn-light">불합격</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../layout/footer.jsp" %>