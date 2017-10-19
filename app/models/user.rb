class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/users/avatars/:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :reviews
  has_many :movies, through: :reviews
  has_many :discs, -> {includes :movie}
  has_one :address

  def shelf
    Disc.visible.owned.where(user_id: self.id)
  end
end
