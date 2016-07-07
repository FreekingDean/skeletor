module Authenticator
  extend ActiveSupport::Concern

  included do
    skip_before_action :verify_authenticated
  end

  protected
  def login(username:, password:)
    account = Account.find_by(username: username)
    return if account.blank?
    account = account.authenticate(password)
    return if account.blank?
    self.current_account=account
  end

  def logout
    session[:account_id] = nil
  end
end
