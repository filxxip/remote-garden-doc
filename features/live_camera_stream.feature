Feature: Live Camera Stream
  As a mobile app user
  I want to view live camera feed from my garden
  So that I can monitor my plants in real-time

  Background:
    Given the user is logged in
    And has a garden with ESP camera device
    And WebSocket connection is established

  Scenario: Receiving camera frames via WebSocket
    Given ESP device is sending camera frames via MQTT
    When the backend receives frame on topic "{mac}/device/camera/frame/{index}/#"
    Then the backend processes JPEG frame
    And converts frame to base64
    And sends "camera_frame" event via WebSocket to user
    And the app receives frame with timestamp and image data
    And the app displays frame in real-time

  Scenario: Handling multipart camera frames
    Given ESP sends large frame in multiple parts
    When backend receives parts on "{mac}/device/camera/frame/{index}/part/{number}"
    Then the backend buffers each part
    And waits for "/end" marker
    And assembles complete frame from parts
    And sends assembled frame via WebSocket
    And the app displays complete image

  Scenario: Viewing live camera feed
    Given user opens garden camera view
    When the app listens to WebSocket "camera_frame" events
    Then the app continuously receives new frames
    And decodes base64 image data
    And displays frames as live video stream
    And updates display with each new frame

  Scenario: Closing live camera feed
    Given user is viewing live stream
    When user navigates away from camera view
    Then the app stops processing camera_frame events
    And releases image resources
