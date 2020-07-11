// ASCollectionView. Created by Apptek Studios 2019

import ASCollectionView
import SwiftUI

struct TableViewDragAndDropScreen: View
{
	@State var groupA: [String] = (0 ... 4).map { "Item A-\($0)" }
	@State var groupB: [String] = (0 ... 4).map { "Item B-\($0)" }
	@State var groupC: [String] = (0 ... 4).map { "Item C-\($0)" }
	@State var groupD: [String] = (0 ... 4).map { "Item D-\($0)" }

	var body: some View
	{
		VStack {
			Text("Drag within a tableview to move.\nDrag between tableviews to copy.")
				.padding()
			HStack {
				ASTableView {
					ASSection<Int>(
						id: 0,
						data: groupA,
						dataID: \.self,
						dragDropConfig: ASDragDropConfig(dataBinding: $groupA),
						onSwipeToDelete: { index, _ -> Bool in
							withAnimation {
								_ = self.groupA.remove(at: index)
							}
							return true
					})
					{ item, _ in
						Text(item)
							.padding()
							.frame(maxWidth: .infinity, alignment: .leading)
					}
					.sectionHeader {
						header("Section A")
					}
					ASSection<Int>(
						id: 1,
						data: groupB,
						dataID: \.self,
						dragDropConfig: ASDragDropConfig(dataBinding: $groupB),
						onSwipeToDelete: { index, _ -> Bool in
							withAnimation {
								_ = self.groupB.remove(at: index)
							}
							return true
					})
					{ item, _ in
						Text(item)
							.padding()
							.frame(maxWidth: .infinity, alignment: .leading)
					}
					.sectionHeader {
						header("Section B")
					}
				}
				Color.blue.frame(width: 10)
				ASTableView {
					ASSection<Int>(
						id: 0,
						data: groupC,
						dataID: \.self,
						dragDropConfig: ASDragDropConfig(dataBinding: $groupC),
						onSwipeToDelete: { index, _ -> Bool in
							withAnimation {
								_ = self.groupC.remove(at: index)
							}
							return true
					})
					{ item, _ in
						Text(item)
							.padding()
							.frame(maxWidth: .infinity, alignment: .leading)
					}
					.sectionHeader {
						header("Section C")
					}
					ASSection<Int>(
						id: 1,
						data: groupD,
						dataID: \.self,
						dragDropConfig: ASDragDropConfig(dataBinding: $groupD),
						onSwipeToDelete: { index, _ -> Bool in
							withAnimation {
								_ = self.groupD.remove(at: index)
							}
							return true
					})
					{ item, _ in
						Text(item)
							.padding()
							.frame(maxWidth: .infinity, alignment: .leading)
					}
					.sectionHeader {
						header("Section D")
					}
				}
			}
		}
		.navigationBarTitle("Drag & drop", displayMode: .inline)
	}

	func header(_ string: String) -> some View
	{
		Text(string)
			.padding()
			.frame(maxWidth: .infinity, alignment: .leading)
			.background(Color(.secondarySystemBackground))
	}
}

struct TableViewDragAndDropScreen_Previews: PreviewProvider
{
	static var previews: some View
	{
		TableViewDragAndDropScreen()
	}
}
