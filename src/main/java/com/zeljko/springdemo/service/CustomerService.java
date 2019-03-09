package com.zeljko.springdemo.service;

import java.util.List;

import com.zeljko.springdemo.entity.Customer;

public interface CustomerService {

    List<Customer> getCustomers();

    void saveCustomer(Customer theCustomer);

    Customer getCustomer(int theId);

    void deleteCustomer(int theId);

}
