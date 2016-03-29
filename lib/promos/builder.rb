module Promos
  attr_reader :charset, :digits, :any_character
  class Builder
    def initialize()
      @charset = [*'A'..'Z',*'a'..'z']
      @digits = [*'0'..'9']
      @any_character = [*'A'..'Z',*'a'..'z', *'0'..'9']
    end

    def build_promocode(promo_mask)
      10.times do
        promo_code = ''
        promo_mask.each_char { |char|
          promo_code << case char
                        when '*'
                          @any_character.sample
                        when'@'
                          @charset.sample
                        when '#'
                          @digits.sample
                        else
                          char
                        end
        }
        unless Promo.find_by(code: promo_code)
          return promo_code
        end
      end
    end
  end
end
