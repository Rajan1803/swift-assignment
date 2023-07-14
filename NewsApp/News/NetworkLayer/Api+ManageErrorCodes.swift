//
//  Api+ManageStatusCodes.swift
//  News
//
//  Created by Rajan Patel on 17/07/23.
//

import Foundation

enum HTTPErrorCode: Int, Error {
    
    // Client Error - 4xx
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case requestTimeout = 408
    case payloadTooLarge = 413
    case upgradeRequired = 426
    case tooManyRequests = 429
 
    // Server Error - 5xx
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case HTTPVersionNotSupported = 505
    case insufficientStorage = 507
    case networkAuthenticationRequired = 511
    
}
