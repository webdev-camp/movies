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

  has_many :notifications
  has_many :reviews
  has_many :movies, through: :reviews
  has_many :cards, -> {includes :movie}
  has_one :address
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  # TODO Do not delete!
  # has_many :following, through: :active_relationships, source: :followed
  # has_many :followers, through: :passive_relationships, source: :follower

  def shelf
    Card.visible.owned.where(user_id: self.id)
  end

  # TODO Do not delete!
  # def follow(other_user)
  #   following.push(other_user)
  # end
  #
  # def unfollow(other_user)
  #   following.delete(other_user)
  # end
  #
  # def following?(other_user)
  #   following.include?(other_user)
  # end
end
