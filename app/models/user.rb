class User < ApplicationRecord
  has_many :pets, :dependent => :delete_all

  validates :name, presence: true,
                    length: { minimum: 2 }

  validates :surname, presence: true,
                    length: { minimum: 2 }

  validates :surname, presence: true,
                    length: { minimum: 5 }
end
