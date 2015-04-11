class LockersController < ApplicationController
  before_action :set_locker, only: [:receipt]

  # GET
  def reservation
    @avaliable_small_lockers_count = Locker.avaliable_small_lockers_count
    @avaliable_medium_lockers_count = Locker.avaliable_medium_lockers_count
    @avaliable_large_lockers_count = Locker.avaliable_large_lockers_count
  end

  # GET
  def return_locker
  end

  # GET
  def receipt
  end

  # PUT
  def reserve
    success = false
    locker_size = LockerSize.where(name: params[:locker_size]).first  
    if locker = Locker.reserve_locker(locker_size)
      flash[:notice] = "Saved successfully. Please print the receipt."
      redirect_to receipt_path(locker)
    else
      flash[:alert] = "Wasn't able to make the reservation. Please try again."
      redirect_to make_reservation_path
    end
  end

  # PUT
  def return
    success = false
    msg = "Wasn't able to return the locker. Please try again."
    locker = Locker.where(display_name: params[:locker_name]).first
    if locker
      if locker.occupied
        locker.occupied = false
        if locker.save
          success = true
          msg = "Returned successfully. Thank you."
        end
      else
        msg = "Locker is already returned."
      end
    end
    if success
      flash[:notice] = msg
      redirect_to root_path
    else
      flash[:alert] = msg
      redirect_to return_locker_path
    end
  end

  # GET /lockers
  # GET /lockers.json
  def index
    @lockers = Locker.order('locker_size_id asc, id asc').page params[:page]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locker
      @locker = Locker.find(params[:id])
    end
end
