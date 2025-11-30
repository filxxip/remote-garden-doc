Feature: Sensor Readings
  As a mobile app user
  I want to view sensor data from my garden
  So that I can monitor environmental conditions

  Background:
    Given the user is logged in
    And has a garden with sensor devices

  Scenario: Viewing latest sensor reading
    Given the user views garden dashboard
    When the app sends GET to "/api/readings/garden/{garden_id}/device-type/{type}/last"
    Then the backend returns most recent reading for device type
    And the app displays current sensor value

  Scenario: Viewing historical sensor data
    Given the user wants to see trends
    When the user selects date range
    And the app sends GET to "/api/readings/garden/{garden_id}/device-type/{type}" with filters
    Then the backend returns paginated readings for time range
    And the app displays data as chart or list

  Scenario: Filtering readings by time range
    Given the user views sensor history
    When the user sets start and end time
    And the app sends request with time parameters
    Then the backend filters readings by timestamp
    And returns matching records
    And the app updates the display

  Scenario: Paginating through readings
    Given there are many sensor readings
    When the user scrolls through history
    And the app sends request with offset and limit
    Then the backend returns specified page of data
    And the app appends to existing list
