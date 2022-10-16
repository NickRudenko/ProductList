//
//  ResponseStatus.swift
//  Reveri
//
//  Created by Mykola Rudenko on 15.10.2022.
//

import Foundation

enum ResponseStatus: Int {
    case OK = 200
    case NoContent = 204
    case BAD_REQUEST = 400
    case NOT_FOUND = 404
    case NotAcceptable = 406
    case UnprocessableEntity = 422
    case Locked = 423
    case Forbidden = 403
}
