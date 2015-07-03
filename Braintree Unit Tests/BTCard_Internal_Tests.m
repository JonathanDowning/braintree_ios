#import <XCTest/XCTest.h>
#import "BTCard_Internal.h"

// See also BTCard_Tests
@interface BTCard_Internal_Tests : XCTestCase

@end

@implementation BTCard_Internal_Tests

- (void)testParameters_standardProperties {
    BTCard *card = [[BTCard alloc] initWithNumber:@"4111111111111111"
                                   expirationDate:@"12/2038"
                                              cvv:@"123"];
    BTJSON *parameters = [[BTJSON alloc] initWithValue:card.parameters];
    XCTAssertEqualObjects(parameters[@"number"].asString, @"4111111111111111");
    XCTAssertEqualObjects(parameters[@"expiration_date"].asString, @"12/2038");
    XCTAssertEqualObjects(parameters[@"cvv"].asString, @"123");
}


- (void)testParameters_encodesAllParametersIncludingAdditionalParameters {
    BTCard *card =
    [[BTCard alloc] initWithParameters:@{
                                         @"billing_address": @{
                                                 @"street_address": @"724 Evergreen Terrace" }
                                         }];

    card.number =@"4111111111111111";
    card.expirationDate = @"12/2038";
    card.postalCode = @"40404";

    BTJSON *parameters = [[BTJSON alloc] initWithValue:card.parameters];
    XCTAssertEqualObjects(parameters[@"number"].asString, @"4111111111111111");
    XCTAssertEqualObjects(parameters[@"expiration_date"].asString, @"12/2038");
    XCTAssertEqualObjects(parameters[@"billing_address"][@"postal_code"].asString, @"40404");
    XCTAssertEqualObjects(parameters[@"billing_address"][@"street_address"].asString, @"724 Evergreen Terrace");
}

- (void)testParameters_WhenNothingSpecified_encodesEmptyObject {
    BTCard *card = [[BTCard alloc] init];

    XCTAssertEqualObjects(card.parameters, @{});
}

@end
