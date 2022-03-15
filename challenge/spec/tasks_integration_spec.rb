require "task_list"
require "task"
require 'task_formatter'

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  it "returns all tasks in the tasklist" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "formats an incomplete task" do
    new_task = Task.new("Walk the dog")
    formatter = TaskFormatter.new(new_task)
    result = formatter.format
    expect(result).to eq "- [ ] Walk the dog"
  end

  it "formats a complete task" do
    new_task = Task.new("Walk the dog")
    new_task.mark_complete
    formatter = TaskFormatter.new(new_task)
    result = formatter.format
    expect(result).to eq "- [x] Walk the dog"
  end
end