##---------------------------------------------------------------------------
## Author:      Sean D'Epagnier
## Copyright:   
## License:     GPLv3
##---------------------------------------------------------------------------


IF(WIN32)
    IF(MINGW)
        FIND_PACKAGE(TinyXML)
    ENDIF()

    IF(TINYXML_FOUND)
        message (STATUS "Building with system tinyxml")
        INCLUDE_DIRECTORIES(${TINYXML_INCLUDE_DIR})
        TARGET_LINK_LIBRARIES(${PACKAGE_NAME} ${TINYXML_LIBRARIES} )
    ELSE()
        message (STATUS "Building with bundled tinyxml")
        SET(SRC_TINYXML
            src/tinyxml/tinyxml.cpp
            src/tinyxml/tinyxmlparser.cpp
            src/tinyxml/tinyxmlerror.cpp
        )
        ADD_LIBRARY(${PACKAGE_NAME}_LIB_PLUGINXML STATIC ${SRC_TINYXML})
        TARGET_LINK_LIBRARIES( ${PACKAGE_NAME} ${PACKAGE_NAME}_LIB_PLUGINXML )
    ENDIF()
ENDIF()

ADD_DEFINITIONS(-DTIXML_USE_STL)
