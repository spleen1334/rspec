class Location < ActiveRecord::Base
  # validate/validates isto
  validates :latitude, :longitude,
      presence: true,
      numericality: true

  # attr_accessible :latitude, :longitude # nepotrebno jer rails generise
  # constructor automatski


  # Constant
  R = 3_959 # Earth radius Miles

  def near?(lat, long, mile_radius)
    # Exception
    raise ArgumentError unless mile_radius >= 0


    loc = Location.new(latitude: lat, longitude: long)

    R * haversine_distance(loc) <= mile_radius # ovo proverava da li je R*haversine manje ili = sa mile radius,
    # ukoliko jeste vraca TRUE, ukoliko nije vraca FALSE
  end


  private

    def to_radians(degrees)
      degrees * Math::PI / 180
    end


    def haversine_distance(loc)
      dist_lat = to_radians(loc.latitude - self.latitude)
      dist_long = to_radians(loc.longitude - self.longitude)

      lat1 = to_radians(self.latitude)
      lat2 = to_radians(loc.latitude)

      a = Math.sin(dist_lat/2) * Math.sin(dist_lat/2) +
        Math.sin(dist_long/2) * Math.sin(dist_long/2) *
        Math.cos(lat1) * Math.cos(lat2)

      2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    end
end
