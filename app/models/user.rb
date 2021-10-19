class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
         
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :posts, dependent: :destroy
  has_many :plans, dependent: :destroy

  enum is_valid: { '有効': true, '退会済': false }
  
  def active_for_authentication?
    super && is_valid
  end

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end