require 'rspec'
require_relative 'rubyday2'

# Story: As a programmer, I can make a vehicle.
describe 'Vehicle' do
  it "should create the Vehicle class" do
    expect{Vehicle.new}.to_not raise_error
    expect(Vehicle.new).to be_a Vehicle
  end
end

describe 'Car' do


  # Story: As a programmer, I can make a car.
  it "should create the Car class" do
    expect{Car.new}.to_not raise_error
    expect(Car.new).to be_a Car
  end
  # Story: As a programmer, I can tell how many wheels a car has; default is four.
  it "should have wheels" do
    expect{Car.new.wheels}.to_not raise_error
    expect(Car.new.wheels).to be(4)
    expect(Car.new.wheels).to be_a(Integer)
  end

  # Story: As a programmer, I can tell which model year a vehicle is from. Model years never change.
  it "should have year" do
    expect{Car.new.year}.to_not raise_error
    expect(Car.new.year).to be_a(Integer)
    expect(Car.new.year).to be > 1000
    expect(Car.new.year).to be < 9999
  end
  # Story: As a programmer, I can turn on and off the lights on a given vehicle.
  it "can turn the lights on and off" do
    expect{Vehicle.new.toggleLights}.to_not raise_error
  end

  # Story: As a programmer, I can determine if the lights are on or off. Lights start in the off position.
  it "can determine if the lights are on or off" do
    vehicle = Vehicle.new
    expect(vehicle.lightsOn?).to be false
    expect(vehicle.toggleLights).to be true
    expect(vehicle.lightsOn?).to be true
  end
  # Story: As a programmer, I can determine the speed of a car. Speed starts at 0 km/h.
  it "can determine the speed of a car and the speed starts at 0 km/h" do
    car = Car.new
    expect(car.speed).to be_a(Integer)
    expect(car.speed).to eq(0)
  end
  # Story: As a programmer, I can speed a car up.
  it "can speed the car up" do
    car = Car.new
    expect{car.speedUp}.to_not raise_error
    expect(car.speed).to be > 0
  end
  # Story: As a programmer, I can slow a car down to zero.
  it "can slow the car down" do
    car = Car.new
    expect{car.speedUp}.to_not raise_error
    expect{car.slowDown}.to_not raise_error
    expect(car.speed).to eq(0)
  end
  #As a programmer, I can honk the cars horn.
  it "can honk the horn" do
    car = Car.new
    expect{car.horn}.to_not raise_error
    expect(car.horn).to be(nil)
  end
end

describe 'Tesla' do
  # Story: As a programmer, I can make a Tesla car.
  it "should create the Tesla class" do
    expect{Tesla.new}.to_not raise_error
    expect(Tesla.new).to be_a Tesla
  end
  # Story: As a programmer, I can speed my Teslas up by 10 per acceleration.
  it "can speed the Tesla up by 10" do
    tesla = Tesla.new
    expect{tesla.accelerate}.to_not raise_error
    expect(tesla.speed).to eq(10)
  end
  # Story: As a programmer, I can slow my Teslas down by 7 per braking.
  it "can slow the Tesla down by 7" do
    tesla = Tesla.new
    expect{tesla.accelerate}.to_not raise_error
    expect{tesla.brake}.to_not raise_error
    expect(tesla.speed).to eq(3)
  end
  #Tesla horns go "beep beep"
  it "should go 'beep beep'" do
    tesla = Tesla.new
    expect{tesla.horn}.to_not raise_error
    expect(tesla.horn).to eq('beep beep')
  end
end

describe 'Tata' do
  # Story: As a programmer, I can make a Tata car.
  it "should create the Tata class" do
    expect{Tata.new}.to_not raise_error
    expect(Tata.new).to be_a Tata
  end
  # Story: As a programmer, I can speed my Tatas up by 2 per acceleration.
  it "can speed the Tata up by 2" do
    tata = Tata.new
    expect{tata.accelerate}.to_not raise_error
    expect(tata.speed).to eq(2)
  end
  # Story: As a programmer, I can slow my Tatas down by 1.25 per braking.
  it "can slow the Tata down by 1.25" do
    tata = Tata.new
    expect{tata.accelerate}.to_not raise_error
    expect{tata.brake}.to_not raise_error
    expect(tata.speed).to eq(0.75)
  end
#Story: when you honk a non-Tesla, non-Toyota cars horn
  it "should not have a horn" do
    tata = Tata.new
    expect{tata.horn}.to_not raise_error
    expect(tata.horn).to eq(nil)
  end
end

describe 'Toyota' do
  # Story: As a programmer, I can make a Toyota car.
  it "should create the Toyota class" do
    expect{Toyota.new}.to_not raise_error
    expect(Toyota.new).to be_a Toyota
  end
  # Story: As a programmer, I can speed my Toyotas up by 7 per acceleration.
  it "can speed the Toyota up by 7" do
    toyota = Toyota.new
    expect{toyota.accelerate}.to_not raise_error
    expect(toyota.speed).to eq(7)
  end
  # Story: As a programmer, I can slow my Toyotas down by 5 per braking.
  it "can slow the Toyota down by 5" do
    toyota = Toyota.new
    expect{toyota.accelerate}.to_not raise_error
    expect{toyota.brake}.to_not raise_error
    expect(toyota.speed).to eq(2)
  end
  #Toyota horns "honk honk"
  it "should go 'beep beep'" do
    toyota = Toyota.new
    expect{toyota.horn}.to_not raise_error
    expect(toyota.horn).to eq('honk honk')
  end
end

describe 'Garage' do
  # Story: As a programmer, I can keep a collection of two of each kind of vehicle, all from different years.
  it "can keep a collection of cars" do
    andrewsTesla = Tesla.new(2016)
    davidsTesla = Tesla.new(1905)
    andrewsTata = Tata.new(1992)
    davidsTata = Tata.new(2025)
    andrewsToyota = Toyota.new(2004)
    davidsToyota = Toyota.new(2011)
    garage = [andrewsTesla, davidsTesla, andrewsTata, davidsTata, andrewsToyota, davidsToyota]

    expect(garage.length).to eq(6)
  end


  # Story: As a programmer, I can sort my collection of cars based on model year.
  it "can sort the collection by year" do
    andrewsTesla = Tesla.new(2016)
    davidsTesla = Tesla.new(1905)
    andrewsTata = Tata.new(1992)
    davidsTata = Tata.new(2025)
    andrewsToyota = Toyota.new(2004)
    davidsToyota = Toyota.new(2011)
    garage = [andrewsTesla, davidsTesla, andrewsTata, davidsTata, andrewsToyota, davidsToyota]

    garage.sort_by{|car| car.year}
    # expect(garage[0]).to be davidsTesla
  end
  # Story: As a programmer, I can sort my collection of cars based on model.
  # Task: Sort based on class name.

  # Story: As a programmer, I can sort my collection of cars based on model and then year.
end
