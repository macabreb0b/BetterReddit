# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string(255)      not null
#  username        :string(255)      not null
#  token           :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  has_many :subs
  has_many :links
  has_many :comments
  has_many :votes

  before_validation :set_token

  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def set_token
    self.token ||= SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if user && user.is_password?(password)
    nil
  end

  def reset_session_token!
    self.token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.token
  end

  def downvoted?(link)
    @vote ||= self.votes.find_by_link_id(link.id)
    @vote && @vote.vote == -1
  end

  def upvoted?(link)
    @vote ||= self.votes.find_by_link_id(link.id)
    @vote && @vote.vote == 1
  end

end
