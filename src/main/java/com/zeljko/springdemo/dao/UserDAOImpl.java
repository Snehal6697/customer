package com.zeljko.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeljko.springdemo.entity.Users;

@Repository
public class UserDAOImpl implements UserDAO {

	// need to inject the session factory
	private SessionFactory sessionFactory;

	@Autowired
	public UserDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Users> getUsers() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// create a query ... sort by password
		Query<Users> theQuery = currentSession.createQuery("from Users order by password", Users.class);

		// execute query and get result list
		List<Users> users = theQuery.getResultList();

		// return the results
		return users;
	}

}
