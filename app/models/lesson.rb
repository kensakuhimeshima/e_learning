class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :words, through: :answers
  has_one :activity, as: :action, dependent: :destroy

  def next_word
    (category.words - words).first
  end

  def correct_answers
    self.answers.joins(:choice).where(choices: {is_correct: true})
  end
end

