//
//  DataEngine.m
//  Travel
//
//  Created by qianfeng on 15/6/3.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DataEngine.h"
#import "AFNetworking.h"
#import "URLDefine.h"

@implementation DataEngine
{
    AFHTTPRequestOperationManager * _manager;
}

-(id)init
{
    if (self=[super init]) {
        _manager=[AFHTTPRequestOperationManager manager];
        //指定返回二进制数据
//        [_manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    }
    return self;
}

+(instancetype)shareInstance
{
    static DataEngine *s_dataEngine=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_dataEngine=[[DataEngine alloc]init];
    });
    return s_dataEngine;
}

-(void)requestRecommendData:(SuccessBlockType)success faild:(FailedBlockType)failed
{
    [_manager GET:REC_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(error);
    }];
}

-(void)requestDestinationData:(SuccessBlockType)success faild:(FailedBlockType)failed
{
    [_manager GET:DES_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(error);
    }];
}

-(void)requestGroupData:(SuccessBlockType)success faild:(FailedBlockType)failed
{
    [_manager GET:GROUO_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(error);
    }];
}


-(void)requestRecommendCellDataWithPage:(NSInteger)pageNo success:(SuccessBlockType)success faild:(FailedBlockType)failed
{
    [_manager GET:[NSString stringWithFormat:REC_CELL_URL,pageNo] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(error);
    }];
    
}

-(void)requestGroupDetailDataWithDict:(NSDictionary *)dict success:(SuccessBlockType)success faild:(FailedBlockType)failed
{
   [_manager POST:GROUP_DETAIL_URL_POST parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       failed(error);
   }];
}





@end
