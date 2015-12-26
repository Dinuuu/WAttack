class ApiBombRunnerContext
  attr_reader :test, :options
  def initialize(test)
    @test = test
    @options = initialize_options(test)
  end

  def run
    Result.create(test: test, path: test.path, headers: test.headers, body: test.body)
    ApiBomb::War.new(options).start!
  end

  private

  def initialize_options(test)
    project = test.project
    options = {
      concurrent_users: test.concurrent_users, #concurrent users
      duration: test.duration, #seconds
      base_url: "#{project.base_url}#{test.path}", #base url
      options: { #this hash is overriden for each path that has its own options
      headers: test.headers,
      params: test.params,
      json: test.body
      },
    }
  end
end