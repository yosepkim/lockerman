class LockerSize < ActiveRecord::Base
	has_many :lockers

	LOCKER_SIZE_SMALL			= "Small"
	LOCKER_SIZE_MEDIUM		= "Medium"
	LOCKER_SIZE_LARGE			= "Large"
end
