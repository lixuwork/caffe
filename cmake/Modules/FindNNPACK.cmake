SET(NNPACK_INCLUDE_SEARCH_PATHS
  /usr/include
  /usr/local/include
  /opt/NNPACK/include
  $ENV{NNPACK_ROOT}
  $ENV{NNPACK_ROOT}/include
)

SET(NNPACK_LIB_SEARCH_PATHS
        /lib/
        /lib64/
        /usr/lib
        /usr/lib64
        /usr/local/lib
        /usr/local/lib64
        /opt/NNPACK/lib
        $ENV{NNPACK_ROOT}
        $ENV{NNPACK_ROOT}/lib
 )

FIND_PATH(NNPACK_INCLUDE_DIR NAMES nnpack.h PATHS ${NNPACK_INCLUDE_SEARCH_PATHS})
FIND_LIBRARY(NNPACK_LIB NAMES nnpack PATHS ${NNPACK_LIB_SEARCH_PATHS})

SET(NNPACK_FOUND ON)

#    Check include files
IF(NOT NNPACK_INCLUDE_DIR)
    SET(NNPACK_FOUND OFF)
    MESSAGE(STATUS "Could not find NNPACK include. Turning NNPACK_FOUND off")
ENDIF()

#    Check libraries
IF(NOT NNPACK_LIB)
    SET(NNPACK_FOUND OFF)
    MESSAGE(STATUS "Could not find NNPACK lib. Turning NNPACK_FOUND off")
ENDIF()

IF (NNPACK_FOUND)
  add_definitions(-DUSE_NNPACK)
  IF (NOT NNPACK_FIND_QUIETLY)
    MESSAGE(STATUS "Found NNPACK libraries: ${NNPACK_LIB}")
    MESSAGE(STATUS "Found NNPACK include: ${NNPACK_INCLUDE_DIR}")
  ENDIF (NOT NNPACK_FIND_QUIETLY)
ELSE (NNPACK_FOUND)
  IF (NNPACK_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find NNPACK")
  ENDIF (NNPACK_FIND_REQUIRED)
ENDIF (NNPACK_FOUND)

MARK_AS_ADVANCED(
    NNPACK_INCLUDE_DIR
    NNPACK_LIB
    NNPACK
)
