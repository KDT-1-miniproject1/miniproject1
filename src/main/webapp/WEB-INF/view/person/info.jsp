<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div class="container d-flex mt-4">
            <div class="list-group ms-2 mt-4">
                <a href="/person/info" class="list-group-item  hs_list_effect" style="width: 150px;">회원 정보</a>
                <a href="/person/resumes" class="list-group-item ">이력서 관리</a>
                <a href="/person/scrap" class="list-group-item ">스크랩</a>
                <a href="/person/history" class="list-group-item ">지원 이력</a>
            </div>



            <div class="ms-2 p-4">
                <div class="border border-tertiary w-100 p-5 rounded ">
                    <div class="d-flex justify-content-between">
                        <h1 class="hs_line">개인회원 정보</h1>
                        <button type="button" class="btn btn-dark hs_update_button"
                            onclick="location.href=`/person/updateInfoForm`;">수정하기</button>
                    </div>
                    <hr />
                    <div>
                        <div class="container w-50 mt-5 text ">
                            <form>
                                <div class="input-group mb-3">
                                    <span
                                        class="input-group-text bg-light justify-content-center hs_span_size">이름</span>
                                    <input type="text" class="form-control" value="성소정" readonly>
                                </div>
                                <div class="input-group mb-3">
                                    <span
                                        class="input-group-text bg-light justify-content-center hs_span_size">연락처</span>
                                    <input type="text" class="form-control" value="000-000-0000" readonly>
                                </div>
                                <div class="input-group mb-3">
                                    <span
                                        class="input-group-text bg-light justify-content-center hs_span_size">이메일</span>
                                    <input type="text" class="form-control" value="email@email.com" readonly>
                                </div>
                                <div class="input-group mb-3">
                                    <span
                                        class="input-group-text bg-light justify-content-center hs_span_size">주소</span>
                                    <input type="text" class="form-control" value="부산광역시 진구 서면" readonly>
                                </div>

                                <hr class="my-4">
                                <div class="mt-5 jh_resume_skill">
                                    <h4>기술스택</h4>
                                    <div class="">
                                        <ul>
                                            <li>HTML</li>
                                            <li>CSS</li>
                                            <li>JavaScript</li>
                                            <li>React</li>
                                            <li>Node.js</li>
                                            <li>Express</li>
                                        </ul>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <%@ include file="../layout/footer.jsp" %>