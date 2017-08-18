class Contato < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates :telefone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
  validates :email, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Contato.create! row.to_hash
    end
  end
end
