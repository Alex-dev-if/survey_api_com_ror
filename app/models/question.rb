class Question < ApplicationRecord
  belongs_to :survey
  validates :question_type, inclusion: { in: ["checkbox", "radio", "text"] }
  validate :validate_options_presence, if: -> { question_type == 'checkbox' || question_type == 'radio' }
  validate :validate_max_questions
  has_many :responses, dependent: :delete_all

  def validate_max_questions
    if survey.questions.count >= 10
      errors.add(:base, "Você atingiu o limite máximo de 10 questões.")
    end
  end

  def validate_options_presence
    errors.add(:options, 'Options precisa ser presente se a questão for do tipo radio ou checkbox') if options.blank?
  end
  

end
