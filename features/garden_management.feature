Feature: Garden Management
  As a mobile app user
  I want to manage my gardens
  So that I can organize and monitor my plants

  Background:
    Given the user is logged in
    And has valid access token

  Scenario: Creating a new garden
    Given the user is on the home screen
    When the user taps "Add Garden"
    And enters garden name "My Vegetable Garden"
    And the app sends POST to "/api/gardens/"
    Then the backend creates the garden
    And provisions an AI agent for automation
    And registers default schedule trigger
    And returns garden details with status 200
    And the app displays the new garden in the list

  Scenario: Viewing all user gardens
    Given the user has created gardens
    When the user opens the app
    And the app sends GET to "/api/gardens/"
    Then the backend returns all user's gardens
    And the app displays garden list on home screen

  Scenario: Viewing specific garden details
    Given the user has gardens
    When the user taps on a garden
    And the app sends GET to "/api/gardens/{garden_id}"
    Then the backend returns garden details
    And the app displays garden dashboard with devices and readings

  Scenario: Updating garden name
    Given the user views garden details
    When the user taps "Edit Garden"
    And changes name to "Indoor Herbs"
    And the app sends PUT to "/api/gardens/{garden_id}"
    Then the backend updates garden name
    And returns updated garden with status 200
    And the app displays updated name

  Scenario: Deleting a garden
    Given the user has multiple gardens
    When the user long-presses on a garden
    And selects "Delete"
    And confirms deletion
    And the app sends DELETE to "/api/gardens/{garden_id}"
    Then the backend removes garden and related data
    And returns success status
    And the app removes garden from list

  Scenario: Updating garden preferences
    Given the user views garden settings
    When the user changes temperature unit to "Celsius"
    And enables automation
    And the app sends PATCH to "/api/gardens/{garden_id}/preferences"
    Then the backend updates preferences
    And returns updated garden
    And the app applies new preferences to display
