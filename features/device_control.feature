Feature: Device Control
  As a mobile app user
  I want to control garden actuators
  So that I can manage my garden environment

  Background:
    Given the user is logged in
    And has a garden with ESP devices

  Scenario: Viewing devices in a garden
    Given the user views garden dashboard
    When the app sends GET to "/api/devices/garden/{garden_id}"
    Then the backend returns all devices for garden's ESPs
    And the app displays device list with current status

  Scenario: Turning on actuator for all devices in garden
    Given the user views garden dashboard
    When the user selects actuator type
    And taps "Turn On All"
    And the app sends POST to "/api/devices/garden/{garden_id}/{actuator}/on"
    Then the backend sends ON command to all actuators of that type
    And returns success status
    And the app updates device status to active

  Scenario: Turning off actuator for all devices in garden
    Given actuators are active
    When the user taps "Turn Off All"
    And the app sends POST to "/api/devices/garden/{garden_id}/{actuator}/off"
    Then the backend sends OFF command to actuators
    And returns success
    And the app updates device status to inactive

  Scenario: Controlling specific ESP device actuator
    Given the user views device details
    When the user selects specific ESP actuator
    And taps control button
    And the app sends POST to "/api/devices/esp/{esp_id}/{actuator}/{action}"
    Then the backend sends command to that ESP's actuator
    And returns success
    And the app updates that device status
