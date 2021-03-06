class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates :name, uniqueness: { case_sensitive: false }
  validates(:name, {:presence => true, :length => { :maximum => 100 }})

  before_save(:upcase_name)

  private
  def upcase_name
    self.name=(name().split.map(&:capitalize).join(' '))
  end
end
