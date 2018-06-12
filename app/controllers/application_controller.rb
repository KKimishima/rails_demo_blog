class ApplicationController < ActionController::Base
  # クロスサイトリクエストフォージェリ対策
  protect_from_forgery with: :exception, prepend: true
  include SessionsHelper
end
