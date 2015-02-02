require('spec_helper')

describe(Band) do
  it("validates presense of a band name") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end
end


describe(Band) do
  it("capitalizes the first letter in of the band") do
    band = Band.create({:name => "rancid"})
    expect(band.name()).to(eq("Rancid"))
  end
end

describe(Band) do
  it { should have_and_belong_to_many(:venues) }
end
