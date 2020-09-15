module RequestSpecHelper
  # parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
end
