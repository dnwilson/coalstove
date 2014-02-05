require 'spec_helper'

include Devise::TestHelpers

describe User do
  before {@user = User.new(name: "This person",
     email: "user@example.com",
     username: "thisperson",
     password: "password",
     password_confirmation: "password")}
     
     subject{@user}
     
     it{should respond_to(:name)}
     it{should respond_to(:email)}
     it{should respond_to(:username)}
     
     it{should be_valid}

end
