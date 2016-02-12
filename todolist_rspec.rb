require 'rspec'
require_relative 'todolist'

# Story: As a developer, I can create a ToDoItem.
describe 'ToDoItem' do
  it 'should create the ToDoItem class' do
    expect{ToDoItem.new}.to_not raise_error
  end
  #Story: As a developer, I can give a ToDoItem a title and retrieve it.
  it 'should give a title and retrieve it' do
    newItem = ToDoItem.new
    expect{newItem.title}.to_not raise_error
    expect(newItem.title).to eq('')
  end
  # Story: As a developer, I can give a ToDoItem a description and retrieve it.
  it 'should give a description and retrieve it' do
    newItem = ToDoItem.new
    expect{newItem.desc}.to_not raise_error
    expect(newItem.desc).to eq('')
  end
  # Story: As a developer, I can print a ToDoItem with field labels and values.
  it 'should print a ToDoItem with field labels and values' do
    newItem = ToDoItem.new
    expect{newItem.labels}.to_not raise_error
    expect(newItem.labels).to eq('Title: ; Description: ; Item incomplete')
  end
  # Story: As a developer, I can mark a ToDoItem done.
  it 'should mark a ToDoItem done' do
    newItem = ToDoItem.new
    expect{newItem.done?}.to_not raise_error
    expect(newItem.done?).to eq('Item incomplete')
    expect(newItem.markDone).to eq('Item complete')
    expect(newItem.done?).to eq('Item complete')
  end
end

# Story: As a developer, I can add all of my ToDoItems to a ToDoList.

describe 'ToDoList' do
  it 'should create a new ToDoList' do
    expect{ToDoList.new}.to_not raise_error
  end
  it 'should create an array for ToDoItems' do
    newItem1 = ToDoItem.new("1","1")
    newItem2 = ToDoItem.new("2","2")
    newItem3 = ToDoItem.new("3","3")
    newList = ToDoList.new
    newList.addToArray(newItem1)
    newList.addToArray(newItem2)
    newList.addToArray(newItem3)
    expect{newList}.to_not raise_error
    expect(newList.toDoItems.length).to eq(3)
  end

  # Story: As a developer with a ToDoList, I can show all the completed items.

  it 'should select items that are complete' do
    newItem1 = ToDoItem.new("1","1")
    newItem2 = ToDoItem.new("2","2")
    newItem3 = ToDoItem.new("3","3")
    newItem1.markDone
    newItem3.markDone
    newList = ToDoList.new
    newList.addToArray(newItem1)
    newList.addToArray(newItem2)
    newList.addToArray(newItem3)
    expect{newList}.to_not raise_error
    expect(newList.selectComplete).to eq([newItem1, newItem3])
  end

  # Story: As a developer with a ToDoList, I can show all the not completed items.
  it 'should select items that are incomplete' do
    newItem1 = ToDoItem.new("1","1")
    newItem2 = ToDoItem.new("2","2")
    newItem3 = ToDoItem.new("3","3")
    newItem1.markDone
    newItem3.markDone
    newList = ToDoList.new
    newList.addToArray(newItem1)
    newList.addToArray(newItem2)
    newList.addToArray(newItem3)
    expect{newList}.to_not raise_error
    expect(newList.selectIncomplete).to eq([newItem2])
  end
  it "should select items with due dates today and that are incomplete" do
    newItem1 = ItemWithDate.new("1","1")
    newItem2 = ItemWithDate.new("2","2")
    newItem2.changeDueDate("2016-3-20")
    newList = ToDoList.new
    newList.addToArray(newItem1)
    newList.addToArray(newItem2)
    expect{newList}.to_not raise_error
    expect(newList.selectIncompleteDueDate).to eq([newItem1])
  end


end

# Story: As a developer, I can create a to do item with a due date, which can be changed.
describe ItemWithDate do
  it "should create a new item" do
    expect{ItemWithDate.new}.to_not raise_error
  end

  it "should have a due date" do
    newItem = ItemWithDate.new
    expect(newItem.changeDueDate("2016-2-11").to_s).to include("2016-02-11")
  end

  it "should print out the field labels and values" do
    newItem = ItemWithDate.new
    expect(newItem.labels).to eq("Title: ; Description: ; Item incomplete, Due Date: 2016-02-11")
  end
end
