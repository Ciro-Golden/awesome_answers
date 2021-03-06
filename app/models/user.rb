class User < ApplicationRecord
    has_many :questions, dependent: :nullify
    has_many :answers, dependent: :nullify

    has_secure_password
    # Provides user authentication features on
    # the model it is called in.
    # - Requires a column named password_digest and
    # the gem: bcrypt.
    # It will add two atribute accessors for 'password'
    # and 'password_confirmation'
    #  It will add a presence validation for 'password'
    # It will save passwords assigned to 'password'
    # using bcrypt to hash and store it in the
    # 'password_digest' column, meaning we'll never 
    # store plain text passwords.
  
    validates :email, presence: true,
                      uniqueness: true,
                      format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

        
        def full_name
            "#{first_name} #{last_name}".strip
        end
  end
  