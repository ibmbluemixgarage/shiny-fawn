class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :addresses

  validates :first_name, :last_name, :phone, presence: true

  validates :phone, length: {is: 10}

  validates_presence_of   :email, if: :email_required?
  validates_format_of     :email, with: email_regexp
end
