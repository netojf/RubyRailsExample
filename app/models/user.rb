class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'email inválido' }
    
    
end
