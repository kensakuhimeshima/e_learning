class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  has_many :lessons, through: :answers
  accepts_nested_attributes_for :choices

  validates :content, presence: true, length: {maximum: 50}

  validate :has_one_correct_answer
  validate :has_unique_choices

  def correct_answer
    choices.find_by(is_correct: true).content
  end

  private
  def has_one_correct_answer
    if choices.select{ |choices| choices.is_correct? }.count != 1 
      return errors.add :base, "Must have one correct choice"
    end  
  end

  def has_unique_choices
    if choices.uniq { |choice| choice.content }.count < choices.length
      return errors.add :base, "Must have unique choices"
    end
  end
end
