vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

set(QFIELD_REF msvc)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO m-kuhn/QField
    REF ${QFIELD_REF}
    SHA512 ed545d3c213a614e98cb7c97b6c0ecb094975f876b732d8dc74bb64becf24d4101d6287d492163784cc10190e36325fa570ed33c2a43196d36ab247625b185c4
    HEAD_REF msvc
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    #PREFER_NINJA
    OPTIONS ${QFIELD_OPTIONS} 
    OPTIONS_DEBUG ${QFIELD_OPTIONS_DEBUG}
    OPTIONS_RELEASE ${QFIELD_OPTIONS_RELEASE}
)

vcpkg_install_cmake()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/include
)
file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/share
)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)