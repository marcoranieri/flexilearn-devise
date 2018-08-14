class OrdersController < ApplicationController
  before_action :set_lesson, only: [:create, :show]

  def index
    @orders = current_student.orders
  end

  def create
    order  = Order.create!(
      name: @lesson.subject.name,
       amount: @lesson.price,
       lesson: @lesson,
       student: current_student,
        state: 'pending'
        )

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_student.orders.where(state: 'paid').find(params[:id])
  end

private

  def set_lesson
    params[:id] ? @lesson = Lesson.find(params[:id]) : @lesson = Lesson.find(params[:lesson_id])
  end
end
