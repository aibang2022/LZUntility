//
//  UIDevice+LZCategory.m
//  LZPhoneHelper
//
//  Created by liuzhao on 2020/12/21.
//  Copyright © 2020 Liu Zhao. All rights reserved.
//

#import "UIDevice+LZCategory.h"

@implementation UIDevice (LZCategory)

/**
 设备ID
 @return 返回设备ID
 */
//+ (NSString *)deviceID  {
//    NSUUID *adverSUUID = [[ASIdentifierManager sharedManager] advertisingIdentifier];
//    NSString *uuidString = @"0";
//    if (adverSUUID) {
//        uuidString = [adverSUUID UUIDString];
//    }
//    /*
//    2 收不到推送修复：iOS用户打开了 设置->隐私->广告->限制广告跟踪之后 获取到的idfa将会是一串00000 导致咱们的d输出都是下面这串：
//    e [@"00000000-0000-0000-0000-000000000000" md5DecodingString];
//    @"9F89C84A559F573636A47FF8DAED0D33"
//    引入SimulateIDFA, 当d = @"9F89C84A559F573636A47FF8DAED0D33" 使用SimulateIDFA生成新的标识符
//     */
//    NSString *uniqueIdentifier = [uuidString md5DecodingString];
//    if ([uniqueIdentifier isEqualToString: @"9F89C84A559F573636A47FF8DAED0D33"]) {
//        uniqueIdentifier = [SimulateIDFA createSimulateIDFA];
//    }
//    return uniqueIdentifier;
//}

@end
