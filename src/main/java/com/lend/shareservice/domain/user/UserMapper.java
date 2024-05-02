package com.lend.shareservice.domain.user;

import com.lend.shareservice.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    List<User> userList();

    String getUserId(String userId);
}
