package com.lend.shareservice.web.user;

import com.lend.shareservice.domain.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

}
