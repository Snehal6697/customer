package com.zeljko.springdemo.service;

import java.util.List;

import com.zeljko.springdemo.entity.User;

public interface UserService {

	public List<User> getUsers();

	public void saveUser(User theUser);

	public User getUser(String theUsername);

	public void deleteUser(String theUsername);

}