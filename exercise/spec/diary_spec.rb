require 'diary'

RSpec.describe Diary do
  it "returns the contents of the diary" do
    new_diary = Diary.new("contents")
    result = new_diary.read
    expect(result).to eq "contents"
  end
end