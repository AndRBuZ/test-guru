module GistsHelper
  TEXT_LENGTH = 25

  def gist_url(gist)
    link_to gist.url, "#{gist.url}", rel: 'noopener nofollow', target: '_blank'
  end

  def gist_question(gist)
    question = gist.question
    link_to question.text.truncate(TEXT_LENGTH), admin_question_path(question)
  end

  def gist_user_email(gist)
    gist.user.email
  end
end
