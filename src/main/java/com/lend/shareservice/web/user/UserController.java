package com.lend.shareservice.web.user;

import com.lend.shareservice.domain.address.AddressService;
import com.lend.shareservice.domain.review.ReviewService;
import com.lend.shareservice.domain.user.UserService;

import com.lend.shareservice.domain.user.service.UserSignupService;
import com.lend.shareservice.domain.user.util.CommonUtil;
import com.lend.shareservice.domain.user.vo.UserVo;
import com.lend.shareservice.entity.User;

import com.lend.shareservice.web.user.dto.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import com.lend.shareservice.web.paging.dto.PagingDTO;
import lombok.AllArgsConstructor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RequestParam;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@AllArgsConstructor
@Slf4j
public class UserController {


    private final UserService userService;

    private final UserSignupService userSignupService;

    private final AddressService addressService;

    private final ReviewService reviewService;


    @Autowired
    private CommonUtil util;


    @GetMapping("/test")
    public String test(@SessionAttribute(name="userId", required = false)String userId, Model model) {

        UserVo user = userSignupService.getUserAccount(userId);

        if(user ==null){
            return "redirect:/login";
        }

        model.addAttribute("user",user);


        return "jspp/logintest";
    }

    @GetMapping("/login")
    public String loginForm(){
        return "jspp/login";
    }

