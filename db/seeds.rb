# Temporary admin account
u = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: true
)
u.skip_confirmation!
u.save!

classification = ["Surowce energetyczne", "Kruszce i metale", "Kamienie szlachetne"]
classification.each { |d| Classification.where(:name => d).first_or_create }

energetic = ["Ropa naftowa", "Węgiel brunatny", "Węgiel kamienny", "Gaz ziemny"]
metal = ["Złoto", "Srebro", "Platyna", "Miedź", "Aluminium"]
gems = ["Diament", "Beryl", "Agat"]

energetic.each { |ener| Product.where(:name => ener, :classification_id => 1,
									  :currentExchange => rand(200)).first_or_create }

metal.each { |met| Product.where(:name => met, :classification_id => 2, 
								 :currentExchange => rand(200)).first_or_create }

gems.each { |gem| Product.where(:name => gem, :classification_id => 3,
								:currentExchange => rand(200)).first_or_create }
