class Note < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, if: -> { body.blank? }
  validates :title, length: { maximum: 30, too_long: "can't be more than %{count} characters" }
  validates :body, presence: true, if: -> { title.blank? }
  validates :body, length: { maximum: 1000, too_long: "can't be more than %{count} characters" }

  before_save do
    self.title = self.body[0..29] if self.title.blank?
  end
end
