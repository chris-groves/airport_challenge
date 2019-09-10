require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    if weather.current_conditions == "stormy"
      raise stormy_error
    elsif full?
      raise full_error
    else
      @planes << plane
    end
    plane.mark_landed
  end

  def takeoff(plane, weather)
    if weather.current_conditions == "stormy"
      raise stormy_error
    elsif plane.flying == true
      raise "Plane is already airborne"
    else
      @planes[0]
    end
    plane.mark_flying
  end

  private

  def full?
    @planes.length == @capacity
  end

  def full_error
    "Airport is full, unable to land plane"
  end

  def stormy_error
    "Weather is stormy: permission to land denied"
  end
end