    @PostMapping("/login")
    @ResponseBody
    public UserVo login(HttpServletRequest request, Model model) {

        model.addAttribute("loginType", "session-login");
        model.addAttribute("pageName", "세션 로그인");
        //1.회원정보 조회
        String userId = request.getParameter("userId");
        String pw = request.getParameter("pw");
        UserVo user = userSignupService.login(userId,pw);

        //2. 세션에 회원정보 저장 , 세션 유지 시간 설정
        if(user != null){
            request.getSession().invalidate();
            HttpSession session = request.getSession(true);  // Session이 없으면 생성
            // 세션에 userId를 넣어줌
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("authorization",user.getAuthorization());
            session.setAttribute("ban",user.getBan());
            session.setMaxInactiveInterval(1800); // Session이 30분동안 유지
        }

        return user;

    }
    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, Model model){
        model.addAttribute("loginType", "session-login");
        model.addAttribute("pageName", "세션 로그인");

        HttpSession session = request.getSession(false);  // Session이 없으면 null return
        if(session != null) {
            session.invalidate();
        }
        return "redirect:/login";
    }


    //빌려준 목록 보여주기
    @GetMapping("/user/{userId}/lender")
    public String lenderList(Model model,
                             PagingDTO page,
                             @PathVariable("userId") String userId,
                             @RequestParam(defaultValue = "1") int pageNum) {

        int totalCount = userService.getLenderCount(userId);

        page.setTotalCount(totalCount);
        page.setOneRecordPage(6);
        page.setPagingBlock(5);

        page.init();

        List<MyLenderAndMyLendyDTO> lenders= userService.findByLender(page,userId);

        for(MyLenderAndMyLendyDTO dto:lenders){
            if (dto.getLongitude() != null && dto.getLatitude() != null) {
                dto.setAddress(addressService.getAddressFromLatLng(dto.getLatitude(), dto.getLongitude()));
            } else {
                dto.setAddress("");
            }
        }

        String loc ="/user/"+userId+"/lender";

        String pageNavi=page.getPageNavi(loc);

        model.addAttribute("lenders",lenders);
        model.addAttribute("userId",userId);
        model.addAttribute("page",page);
        model.addAttribute("pageNavi",pageNavi);


        return "jspp/myLender";
    }
    //빌린 목록 보여주기
    @GetMapping("/user/{userId}/lendy")
    public String lendyList(Model model,
                            PagingDTO page,
                            @PathVariable("userId") String userId,
                            @RequestParam(defaultValue = "1") int pageNum) {

        int totalCount = userService.getLendyCount(userId);

        page.setTotalCount(totalCount);
        page.setOneRecordPage(6);
        page.setPagingBlock(5);

        page.init();

        List<MyLenderAndMyLendyDTO> lendys= userService.findByLendy(page,userId);

        for(MyLenderAndMyLendyDTO dto:lendys){
            if (dto.getLongitude() != null && dto.getLatitude() != null) {
                dto.setAddress(addressService.getAddressFromLatLng(dto.getLatitude(), dto.getLongitude()));
            } else {
                dto.setAddress("");
            }
        }

        String loc ="/user/"+userId+"/lendy";

        String pageNavi=page.getPageNavi(loc);

        model.addAttribute("lendys",lendys);
        model.addAttribute("userId",userId);
        model.addAttribute("page",page);
        model.addAttribute("pageNavi",pageNavi);


        return "jspp/myLendy";
    }
    //내 글 목록 보여주기
    @GetMapping("/user/{userId}/board")
    public String myBoardList(Model model,
                              PagingDTO page,
                              @PathVariable("userId") String userId,
                              @RequestParam(defaultValue = "1") int pageNum){

        int totalCount = userService.getMyBoardCount(userId);

        page.setTotalCount(totalCount);
        page.setOneRecordPage(6);
        page.setPagingBlock(5);

        page.init();

        List<MyBoardDTO> myBoards= userService.findByMyBoard(page,userId);

        for(MyBoardDTO dto:myBoards){
            if (dto.getLongitude() != null && dto.getLatitude() != null) {
                dto.setAddress(addressService.getAddressFromLatLng(dto.getLatitude(), dto.getLongitude()));
            } else {
                dto.setAddress("");
            }
        }

        String loc ="/user/"+userId+"/board";

        String pageNavi=page.getPageNavi(loc);

        model.addAttribute("myBoards",myBoards);
        model.addAttribute("userId",userId);
        model.addAttribute("page",page);
        model.addAttribute("pageNavi",pageNavi);

        return "jspp/myBoard";
    }

    //회원가입 페이지 출력
    @GetMapping("/user/signup")
    public String userSignupForm(){
        return "jspp/signup";
    }


    //회원가입 진행
    @PostMapping("/user/signup")
    public String signup(UserVo userVo){
        System.out.println("userVo = " + userVo);
        userSignupService.joinUser(userVo);

        return "redirect:/login";
    }



    @GetMapping("/user/idCheck")
    public String idCheckForm(){

        return "jspp/idCheck";
    }

    @PostMapping("/user/idCheck")
    public String idCheckEnd(Model model, @RequestParam(defaultValue = "")String userId){
        if(userId.isBlank()){
            return util.addMsgBack(model,"아이디를 입력해야 해요");
        }
        boolean isUse=userService.idCheck(userId);
        String msg=(isUse)? userId+"는 사용 가능합니다":userId+"는 이미 사용 중 입니다";
        String result=(isUse)?"ok":"fail";
        model.addAttribute("msg",msg);
        model.addAttribute("result",result);
        model.addAttribute("uid",userId);

        return "jspp/idCheckResult";
    }




    // 차단 등록
    @PostMapping("/user/{userId}/block")
    @ResponseBody
    public ResponseEntity<String> blockUser(@PathVariable("userId") String userId, @RequestBody BlockDTO blockDTO) {

        if (userService.blockUser(userId, blockDTO.getWriter()) > 0) {
            return ResponseEntity.ok("ok");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to block user.");
        }
    }

    //내 정보
    @GetMapping("/user/{userId}")
    public String myDetail(Model model,
                           @PathVariable("userId") String userId,
                           HttpServletRequest request){

        MyDetailDTO details=userService.findByUserDetail(userId);

        Double avgStar=reviewService.averageStar(userId);

        if(details.getLatitude()!=null && details.getLongitude()!=null){
            details.setAddress(addressService.getAddressFromLatLng(details.getLatitude(),details.getLongitude()));
        }else{
            details.setAddress("");
        }

        HttpSession session = request.getSession();
        String sessionUserId = (String) session.getAttribute("userId");

        model.addAttribute("details",details);
        model.addAttribute("avgStar",avgStar);
        if (userId.equals(sessionUserId)) {
            model.addAttribute("sessionUserId", sessionUserId);
        } else {
            model.addAttribute("notSessionUserId", userId);
        }

        return "jspp/myDetail";
    }

    //내 정보 수정페이지 이동
    @GetMapping("/user/{userId}/edit")
    public String editUser(Model model,
                           @PathVariable("userId")String userId){

        MyDetailDTO edit = userService.findByUserDetail(userId);

        if(edit.getLatitude()!=null && edit.getLongitude()!=null){
            edit.setAddress(addressService.getAddressFromLatLng(edit.getLatitude(),edit.getLongitude()));
        }else{
            edit.setAddress("");
        }

        model.addAttribute("edit",edit);

        return "jspp/editUser";
    }
    //유저 수정
    @PutMapping("/user/{userId}")
    public ResponseEntity<Map<String, String>> updateUser(@PathVariable("userId") String userId,
                                                          @Valid @RequestBody UpdateUserDTO updateUserDTO,
                                                          BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            for (FieldError error : bindingResult.getFieldErrors()) {
                errors.put(error.getField(), error.getDefaultMessage());
            }
            return new ResponseEntity<>(errors, HttpStatus.BAD_REQUEST);
        }

        int n=userService.updateUser(userId,updateUserDTO);

        Map<String, String> response = new HashMap<>();
        if (n > 0) {
            response.put("message", "ok");
            return new ResponseEntity<>(response, HttpStatus.OK);
        }

        response.put("message", "no");
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
    //주소 수정
    @PutMapping("/user/{userId}/address")
    public ResponseEntity<String> updateUserAddress(@PathVariable("userId") String userId,
                                                    @RequestParam("latitude") Double latitude,
                                                    @RequestParam("longitude") Double longitude){

        int n= userService.updateUserAddress(userId,latitude,longitude);

        if(n>0){
            return ResponseEntity.ok("ok");
        }else{
            return ResponseEntity.ok("no");
        }
    }
    //유저 탈퇴
    @DeleteMapping("/user/{userId}")
    public ResponseEntity<String> DeleteUser(@PathVariable("userId")String userId, HttpSession session){

        int n=userService.deleteUser(userId);

        if(n>0){
            session.invalidate();
            return ResponseEntity.ok("ok");
        }else{
            return ResponseEntity.ok("no");
        }

    }

    //돈 충전기능
    @PutMapping("/user/{userId}/charge")
    public ResponseEntity<String> ChargeMoney(@PathVariable("userId")String userId,
                                              @RequestParam("money") Integer money){

        int n=userService.updateMoney(userId,money);

        if(n>0){
            return ResponseEntity.ok("ok");
        }else{
            return ResponseEntity.ok("no");
        }
    }

    // 유저의 돈 조회
    @GetMapping("/user/{userId}/money")
    @ResponseBody
    public ResponseEntity<Integer> getUserMoney(@PathVariable("userId") String userId) {
        log.info("요청");
        return ResponseEntity.ok(userService.findByUserDetail(userId).getMoney());
    }

    // 유저의 리뷰 조회
    @GetMapping("/user/{userId}/review")
    @ResponseBody
    public ResponseEntity<List<ReviewDTO>> getReview(@PathVariable("userId") String userId) {

        List<ReviewDTO> reviews = userService.getReviewsByUserId(userId);
        log.info("reviews = {}", reviews);
        return ResponseEntity.ok(reviews);
    }

}


