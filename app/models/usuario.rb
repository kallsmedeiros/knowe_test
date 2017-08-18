class Usuario < ApplicationRecord

  validates :senha, presence: true, length: { minimum: 6 }
  validates :nome, presence: true, length: { minimum: 3 }
end
