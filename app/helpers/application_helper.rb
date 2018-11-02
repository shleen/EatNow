module ApplicationHelper
  # returns the first item in the path
  def current_class?(test_class)
    request.path.split('/')[1] == test_class
  end
end
