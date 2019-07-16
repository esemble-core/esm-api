module TestSpecHelpers

  def resp_json
    JSON.parse(response.body)
  end
end