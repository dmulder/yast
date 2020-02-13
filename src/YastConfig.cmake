#
# Find YaST and sets the following variables
# YAST_INCLUDE_DIR
# YAST_LIBRARY
# YAST_PLUGIN_DIR
# YAST_DATA_DIR
# YAST_PLUGIN_WFM_LIBRARY
# YAST_PLUGIN_SCR_LIBRARY
# YAST_PLUGIN_UI_LIBRARY
# YAST_YCP_LIBRARY
#

include(../yast-devtools/build-tools/cmake/modules/YastCommon.cmake)

if(YAST_INCLUDE_DIR AND YAST_LIBRARY AND YAST_YCP_LIBRARY)
  # Already in cache, be silent
  set(YAST_FIND_QUIETLY TRUE)
endif(YAST_INCLUDE_DIR AND YAST_LIBRARY AND YAST_YCP_LIBRARY)

set(YAST_LIBRARY)
set(YAST_INCLUDE_DIR)
set(YAST_YCP_LIBRARY)

FIND_PATH(YAST_INCLUDE_DIR Y2.h
  ../yast-core/liby2/src/include
)

FIND_LIBRARY(YAST_LIBRARY NAMES y2
  PATHS
  ../yast-core/liby2/src/.libs
)

FIND_LIBRARY(YAST_YCP_LIBRARY NAMES ycp
  PATHS
  ../yast-core/libycp/src/.libs
)

FIND_LIBRARY(YAST_YUI_LIBRARY NAMES yui
  PATHS
  ../libyui/src/.libs
)

FIND_LIBRARY(YAST_PLUGIN_WFM_LIBRARY NAMES py2wfm
  PATHS
  ../yast-core/wfm/src/.libs
)

FIND_LIBRARY(YAST_PLUGIN_SCR_LIBRARY NAMES py2scr
  PATHS
  ../yast-core/scr/src/.libs
)

FIND_LIBRARY(YAST_PLUGIN_UI_LIBRARY NAMES py2UI
  PATHS
  ../yast-ycp-ui-bindings/src/.libs
)

#SET(CMAKE_MODULE_PATH "${CMAKE_INSTALL_PREFIX}/share/YaST2/data/devtools/cmake/modules" ${CMAKE_MODULE_PATH})

if(YAST_INCLUDE_DIR AND YAST_LIBRARY AND YAST_YCP_LIBRARY)
   MESSAGE( STATUS "YaST2 found: includes in ${YAST_INCLUDE_DIR}, library in ${YAST_LIBRARY}")
   MESSAGE( STATUS "             plugins in ${YAST_PLUGIN_DIR}")
   MESSAGE( STATUS "             scr in ${YAST_PLUGIN_SCR_LIBRARY}")
   MESSAGE( STATUS "             wfm in ${YAST_PLUGIN_WFM_LIBRARY}")
   MESSAGE( STATUS "             UI in ${YAST_PLUGIN_UI_LIBRARY}")
   set(YAST_FOUND TRUE)
else(YAST_INCLUDE_DIR AND YAST_LIBRARY AND YAST_YCP_LIBRARY)
  if (NOT YAST_INCLUDE_DIR)
    MESSAGE( STATUS "YaST2 include dir not found.")
  endif (NOT YAST_INCLUDE_DIR)
  if (NOT YAST_LIBRARY)
    MESSAGE( STATUS "YaST2 library not found.")
  endif (NOT YAST_LIBRARY)
  if (NOT YAST_YCP_LIBRARY)
    MESSAGE( STATUS "YaST2 YCP files not found.")
  endif (NOT YAST_YCP_LIBRARY)
endif(YAST_INCLUDE_DIR AND YAST_LIBRARY AND YAST_YCP_LIBRARY)

MARK_AS_ADVANCED(YAST_INCLUDE_DIR YAST_LIBRARY YAST_YCP_LIBRARY YAST_PLUGIN_WFM_LIBRARY YAST_PLUGIN_SCR_LIBRARY
                 YAST_PLUGIN_UI_LIBRARY YAST_PLUGIN_DIR YAST_IMAGE_DIR YAST_DATA_DIR YAST_YUI_LIBRARY )
