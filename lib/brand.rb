class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates :name, uniqueness: { case_sensitive: false }
  validates(:name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})


  before_save(:upcase_name)




  private
  def upcase_name
    self.name=(name().split.map(&:capitalize).join(' '))
  end
end
