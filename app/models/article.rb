class Article < ApplicationRecord
    belongs_to :autor, foreign_key: :autor
    belongs_to :library, foreign_key: :library
end
