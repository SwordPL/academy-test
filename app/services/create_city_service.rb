class CreateCityService

  def initialize
    @cities = [%w(Warsaw Ws), %w(Cracow Cw),
               %w(Paris Ps), %w(London Ld),
               %w(Washington Wa), %w(Moscow Mo)]
  end

  def call
    @cities.each do |city|
      City.find_or_create_by!(name: city[0]) do |x|
        x.short_name = city[1]
      end
      puts 'Created '+city[0]
    end
  end
end