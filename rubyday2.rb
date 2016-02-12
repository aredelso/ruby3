# Object Oriented Car Challenge

# Story: As a programmer, I can make a vehicle.
# Task: Create a class called Vehicle
class Vehicle
  # Story: As a programmer, I can turn on and off the lights on a given vehicle.
  # Task: Create method(s) to allow programmer to turn lights on and off.
  # Story: As a programmer, I can determine if the lights are on or off. Lights start in the off position.
  # Tests:
  # vehicle = Vehicle.new(...)
  # vehicle.lightsOn? # should return false
  # vehicle.lightsOn = true
  # vehicle.lightsOn? # should return true
  # vehicle.lightsOn = false
  # vehicle.lightsOn? # should return false
  def initialize
    @toggleLights = false
  end
  def lightsOn?
     return @toggleLights
  end
  def toggleLights
    if @toggleLights == false
      @toggleLights = true
    else
      @toggleLights = false
    end
  end
end

#Create an object called myVehicle which is of class Vehicle.
myVehicle = Vehicle.new


# Story: As a programmer, I can tell how many wheels a car has; default is four.

# Story: As a programmer, I can tell which model year a vehicle is from. Model years never change.

# Story: As a programmer, I can determine the speed of a car. Speed starts at 0 km/h.

# Story: As a programmer, I can make a car.
# Task: Create a class called Car
class Car < Vehicle
  #Initialize the car to have four wheels
  def initialize(wheels=4,year=1111)
    #Initialize the car to have four wheels
    @wheels = wheels
    #Make model year part of the initialization.
    @modelYear = year
    #Make speed of car starting at 0 part of the initialization.
    @speed = 0
    @horn = horn
  end
  def year
    return @modelYear
  end
  #create a method to return the number of wheels.
  def wheels
    return @wheels
  end
  def speed
    return @speed
  end
  # Story: As a programmer, I can speed a car up.
  def speedUp
    return @speed = @speed + 1
  end
  # Story: As a programmer, I can slow a car down to zero.
  def slowDown
    if @speed <= 0
      @speed = 0
    else
      @speed = @speed - 1
    end
  end
  #As a programmer, I can honk the cars horn.
  def horn
    return @horn
  end
end
#
# #Create an object called myCar that is of class Car
# myCar = Car.new(2016)

# Story: As a programmer, I can make a Tesla car.
# Task: Create an object called myTesla which is of class Tesla which inherits from class Car .

class Tesla < Car
  # Story: As a programmer, I can speed my Teslas up by 10 per acceleration.
  def accelerate
    @speed = @speed + 10
  end
  # Story: As a programmer, I can slow my Teslas down by 7 per braking.
  def brake
    if @speed < 7
      @speed = 0
    else
      @speed = @speed - 7
    end
  end
  #Tesla horns go "beep beep".
  def horn
    @horn = "beep beep"
  end
end

tesla = Tesla.new
puts tesla.horn
#
#
# Story: As a programmer, I can make a Tata car.
# Task: Create an object called myTata which is of class Tata.

class Tata < Car
  # Story: As a programmer, I can speed my Tatas up by 2 per acceleration.
  def accelerate
    @speed = @speed + 2
  end
  # Story: As a programmer, I can slow my Tatas down by 1.25 per braking.
  def brake
    if @speed < 1.25
      @speed = 0
    else
      @speed = @speed - 1.25
    end
  end
end

# Story: As a programmer, I can make a Toyota car.
# Task: Create an object called myToyota which is of class Toyota.

class Toyota < Car
  # Story: As a programmer, I can speed my Toyotas up by 7 per acceleration.
  def accelerate
    @speed = @speed + 7
  end
  # Story: As a programmer, I can slow my Toyotas down by 5 per braking.
  def brake
    if @speed < 5
      @speed = 0
    else
      @speed = @speed - 5
    end
  end
  #Toyota horns "honk honk".
  def horn
    @horn = "honk honk"
  end
end

toyota = Toyota.new
puts toyota.horn


# Story: As a programmer, I can keep a collection of two of each kind of vehicle, all from different years.
# Task: Create two of each vehicles, all from different model years, and put them into an Array.
andrewsTesla = Tesla.new(2016)
davidsTesla = Tesla.new(1905)
andrewsTata = Tata.new(1992)
davidsTata = Tata.new(2025)
andrewsToyota = Toyota.new(2004)
davidsToyota = Toyota.new(2011)
garage = [andrewsTesla, davidsTesla, andrewsTata, davidsTata, andrewsToyota, davidsToyota]

# # Story: As a programmer, I can sort my collection of cars based on model year.
garage.sort_by {|car| car.year}

# Story: As a programmer, I can sort my collection of cars based on model.
# Task: Sort based on class name.
garage.sort_by {|car| car.class.to_s}

# Story: As a programmer, I can sort my collection of cars based on model and then year.
garage.sort_by {|car| [car.class.to_s, car.year]}
