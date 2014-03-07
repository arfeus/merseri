config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'example.com',
  user_name:            'simo.siiseli@gmail.com',
  password:             'hallinto010',
  authentication:       'plain',
  enable_starttls_auto: true  }