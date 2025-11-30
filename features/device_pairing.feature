Feature: Device Pairing via Bluetooth and WiFi Connection
  As a mobile app user
  I want to pair an ESP device via Bluetooth
  So that I can connect it to my WiFi network and link it to my account

  Background:
    Given the user is logged in
    And the ESP device is powered on
    And the ESP device is in pairing mode (BLE advertising)

  Scenario: Discovering and connecting to ESP device via Bluetooth
    Given user opens "Add Device" screen
    When app scans for BLE devices
    And discovers ESP device broadcasting
    And user selects the ESP device
    Then app establishes BLE/GATT connection
    And app is ready to send credentials

  Scenario: Sending WiFi credentials via Bluetooth
    Given app is connected to ESP via BLE
    When user selects WiFi network from list
    And enters WiFi password
    And app writes SSID to BLE characteristic
    And app writes password to BLE characteristic
    And app writes user key to BLE characteristic
    Then ESP receives all credentials
    And ESP connects to WiFi network
    And ESP obtains IP address

  Scenario: ESP device registration with backend
    Given ESP is connected to WiFi
    And has user key from BLE
    When ESP connects to MQTT broker
    And ESP sends registration with user key
    Then backend validates user key
    And backend links ESP device to user account
    And device appears in user's device list
    And app displays "Device paired successfully"
