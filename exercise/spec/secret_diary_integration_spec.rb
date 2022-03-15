require 'secret_diary'
require 'diary'

RSpec.describe "diary reading feature" do
  context "the diary is locked" do
    it "fails" do
      new_diary = Diary.new("contents")
      new_secret_diary = SecretDiary.new(new_diary)
      expect{new_secret_diary.read}.to raise_error "Go away!"
    end
  end

  context "the diary is unlocked" do
    it "reads the contents" do
      new_diary = Diary.new("contents")
      new_secret_diary = SecretDiary.new(new_diary)
      new_secret_diary.unlock
      expect(new_secret_diary.read).to eq "contents"
    end
  end
  
  context "when diary is locked again" do
    it "does not read the diary" do
      new_diary = Diary.new("contents")
      new_secret_diary = SecretDiary.new(new_diary)
      new_secret_diary.unlock
      new_secret_diary.lock
      expect{new_secret_diary.read}.to raise_error "Go away!"
    end
  end
end