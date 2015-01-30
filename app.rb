require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post('/bands') do
  @bands = Band.all()
  name = params.fetch("band_name")
  @band = Band.new({:name => name})
  @band.save
  if @band.save()
    erb(:index)
  else
    erb(:errors)
  end
end

get('/bands/:id/edit') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_edit)
end

patch('/bands/:id') do
  name = params.fetch("name")
  @band = Band.find(params.fetch("id").to_i())
  @band.update({:name => name})
  redirect('/')
end

delete('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @band.delete()
  @bands = Band.all()
  redirect('/')
end

get('/venues/:id') do
  band_id = Band.find(params.fetch("id").to_i())
  @band = Band.find(band_id)
  @venues = Venue.all()
  erb(:venue)
end

post('/venues') do
  name = params.fetch("venue_name")
  Venue.create({:name => name})
  redirect back
end

post('/bands_venue_add') do
  band_id = params.fetch("band_id").to_i()
  @band = Band.find(band_id)
  venue_ids_array = params.fetch("venue_ids_array")
  venue_ids_array.each() do |venue_id|
    @band.venues().<<(Venue.find(venue_id))
  end
  redirect('/')
end
