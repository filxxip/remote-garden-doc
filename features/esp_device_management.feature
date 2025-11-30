Feature: ESP Device Management
  As a mobile app user
  I want to manage my ESP devices
  So that I can connect them to my gardens

  Background:
    Given the user is logged in

  Scenario: Viewing all user's ESP devices
    Given the user has registered ESP devices
    When the app sends GET to "/api/esp-devices/"
    Then the backend returns all user's ESP devices
    And the app displays ESP device list

  Scenario: Assigning ESP device to garden
    Given the user has an unassigned ESP device
    And has a garden
    When the user selects "Assign to Garden"
    And chooses a garden
    And the app sends POST to "/api/esp-devices/{esp_id}/assign"
    Then the backend assigns ESP to garden
    And returns success status
    And the app shows device in garden

  Scenario: Unassigning ESP device from garden
    Given ESP device is assigned to garden
    When the user selects "Unassign from Garden"
    And the app sends POST to "/api/esp-devices/{esp_id}/unassign"
    Then the backend removes garden assignment
    And returns success
    And the app updates device status

  Scenario: Resetting ESP device
    Given ESP device has configuration
    When the user selects "Reset Device"
    And confirms reset
    And the app sends POST to "/api/esp-devices/{esp_id}/reset"
    Then the backend resets device to factory state
    And returns success
    And the app updates device status

  Scenario: Stopping ESP device
    Given ESP device is running
    When the user taps "Stop Device"
    And the app sends POST to "/api/esp-devices/{esp_id}/stop"
    Then the backend stops device operations
    And returns success
    And the app shows device as stopped

  Scenario: Resuming ESP device
    Given ESP device is stopped
    When the user taps "Resume Device"
    And the app sends POST to "/api/esp-devices/{esp_id}/resume"
    Then the backend resumes device operations
    And returns success
    And the app shows device as active
