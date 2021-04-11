class Location:
    def __init__(self, name, country):
        self.name = name
        self.country = country

    def myLocation(self):
        print("Hi, my name is " + self.name + " and i live in " + self.country +".")

loc1 = Location("Tomas", "Portugal")
loc1.myLocation()
loc2 = Location("ying", "China")
loc3 = Location("Amare","Kenya")

loc2.myLocation()
loc3.myLocation()

your_loc = Location("Abdel", "Belgium")
your_loc.myLocation()



