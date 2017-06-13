//
//  Rx+String.swift
//  SwiftWisdom
//
//  Created by Maya Saxena on 6/12/17.
//  Copyright © 2017 Intrepid. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType where E == String {
    public func ip_limitLength(to limit: Int) -> Observable<E> {
        return self.map { $0.ip_trimmed(toLength: limit) }
    }
}

extension ObservableType where E == String? {
    public func ip_limitLength(to limit: Int) -> Observable<E> {
        return self.map { $0?.ip_trimmed(toLength: limit) }
    }
}

extension Reactive where Base: UITextField {
    /** Limit the length of input to a text field

    Usage Example:

     textField.rx.ip_limitLength(to: 5)
    */
    public func ip_limitLength(to limit: Int) -> Disposable {
        return text.ip_limitLength(to: limit).bind(to: text)
    }
}
