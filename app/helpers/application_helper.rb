module ApplicationHelper
  # returns the first item in the path
  def current_class?(test_class)
    request.path.split('/')[1] == test_class
  end

  # returns type of device- mobile or desktop
  def iphone?
    request.user_agent =~ /iPhone/i
  end

  # for styling of flash messages
  def flash_class(level)
      case level
          when :error
          when :alert
            "alert alert-error"
          else
            "alert alert-success"
      end
  end
end
