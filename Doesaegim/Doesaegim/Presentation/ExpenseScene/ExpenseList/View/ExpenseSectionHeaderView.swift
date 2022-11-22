//
//  ExpenseSectionHeader.swift
//  Doesaegim
//
//  Created by Jaehoon So on 2022/11/17.
//

import UIKit

final class ExpenseSectionHeaderView: UICollectionReusableView {
    
    static let identifier: String = String(describing: ExpenseSectionHeaderView.self)
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.text = "날짜"
        label.textColor = .black
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        backgroundColor = .white
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(dateLabel)
    }
    
    private func configureConstraints() {
        dateLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalTo(self.snp.leading)
        }
    }
    
    func configureData(date: Date?) {
        guard let date else { return }
        let formatter = Date.yearMonthDayDateFormatter
        let dateString = formatter.string(from: date)
        
        dateLabel.text = dateString
    }
}
