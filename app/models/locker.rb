class Locker < ActiveRecord::Base
	belongs_to :locker_size

	paginates_per 10

	def self.avaliable_small_lockers_count
		Locker.joins(:locker_size).where('locker_sizes.name = ? and occupied = ?', LockerSize::LOCKER_SIZE_SMALL, false).count
	end
	def self.avaliable_medium_lockers_count
		Locker.joins(:locker_size).where('locker_sizes.name = ? and occupied = ?', LockerSize::LOCKER_SIZE_MEDIUM, false).count
	end
	def self.avaliable_large_lockers_count
		Locker.joins(:locker_size).where('locker_sizes.name = ? and occupied = ?', LockerSize::LOCKER_SIZE_LARGE, false).count
	end

	def self.reserve_locker(locker_size)
		if locker_size
      if locker = locker_size.lockers.where(occupied: false).order('id asc').first
        locker.occupied = true
        locker.save!
      end
    end
    locker
	end
end
