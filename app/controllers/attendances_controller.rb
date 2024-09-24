class AttendancesController < ApplicationController
  def create
    unless current_user.can_attend? && current_user.student?
      return redirect_to lesson_path(id: params[:lesson_id]),
                         alert: 'Você não tem permissão para registrar presença'
    end

    @attendance = Attendance.new(user_id: current_user.id, lesson_id: params[:lesson_id])
    if @attendance.save
      redirect_to lesson_path(@attendance.lesson_id)
    else
      render lesson_path(@attendance.lesson_id), alert: 'Erro ao registrar presença'
    end
  end
end
