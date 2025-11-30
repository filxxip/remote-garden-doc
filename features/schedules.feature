Feature: Schedule Management
  As a mobile app user
  I want to manage automated schedules for my garden
  So that tasks run automatically at specified times

  Background:
    Given the user is logged in
    And has a garden

  Scenario: Viewing all schedules for a garden
    Given the garden has schedules
    When the app sends GET to "/api/schedules/{garden_id}/"
    Then the backend returns all schedules for the garden
    And the app displays schedule list with timing and actions

  Scenario: Creating a new schedule
    Given the user wants to automate a task
    When the user sets cron expression and action
    And the app sends POST to "/api/schedules/{garden_id}/"
    Then the backend creates scheduled task
    And returns task_id
    And the app adds schedule to list

  Scenario: Creating a weekly schedule
    Given the user wants weekly automation
    When the user selects days and time
    And the app sends POST to "/api/schedules/weekly/{garden_id}/"
    Then the backend creates weekly schedule
    And returns task_id
    And the app displays weekly schedule

  Scenario: Updating a schedule
    Given the user has an existing schedule
    When the user changes cron expression
    And the app sends PUT to "/api/schedules/{task_id}/"
    Then the backend updates schedule timing
    And returns success
    And the app refreshes schedule display

  Scenario: Updating a weekly schedule
    Given the user has weekly schedule
    When the user changes days or time
    And the app sends PUT to "/api/schedules/weekly/{task_id}/"
    Then the backend updates weekly schedule
    And returns success
    And the app updates display

  Scenario: Toggling schedule on/off
    Given the user has active schedule
    When the user taps toggle switch
    And the app sends POST to "/api/schedules/{task_id}/toggle/"
    Then the backend toggles schedule state
    And returns success
    And the app updates toggle UI

  Scenario: Deleting a schedule
    Given the user wants to remove schedule
    When the user confirms deletion
    And the app sends DELETE to "/api/schedules/{task_id}/"
    Then the backend removes schedule permanently
    And returns success
    And the app removes schedule from list
