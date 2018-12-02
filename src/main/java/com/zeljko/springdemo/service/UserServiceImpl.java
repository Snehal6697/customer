package com.zeljko.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zeljko.springdemo.dao.UserDAO;
import com.zeljko.springdemo.entity.Users;

@Service
public class UserServiceImpl implements UserService {

	// need to inject user dao
	private UserDAO userDAO;

	@Autowired
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	@Transactional
	public List<Users> getUsers() {

		return userDAO.getUsers();
	}

}
