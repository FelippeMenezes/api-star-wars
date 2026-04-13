require "digest"

class Film < ApplicationRecord
    has_and_belongs_to_many :characters

    FILM_ICON_CLASSES = [
      "fa-brands fa-old-republic",
      "fa-brands fa-empire",
      "fa-solid fa-jedi",
      "fa-brands fa-phoenix-squadron",
      "fa-brands fa-trade-federation",
      "fa-brands fa-rebel"
    ].freeze

    def film_icon_class
      # Garante um ícone único para cada filme associando ao índice do ID
      FILM_ICON_CLASSES[(id.to_i - 1) % FILM_ICON_CLASSES.size]
    end

    def icon_style
      "color: #{icon_color_css}"
    end

    def icon_color_css
      # Gera cores HSL baseadas no hash do título
      hue = title_segment(3) % 360
      saturation = 50 + (title_segment(4) % 41)
      lightness = 45 + (title_segment(5) % 31)
      "hsl(#{hue}, #{saturation}%, #{lightness}%)"
    end

    private

    def title_digest_hex
      @title_digest_hex ||= Digest::SHA256.hexdigest(title.to_s)
    end

    def title_segment(index)
      # Extrai segmentos do hash para gerar números determinísticos
      title_digest_hex[index * 8, 8].to_i(16)
    end
end
