macro(RUN_OMNIIDL IDL_FILE OUTPUT_DIRECTORY INCLUDE_DIRECTORY OPTIONS OUTPUT_FILES)
    file(MAKE_DIRECTORY ${OUTPUT_DIRECTORY})
    get_filename_component(IDL_FILE_BASENAME ${IDL_FILE} NAME)
    set(INTERNAL_OUTPUT_FILES ${OUTPUT_FILES})
    set(INTERNAL_OPTIONS ${OPTIONS})
    set(OUT_WITH_PATH)
    foreach (arg IN LISTS INTERNAL_OUTPUT_FILES)
        set(OUT_WITH_PATH ${OUT_WITH_PATH} ${OUTPUT_DIRECTORY}/${arg})
    endforeach ()
    ADD_CUSTOM_COMMAND(OUTPUT ${OUT_WITH_PATH}
            COMMAND ${OMNIORB4_IDL_COMPILER} ${OMNIIDL_PLATFORM_FLAGS} -bcxx -p${OMNI_PYTHON_RESOURCES} -I${INCLUDE_DIRECTORY} ${INTERNAL_OPTIONS} -C${OUTPUT_DIRECTORY} ${IDL_FILE}
            DEPENDS ${IDL_FILE} ${RUN_OMNIIDL_DEPS}
            COMMENT "Processing ${IDL_FILE_BASENAME}..")

    set(OUTPARAM "${ARGN}")
    foreach (loop_var IN LISTS OUTPARAM)
        set(${OUTPARAM} ${${OUTPARAM}} ${OUT_WITH_PATH})
    endforeach ()
endmacro(RUN_OMNIIDL)