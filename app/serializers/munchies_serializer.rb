class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :restaurant_list

end
