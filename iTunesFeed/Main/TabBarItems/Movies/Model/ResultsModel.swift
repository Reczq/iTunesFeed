struct ResultsModel: Codable {
    var artistName: String
    var releaseDate: String
    var name: String
    var kind: String
    var artworkUrl100: String
    var genres: [GenreModel]
}
