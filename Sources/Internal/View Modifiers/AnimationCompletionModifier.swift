//
//  AnimationCompletionModifier.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import SwiftUI

extension View {
    func onAnimationCompleted<V: VectorArithmetic>(for value: V, perform action: @escaping () -> ()) -> some View { modifier(Modifier(observedValue: value, completion: action)) }
}

// MARK: - Implementation
fileprivate struct Modifier<V: VectorArithmetic>: AnimatableModifier {
    var animatableData: V { didSet { notifyCompletionIfFinished() }}
    private var targetValue: V
    private var completion: () -> ()


    init(observedValue: V, completion: @escaping () -> ()) {
        self.animatableData = observedValue
        self.targetValue = observedValue
        self.completion = completion
    }
    func body(content: Content) -> some View { content }
}

private extension Modifier {
    func notifyCompletionIfFinished() { if animatableData == targetValue {
        DispatchQueue.main.async { self.completion() }
    }}
}
