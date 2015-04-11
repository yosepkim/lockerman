json.array!(@lockers) do |locker|
  json.extract! locker, :id, :locker_size_id, :display_name, :occupied
  json.url locker_url(locker, format: :json)
end
