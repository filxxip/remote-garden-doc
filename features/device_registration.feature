Feature: ESP Device Registration
  As an administrator
  I want to register new ESP devices
  So that users can add them to their gardens

  Background:
    Given admin is logged in to desktop app
    And ESP device is connected via USB

  Scenario: Complete device registration
    Given admin selects USB port and firmware version
    When admin clicks "Register Device"
    Then admin app launches esp-prepare Docker container
    And container generates MAC and secret
    And creates SPIFFS files with credentials
    And sends POST to "/api/admin/esp/create"
    And backend validates admin token
    And backend creates device with sensors/actuators
    And container downloads firmware
    And container flashes firmware and SPIFFS to device
    And device reboots with new firmware
    And admin app displays "Flash completed successfully"
    And shows success dialog
