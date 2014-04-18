#Starting off with some basic booze
Ingredient.create(:name => 'Vodka', :desc => 'Usually potatoes', :kind => 'liquor', :info => '', :active => 'false')
Ingredient.create(:name => 'Scotch', :desc => 'Scotchy Scotch Scotch', :kind => 'Liquor', :info => '', :active => 'false')
Ingredient.create(:name => 'Rum(Spiced)', :desc => 'Pirates Love this stuff', :kind => 'Liquor', :info => '', :active => 'false')
Ingredient.create(:name => 'Rum(Clear)', :desc => 'Pirates like this too', :kind => 'Liquor', :info => '', :active => 'false')
Ingredient.create(:name => 'Gin', :desc => 'Gin', :kind => 'Liquor', :info => 'Gin', :active => 'false')
Ingredient.create(:name => 'Tonic', :desc => 'Goes well with Gin', :kind => 'Mixer', :info => '', :active => 'false')
Ingredient.create(:name => 'Vermouth', :desc => 'Good for martinis', :kind => 'Mixer', :info => '', :active => 'false')
Ingredient.create(:name => 'Rum Chata', :desc => 'Tasty stuff', :kind => 'Liquor', :info => '', :active => 'false')
Ingredient.create(:name => 'Pepsi', :desc => 'Good Stuff', :kind => 'Mixer', :info => '', :active => 'false')
#puts "setup deleted user, make sure this gets id 0"
User.create(:fname => 'nobody', :email => "nobody@blnorris.com", :password => "nothing123",  :password_confirmation => "nothing123")