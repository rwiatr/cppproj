if (__IMGUI_INCLUDE__LIB)
else(__IMGUI_INCLUDE__LIB)

  include(ExternalProject)
  include(cmake/script/CommonVars.cmake)
  set(IMGUI_VERSION v1.52)

  ### imgui
  ExternalProject_Add(
          imgui
          GIT_REPOSITORY https://github.com/ocornut/imgui.git
          GIT_TAG release-${IMGUI_VERSION}
          PREFIX ${C_V__LIBRARIES_HOME}/imgui-${IMGUI_VERSION}
          # Disable install step
          INSTALL_COMMAND ""
          DOWNLOAD_DIR "${C_V__LIBRARIES_HOME}/download/imgui-${IMGUI_VERSION}"
  )

  add_library(libgtest IMPORTED STATIC GLOBAL)
  add_dependencies(libgtest imgui)

  ExternalProject_Get_Property(imgui source_dir binary_dir)

  MESSAGE( "-- [imgui] source_dir: " ${source_dir} )
  MESSAGE( "-- [imgui] binary_dir: " ${binary_dir} )

  set_target_properties(libgtest PROPERTIES
          "IMPORTED_LOCATION" "${binary_dir}/libimgui.a"
          "IMPORTED_LINK_INTERFACE_LIBRARIES" "${CMAKE_THREAD_LIBS_INIT}"
          #"INTERFACE_INCLUDE_DIRECTORIES" "${source_dir}/include"
          )
  include_directories("${source_dir}/include")

  set(__IMGUI_INCLUDE__LIB true)
endif(__IMGUI_INCLUDE__LIB)
