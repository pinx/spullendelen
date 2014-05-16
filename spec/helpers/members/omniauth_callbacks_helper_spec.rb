require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the Members::OmniauthCallbacksControllerHelper. For example:
#
# describe Members::OmniauthCallbacksControllerHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe Members::OmniauthCallbacksHelper do
  # Do we set this here, or in the environments/test.rb ???
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
                                                                   :provider => 'twitter',
                                                                   :uid => '123545'
                                                                   # etc.
                                                               })

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
