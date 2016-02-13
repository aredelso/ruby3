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
    newList.addToDoItems(newItem1)
    newList.addToDoItems(newItem2)
    newList.addToDoItems(newItem3)
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
    newList.addToDoItems(newItem1)
    newList.addToDoItems(newItem2)
    newList.addToDoItems(newItem3)
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
    newList.addToDoItems(newItem1)
    newList.addToDoItems(newItem2)
    newList.addToDoItems(newItem3)
    expect{newList}.to_not raise_error
    expect(newList.selectIncomplete).to eq([newItem2])
  end
  # Story: As a developer with a ToDoList, I can list all the not completed items that are due today.
  it "should select items with due dates today and that are incomplete" do
    newList = ToDoList.new
    newItem1 = ItemWithDate.new("1","1")
    newItem2 = ItemWithDate.new("2","2")
    newItem2.changeDueDate("2016-3-20")
    newList.addDueItems(newItem1)
    newList.addDueItems(newItem2)
    expect{newList}.to_not raise_error
    expect(newList.selectIncompleteDueDate).to eq([newItem1])
  end
  # Story: As a developer with a ToDoList, I can list all the not completed items in order of due date.
  it "should select items that are incomplete and sort by date" do
    newList = ToDoList.new
    newItem1 = ItemWithDate.new("1","1")
    newItem2 = ItemWithDate.new("2","2")
    newItem3 = ItemWithDate.new("3","3")
    newItem4 = ItemWithDate.new("4","4")
    newItem2.changeDueDate("2016-3-20")
    newItem3.changeDueDate("2016-1-22")
    newItem4.changeDueDate("2017-7-5")
    newItem3.markDone
    newList.addDueItems(newItem1)
    newList.addDueItems(newItem2)
    newList.addDueItems(newItem3)
    newList.addDueItems(newItem4)
    expect{newList}.to_not raise_error
    expect(newList.selectIncompleteOrderByDate).to eq([newItem1, newItem2, newItem4])
  end
  # Story: As a developer with a ToDoList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
  it "should select incomplete items with and without dates and sort by date, with items without date at the end" do
    newList = ToDoList.new
    newItem1 = ToDoItem.new("1","1")
    newItem2 = ToDoItem.new("2","2")
    newItem3 = ToDoItem.new("3","3")
    newItem1.markDone
    newItem3.markDone
    newList.addToDoItems(newItem1)
    newList.addToDoItems(newItem2)
    newList.addToDoItems(newItem3)
    newItem4 = ItemWithDate.new("4","4")
    newItem5 = ItemWithDate.new("5","5")
    newItem6 = ItemWithDate.new("6","6")
    newItem7 = ItemWithDate.new("7","7")
    newItem5.changeDueDate("2016-3-20")
    newItem6.changeDueDate("2016-1-22")
    newItem7.changeDueDate("2017-7-5")
    newItem6.markDone
    newList.addDueItems(newItem4)
    newList.addDueItems(newItem5)
    newList.addDueItems(newItem6)
    newList.addDueItems(newItem7)
    expect{newList}.to_not raise_error
    expect(newList.incompleteItemsWithAndWithoutDates).to eq([newItem4, newItem5,newItem7,newItem2])
  end
  # Story: As a developer with a ToDoList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
  it "should select incomplete items and order by date and select yearly items for the current month" do
    newList = ToDoList.new
    newItem1 = ItemWithDate.new("1","1")
    newItem2 = ItemWithDate.new("2","2")
    newItem3 = ItemWithDate.new("3","3")
    newItem4 = ItemWithDate.new("4","4")
    newItem2.changeDueDate("2016-3-20")
    newItem3.changeDueDate("2016-1-22")
    newItem4.changeDueDate("2017-7-5")
    newItem3.markDone
    newList.addDueItems(newItem1)
    newList.addDueItems(newItem2)
    newList.addDueItems(newItem3)
    newList.addDueItems(newItem4)
    newItem5 = AnniversaryItem.new("5","5")
    newItem6 = AnniversaryItem.new("6","6")
    newItem7 = AnniversaryItem.new("7","7")
    newItem8 = AnniversaryItem.new("8","8")
    newItem5.anniDate(2,18)
    newItem6.anniDate(5,13)
    newItem7.anniDate(2,1)
    newItem8.anniDate(2,21)
    newList.addAnniversaryItems(newItem5)
    newList.addAnniversaryItems(newItem6)
    newList.addAnniversaryItems(newItem7)
    newList.addAnniversaryItems(newItem8)
    expect{newList}.to_not raise_error
    expect(newList.itemsOfThisMonth).to eq([newItem1, newItem2, newItem4, newItem5,newItem7, newItem8])
  end
  # Story: As a developer with a ToDoList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.
  it "should select items and order by date, then current year, then items without date" do
    newList = ToDoList.new
    newItem1 = ItemWithDate.new("1","1")
    newItem2 = ItemWithDate.new("2","2")
    newItem3 = ItemWithDate.new("3","3")
    newItem4 = ItemWithDate.new("4","4")
    newItem2.changeDueDate("2016-3-20")
    newItem3.changeDueDate("2016-1-22")
    newItem4.changeDueDate("2017-7-5")
    newItem3.markDone
    newList.addDueItems(newItem1)
    newList.addDueItems(newItem2)
    newList.addDueItems(newItem3)
    newList.addDueItems(newItem4)
    newItem5 = AnniversaryItem.new("5","5")
    newItem6 = AnniversaryItem.new("6","6")
    newItem7 = AnniversaryItem.new("7","7")
    newItem8 = AnniversaryItem.new("8","8")
    newItem5.anniDate(2,18)
    newItem6.anniDate(5,13)
    newItem7.anniDate(2,1)
    newItem8.anniDate(2,21)
    newList.addAnniversaryItems(newItem5)
    newList.addAnniversaryItems(newItem6)
    newList.addAnniversaryItems(newItem7)
    newList.addAnniversaryItems(newItem8)
    newItem9 = ToDoItem.new("9","9")
    newItem10 = ToDoItem.new("10","10")
    newItem11 = ToDoItem.new("11","11")
    newItem9.markDone
    newItem11.markDone
    newList.addToDoItems(newItem9)
    newList.addToDoItems(newItem10)
    newList.addToDoItems(newItem11)
    expect{newList}.to_not raise_error
    expect(newList.allItemsIncompleteAndYearlyAndDue).to eq([newItem1, newItem2, newItem4, newItem5, newItem7, newItem8, newItem10])
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
    newItem.changeDueDate("2016-02-12")
    expect(newItem.labels).to eq("Title: ; Description: ; Item incomplete, Due Date: 2016-02-12")
  end
end
describe AnniversaryItem do
  it "should create a new item" do
    expect{AnniversaryItem.new}.to_not raise_error
  end
  it "should add a date to the item" do
    anniItem = AnniversaryItem.new
    expect(anniItem.anniDate(3,13)).to eq("3/13")
  end
  it "should return labels" do
    anniItem = AnniversaryItem.new
    expect(anniItem.anniDate(3,13)).to eq("3/13")
    expect(anniItem.labels).to eq("Title: ; Description: ; Item incomplete, Anniversary: 3/13")
  end
  it "should return the month" do
    anniItem = AnniversaryItem.new
    expect(anniItem.anniDate(2,13)).to eq("2/13")
    expect(anniItem.month).to eq(true)
  end
end
