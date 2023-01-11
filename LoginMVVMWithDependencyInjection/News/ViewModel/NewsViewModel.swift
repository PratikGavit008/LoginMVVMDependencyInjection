//
//  NewsViewModel.swift
//  LoginMVVMWithDependencyInjection
//
//  Created by Madhuri Yerudkar on 04/12/22.
//

import Foundation

protocol NewsViewModelProtocol {
    func getNewsList()
    func getNewsCount() -> Int
    func getNewsModel(indexPath: IndexPath) -> News
    func bind(viewDelegate: NewsViewControllerProtocol)
}

class NewsViewModel {
    var newsList: [News] = []
    weak var viewDelegate: NewsViewControllerProtocol?

}

extension NewsViewModel: NewsViewModelProtocol {
    
    
    func getNewsList() {
        // Call File or API
        // Get Data
        // Map to Madel
        
        let news1 = News(title: "Ukrain Russsia war updates..", desc: "Ukrainian President Volodymyr Zelensky called the European Union's Russian oil cap decision a “weak position and still too comfortable for the budget of a terrorist state” in his nightly address Saturday.")
        let news2 = News(title: "India China News Updates..", desc: "Chief of the Naval Staff Admiral R Hari Kumar on December 03 briefed the media in Delhi. He ascertained that India is keeping a close watch on Chinese vessels operating in the Indian Ocean Region..")
        let news3 = News(title: "Gujarat Election News Updates..", desc: "Gujarat's Chief Electoral Officer P Bharathi on Sunday raised concerns over the 'low' voter turnout in urban areas in the first phase of the Assembly polls on December 1. Every voter, especially in urban areas, should come forward and vote enthusiastically. The Chief Election Commissioner is also working tirelessly to make the urban youth shed their apathy and vote, the chief electoral officer said, adding that the poll panel chief has also appealed to the urban voter.")
        self.newsList.append(news1)
        self.newsList.append(news2)
        self.newsList.append(news3)
        //2. call reload Data
        viewDelegate?.displayList()
    }
    
    func getNewsCount() -> Int {
        // 5.
        return self.newsList.count
    }
    
    func getNewsModel(indexPath: IndexPath) -> News {
        return self.newsList[indexPath.row]
    }
    
    func bind(viewDelegate: NewsViewControllerProtocol) {
        self.viewDelegate = viewDelegate
    }
}
