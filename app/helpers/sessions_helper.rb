module SessionsHelper
  def flash_messages(type)
    if flash[type]
      content_tag :p, flash[type], class: 'flash alert'
    end
  end
end
