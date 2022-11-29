module SessionsHelper
  def flash_messages
    if flash[:alert] 
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
