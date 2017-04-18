class User < ActiveRecord::Base
  # has_many :questions, :answers

  has_secure_password

  validates :email, :format => { :with => /.+@.+\...+/,
    :message => "Email address format invalid." }
  validates :email, uniqueness: true
end
