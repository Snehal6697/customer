package com.zeljko.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zeljko.springdemo.entity.User;

@Repository
public class UserDAOImpl implements UserDAO {

	// need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<User> getUsers() {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// create a query ... sort by password
		Query<User> theQuery = currentSession.createQuery("from User order by password", User.class);

		// execute query and get result list
		List<User> users = theQuery.getResultList();

		// return the results
		return users;
	}

	@Override
	public void saveUser(User theUser) {

		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// save/update the user ... finally LOL
		currentSession.saveOrUpdate(theUser);

	}

	@Override
	public User getUser(String theUsername) {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// now retrieve/read from database using the primary key
		User theUser = currentSession.get(User.class, theUsername);
		return theUser;
	}

	@Override
	public void deleteUser(String theUsername) {

		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();

		// delete object with primary key
		Query theQuery = currentSession.createQuery("delete from User where id=:username");
		theQuery.setParameter("username", theUsername);

		theQuery.executeUpdate();
	}

}
