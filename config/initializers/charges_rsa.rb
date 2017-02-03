require 'openssl'

charges_public_key_txt = ENV['CHARGES_PUBLIC_KEY']
charges_private_key_txt = ENV['CHARGES_PRIVATE_KEY']
charges_private_key_pwd = ENV['CHARGES_PRIVATE_KEY_PWD']

Rails.application.config.charges_rsa.public_key = OpenSSL::PKey::RSA.new(charges_public_key_txt)
Rails.application.config.charges_rsa.private_key = OpenSSL::PKey::RSA.new(charges_private_key_txt, charges_private_key_pwd)