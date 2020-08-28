class College < ApplicationRecord
	def self.sendiconlink(str)
		if(str=="Library")
			return "books.svg"
		elsif (str=="Cafeteria")
			return "cafe.svg"
		elsif(str=="Hostel")
			return "hotel.svg"
		elsif (str=="Sports Complex")
			return "soccer.svg"
		elsif (str=="Gym")
			return "weight.svg"
		elsif (str=="Hospital / Medical Facilities")
		return "hospital.svg"	
		elsif (str=="Wi-Fi Campus")
			return "router.svg"
		elsif (str=="Auditorium")
		return "cinema.svg"									
		elsif (str=="Labs")
			return "lab.svg"
		elsif (str=="A/C Classrooms")
			return "air-conditioner.svg"
		elsif (str=="Dance Room")
			return "dancer.svg"
		elsif (str=="Music Room")
			return "headphones.svg"
		elsif (str=="Shuttle Service")
			return "electric-bus.svg"
			elsif (str=="Design Studio")
			return "photo.svg"
			elsif (str=="Convenience Store")
			return "online-shopping.svg"
			elsif (str=="Moot Court (Law)")
			return "law.svg"
		else
			return "close.svg"
		end
	end
end
