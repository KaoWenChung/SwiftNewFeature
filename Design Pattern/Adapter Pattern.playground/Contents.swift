
// Adapter for TableView or CollectionView
import UIKit

extension UIView {
    static var name: String {
        return String(describing: self)
    }
}

protocol TableViewAdapterDelegate: AnyObject {

    func configure(model: AdapterItem, view: UIView, indexPath: IndexPath)
    func select(model: AdapterItem)
    func size(model: AdapterItem, containerSize: CGSize) -> CGSize

}
// Acting like UITableViewDelegate and UITableViewDataSource
class TableViewAdapter: NSObject {
    
    let registerService = RegisterService()
    weak var tableView: UITableView?
    weak var delegate: TableViewAdapterDelegate?
    private(set) var sections: [AdapterSection] = []
    private var isRegisterAble: Bool = true
    
    init(tableView: UITableView?, delegate: TableViewAdapterDelegate?) {
        self.tableView = tableView
        self.delegate = delegate
    }

    open func update(_ sections: [AdapterSection]) {
        self.sections = sections
        tableView?.reloadData()
    }

    /// Register UICollectionViewCell
    open func register(everytime: Bool = false, _ sections: [AdapterSection]) {
        guard isRegisterAble else { return }
        isRegisterAble = everytime
        registerService.registerIfNeeded(tableView, sections: sections)
    }
    
}

extension TableViewAdapter: UITableViewDataSource {

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.type.name, for: indexPath)
        delegate?.configure(model: item, view: cell, indexPath: indexPath)
        
        return cell
    }

}

extension TableViewAdapter: UITableViewDelegate {
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let item = sections[indexPath.section].items[indexPath.row]
        delegate?.select(model: item)
        tableView.deselectRow(at: indexPath, animated: true)

    }

    open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        let item = sections[indexPath.section].items[indexPath.row]
        let cgSize = delegate?.size(model: item, containerSize: tableView.frame.size)
        
        return cgSize?.height ?? 0

    }

    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        guard let header = sections[section].header,
              let cgSize = delegate?.size(model: header, containerSize: tableView.frame.size) else { return 0 }

        return cgSize.height

    }

    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        guard let footer = sections[section].footer,
              let cgSize = delegate?.size(model: footer, containerSize: tableView.frame.size) else { return 0 }

        return cgSize.height

    }

    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let header = sections[section].header,
              let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: header.type.name) else { return nil }
        delegate?.configure(model: header, view: view, indexPath: IndexPath(row: 0, section: section))

        return view

    }

    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        guard let footer = sections[section].footer,
              let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: footer.type.name) else { return nil }
        delegate?.configure(model: footer, view: view, indexPath: IndexPath(row: 0, section: section))

        return view

    }

}

class RegisterService {
    public private(set) var registeredTypes = Set<String>()

    func registerIfNeeded(_ tableView: UITableView?, sections: [AdapterSection]) {
        sections.forEach { section in
            registerHeader(tableView, section: section)
            registerFooter(tableView, section: section)
            registerItems(tableView, section: section)
        }
    }

    func registerHeader(_ tableView: UITableView?, section: AdapterSection) {
        if let header = section.header, !registeredTypes.contains(header.type.name) {

            if header.type.isSubclass(of: UITableViewHeaderFooterView.self) {
                tableView?.register(header.type, forHeaderFooterViewReuseIdentifier: header.type.name)
            }

            registeredTypes.insert(header.type.name)
        }
    }

    func registerFooter(_ tableView: UITableView?, section: AdapterSection) {
        if let footer = section.footer, !registeredTypes.contains(footer.type.name) {

            if footer.type.isSubclass(of: UITableViewHeaderFooterView.self) {
                tableView?.register(footer.type, forHeaderFooterViewReuseIdentifier: footer.type.name)
            }

            registeredTypes.insert(footer.type.name)
        }
    }

    func registerItems(_ tableView: UITableView?, section: AdapterSection) {
        section.items.forEach { item in
            
            if !registeredTypes.contains(item.type.name) {

                if item.type.isSubclass(of: UITableViewCell.self) {
                    tableView?.register(UINib(nibName: item.type.name, bundle: nil), forCellReuseIdentifier: item.type.name)
                }

                registeredTypes.insert(item.type.name)
            }
        }
    }
}

struct AdapterSection {

    let footer: AdapterItem?
    let header: AdapterItem?
    let items: [AdapterItem]

    init(footer: AdapterItem? = nil, header: AdapterItem? = nil, items: [AdapterItem]) {
        self.footer = footer
        self.header = header
        self.items = items
    }

}

protocol AdapterItem {

    var type: UIView.Type { get }

}

