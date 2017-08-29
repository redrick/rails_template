module ApplicationHelper
  def alert_icon_for(type)
    case type
    when 'error' then 'warning'
    when 'alert' then 'ban'
    when 'success' then 'check'
    else 'info'
    end
  end

  def body_class
    case controller_name
    when 'sessions' then 'hold-transition login-page'
    else controller_name
    end
  end
end
