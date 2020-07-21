//
//  Created by Robert Geifman on 14/12/2019.
//  Copyright © 2019 Peter Steinberger. All rights reserved.
//

import Foundation
import AspectsObjC

public extension NSObject {
	typealias ReplacementBlock = @convention(block) (AspectInfo) -> Void
}

// swiftlint:disable implicitly_unwrapped_optional
public extension NSObject {
	@nonobjc final func hook(before selector: Selector!, body: @escaping ReplacementBlock) throws -> AspectToken {
		try hook(selector, options: .positionBefore, body: body)
	}

	@nonobjc final func hook(after selector: Selector!, body: @escaping ReplacementBlock) throws -> AspectToken {
		try hook(selector, options: [], body: body)
	}

	@nonobjc final func hook(instead selector: Selector!, body: @escaping ReplacementBlock) throws -> AspectToken {
		try hook(selector, options: .positionInstead, body: body)
	}

	@nonobjc final func hook(_ selector: Selector, options: AspectOptions, body: @escaping ReplacementBlock) throws -> AspectToken {
		try aspect_hook(selector, with: options, usingBlock: unsafeBitCast(body, to: NSObject.self))
	}

	@discardableResult
	@nonobjc final func hookOnce(before selector: Selector!, body: @escaping ReplacementBlock) throws -> AspectToken {
		try hook(selector, options: [.optionAutomaticRemoval, .positionBefore], body: body)
	}

	@discardableResult
	@nonobjc final func hookOnce(after selector: Selector!, body: @escaping ReplacementBlock) throws -> AspectToken {
		try hook(selector, options: [.optionAutomaticRemoval], body: body)
	}

	@discardableResult
	@nonobjc final func hookOnce(instead selector: Selector!, body: @escaping ReplacementBlock) throws -> AspectToken {
		try hook(selector, options: [.optionAutomaticRemoval, .positionInstead], body: body)
	}
}
// swiftlint:enable implicitly_unwrapped_optional
