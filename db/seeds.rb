user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

CreateCityService.new.call
