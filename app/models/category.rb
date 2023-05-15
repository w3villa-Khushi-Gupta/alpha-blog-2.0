class Category < ApplicationRecord
    has_many :article_categories
    has_many :articles, through: :article_categories
    validates :name, presence: true, length: {minimum: 3, maximimum: 20}
    validates_uniqueness_of :name
end
