//
//  RickVM.swift
//  BasicAppAPI
//
//  Created by Cristian Jose Perez Guerra on 03/04/2025.
//

import Foundation

@Observable
final class RickMortyVM {
    let apiDataRepository: ApiDataRepository
    var rickMortyInfo: Info?
    var rmCharList: [CharacterModel] = []
    
    private var page: Int = 1
    private var showAlert = false
    private var errorMsg = ""
    
    init(apiDataRepository: ApiDataRepository = NetworkRepository()) {
        self.apiDataRepository = apiDataRepository
    }
    
    private func handleError(_ error: Error) {
        self.errorMsg = error.localizedDescription
//        showAlert.toggle()
//        pageLoading = true
    }
}

@MainActor
extension RickMortyVM {
    func fetchCharacters() async {
        do {
            let response = try await apiDataRepository.getCharacters(page: "\(page)")
            self.rickMortyInfo = response.info
            self.rmCharList = response.results
        } catch {
            handleError(error)
        }
    }
}
    
