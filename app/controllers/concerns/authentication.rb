module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :verify_authenticated
    helper_method :current_account
  end

  protected
  def verify_authenticated
    not_logged_in! unless current_account.present?
  end

  def not_logged_in!
    redirect_to new_session_path
  end

  def current_account
    @account ||= Account.find_by(id: session[:account_id])
  end

  def current_account=(account)
    session[:account_id] = account.id
  end
end
