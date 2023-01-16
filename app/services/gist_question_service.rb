class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    gist_struct
  end

  private

  def success?
    @client.last_response.status == 201
  end

  def gist_struct
    Struct.new('GistStruct', :url, :success?)
    result = @client.create_gist(gist_params)
    Struct::GistStruct.new(result.html_url, success?)
  end

  def gist_params
    {
      description: I18n.t('.gist_question_service.description', test_title: @test.title),
      'public': true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.text, *@question.answers.pluck(:text)].join("\n")
  end
end
