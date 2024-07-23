class BadgedComponent < ViewComponent::Base
  attr_reader :appoinment_type

  def initialize(appoinment_type: nil)
    @appoinment_type = appoinment_type
  end

  def classes
    "absolute top-3 right-3 w-3 h-3 rounded-full"
  end

  def bg_color
    "background-color: #{background_color}"
  end

  private

  def background_color
    self.appoinment_type.color
  end
end