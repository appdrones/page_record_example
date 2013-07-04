# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

PageRecordExample::Application.config.secret_token = '4e425f28614a20f3228431a353f160f3eaf5a64359fd03d78b9d3c4a11ff8febbf13ed49439e8425da62c697f574e4313d25627eb32120f3a20172206d1c6156'
PageRecordExample::Application.config.secret_key_base = 'ee62c99a83311259fdafadeb7323216440a1ce86a18aaa0ef85c95b3f91e24473aa56e70dabebb7530ff9182e6421bd70ca0fa4442c2cb27daa0f071b52f9e0b' # this needs to be added
