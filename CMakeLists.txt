set(ARDUINO_SDK_PATH ${CMAKE_SOURCE_DIR}/arduino-1.8.5)
set(CMAKE_TOOLCHAIN_FILE arduino-cmake/cmake/ArduinoToolchain.cmake)

cmake_minimum_required(VERSION 2.8)

project(transmitter C CXX)

set(SparkFunBME280_RECURSE True)

link_directories(${CMAKE_SOURCE_DIR}/libs)

generate_arduino_firmware(transmitter
  BOARD uno
  HDRS ${CMAKE_SOURCE_DIR}/libs/LowPower/LowPower.h ${CMAKE_SOURCE_DIR}/libs/SparkFunBME280/src/SparkFunBME280.h
  SRCS ${CMAKE_SOURCE_DIR}/src/transmitter/main.cpp
)

generate_arduino_firmware(base
  BOARD uno
  HDRS ${CMAKE_SOURCE_DIR}/libs/SparkFunBME280/src/SparkFunBME280.h
  SRCS ${CMAKE_SOURCE_DIR}/src/base/main.cpp ${CMAKE_SOURCE_DIR}/src/base/NixieDisplay.cpp ${CMAKE_SOURCE_DIR}/src/base/PanelControls.cpp ${CMAKE_SOURCE_DIR}/src/base/SensorReadout.cpp
)
