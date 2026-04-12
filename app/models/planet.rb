require "digest"

class Planet < ApplicationRecord
  has_many :characters

  EARTH_ICON_CLASSES = %w[
    fa-earth-africa
    fa-earth-americas
    fa-earth-asia
    fa-earth-europe
    fa-earth-oceania
  ].freeze

  def earth_icon_class
    EARTH_ICON_CLASSES[name_segment(0) % EARTH_ICON_CLASSES.size]
  end

  def spin_classes
    "fa-spin"
  end

  def spin_reverse?
    name_segment(1).odd?
  end

  def icon_style
    [
      "color: #{icon_color_css}",
      "--fa-animation-duration: #{spin_duration_seconds}s",
      "--planet-spin-duration: #{spin_duration_seconds}s"
    ].join("; ")
  end

  def spin_duration_seconds
    1.5 + (name_segment(2) % 13_000) / 1000.0
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
