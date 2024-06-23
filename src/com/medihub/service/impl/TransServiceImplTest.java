package com.medihub.service.impl;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.medihub.utility.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

class TransServiceImplTest {

    private TransServiceImpl transService;


    @AfterAll
    static void tearDownAfterClass() throws Exception {
        // Any global teardown can be done here if needed
    }

    @BeforeEach
    void setUp() throws Exception {
        transService = new TransServiceImpl();  // Initialize the TransServiceImpl instance
    }

    @AfterEach
    void tearDown() throws Exception {
        // Clean up after each test if necessary
    }

    @Test
    void testGetUserId() {
        // Given
        String transId = "T20240430102235";

        // When
        String userId = transService.getUserId(transId);

        // Then
        assertEquals("ashima@gmail.com", userId);  // Assuming the expected userId is "testUser"
    }
}
