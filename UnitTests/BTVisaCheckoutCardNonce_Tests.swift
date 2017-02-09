import XCTest

class BTVisaCheckoutCardNonce_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testVisaCheckoutCardWithJSON_createsVisaCheckoutCardWithExpectedValues() {
        let visaCheckoutCardNonce = BTVisaCheckoutCardNonce(JSON: BTJSON(value: [
            "type": "VisaCheckoutCard",
            "nonce": "123456-12345-12345-a-adfa",
            "description": "ending in 11",
            "default": false,
            "details": [
                "cardType": "Visa",
                "lastTwo": "11"
            ],
            "shippingAddress": [
                "firstName": "BT",
                "lastName": "Test",
                "streetAddress": "123 Townsend St Fl 6",
                "locality": "San Francisco",
                "region": "CA",
                "postalCode": "94107",
                "countryCode": "US"
            ],
            "userData": [
                "userFirstName": "BT",
                "userLastName": "Test",
                "userFullName": "BT Test",
                "userName": "test@bt.com",
                "userEmail": "test@bt.com"
            ]
            ]))

        XCTAssertEqual(visaCheckoutCardNonce.nonce, "123456-12345-12345-a-adfa")
        XCTAssertEqual(visaCheckoutCardNonce.localizedDescription, "ending in 11")
        XCTAssertEqual(visaCheckoutCardNonce.isDefault, false)
        XCTAssertEqual(visaCheckoutCardNonce.type, "Visa")
        XCTAssertEqual(visaCheckoutCardNonce.lastTwo, "11")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressFirstName, "BT")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressLastName, "Test")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressStreetAddress, "123 Townsend St Fl 6")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressLocality, "San Francisco")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressRegion, "CA")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressPostalCode, "94107")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressCountryCode, "US")
        XCTAssertEqual(visaCheckoutCardNonce.userDataFirstName, "BT")
        XCTAssertEqual(visaCheckoutCardNonce.userDataLastName, "Test")
        XCTAssertEqual(visaCheckoutCardNonce.userDataFullName, "BT Test")
        XCTAssertEqual(visaCheckoutCardNonce.userDataName, "test@bt.com")
        XCTAssertEqual(visaCheckoutCardNonce.userDataEmail, "test@bt.com")
    }
    
    func testVisaCheckoutCardWithJSON_withBillingAddress_createsVisaCheckoutCardWithExpectedValues() {
        let visaCheckoutCardNonce = BTVisaCheckoutCardNonce(JSON: BTJSON(value: [
            "type": "VisaCheckoutCard",
            "nonce": "123456-12345-12345-a-adfa",
            "description": "ending in 11",
            "default": false,
            "details": [
                "cardType": "Visa",
                "lastTwo": "11"
            ],
            "shippingAddress": [
                "firstName": "BT",
                "lastName": "Test",
                "streetAddress": "123 Townsend St Fl 6",
                "locality": "San Francisco",
                "region": "CA",
                "postalCode": "94107",
                "countryCode": "US"
            ],
            "billingAddress": [
                "firstName": "BT Bill Me",
                "lastName": "Test Bill",
                "streetAddress": "123 Townsend St Fl 5",
                "locality": "San Francis",
                "region": "CB",
                "postalCode": "94108",
                "countryCode": "USA"
            ],
            "userData": [
                "userFirstName": "BT",
                "userLastName": "Test",
                "userFullName": "BT Test",
                "userName": "test@bt.com",
                "userEmail": "test@bt.com"
            ]
            ]))
        
        XCTAssertEqual(visaCheckoutCardNonce.nonce, "123456-12345-12345-a-adfa")
        XCTAssertEqual(visaCheckoutCardNonce.localizedDescription, "ending in 11")
        XCTAssertEqual(visaCheckoutCardNonce.isDefault, false)
        XCTAssertEqual(visaCheckoutCardNonce.type, "Visa")
        XCTAssertEqual(visaCheckoutCardNonce.lastTwo, "11")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressFirstName, "BT")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressLastName, "Test")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressStreetAddress, "123 Townsend St Fl 6")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressLocality, "San Francisco")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressRegion, "CA")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressPostalCode, "94107")
        XCTAssertEqual(visaCheckoutCardNonce.shippingAddressCountryCode, "US")
        XCTAssertEqual(visaCheckoutCardNonce.billingAddressFirstName, "BT Bill Me")
        XCTAssertEqual(visaCheckoutCardNonce.billingAddressLastName, "Test Bill")
        XCTAssertEqual(visaCheckoutCardNonce.billingAddressStreetAddress, "123 Townsend St Fl 5")
        XCTAssertEqual(visaCheckoutCardNonce.billingAddressLocality, "San Francis")
        XCTAssertEqual(visaCheckoutCardNonce.billingAddressRegion, "CB")
        XCTAssertEqual(visaCheckoutCardNonce.billingAddressPostalCode, "94108")
        XCTAssertEqual(visaCheckoutCardNonce.billingAddressCountryCode, "USA")
        XCTAssertEqual(visaCheckoutCardNonce.userDataFirstName, "BT")
        XCTAssertEqual(visaCheckoutCardNonce.userDataLastName, "Test")
        XCTAssertEqual(visaCheckoutCardNonce.userDataFullName, "BT Test")
        XCTAssertEqual(visaCheckoutCardNonce.userDataName, "test@bt.com")
        XCTAssertEqual(visaCheckoutCardNonce.userDataEmail, "test@bt.com")
    }
}