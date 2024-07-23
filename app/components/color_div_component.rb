class ColorDivComponent < ViewComponent::Base
  attr_reader :appoinment_type

  def initialize(appoinment_type: nil)
    @appoinment_type = appoinment_type
  end

  def classes
    "h-1 w-full absolute top-0 left-0 right-0"
  end

  def bg_color
    "background-color: #{background_color}"
  end

  private

  def background_color
    self.appoinment_type.color
  end
end