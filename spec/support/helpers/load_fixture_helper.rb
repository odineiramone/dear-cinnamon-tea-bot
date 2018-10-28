# frozen_string_literal: true

module LoadFixtureHelper
  def load_json(path)
    json_content = load_fixture_file(path)
    MultiJson.load(json_content)
  end

  def load_json_symbolized(path)
    json_content = load_fixture_file(path)
    MultiJson.load(json_content, symbolize_names: true)
  end

  def load_fixture_file(path)
    full_path = File.join(Dir.pwd, "spec/fixtures/#{path}")
    File.read(full_path)
  end
end
