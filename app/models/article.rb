class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 5}
  #before_create :set_visits_count
  before_save :set_visits_count


  def update_visits_count
    self.save if self.visits_count.nil?
    self.update(visits_count: self.visits_count + 1)
  end

  private

  def set_visits_count
    self.visits_count ||= 0
  end
end
