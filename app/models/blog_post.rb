class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) } # Has not been set any time for an action
  scope :published, -> { where("published_at <= ?", Time.current) } # Published time is <= to current time
  scope :schedule, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def schedule?
    published_at? && published_at > Time.current
  end
end
