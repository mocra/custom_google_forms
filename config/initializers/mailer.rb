mailer_options = YAML.load_file("#{RAILS_ROOT}/config/mailer.yml")
ActionMailer::Base.smtp_settings = mailer_options
