class Location < ApplicationRecord
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
