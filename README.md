# Garden IoT System - Features and Diagrams Documentation

## Overview
This directory contains Gherkin feature files and PlantUML sequence diagrams documenting the Garden IoT System architecture and workflows.

## Features Directory

### Mobile App Features

1. **mobile_login.feature** - Google OAuth authentication
   - First-time login with Google
   - Login for existing user
   - Refreshing expired access token
   - Accessing protected resources
   - User logout

2. **garden_management.feature** - Garden CRUD operations
   - Creating a new garden
   - Viewing all user gardens
   - Viewing specific garden details
   - Updating garden name
   - Deleting a garden

3. **device_control.feature** - IoT device control
   - Viewing devices in a garden
   - Turning on/off actuators for all devices
   - Controlling specific ESP device actuator

4. **sensor_readings.feature** - Sensor data monitoring
   - Viewing latest sensor reading
   - Viewing historical sensor data
   - Paginating through readings

5. **esp_device_management.feature** - ESP device lifecycle
   - Viewing all user's ESP devices
   - Assigning/unassigning ESP to garden
   - Resetting, stopping, resuming ESP device

6. **notifications.feature** - Notification system
   - Viewing all notifications
   - Viewing alert/reminder/system notifications

7. **live_camera_stream.feature** - Real-time camera feed
   - Receiving camera frames via WebSocket

8. **schedules.feature** - Automated task scheduling
   - Viewing, creating, updating schedules
   - Weekly schedules
   - Toggling and deleting schedules

9. **device_pairing.feature** - Bluetooth device pairing
   - Discovering ESP via Bluetooth
   - Sending WiFi credentials via BLE
   - ESP device registration with backend

### Admin App Features

10. **Admin Desktop Application** - Admin management
    - Login with Google authentication
    - Access control for non-admin users
    - USB port management

11. **device_registration.feature** - ESP device registration
    - Complete device registration via USB
    - Firmware flashing process

## PlantUML Diagrams

### Authentication & Authorization
- `mobile_login.puml` - Mobile app Google authentication flow
- `token_refresh.puml` - Access token refresh mechanism
- `protected_resources.puml` - Protected endpoint access
- `logout.puml` - User logout process
- `admin_login.puml` - Admin desktop app login
- `admin_access_denied.puml` - Non-admin access denial

### Garden & Device Management
- `garden_management.puml` - Garden CRUD operations
- `device_control.puml` - IoT device control via MQTT
- `sensor_readings.puml` - Sensor data retrieval
- `esp_device_management.puml` - ESP device lifecycle
- `schedules.puml` - Schedule management

### Communication & Monitoring
- `notifications.puml` - Notification system
- `live_camera_stream.puml` - Camera streaming via WebSocket
- `camera_frame_processing.puml` - Detailed multipart frame handling

### Device Provisioning
- `device_registration.puml` - Admin device registration workflow
- `device_pairing.puml` - Bluetooth pairing and WiFi setup
- `usb_port_refresh.puml` - USB port scanning
- `esp_activation_detailed.puml` - ESP flashing and activation
- `esp_startup_workflow.puml` - ESP first boot and provisioning

## Technologies Used

### Backend
- **Python/FastAPI** - REST API framework
- **PostgreSQL** - Database
- **MQTT** - IoT messaging protocol
- **WebSocket** - Real-time communication
- **JWT** - Token-based authentication
- **Google OAuth** - Authentication provider

### Frontend
- **Mobile App** - iOS/Android application
- **Qt/QML** - Admin desktop application
- **BLE GATT** - Bluetooth Low Energy communication

### IoT/Embedded
- **ESP32** - Microcontroller platform
- **ESP-IDF** - Development framework
- **OV2640** - Camera module
- **LittleFS** - Embedded filesystem
- **TLS/mTLS** - Secure communication
- **PSRAM** - External RAM for image buffering

### DevOps
- **Docker** - Containerization
- **espressif/idf** - ESP32 development container
- **mklittlefs** - Filesystem builder
- **esptool.py** - ESP32 flashing tool

## Viewing Diagrams

To view PlantUML diagrams:
1. Use PlantUML web server: http://www.plantuml.com/plantuml/
2. Install PlantUML extension in VS Code
3. Use PlantUML command-line tool

## Architecture Flow

1. **Admin registers device** → ESP flashed with firmware → Device ready for pairing
2. **User pairs device** → BLE connection → WiFi credentials → TLS provisioning → MQTT connection
3. **Device operates** → Sensors publish data → Camera streams → App controls actuators
4. **User monitors** → Real-time WebSocket updates → Historical data queries → Schedule automation
