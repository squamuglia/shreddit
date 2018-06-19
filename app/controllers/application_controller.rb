class ApplicationController < ActionController::Base
  def to_slug(string)
    string.parameterize.truncate(80, omission: '')
  end
end
