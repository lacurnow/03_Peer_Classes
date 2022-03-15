require 'task_formatter'

RSpec.describe TaskFormatter do
  it "formats an incomplete task" do
    new_task = double(:fake_task, title: "fake title", complete?: false)
    formatter = TaskFormatter.new(new_task)
    result = formatter.format
    expect(result).to eq "- [ ] fake title"
  end

  it "formats a complete task" do
    new_task = double(:fake_task, title: "fake title", complete?: true)
    formatter = TaskFormatter.new(new_task)
    result = formatter.format
    expect(result).to eq "- [x] fake title"
  end
end