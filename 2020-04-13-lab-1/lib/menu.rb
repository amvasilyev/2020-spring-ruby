# frozen_string_literal: true

require 'tty-prompt'

# The main class of our application
class Menu
  def initialize
    @prompt = TTY::Prompt.new
  end

  MAIN_MENU_CHOICES = [
    { name: 'Вывести расписание движения поездов', value: :rasp },
    { name: 'Вывести список поездов, по количеству реальных остановок',
      value: :stops },
    { name: 'Завершить работу приложения', value: :exit }
  ].freeze

  def show_menu
    loop do
      action = @prompt.select('Выберите действие', MAIN_MENU_CHOICES)
      break if action == :exit
    end
  end
end
