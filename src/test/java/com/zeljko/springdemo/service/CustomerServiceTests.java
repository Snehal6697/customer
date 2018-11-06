package com.zeljko.springdemo.service;

import com.zeljko.springdemo.dao.CustomerDAO;
import com.zeljko.springdemo.entity.Customer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
//import org.mockito.junit.MockitoJUnitRunner;
import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

//@RunWith(SpringJUnit4ClassRunner.class)
@RunWith(MockitoJUnitRunner.class)
public class CustomerServiceTests {

    @Mock
    private CustomerDAO customerDAO;

    @InjectMocks
    private CustomerServiceImpl customerService;

    /*@Before
    public void setup(){
        MockitoAnnotations.initMocks(this);
    }*/

    @Test
    public void getCustomers() {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer(1, "mare", "maric", "mare@gmail.com"));
        customerList.add(new Customer(2, "pera", "peric", "pera@gmail.com"));
        when(customerService.getCustomers()).thenReturn(customerList);
        List<Customer> result = customerService.getCustomers();
        assertEquals(2, result.size());
    }

    @Test
    public void getCustomer() {
        Customer customer = new Customer(3, "zare", "zaric", "zare@gmail.com");
        when(customerDAO.getCustomer(3)).thenReturn(customer);
        Customer result = customerService.getCustomer(3);
        assertEquals(3, result.getId());
        assertEquals("zare", result.getFirstName());
        assertEquals("zaric", result.getLastName());
        assertEquals("zare@gmail.com", result.getEmail());
    }

    @Test
    public void deleteCustomer() {
        customerService.deleteCustomer(3);
        verify(customerDAO, times(1)).deleteCustomer(3);
    }
}