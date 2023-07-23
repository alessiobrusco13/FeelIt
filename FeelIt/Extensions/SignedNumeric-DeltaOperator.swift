//
//  SignedNumeric-DeltaOperator.swift
//  FeelIt
//
//  Created by Alessio Garzia Marotta Brusco on 02/07/23.
//

import Foundation

extension SignedNumeric where Self: Comparable {
    static func |-|(_ lhs: Self, _ rhs: Self) -> Self {
        abs(lhs - rhs)
    }
}

