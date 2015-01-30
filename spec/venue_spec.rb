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
