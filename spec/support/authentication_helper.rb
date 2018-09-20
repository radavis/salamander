module AuthenticationHelper
  DEFAULT_PROVIDER = :google_oauth2
  def sign_in(user, provider = DEFAULT_PROVIDER)
    mock_omniauth(user)
    visit "/auth/#{provider}"
  end

  def mock_omniauth(user, provider = DEFAULT_PROVIDER)
    auth_hash = OmniAuth::AuthHash.new({
      uid: user.uid,
      provider: provider,
      info: {
        email: user.email
      }
    })

    OmniAuth.config.mock_auth[provider] = auth_hash
  end

  def mock_omniauth_failure(provider = DEFAULT_PROVIDER)
    OmniAuth.config.mock_auth[provider] = :invalid_credentials
  end
end
