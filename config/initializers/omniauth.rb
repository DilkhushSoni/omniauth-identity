# To fix for OmniAuth::FailureEndpoint does not redirect in development mode
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
