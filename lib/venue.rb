class Venue < ActiveRecord::Base
  has_and_belongs_to_many (:bands)
  validates(:name, :presence => true)
  before_create(:titleize_name)

  scope(:not_done, -> do
    where({:done => false})
  end)


  private

  define_method(:titleize_name) do
    self.name=(name().titleize())
  end
end
