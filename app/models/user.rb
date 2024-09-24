class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lessons

  attribute :role, :string
  enum role: { student: "Aluno", professor: "Professor" }

  def student?
    role == "student"
  end

  def professor?
    role == "professor"
  end

  def can_attend?
    validate_today_lesson == Date.today
  end
end
