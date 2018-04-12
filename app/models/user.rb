class User < ApplicationRecord
    EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    
    validates_presence_of :email, :full_name, :location, :password
    validates_confirmation_of :password
    validates_length_of :bio, minimum: 30, allow_blank: FALSE

    validate :email_format

    private

    # Essa validação pode ser representada da seguinte forma:
    # validates_format_of :email, with: EMAIL_REGEXP page 58
    def email_format
        errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
    end
end
