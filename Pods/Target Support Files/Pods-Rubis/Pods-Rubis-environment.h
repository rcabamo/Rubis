
// To check if a library is compiled with CocoaPods you
// can use the `COCOAPODS` macro definition which is
// defined in the xcconfigs so it is available in
// headers also when they are imported in the client
// project.


// PureLayout
#define COCOAPODS_POD_AVAILABLE_PureLayout
#define COCOAPODS_VERSION_MAJOR_PureLayout 2
#define COCOAPODS_VERSION_MINOR_PureLayout 0
#define COCOAPODS_VERSION_PATCH_PureLayout 5

// Typhoon
#define COCOAPODS_POD_AVAILABLE_Typhoon
#define COCOAPODS_VERSION_MAJOR_Typhoon 2
#define COCOAPODS_VERSION_MINOR_Typhoon 3
#define COCOAPODS_VERSION_PATCH_Typhoon 4

// Typhoon/no-arc
#define COCOAPODS_POD_AVAILABLE_Typhoon_no_arc
#define COCOAPODS_VERSION_MAJOR_Typhoon_no_arc 2
#define COCOAPODS_VERSION_MINOR_Typhoon_no_arc 3
#define COCOAPODS_VERSION_PATCH_Typhoon_no_arc 4

// libextobjc/EXTScope
#define COCOAPODS_POD_AVAILABLE_libextobjc_EXTScope
#define COCOAPODS_VERSION_MAJOR_libextobjc_EXTScope 0
#define COCOAPODS_VERSION_MINOR_libextobjc_EXTScope 4
#define COCOAPODS_VERSION_PATCH_libextobjc_EXTScope 1

// libextobjc/RuntimeExtensions
#define COCOAPODS_POD_AVAILABLE_libextobjc_RuntimeExtensions
#define COCOAPODS_VERSION_MAJOR_libextobjc_RuntimeExtensions 0
#define COCOAPODS_VERSION_MINOR_libextobjc_RuntimeExtensions 4
#define COCOAPODS_VERSION_PATCH_libextobjc_RuntimeExtensions 1

// Debug build configuration
#ifdef DEBUG

  // Reveal-iOS-SDK
  #define COCOAPODS_POD_AVAILABLE_Reveal_iOS_SDK
  #define COCOAPODS_VERSION_MAJOR_Reveal_iOS_SDK 1
  #define COCOAPODS_VERSION_MINOR_Reveal_iOS_SDK 5
  #define COCOAPODS_VERSION_PATCH_Reveal_iOS_SDK 1

#endif
