//
//  NavigationManager.swift of Navigattie
//
//  Created by Eugene Babenko

// 
//  Copyright ©2023 eugene. Licensed under MIT License. 

import SwiftUI

public extension NavigationManager {
    /// Returns to a previous view on the stack
    static func pop() { performOperation(.removeLast) }

    /// Returns to view with provided type
    @discardableResult
    static func pop<N: NavigatableView>(to view: N.Type) -> Bool { performOperation(.removeAll(toID: .init(describing: view))) }

    /// Returns to a root view
    static func popToRoot() { performOperation(.removeAllExceptFirst) }
}


// MARK: - Internal
public class NavigationManager: ObservableObject {
    @Published private(set) var views: [AnyNavigatableView] = [] { willSet { onViewsWillUpdate(newValue) } }
    @Published private(set) var transitionsBlocked: Bool = false
    private(set) var transitionType: TransitionType = .push
    private(set) var transitionAnimation: TransitionAnimation = .no
    private(set) var namespace: Namespace.ID?

    static let shared: NavigationManager = .init()
    private init() {}
}

// MARK: - Operations Handler
extension NavigationManager {
    static func push(_ view: some NavigatableView, _ animation: TransitionAnimation) { performOperation(.insert(view, animation)) }
}
private extension NavigationManager {
    @discardableResult
    static func performOperation(_ operation: Operation) -> Bool {
        if !NavigationManager.shared.transitionsBlocked {
            DispatchQueue.main.async {
                withAnimation(nil) {
                    return shared.views.perform(operation)
                }
            }
        }
        return false
    }
}

// MARK: - Setters
extension NavigationManager {
    static func setRoot(_ rootView: some NavigatableView) { DispatchQueue.main.async { shared.views = [.init(rootView, .no)] }}
    static func setNamespace(_ value: Namespace.ID) { if shared.namespace == nil { shared.namespace = value } }
    static func blockTransitions(_ value: Bool) { shared.transitionsBlocked = value }
}

// MARK: - On Views Will Update
private extension NavigationManager {
    func onViewsWillUpdate(_ newValue: [AnyNavigatableView]) {
        transitionType = newValue.count > views.count ? .push : .pop
        transitionAnimation = (transitionType == .push ? newValue.last?.animation : views.last?.animation) ?? .no
    }
}

// MARK: - Transition Type
enum TransitionType { case pop, push }

// MARK: - Array Operations
fileprivate enum Operation {
    case insert(any NavigatableView, TransitionAnimation)
    case removeLast, removeAll(toID: String), removeAllExceptFirst
}
fileprivate extension [AnyNavigatableView] {
    @discardableResult
    mutating func perform(_ operation: Operation) -> Bool {
        if !NavigationManager.shared.transitionsBlocked {
            hideKeyboard()
            return performOperation(operation)
        }
        return false
    }
}
private extension [AnyNavigatableView] {
    func hideKeyboard() {
        UIApplication.shared.hideKeyboard()
    }

    @discardableResult
    mutating func performOperation(_ operation: Operation) -> Bool {
        switch operation {
            case .insert(let view, let animation): append(.init(view, animation), if: canBeInserted(view))
            case .removeLast: removeLastExceptFirst()
            case .removeAll(let id): removeLastTo(elementWhere: { $0.id == id })
            case .removeAllExceptFirst: removeAllExceptFirst()
        }
    }
}
private extension [AnyNavigatableView] {
    func canBeInserted(_ view: any NavigatableView) -> Bool { !contains(where: { $0.id == view.id }) }
}
