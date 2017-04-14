class Location < ApplicationRecord
    
    #Finds locations in the database within radius of given coordinates.
    #Defaults to 5 miles.
    #Credit= query found here: http://spinczyk.net/blog/2009/10/04/radius-search-with-google-maps-and-mysql/
	scope :nearby, -> (longitude=nil, latitude=nil, earthRadius=3965, distance=5){
		find_by_sql([
			"SELECT id, address,
				ACOS( SIN( RADIANS(latitude) ) * SIN( RADIANS(?) ) + COS( RADIANS(latitude) ) * 
				COS( RADIANS(?)) * COS(RADIANS(longitude) - RADIANS(?)) ) * ? AS distance
			FROM locations
			WHERE 
				ACOS( SIN( RADIANS(latitude) ) * SIN( RADIANS(?) ) + COS( RADIANS(latitude) ) * 
				COS( RADIANS(?)) * COS(RADIANS(longitude) - RADIANS(?)) ) * ? < ?
			ORDER BY distance ASC", 
			latitude, latitude, longitude, earthRadius,
			latitude, latitude, longitude, 
			earthRadius, distance])
	}

    def to_xml(options = {})
        # no type information, not such a great idea!
        to_xml_opts = {:skip_types => false} 
        to_xml_opts.merge!(options.slice(:builder, :skip_instruct))
        # a builder instance is provided when to_xml is called on a collection of instructors,
        # in which case you would not want to have <?xml ...?> added to each item
        to_xml_opts[:root] ||= "location"
        self.attributes.to_xml(to_xml_opts)
    end
end
