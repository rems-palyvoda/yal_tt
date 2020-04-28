# frozen_string_literal: true

def test_json
  file = File.read(Rails.root.join('spec/test.json'))
  JSON.parse(file)
end