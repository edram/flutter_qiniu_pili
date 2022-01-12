#import "FlutterQiniuPiliPlugin.h"
#if __has_include(<flutter_qiniu_pili/flutter_qiniu_pili-Swift.h>)
#import <flutter_qiniu_pili/flutter_qiniu_pili-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_qiniu_pili-Swift.h"
#endif

@implementation FlutterQiniuPiliPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterQiniuPiliPlugin registerWithRegistrar:registrar];
}
@end
