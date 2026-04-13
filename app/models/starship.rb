require "digest"

class Starship < ApplicationRecord
    has_and_belongs_to_many :characters

    ICON_CLASSES = %w[
      fa-plane
      fa-jet-fighter
      fa-shuttle-space
    ].freeze

    def icon_class
      ICON_CLASSES[name_segment(0) % ICON_CLASSES.size]
    end

    def shake_classes
      "fa-shake"
    end

    def icon_style
      [
        "color: #{icon_color_css}",
        "--fa-animation-duration: #{shake_duration_seconds}s",
        "--starship-shake-duration: #{shake_duration_seconds}s"
      ].join("; ")
    end

    def shake_duration_seconds
      (2.0 + (name_segment(2) % 3000) / 1000.0) * 2.0
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
