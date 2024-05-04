package com.lend.shareservice.web.review;

import com.lend.shareservice.domain.review.ReviewService;
import com.lend.shareservice.domain.user.UserService;
import com.lend.shareservice.entity.Favorite;
import com.lend.shareservice.entity.Review;
import com.lend.shareservice.web.favorite.dto.FavoriteDTO;
import com.lend.shareservice.web.paging.dto.PagingDTO;
import com.lend.shareservice.web.review.dto.ReviewDTO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;

    private final UserService userService;


    @GetMapping("/review/{userid}/received")
    public String receivedReviewList(Model model,
                                     PagingDTO page,
                                     @PathVariable("userid") String userId,
                                     @RequestParam(defaultValue = "1") int pageNum){

        userId=userService.getUserId(userId);

        int totalCount= reviewService.receivedGetTotalCount(userId);

        page.setTotalCount(totalCount);
        page.setOneRecordPage(6);
        page.setPagingBlock(5);

        List<ReviewDTO> receiveds=reviewService.receiveds(page,userId);

        String loc ="/review/"+userId+"/received";

        String pageNavi=page.getPageNavi(loc);

        model.addAttribute("receiveds",receiveds);
        model.addAttribute("userId",userId);
        model.addAttribute("page",page);
        model.addAttribute("pageNavi",pageNavi);

        return "jspp/myReceivedReview";
    }

    @GetMapping("/review/{userid}/sent")
    public String sentReviewList(Model model,
                                 PagingDTO page,
                                 @PathVariable("userid") String userId,
                                     @RequestParam(defaultValue = "1") int pageNum){

        userId=userService.getUserId(userId);

        if(pageNum<1){
            pageNum=1;
        }

        int totalCount=reviewService.sentGetTotalCount(userId);

        List<ReviewDTO> sents=reviewService.sents(page,userId);

        model.addAttribute("sents",sents);
        model.addAttribute("userId",userId);
        model.addAttribute("page",page);

        return "jspp/mySentReview";
    }
}
