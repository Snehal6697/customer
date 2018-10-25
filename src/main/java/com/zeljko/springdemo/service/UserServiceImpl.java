package com.zeljko.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zeljko.springdemo.dao.UserDAO;
import com.zeljko.springdemo.entity.User;

@Service
public class UserServiceImpl implements UserService {

	// need to inject user dao
	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional
	public List<User> getUsers() {

		return userDAO.getUsers();
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {

		userDAO.saveUser(theUser);

	}

	@Override
	@Transactional
	public User getUser(String theUsername) {

		return userDAO.getUser(theUsername);
	}

	@Override
	@Transactional
	public void deleteUser(String theUsername) {

		userDAO.deleteUser(theUsername);

	}

}
