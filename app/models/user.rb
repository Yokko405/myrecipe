class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください。' }, if: lambda {
                                                                                                    new_record? || !password.nil?
                                                                                                  }

  has_many :recipes
end
