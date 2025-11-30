Feature: Notifications
  As a mobile app user
  I want to receive and manage notifications
  So that I stay informed about my garden status

  Background:
    Given the user is logged in

  Scenario: Viewing all notifications
    Given the user has notifications
    When the app sends GET to "/api/notifications/"
    Then the backend returns all user notifications
    And the app displays notification list

  Scenario: Viewing alert notifications
    Given the user has alert notifications
    When the user filters by "Alerts"
    And the app sends GET to "/api/notifications/alerts/"
    Then the backend returns alert-type notifications
    And the app displays urgent garden warnings

  Scenario: Viewing reminder notifications
    Given the user has scheduled tasks
    When the user filters by "Reminders"
    And the app sends GET to "/api/notifications/reminders/"
    Then the backend returns reminder notifications
    And the app displays tasks and schedules

  Scenario: Viewing system notifications
    Given system messages are available
    When the user filters by "System"
    And the app sends GET to "/api/notifications/system/"
    Then the backend returns system notifications
    And the app displays maintenance messages

  Scenario: Dismissing a notification
    Given the user views a notification
    When the user swipes to dismiss
    And the app sends PATCH to "/api/notifications/{id}/dismiss/"
    Then the backend marks notification as dismissed
    And returns success
    And the app removes notification from list
