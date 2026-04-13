require "digest"

class Vehicle < ApplicationRecord
    has_and_belongs_to_many :characters

  VEHICLE_ICON_CLASSES = %w[
    fa-car-side
    fa-truck
    fa-truck-field
    fa-truck-moving
    fa-truck-pickup
    fa-truck-monster
    fa-tractor
    fa-motorcycle
    fa-snowplow
  ].freeze

  def vehicle_icon_class
    VEHICLE_ICON_CLASSES[name_segment(0) % VEHICLE_ICON_CLASSES.size]
  end

  def icon_style
    "color: #{icon_color_css}"
  end

  def icon_color_css
    hue = name_segment(3) % 360
    saturation = 50 + (name_segment(4) % 41)
    lightness = 45 + (name_segment(5) % 31)
    "hsl(#{hue}, #{saturation}%, #{lightness}%)"
  end

  private

  def name_digest_hex
    @name_digest_hex ||= Digest::SHA256.hexdigest(name.to_s)
  end

  def name_segment(index)
    name_digest_hex[index * 8, 8].to_i(16)
  end
end
