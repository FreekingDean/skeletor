module ApiAuthentication
  extend Authentication
  #extend ActiveSupport::Concern

  protected
  def current_account
    tokens = request.headers["Authorization"].split('key=').map(&:strip)
    api_token_id = tokens[0]
    return nil if api_token_id != 'SkeletorSecret'
    api_token = tokens[1]
    @account ||= Account.find_by(api_secret: api_token)
  end

  def not_logged_in!
    render json: {error: "OH NOES!"}, status: :unauthorized
  end
end
