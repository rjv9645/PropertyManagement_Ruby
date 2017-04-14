Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  #root 'locations#index'
  scope '/api' do
  	scope '/v1' do
  		scope '/locations' do
  			get '/:id' => 'locations#getLocationById'
  			scope '/nearby' do
  				#get '/:id' => 'locations#getLocationWithinRadius'
  				get '/:longitude/:latitude/:distance/:units' => 'locations#getLocationWithinRadius',
						constraints: {longitude:/-?\d*(\.\d*)?/, latitude:/-?\d*(\.\d*)?/,distance:/-?\d*(\.\d*)?/}
  			end
  		end
  	end
  end 
end
