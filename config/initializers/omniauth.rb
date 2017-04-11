Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '106916279854727','58a42796ecaf56c6054e434c7d682f17'
  # provider :github, ENV['GITHUB_OAUTH_KEY'], ENV['GITHUB_OAUTH_SECRET']
  # provider :facebook, ENV['FACEBOOK_OAUTH_KEY'], ENV['FACEBOOK_OAUTH_SECRET']
end
