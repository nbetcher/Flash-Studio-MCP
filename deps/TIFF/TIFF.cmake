find_package(OpenGL QUIET REQUIRED)

if (APPLE)
    message(STATUS "Compiling TIFF for macos ${CMAKE_SYSTEM_VERSION}.")
    orcaslicer_add_cmake_project(TIFF
        # Official release tarball, not a GitLab auto-generated archive: those are
        # regenerated server-side and their bytes (and therefore their hash) change
        # over time, which is exactly what broke this pin.
        URL https://download.osgeo.org/libtiff/tiff-4.3.0.tar.gz
        URL_HASH SHA256=0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8
        DEPENDS ${ZLIB_PKG} ${PNG_PKG} dep_JPEG
        CMAKE_ARGS
            -Dlzma:BOOL=OFF
            -Dwebp:BOOL=OFF
            -Djbig:BOOL=OFF
            -Dzstd:BOOL=OFF
            -Dlibdeflate:BOOL=OFF
            -Dpixarlog:BOOL=OFF
    )
else()
    orcaslicer_add_cmake_project(TIFF
        # See the note above: the GitLab archive this used to point at no longer
        # hashes to the pinned value, which silently took wxWidgets down with it.
        URL https://download.osgeo.org/libtiff/tiff-4.1.0.tar.gz
        URL_HASH SHA256=5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634
        DEPENDS ${ZLIB_PKG} ${PNG_PKG} dep_JPEG
        CMAKE_ARGS
            -Dlzma:BOOL=OFF
            -Dwebp:BOOL=OFF
            -Djbig:BOOL=OFF
            -Dzstd:BOOL=OFF
            -Dpixarlog:BOOL=OFF
    )

endif()



