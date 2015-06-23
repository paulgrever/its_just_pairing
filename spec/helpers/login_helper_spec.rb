def github_login
  OmniAuth.config.test_mode = true
  OmniAuth.config.logger = Rails.logger
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
    provider: "github",
    uid: "123545",
    info: {
      nickname: "paulgrever",
      email: "paulgrever@gmail.com",
      image: "https://avatars.githubusercontent.com/u/3664281?v=3",
      urls: { GitHub: "https://github.com/paulgrever" }
    },
    credentials: {
      token: "mock_token",
      secret: "mock_secret"
    }
    )
end