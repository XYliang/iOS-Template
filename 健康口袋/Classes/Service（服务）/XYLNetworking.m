//
//  XYLNetWorking.m
//  健康口袋
//
//  Created by 薛银亮 on 16/2/27.
//  Copyright © 2016年 薛银亮. All rights reserved.
//

#import "XYLNetworking.h"
#import "AFNetworking.h"

@implementation XYLNetworking
+(void)sendGetUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock) success failure:(failureBlock)failure
{
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:urlStr parameters:params
     
        success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         success(responseObject);
     }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
    
}

+(void)sendGetByReplacingUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock) success failure:(failureBlock)failure
{
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:urlStr parameters:params
     
        success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         success(responseObject);
     }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
    
    
}

@end
