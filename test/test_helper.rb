ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'rails/controller/testing'
require 'minitest/reporters'

Minitest::Reporters.use!