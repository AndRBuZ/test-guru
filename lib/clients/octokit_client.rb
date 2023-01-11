class OctokitClient

  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @http_client = setup_octokit_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  def status
    @http_client.last_response.status
  end

  private

  def setup_octokit_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
