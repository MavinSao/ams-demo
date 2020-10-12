// MARK: - Article
struct Article: Codable {
    let articleID: Int
    let title, articleDescription, createdDate: String
    let imageURL: String
    let user: User
    let category: Category

    enum CodingKeys: String, CodingKey {
        case articleID = "articleId"
        case title
        case articleDescription = "description"
        case createdDate
        case imageURL = "imageUrl"
        case user, category
    }
}

// MARK: - Category
struct Category: Codable {
    let categoryID: Int
    let categoryName, color: String
    let createdDate: JSONNull?

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case categoryName, color, createdDate
    }
}

// MARK: - User
struct User: Codable {
    let userID: Int
    let userName, email: String
    let profile: String
    let createdDate: JSONNull?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case userName, email, profile, createdDate
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

