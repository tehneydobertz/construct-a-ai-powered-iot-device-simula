# AI-powered IoT Device Simulator

# Define a Device class to represent an IoT device
class Device
  attr_accessor :name, :device_type, :sensor_data, :actuator_data, :ai_model

  def initialize(name, device_type)
    @name = name
    @device_type = device_type
    @sensor_data = {}
    @actuator_data = {}
    @ai_model = nil
  end

  def add_sensor_data(sensor_name, data)
    @sensor_data[sensor_name] = data
  end

  def add_actuator_data(actuator_name, data)
    @actuator_data[actuator_name] = data
  end

  def set_ai_model(model)
    @ai_model = model
  end

  def simulate
    # Collect sensor data and feed it into the AI model
    sensor_values = @sensor_data.values
    ai_output = @ai_model.predict(sensor_values)

    # Update actuator data based on AI output
    ai_output.each do |actuator_name, value|
      @actuator_data[actuator_name] = value
    end

    # Return simulated device state
    { sensor_data: @sensor_data, actuator_data: @actuator_data }
  end
end

# Define an AIModel class to represent an AI model
class AIModel
  def predict(sensor_values)
    # TO DO: implement AI model logic to process sensor values
    # For demonstration purposes, return a hardcoded output
    { "actuator1" => 10, "actuator2" => 20 }
  end
end

# Create a device instance and add sensor and actuator data
device = Device.new("MyDevice", "TemperatureSensor")
device.add_sensor_data("temperature", 25)
device.add_sensor_data("humidity", 60)
device.add_actuator_data("heater", 0)
device.add_actuator_data("fan", 0)

# Create an AI model instance and set it to the device
ai_model = AIModel.new
device.set_ai_model(ai_model)

# Simulate the device
simulated_state = device.simulate
puts simulated_state