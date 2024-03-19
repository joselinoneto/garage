class Product < ApplicationRecord
    has_one_attached :thumbnail do |attachable|
        attachable.variant :thumb, resize_to_limit: [800, 600], preprocessed: true
    end
    has_rich_text :content
    # scope :filter_by_published, -> (published) { where(published: published) }
    scope :filter_by_published, -> { where(published: true) }
end
