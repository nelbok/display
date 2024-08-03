cmake_minimum_required(VERSION 3.27)

project(Display VERSION 1.0 LANGUAGES CXX)

if (MSVC)
    add_compile_options(/W4)
else()
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick LinguistTools)

set(PROJECT_SOURCES
    src/main.cpp
    src/StylesManager.cpp
    src/StylesManager.hpp
    src/TranslationsManager.cpp
    src/TranslationsManager.hpp

    resources/resources.qrc
)
set(QML_SOURCES
    qml/blocks/BSettings.qml
    qml/common/CBlock.qml
    qml/common/CComboBox.qml
    qml/common/CSlider.qml
    qml/Main.qml
)

set(TRANSLATION_FILES
    translations/app_en.ts
    translations/app_fr.ts
)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appDisplay ${PROJECT_SOURCES})
qt_add_qml_module(appDisplay URI Display VERSION 1.0 QML_FILES ${QML_SOURCES})
qt_add_translations(appDisplay TS_FILES ${TRANSLATION_FILES} RESOURCE_PREFIX "/translations")

source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}" PREFIX "" FILES ${PROJECT_SOURCES} ${QML_SOURCES})

set_target_properties(appDisplay PROPERTIES
    WIN32_EXECUTABLE TRUE
    QT_ANDROID_PACKAGE_SOURCE_DIR android
)
target_link_libraries(appDisplay PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appDisplay
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Android
configure_file(android/AndroidManifest.xml android/AndroidManifest.xml COPYONLY)
configure_file(android/res/drawable-hdpi/icon.png android/res/drawable-hdpi/icon.png COPYONLY)
configure_file(android/res/drawable-ldpi/icon.png android/res/drawable-ldpi/icon.png COPYONLY)
configure_file(android/res/drawable-mdpi/icon.png android/res/drawable-mdpi/icon.png COPYONLY)
configure_file(android/res/drawable-xhdpi/icon.png android/res/drawable-xhdpi/icon.png COPYONLY)
configure_file(android/res/drawable-xxhdpi/icon.png android/res/drawable-xxhdpi/icon.png COPYONLY)
configure_file(android/res/drawable-xxxhdpi/icon.png android/res/drawable-xxxhdpi/icon.png COPYONLY)
