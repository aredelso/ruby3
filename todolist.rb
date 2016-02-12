require 'date'

# Story: As a developer, I can create a ToDoItem.
class ToDoItem
  def initialize(title='',desc='',complete = 'Item incomplete')
    @title = title
    @desc = desc
    @complete = complete
  end
  # Story: As a developer, I can give a ToDoItem a title and retrieve it.
  def title
    return @title
  end
    # Story: As a developer, I can give a ToDoItem a description and retrieve it.
  def desc
    return @desc
  end
  # Story: As a developer, I can print a ToDoItem with field labels and values.
  def labels
    return "Title: #{@title}; Description: #{@desc}; #{@complete}"
  end
  # Story: As a developer, I can mark a ToDoItem done.
  def markDone
    if @complete == "Item incomplete"
      @complete = "Item complete"
    else
      @complete = "Item complete"
    end
  end
  # Story: As a developer, when I print a ToDoItem is done status is shown.
  def done?
    if @complete == "Item complete"
      return "Item complete"
    else
      return "Item incomplete"
    end
  end
  def complete
    return @complete
  end
end

# Story: As a developer, I can add all of my ToDoItems to a ToDoList.
class ToDoList
  def initialize()
    @array = []
  end
  def addToArray(item)
    @array.push(item)
  end
  def toDoItems
    return @array
  end
  # Story: As a developer with a ToDoList, I can show all the completed items.
  def selectComplete
    @array.select {|item| item.done? == 'Item complete'}
  end
  # Story: As a developer with a ToDoList, I can show all the not completed items.
  def selectIncomplete
    @array.select {|item| item.done? == 'Item incomplete'}
  end
  #Story: As a developer with a ToDoList, I can list all the not completed items that are due today.
  def selectIncompleteDueDate
    @array.select {|item| [item.dueToday? == true]}
  end
end

# Story: As a developer, I can create a to do item with a due date, which can be changed.
class ItemWithDate < ToDoItem
  #initializes the dueDate parameter and inherits from ToDoItem
  def initialize(title='', desc='', complete = 'Item incomplete', dueDate=Date.today)
    @dueDate = dueDate
    super(title, desc, complete)
  end
  #lets the user change the default date
  def changeDueDate(date)
    @dueDate = Date.parse(date)
    return @dueDate
  end
  def dueToday?
    if @dueDate == Date.today
      return true
    else
      return false
    end
  end
  # Story: As a developer, I can print an item with a due date with field labels and values.
  def labels
    return "Title: #{@title}; Description: #{@desc}; #{@complete}, Due Date: #{@dueDate}"
  end
end
