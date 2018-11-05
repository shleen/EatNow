module ApplicationHelper
  # returns the first item in the path
  def current_class?(test_class)
    request.path.split('/')[1] == test_class
  end

  # returns type of device- mobile or desktop
  def iphone?
    puts request.user_agent =~ /iPhone/i
  end
end
