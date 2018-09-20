class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(uid: auth[:uid], provider: auth[:provider]).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.provider = auth.provider
      user.email = auth.info.email
      user.name = auth.info.name
      user.api_key = generate_api_key unless user.api_key.present?
      user.save!
    end
  end

  def self.generate_api_key
    result = nil
    begin
      result = SecureRandom.urlsafe_base64
    end while User.exists?(api_key: result)
    result
  end

  def first_name
    name&.split(" ", 2)&.first
  end

  def last_name
    name&.split(" ", 2)&.last
  end

  def to_s
    return first_name if first_name.present?
    "User ##{id}"
  end
end
