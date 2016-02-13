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
  # Story: As a developer, when I print a ToDoItem,  done? status is shown.
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
    @to_do_items = []
    @due_items = []
    @anniversary_items = []
  end
  def addToDoItems(item)
    @to_do_items.push(item)
  end
  def toDoItems
    return @to_do_items
  end
  def addDueItems(item)
    @due_items.push(item)
  end
  def dueItems
    return @due_items
  end
  def addAnniversaryItems(item)
    @anniversary_items.push(item)
  end
  def anniversaryItems
    return @anniversary_items
  end
  # Story: As a developer with a ToDoList, I can show all the completed items.
  def selectComplete
    @to_do_items.select {|item| item.done? == 'Item complete'}
  end
  # Story: As a developer with a ToDoList, I can show all the not completed items.
  def selectIncomplete
    @to_do_items.select {|item| item.done? == 'Item incomplete'}
  end
  #Story: As a developer with a ToDoList, I can list all the not completed items that are due today.
  def selectIncompleteDueDate
    @due_items.select{|item| item.dueToday? && item.done? == 'Item incomplete'}
  end
  #Story: As a developer with a ToDoList, I can list all the not completed items in order of due date.
  def selectIncompleteOrderByDate
    @due_items.sort!{|x,y| x.dueDate <=> y.dueDate}
    @due_items.select{|item| item.done? == 'Item incomplete'}
  end
  # Story: As a developer with a ToDoList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
  def incompleteItemsWithAndWithoutDates
    @due_items.sort!{|x,y| x.dueDate <=> y.dueDate}
    @due_items.select!{|item| item.done? == 'Item incomplete'}
    @to_do_items.select!{|item| item.done? == 'Item incomplete'}
    @incomplete_array = @due_items.concat(@to_do_items)
  end
  # Story: As a developer with a ToDoList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
  def itemsOfThisMonth
    @due_items.sort!{|x,y| x.dueDate <=> y.dueDate}
    @due_items.select!{|item| item.done? == 'Item incomplete'}
    @anniversary_items.select!{|item| item.month}
    @incomplete_and_month = @due_items.concat(@anniversary_items)
  end
  # Story: As a developer with a ToDoList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.
  def allItemsIncompleteAndYearlyAndDue
    @due_items.sort!{|x,y| x.dueDate <=> y.dueDate}
    @due_items.select!{|item| item.done? == 'Item incomplete'}
    @anniversary_items.select!{|item| item.month}
    @to_do_items.select!{|item| item.done? == 'Item incomplete'}
    @incomplete_and_month = @due_items.concat(@anniversary_items)
    @incomplete_and_month_and_no_date = @incomplete_and_month.concat(@to_do_items)
  end
end

# Story: As a developer, I can create a to do item with a due date, which can be changed.
class ItemWithDate < ToDoItem
  #initializes the dueDate parameter and inherits from ToDoItem
  def initialize(title='', desc='', complete = 'Item incomplete', dueDate=Date.today)
    @dueDate = dueDate
    super(title, desc, complete)
  end
  def dueDate
    return @dueDate
  end
  #lets the user change the default date
  def changeDueDate(date)
    @dueDate = Date.parse(date)
    return @dueDate
  end
  def dueToday?
    @dueDate == Date.today
  end
  # Story: As a developer, I can print an item with a due date with field labels and values.
  def labels
    return "Title: #{@title}; Description: #{@desc}; #{@complete}, Due Date: #{@dueDate}"
  end
end

# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event)
class AnniversaryItem < ToDoItem
  def initialize(title='', desc='', complete = 'Item incomplete', month='', day='')
    super(title, desc, complete)
    @month = month
    @day = day
  end
  def anniDate(month,day)
    @month = month.to_s
    @day = day.to_s
    @anni = "#{@month}/#{@day}"
    return @anni
  end
  def labels
    return "Title: #{@title}; Description: #{@desc}; #{@complete}, Anniversary: #{@anni}"
  end
  def month
    @month == Date.today.month.to_s
  end
end
