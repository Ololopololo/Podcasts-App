//
//  PodcastsSearchController.swift
//  PodcastsApp
//
//  Created by Владислав Положай on 10/4/22.
//

import UIKit

class PodcastsSearchController: UITableViewController, UISearchBarDelegate {
    
    let podcasts = [
        Podcast(name: "Podcast #1", artistName: "Artist #1", image: UIImage(systemName: "bell")!),
        Podcast(name: "Podcast #2", artistName: "Artist #2", image: UIImage(systemName: "bell")!),
        Podcast(name: "Podcast #3", artistName: "Artist #4", image: UIImage(systemName: "bell")! )
    ]
    
    let cellId = "cellId"
    
    //implementing searchbar
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    //MARK: UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let podcast = self.podcasts[indexPath.row]
        
        var cellConfiguration = cell.defaultContentConfiguration()
        cellConfiguration.image = podcast.image
        cellConfiguration.text = podcast.name
        cellConfiguration.secondaryText = podcast.artistName
        
        cell.contentConfiguration = cellConfiguration
        return cell
    }
    
    //MARK: Setup Work
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}
