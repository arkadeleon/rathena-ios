//
//  Either.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/12.
//

public enum Either<Left, Right>: Decodable where Left: Decodable, Right: Decodable {

    case left(Left)
    case right(Right)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let left = try? container.decode(Left.self) {
            self = .left(left)
        } else if let right = try? container.decode(Right.self) {
            self = .right(right)
        } else {
            throw DecodingError.typeMismatch(Either<Left, Right>.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Invalid type.", underlyingError: nil))
        }
    }

    public func mapRight<R>(_ transform: (Right) -> R) -> Either<Left, R> {
        switch self {
        case .left(let left):
            .left(left)
        case .right(let right):
            .right(transform(right))
        }
    }
}
