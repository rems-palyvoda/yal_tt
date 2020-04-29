# frozen_string_literal: true

def test_json
  JSON.parse(raw_test_json)
end

def raw_test_json
  File.read(Rails.root.join('spec/test.json'))
end
