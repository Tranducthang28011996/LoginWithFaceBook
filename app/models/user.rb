class User < ApplicationRecord
  has_secure_password
  has_many :categories
  has_many :incomes
  has_many :costs
  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) ||
            create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
    )
  end
end
