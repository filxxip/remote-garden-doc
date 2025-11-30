Feature: Mobile App Login via Google Authentication
  As a mobile app user
  I want to authenticate using my Google account
  So that I can securely access the application features

  Background:
    Given the API backend is running
    And the mobile app is installed

  Scenario: First-time login with Google
    Given the user opens the mobile app
    When the user taps "Login with Google"
    And authenticates with Google
    And the app sends ID token to "/api/auth/login/google"
    Then the backend verifies the token
    And creates new user account
    And returns access and refresh tokens
    And the app navigates to home screen

  Scenario: Login for existing user
    Given the user has logged in before
    When the user taps "Login with Google"
    And authenticates with Google
    And the app sends ID token to "/api/auth/login/google"
    Then the backend finds existing user
    And returns new access and refresh tokens
    And the app navigates to home screen

  Scenario: Refreshing expired access token
    Given the user is logged in
    And the access token has expired
    When the app sends refresh token to "/api/auth/refresh"
    Then the backend validates refresh token
    And returns new access token
    And the app continues with authenticated request

  Scenario: User logout
    Given the user is logged in
    When the user taps "Logout"
    Then the app clears stored tokens
    And navigates to login screen
