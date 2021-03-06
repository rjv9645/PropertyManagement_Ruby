# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Remove all locations, reset sequence, then seed.
Location.destroy_all

#Sqlite reset primary key index
#Location.connection.execute("DELETE FROM sqlite_sequence where name='locations'")

#MySql reset primary key index
Location.connection.execute("ALTER TABLE locations AUTO_INCREMENT = 1")

Location.create(address: "8 Fake Address Lane", latitude: 23.213606, longitude: -70.890078)
