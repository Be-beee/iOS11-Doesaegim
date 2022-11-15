//
//  SearchingLocationView.swift
//  Doesaegim
//
//  Created by 서보경 on 2022/11/14.
//

import UIKit

import SnapKit

final class SearchingLocationView: UIView {
    
    // MARK: - UI Properties
    
    /// 서치바 텍스트필드 영역
    private let searchBarField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .grey1
        textField.layer.cornerRadius = Metric.searchBarCornerRadius
        
        let searchIconImageView = UIImageView(
            image: UIImage(systemName: StringLiteral.searchBarIcon)
        )
        searchIconImageView.tintColor = .grey4
        textField.leftView = searchIconImageView
        textField.leftViewMode = .always
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    /// 서치바 마진 영역
    private let searchBarMarginView: UIView = {
        let view = UIView()
        return view
    }()
    
    /// 검색 결과를 표시하는 테이블 뷰
    private let searchResultTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBlue
        
        return tableView
    }()
    
    /// 서치바와 검색 결과 리스트를 포함하는 스택뷰
    private let contentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Metric.contentStackSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureViews()
    }
    
    
    // MARK: - Functions
    
    private func configureViews() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        searchBarMarginView.addSubview(searchBarField)
        
        contentStack.addArrangedSubview(searchBarMarginView)
        contentStack.addArrangedSubview(searchResultTableView)
        
        addSubview(contentStack)
    }
    
    private func configureConstraints() {
        searchBarField.snp.makeConstraints {
            $0.height.equalTo(Metric.searchBarHeight)
            $0.horizontalEdges.equalTo(searchBarMarginView).inset(Metric.searchBarHorizontalPadding)
            $0.verticalEdges.equalTo(searchBarMarginView)
        }
        
        contentStack.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
    }
}

extension SearchingLocationView {
    enum Metric {
        static let searchBarHorizontalPadding: CGFloat = 16
        static let searchBarHeight: CGFloat = 36
        static let searchBarCornerRadius: CGFloat = 10
        
        static let contentStackSpacing: CGFloat = 16
    }
    
    enum StringLiteral {
        static let searchBarIcon = "magnifyingglass"
    }
}
