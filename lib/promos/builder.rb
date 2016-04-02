module Promos
  attr_reader :charset, :digits, :any_character
  class Builder
    def initialize()
      @charset = [*'A'..'Z',*'a'..'z']
      @digits = [*'0'..'9']
      @any_character = [*'A'..'Z',*'a'..'z', *'0'..'9']
    end

    def build_promocodes(promo_mask, count=1)
      promocodes = []

      available_count = [ @charset.size       ** promo_mask.count('@') +
                          @digits.size        ** promo_mask.count('#') +
                          @any_character.size ** promo_mask.count('*'),
                          count
                          ].min
      regexp = promo_mask.gsub( '@','[A-Za-z]' ).
                          gsub('#', '[0-9]').
                          gsub('*', '[A-Za-z0-9]')

      similar_promo_code = Promo.where("code ~* ?", "^#{regexp}$").select(:code).map{|promo| promo.code}

      available_count.times do
        10.times do
          promocode = ''
          promo_mask.each_char { |char|
            promocode << case char
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
          unless similar_promo_code.include?(promocode) || promocodes.include?(promocode)
            promocodes.push(promocode)
            break
          end
        end
      end
      promocodes
    end
  end
end
