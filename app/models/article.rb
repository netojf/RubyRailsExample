class Article < ApplicationRecord
    belongs_to :autor, foreign_key: "autor_id" , optional: true
    belongs_to :library, foreign_key: "library_id" , optional: true
end
