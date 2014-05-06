class User < ActiveRecord::Base
  validates :email, :presence => true,
                    :uniqueness => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :case_sensitive => false,
                    :'validators/email' => true
  validates :first_name, :length => {:minimum => 0, :maximum => 254}
  validates :last_name, :length => {:minimum => 0, :maximum => 254}
end
