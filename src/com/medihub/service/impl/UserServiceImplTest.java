package com.medihub.service.impl;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.medihub.beans.UserBean;

class UserServiceImplTest {

    private UserServiceImpl u;

    @BeforeAll
    static void setUpBeforeClass() throws Exception {
        // Any global setup can be done here if needed
    }

    @AfterAll
    static void tearDownAfterClass() throws Exception {
        // Any global teardown can be done here if needed
    }

    @BeforeEach
    void setUp() throws Exception {
        u = new UserServiceImpl();  // Initialize the UserServiceImpl instance
    }

    @AfterEach
    void tearDown() throws Exception {
        // Clean up after each test if necessary
    }

    @Test
    void testGetFName() {
        // Given
        String emailId = "ashima@gmail.com";

        // When
        String fName = u.getFName(emailId);

        // Then
        assertEquals("Ashima", fName);  // Assuming the expected first name is "Test"
    }
    
    @Test
    void testRegisterUserSuccess() {
        // Given
        UserBean user = new UserBean("Test User2", 1234567890L, "test2@test.com", "Test Address", 123456, "password");

        // When
        String result = u.registerUser(user);

        // Then
        assertEquals("User Registered Successfully!", result);
    }
    
    @Test
    void testIsRegistered() {
        // Given
        String emailId = "ashima@gmail.com";

        // When
        boolean result = u.isRegistered(emailId);

        // Then
        assertTrue(result);  // Assuming the emailId is already registered
    }
    
    @Test
    void testIsValidCredential() {
        // Given
        String emailId = "ashima@gmail.com";
        String password = "ashima";

        // When
        String result = u.isValidCredential(emailId, password);

        // Then
        assertEquals("valid", result);  // Assuming the credentials are valid
    }
    
    @Test
    void testGetUserDetails() {
        // Given
        String emailId = "test@test.com";
        String password = "password";

        // When
        UserBean user = u.getUserDetails(emailId, password);

        // Then
        assertNotNull(user);  // Assuming the user details are correctly retrieved
        assertEquals("Test User", user.getName());
        assertEquals(1234567890, user.getMobile());
        assertEquals("test@test.com", user.getEmail());
        assertEquals("Test Address", user.getAddress());
        assertEquals(123456, user.getPinCode());
        assertEquals("password", user.getPassword());
    }
    
    @Test
    void testGetUserAddr() {
        // Given
        String emailId = "test@test.com";

        // When
        String address = u.getUserAddr(emailId);

        // Then
        assertEquals("Test Address", address);  // Assuming the address is correctly retrieved
    }
}
