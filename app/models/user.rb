class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  
  has_many :panoramas

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup

    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase}]).first
    else
      where(conditions).first
    end
  end

  devise authentication_keys: [:login]
end
