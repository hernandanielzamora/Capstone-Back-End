# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Branch.destroy_all
ReservationRoom.destroy_all
Reservation.destroy_all
Room.destroy_all

@user_one = User.create(name: "User", email: "user@example.com", password: "123456")
@user_two = User.create(name: "Admin", email: "admin@example.com", password: "123456", role: "admin")

@branch_one = Branch.create(city: "New York")
@branch_two = Branch.create(city: "Los Angeles")

@room_one = Room.create(branch: @branch_one, name: "Room One", guest: 2, beds: 1, description: "This is a room.", photo: "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80", cost: 100, reserved: false)
@room_two = Room.create(branch: @branch_one, name: "Room Two", guest: 2, beds: 1, description: "This is a room too.", photo: "https://images.unsplash.com/photo-1595526051245-4506e0005bd0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80", cost: 102, reserved: false)
@room_three = Room.create(branch: @branch_two, name: "Room Three", guest: 2, beds: 1, description: "This is a room on another branch.", photo: "https://images.unsplash.com/photo-1540518614846-7eded433c457?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1457&q=80", cost: 105, reserved: false)

@total_cost = @room_one.cost + @room_two.cost

@reservation = Reservation.create(user: @user_one, reservation_date: "2023-08-23", city: @room_one.branch.city, total_cost: @total_cost)

@reservation.reservation_rooms.create(room: @room_one)
@reservation.reservation_rooms.create(room: @room_two)

@room_one.reserved = true
@room_one.save
@room_two.reserved = true
@room_two.save