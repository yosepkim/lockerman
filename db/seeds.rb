# This script sets up the initial data
small_locker_size = LockerSize.create(name: "Small")
medium_locker_size = LockerSize.create(name: "Medium")
large_locker_size = LockerSize.create(name: "Large")

(1..1000).each do |number|
	Locker.create(locker_size_id: small_locker_size.id, display_name: "#{small_locker_size.name[0]}#{number}", occupied: false)
	Locker.create(locker_size_id: medium_locker_size.id, display_name: "#{medium_locker_size.name[0]}#{number}", occupied: false)
	Locker.create(locker_size_id: large_locker_size.id, display_name: "#{large_locker_size.name[0]}#{number}", occupied: false)
end