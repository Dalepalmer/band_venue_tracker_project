require('spec_helper')

describe(Venue) do
  it("validates presense of a venue name") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end
end

describe(Venue) do
  it("capitalizes the first letter in of the venue") do
    venue = Venue.create({:name => "beachland ballroom"})
    expect(venue.name()).to(eq("Beachland Ballroom"))
  end
end

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }
end

describe(".not_played") do
  it("returns the not played venues") do
    not_played_venue1 = Venue.create({:name => "The Holoscene", :played => false})
    not_played_venue2 = Venue.create({:name => "Mississippi Studios", :played => false})
    not_played_venues = [not_played_venue1, not_played_venue2]
    played_venue = Venue.create({:name => "The Hilt", :played => true})
    expect(Venue.not_played()).to(eq(not_played_venues))
  end
end
