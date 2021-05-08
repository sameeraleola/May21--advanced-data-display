//
//  BasicCollectionViewController.swift
//  BasicCollectionView
//
//  Created by Ben Gohlke on 5/3/21.
//  Guided project completed by Sameera Leola on 3/5/21.
//

import UIKit

private let reuseIdentifier = "Cell"

private let sectionedStates: [[String]] = [
    ["Alabama", "Alaska", "Arizona", "Arkansas"],
    ["California", "Colorado", "Connecticut"],
    ["Delaware"],
    ["Florida"],
    ["Georgia"],
    ["Hawaii"],
    ["Idaho", "Illinois", "Indiana", "Iowa"],
    ["Kansas", "Kentucky"],
    ["Louisiana"],
    ["Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana"],
    ["Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota"],
    ["Ohio", "Oklahoma", "Oregon"],
    ["Pennsylvania"],
    ["Rhode Island"],
    ["South Carolina", "South Dakota"],
    ["Tennessee", "Texas"],
    ["Utah"],
    ["Vermont", "Virginia"],
    ["Washington", "West Virginia", "Wisconsin", "Wyoming"]
]

private let states: [String] = [
  "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware",
  "Florida","Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky",
  "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi",
  "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico",
  "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
  "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont",
  "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"
]

class BasicCollectionViewController: UICollectionViewController {
  
    // MARK: Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Specify which layout to use here
    // The layout can be changed within the app
    // There's no reason to animate this initial layout specification because this is done in the viewDidLoad which is not displayed until after the layout has been generated.  The animation would never be seen!
    collectionView.setCollectionViewLayout(generateLayout(), animated: false)
  }
    
    // MARK: Collection View Layout
    private func generateLayout() -> UICollectionViewLayout { // Creates a UICollectionViewLayout
        // Create from smallest element in the UICollectionViewLayout to the largest UICollectionViewLayout element: item -> group -> section -> layout
        // Remember, the compositional layout design must contain at least one section, one group, and one item.
        // Define a standard amount of spacing to have a uniform look.
        let spacing: CGFloat = 10
        
        // 1. Define the Item
        // Define the item's Size in a relative perspective so that it is calculated correctly for the displaying screen
        // The .fractionalxxx properties are percentages from 0.0 - 1.0 (0% to 100%
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        // Now define the Item.
        // Before an item can be defined the compositional layout must know the item's size so the item size must be defined first (lines 61-63) then the item can be defined.
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 2. Define the Group
        // Group definition must know if the orientation of the items in the group are to be displayed horizontally, or vertically
        // The size of the group must be given and which Items to be displayed within the group.
        // Define the group size.  This specifies how much space the group will take up within the section.
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(70.0) // The absolute value is specified as a number of points
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1)
        
        // Add space between each group
        group.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: 0,
            bottom: 0,
            trailing: 0)
        
        // 3. Define the Section
        let section = NSCollectionLayoutSection(group: group)
        // Add space between each section
        section.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: spacing,
            trailing: spacing
        )
        
        // 4. Define the Compositional layout that will display the elements
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
  
  // MARK: UICollectionView Data Source
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
//    return 1
    return sectionedStates.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
//    return states.count
    return sectionedStates[section].count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BasicCollectionViewCell
    
    // Configure the cell
//    cell.label.text = states[indexPath.item]
    cell.label.text = sectionedStates[indexPath.section][indexPath.item]
    
    return cell
  }
}
