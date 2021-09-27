class Product < ApplicationRecord
    validates_presence_of :title, :description, :image_url, :price
end
