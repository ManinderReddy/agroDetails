ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "evurimanikanta",
  :password             => "evuri@1989",
  :authentication       => "plain",
  :enable_starttls_auto => true
}


# ActionMailer::Base.default_url_options[:host] = "localhost:3000" if Rails.env.development?
# ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?