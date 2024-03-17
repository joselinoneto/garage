class Product < ApplicationRecord
    has_one_attached :thumbnail do |attachable|
        attachable.variant :thumb, resize_to_limit: [800, 600], preprocessed: true
    end
end
